Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94C1C6AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:51:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7ODpPdI010629
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Aug 2015 06:51:25 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 24 Aug 2015 06:51:24 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 24 Aug 2015 09:51:18 -0400
Message-ID: <cover.1440424002.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 24 Aug 2015 13:51:28 -0000
Content-Type: text/plain

Hi all,

I've built and boot tested the pending changes for the 3.14, 3.19 and
4.1 linux-yocto variants.

In this series we have:

 - gcc5.x build fixes for 3.14 (from Richard)
 - 4.1.6 and -rt5 updates
 - configuration changes for CIRRUS graphics and EXT4 for EXT2/3 use
 - quark BSP configuration changes from Saul

This is the first round of updates since I split the meta-data from the
kernel repository itself, so all my update and test scripts had to be
changed .. I've built and tested this, but with three kernels and two
different kernel types in play, there are limits to how much I can build
and test before sending out the changes. So this definitely needs to
be sanity checked by the autobuilder(s).

Cheers,

Bruce

The following changes since commit a3d228a484cf471e999b6537987e2897d8a7bd4e:

  bitbake: main: Handle RuntimeError exception in list_extension_modules (2015-08-20 22:04:43 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/4.1: fix qemuarm preempt-rt configuration
  linux-yocto/3.19/4.1: add coretemp to intel-common-drivers
  linux-yocto/4.1: quark configuration and thermal support
  linux-yocto/3.14: cleanups and gcc5 ARM build fixes
  linux-yocto/4.1: update to v4.1.6 and v4.1.6-rt5
  linux-yocto/4.1: enable DRM_CIRRUS_QEMU and EXT4_USE_FOR_EXT23

 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 ++++++++++----------
 8 files changed, 32 insertions(+), 32 deletions(-)

-- 
2.1.0


