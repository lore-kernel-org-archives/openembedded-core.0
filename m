Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5957D7980B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 17:19:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8MHJ5IF023434
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 22 Sep 2018 10:19:15 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 22 Sep 2018 10:18:55 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 22 Sep 2018 13:18:46 -0400
Message-ID: <cover.1537636541.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Sat, 22 Sep 2018 17:19:41 -0000
Content-Type: text/plain

Hi all,

Here is the consolidated pull request for the active linux-yocto
kernels.

It is -stable updates, configuration audit warning fixes as well
as a fix for the qemuarm64 boot hang with the ssl update.

Nothing to major here, and I've boot tested on all architectures,
but you never know what the autobuilder may dig out.

Cheers,

Bruce

The following changes since commit 18b90a0fd9bdc00d82140fbd55761e9cea308fb1:

  yocto-uninative: Add aarch64 uninative tarball checksum (2018-09-20 09:06:00 -0700)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto: configuration warning fixes
  linux-yocto/4.18: update to v4.18.7
  linux-yocto: tweak RTC configuration
  linux-yocto/4.14: fix kernel configuration audit warnings
  linux-yocto/4.18: update to v4.18.9
  linux-yocto/4.14: update to v4.14.71
  linux-yocto: enable pci and CRYPTO_DEV_VIRTIO

Hongzhi.Song (1):
  linux-yocto-rt: Add paravirt_kvm support for qemux86-64

 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 ++++++++++----------
 6 files changed, 34 insertions(+), 34 deletions(-)

-- 
2.5.0


