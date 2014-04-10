Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3AA965E90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 15:12:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3AFCrLS013405
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Apr 2014 08:12:53 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Apr 2014 08:12:52 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Apr 2014 11:12:35 -0400
Message-ID: <198fd55bc5c581415314c7494497fe280965ee17.1397142033.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397142033.git.bruce.ashfield@windriver.com>
References: <cover.1397142033.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/3.14: beagleboard black: USB, DRM config tweaks
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
X-List-Received-Date: Thu, 10 Apr 2014 15:12:54 -0000
Content-Type: text/plain

Importing the meta SRCREV to pick up the following two fixes:

  928d7b2ddad0 beaglebone: enhance USB support and enable MUSB modules
  fbe38387ac61 beaglebone: enable DRM for HDMI output

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 2a1e20429d8a..a441a53fb95b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.14"
 KMETA = "meta"
 
 SRCREV_machine ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-SRCREV_meta ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
+SRCREV_meta ?= "928d7b2ddad0abc8827055c51ba34225878344a0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index b275f2738d8b..7f0ec2b559a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -17,7 +17,7 @@ SRCREV_machine_qemux86 ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
 SRCREV_machine_qemux86-64 ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
 SRCREV_machine_qemumips64 ?= "ccb2a788551a7951563ac44a27175c6f28501008"
 SRCREV_machine ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-SRCREV_meta ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
+SRCREV_meta ?= "928d7b2ddad0abc8827055c51ba34225878344a0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


