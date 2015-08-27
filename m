Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF91B73217
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 02:31:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7R2VdWr007973
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Aug 2015 19:31:39 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 26 Aug 2015 19:31:38 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Aug 2015 22:31:29 -0400
Message-ID: <cover.1440642427.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH 0/9 v2] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 27 Aug 2015 02:31:44 -0000
Content-Type: text/plain

Hi all,

Patches 0-6 are the same as my previous pull request, but I've added
them here for completness sake.

As Ross pointed out, I got a little bit carried away enabling CIRRUS
drm support, so I've now dialed it back and only enabled it for our
x86 targets. 

I've also addressed a couple of quark and coretemp issues that Saul
noticed in [linux-yocto/4.1: CIRRUS config and quark thermal support]

The interesting parts of this refreshed series are:

  linux-yocto-dev: update to 4.2-rc
  linux-yocto/3.14/4.1: fix ARM boot with gcc 5.x

With these, we have a 4.2 kernel available AND qemuarm targets that
build and boot with gcc 5.2 (for both the 3.14 and 4.1 kernel).

Cheers,

Bruce

The following changes since commit 393bd7496d71eb101f21234c1233a2d18fd2c73e:

  oeqa/oetest.py: add better package search for hasPackage() (2015-08-26 08:28:06 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  linux-yocto/4.1: fix qemuarm preempt-rt configuration
  linux-yocto/3.19/4.1: add coretemp to intel-common-drivers
  linux-yocto/4.1: quark configuration and thermal support
  linux-yocto/3.14: cleanups and gcc5 ARM build fixes
  linux-yocto/4.1: update to v4.1.6 and v4.1.6-rt5
  linux-yocto/4.1: enable DRM_CIRRUS_QEMU and EXT4_USE_FOR_EXT23
  linux-yocto/4.1: CIRRUS config and quark thermal support
  linux-yocto-dev: update to 4.2-rc
  linux-yocto/3.14/4.1: fix ARM boot with gcc 5.x

 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 ++++++++++----------
 9 files changed, 33 insertions(+), 33 deletions(-)

-- 
2.1.0


