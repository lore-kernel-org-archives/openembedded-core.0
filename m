Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 81986609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 19:09:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4LJ90I4010768
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 May 2015 12:09:00 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 21 May 2015 12:09:00 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 May 2015 15:08:53 -0400
Message-ID: <8d68ee8847de2535cb31b5941da95adf4862e977.1432235097.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1432235097.git.bruce.ashfield@windriver.com>
References: <cover.1432235097.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto-custom: clarify bbappend versus copy in comments
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
X-List-Received-Date: Thu, 21 May 2015 19:09:00 -0000
Content-Type: text/plain

The kernel development manual recommends making a copy of
linux-yocto-custom, while the comments in the recipe talk about
bbappends.

To synchronize the two, we remove the bbappend references from the
recipe and instead indicate that a copy should be updated.

[YOCTO: #6925]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index 05463c026304..e38af19f827b 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -11,8 +11,8 @@
 #
 #   You must also provide a Linux kernel configuration. The most direct
 #   method is to copy your .config to files/defconfig in your layer,
-#   in the same directory as the bbappend and add file://defconfig to
-#   your SRC_URI.
+#   in the same directory as the copy (and rename) of this recipe and
+#   add file://defconfig to your SRC_URI.
 #
 #   To use the yocto kernel tooling to generate a BSP configuration
 #   using modular configuration fragments, see the yocto-bsp and
@@ -52,14 +52,14 @@
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
 
-# Override SRC_URI in a bbappend file to point at a different source
+# Override SRC_URI in a copy of this recipe to point at a different source
 # tree if you do not want to build from Linus' tree.
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=machine"
 
 LINUX_VERSION ?= "3.4"
 LINUX_VERSION_EXTENSION ?= "-custom"
 
-# Override SRCREV to point to a different commit in a bbappend file to
+# Override SRCREV to point to a different commit in a copy of this recipe
 # build a different release of the Linux kernel.
 # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
 SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
@@ -67,6 +67,6 @@ SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-# Override COMPATIBLE_MACHINE to include your machine in a bbappend
+# Override COMPATIBLE_MACHINE to include your machine in a copy of this recipe
 # file. Leaving it empty here ensures an early explicit build failure.
 COMPATIBLE_MACHINE = "(^$)"
-- 
2.1.0


