Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3DAF621CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 03:28:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4V3Spsq013082
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 May 2013 20:28:51 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.130.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 30 May 2013 20:28:50 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 May 2013 23:28:44 -0400
Message-ID: <cover.1369970703.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 31 May 2013 03:28:55 -0000
Content-Type: text/plain

Richard/Saul,

While I continue to battle with gcc 4.8, I've got a collection of other fixes
that don't need to wait. Here's part of those pending changes.

 - Remove the yocto 3.2 kernel, early in the Yocto 1.5 cycle as promised
 - Fix the reported issues with linux-yocto-custom recipes by restricting
   NFSD kernel feature requirements to full linux-yocto kernels
 - Refresh the 3.4 and 3.8 kernels with stable updates
 - Fix a kernel feature processing bug reported with some of the Intel BSPs

Cheers,

Bruce

The following changes since commit 647db80298da0a8da212449fdd80d318773eacef:

  hicolor-icon-theme: keep inherited dependencies and switch to gnomebase (2013-05-30 22:31:37 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto: remove 3.2 kernel recipes
  qemu*: restrict NFSD to linux-yocto only
  linux-yocto: v3.8.13 and v3.4.46
  kern-tools: expand kernel features that point to a directory name

 meta/conf/machine/include/qemu.inc                 |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |   29 -----------------
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 ++---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    |    8 ++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |   26 ---------------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |    6 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  |    6 ++--
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |   33 --------------------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 +++++-----
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       |   17 +++++-----
 11 files changed, 32 insertions(+), 121 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.2.bb

-- 
1.7.10.4


