Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1467A730B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 09:47:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1O9ljgU022467
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 01:47:46 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Feb 2017 01:47:45 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2017 01:47:44 -0800
Message-ID: <cover.1487929089.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [RFC PATCH 0/1] core-image-minimal-initramfs: set QB_DEFAULT_FSTYPE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2017 09:47:47 -0000
Content-Type: text/plain

Hi,

This is a RFC patch, my concern is that QB_DEFAULT_FSTYPE is only used
for qemu boot, it is harmless for non qemu machines, so I assume that it
is OK to set it in the image recipe.

There are also other image recipes have the similar issues:
WARNING: meta/recipes-core/images/core-image-minimal-initramfs.bb: QB_DEFAULT_FSTYPE 'ext4' is not in IMAGE_FSTYPES 'cpio.gz'.
WARNING: meta/recipes-extended/images/core-image-testmaster-initramfs.bb: QB_DEFAULT_FSTYPE 'ext4' is not in IMAGE_FSTYPES 'cpio.gz'.
WARNING: meta-selftest/recipes-test/images/wic-image-minimal.bb: QB_DEFAULT_FSTYPE 'ext4' is not in IMAGE_FSTYPES 'wic'.
WARNING: meta/recipes-core/images/core-image-tiny-initramfs.bb: QB_DEFAULT_FSTYPE 'ext4' is not in IMAGE_FSTYPES 'cpio.gz wic'.
WARNING: meta/recipes-core/images/build-appliance-image_15.0.0.bb: QB_DEFAULT_FSTYPE 'ext4' is not in IMAGE_FSTYPES 'vmdk'.

I added the WARNING locally to do the checking. I will fix others if this patch is fine.

BTW, I'm working runqemu testcases (oe-selftest -r runqemu) recently,
please feel free to give your comments on what should be tested.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10249

// Robert

The following changes since commit 65cfc8aca3ff7e39453977a0215a350d13cb85ef:

  libva: Find the correct wayland-scanner (2017-02-23 12:29:21 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qb
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/qb

Robert Yang (1):
  core-image-minimal-initramfs: set QB_DEFAULT_FSTYPE

 meta/recipes-core/images/core-image-minimal-initramfs.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.10.2


