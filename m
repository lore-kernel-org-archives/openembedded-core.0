Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAB797829C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 18:54:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7NIsSxx013035
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Aug 2017 11:54:29 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 23 Aug 2017 11:54:28 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 23 Aug 2017 14:54:25 -0400
Message-ID: <cover.1503284343.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] poky: update default kernel to 4.12 and lsb to 4.9
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
X-List-Received-Date: Wed, 23 Aug 2017 18:54:30 -0000
Content-Type: text/plain

Hi all,

To match the pull request to oe-core that adds the 4.12 kernel and removes
the 4.1 kernel these two patches bump the default kernel to 4.12 and also
update LSB to use the 4.9 kernel.

Build and boot testing was performed on all qemu architectures.

Cheers,

Bruce

The following changes since commit 847d9000180cafedb23c60a6673adcec62ca67a1:

  linux-yocto/4.10: CVE & misc fixes (2017-08-20 22:38:46 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel-yocto
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-yocto

Bruce Ashfield (2):
  poky: bump preferred version of linux-yocto to 4.12
  poky: bump poky lsb to linux 4.9

 meta-poky/conf/distro/poky-lsb.conf | 2 +-
 meta-poky/conf/distro/poky.conf     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.5.0


