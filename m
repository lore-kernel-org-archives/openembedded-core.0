Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2BD78560
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 15:39:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB4FdSIh012281
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Dec 2017 07:39:28 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 4 Dec 2017 07:39:27 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 4 Dec 2017 10:39:18 -0500
Message-ID: <cover.1512401707.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 04 Dec 2017 15:39:28 -0000
Content-Type: text/plain

Hi all,

Here is the latest set of kernel updates and bug fixes to the kernel-yocto
build.

The 4.9 and 4.12 updates are routine -stable updates. I realize we are
still fighting some boot/hang issues with 4.12, but I didn't see any
new issues with the 4.12 updates, so I included them in this pull request.

I've also included Saul's in-tree defconfig fixes + one additional patch
of my own.

I also bump linux-yocto-dev to 4.15-rcX, which brought in some build
issues due to x86 ORC_UNWINDER changes, and ssl cert generation. I've
added the new dependencies directly in the linux-yocto-dev recipe, but
they will very likely have to move lower into the stack over time.

I have some additional, structural changes that are coming shortly, but
I'm traveling for the next 5 days and will send them when I return.

Cheers,

Bruce

The following changes since commit 72867393fe2004ab9f0ee23eb09a975c82938b9e:

  runqemu: Also specialcase resolution of '.' to the file's location (2017-11-21 17:58:41 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/4.9: update to v4.9.61
  linux-yocto/4.12: iwlwifi calltrace fixes and configuration warning
    cleanups
  linux-yocto/4.9: update to v4.9.65
  linux-yocto/4.12: update to v4.12.16
  kernel-yocto: ensure that only a single defconfig is processed
  linux-yocto-dev: update to v4.15+

Saul Wold (2):
  kernel-yocto: ensure sccs variable is set when using KBUILD_DEFCONFIG
  kernel-yocto: Stop the build if defconfig is missing

 meta/classes/kernel-yocto.bbclass                  | 17 ++++++++++++++---
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  5 ++++-
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 20 ++++++++++----------
 8 files changed, 50 insertions(+), 36 deletions(-)

-- 
2.5.0


