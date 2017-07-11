Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F87677D9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 15:04:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6BF4Mcu011276
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Jul 2017 08:04:23 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Jul 2017 08:04:22 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 11 Jul 2017 11:04:15 -0400
Message-ID: <cover.1499784588.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 11 Jul 2017 15:04:24 -0000
Content-Type: text/plain

Hi all,

There are a couple of repeated patches in this series, but I'm
sending them along just to make sure that all my pending patches
are grouped together.

In this series, we have a configuratiion tweak (that fixes a build
warning), -stable updates for all the active kernels, a bug fix for
error propagation .. and finally a bump of linux-yocto-dev to
4.12+.

The next LTS kernel was picked to be 4.14, so once again, we are
going to be in an awkward timing window for the release. To make
sure that we are ready for whatever the timing is, I've bumped
this to 4.12 and integrated the pre-rc1 changes into the tree ..
so this puts -dev at somewhere between 4.12 and 4.13 with this
update.

cheers,

Bruce

The following changes since commit 854c8c2e4c24ea3ddfec6e5b5f6477f0620510e4:

  oeqa/tinfoil: Improve test_wait_event for race issues (2017-07-08 13:34:46 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  kernel-yocto: propagate configuration errors to bbclass
  kernel-yocto/meta: smp configuration changes
  linux-yocto/4.1: update to v4.1.41
  linux-yocto/4.4: update to v4.4.76
  linux-yocto/4.9: update to v4.9.36
  linux-yocto-dev: bump to 4.12+

 meta/classes/kernel-yocto.bbclass                  |  3 ++-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 20 ++++++++++----------
 14 files changed, 54 insertions(+), 53 deletions(-)

-- 
2.5.0


