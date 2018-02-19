Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 368DA7847D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 02:25:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1J2PofO026838
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Feb 2018 18:25:51 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 18 Feb 2018 18:25:33 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 18 Feb 2018 21:25:42 -0500
Message-ID: <cover.1519006338.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 19 Feb 2018 02:25:51 -0000
Content-Type: text/plain

Hi all,

Here is the next set of kernel (and kernel-yocto) changes. Now that we've
got 4.14 and 4.15 in master, these are the follow on tweaks.

 - stable updates for 4.14 and 4.15
 - -rt addition and build dependency fixes for 4.14
 - 4.12 -stable updates (which include meltdown patches). This is also
   valid for rocko, and I'll send it separately as a single patch for
   that branch.

Outside of the kernel updates, I've also included my changes for
make-mod-scripts that were sent as a RFC in my last pull request. These have
been in my tree for a while, and have been commented/tested by others. I now
have a second patch in that sub-series that adds the right openssl dependencies
for 4.15+ kernels when building out of tree modules (since they do appear
to solve the issues reported on the mailing list).

Cheers,

Bruce

The following changes since commit 02641ef12d681e4402fdaee1038513bfdb8c79b1:

  ltp: fix knob to control numa support (2018-02-16 18:05:41 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  make-mod-scripts: add build requirements for external modules
  linux-yocto/4.15: add build dependencies
  linux-yocto/4.14: add -rt and update to v4.4.18
  linux-yocto/4.14: update to v4.14.19
  linux-yocto/4.15: update to v4.15.3
  linux-yocto/4.12: update to v4.12.20

Joe Slater (1):
  make-mod-scripts: change how some kernel module tools are built

 meta/classes/module-base.bbclass                   | 12 +++-------
 meta/classes/module.bbclass                        |  4 ----
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 ++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 ++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  9 +++++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 ++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 16 ++++++-------
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 20 ++++++++--------
 .../make-mod-scripts/make-mod-scripts_1.0.bb       | 27 ++++++++++++++++++++++
 12 files changed, 78 insertions(+), 58 deletions(-)
 create mode 100644 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb

-- 
2.5.0


