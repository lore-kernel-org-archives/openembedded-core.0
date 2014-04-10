Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1F2B65E90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 15:12:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3AFCqA1002834
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Apr 2014 08:12:52 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Apr 2014 08:12:52 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Apr 2014 11:12:34 -0400
Message-ID: <8b41def519c89001776d4afb2477c1f98c311a6e.1397142033.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397142033.git.bruce.ashfield@windriver.com>
References: <cover.1397142033.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/3.14: intel configuration fixes
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
X-List-Received-Date: Thu, 10 Apr 2014 15:12:53 -0000
Content-Type: text/plain

Importing the intel configuration fixes from Darren Hart:

   a82ccc635e7a meta: Purge retired BSPs chiefriver, sys940x, and atom-pc
   b50ba1e37c26 x86: Drop X86_32 configs
   8aa0a946f528 x86: Move MTRR config into x86 common fragments
   ddae217aefee common-pc: Remove SMP from common-pc*-cpu fragments
   f3ad83aa4c39 x86: Consolidate common x86* CPU features

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 2e142bfd9029..2a1e20429d8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.14"
 KMETA = "meta"
 
 SRCREV_machine ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-SRCREV_meta ?= "fc8c30398dbc3cdea787a1042242d4aab689d0ae"
+SRCREV_meta ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 46c42601fe04..b275f2738d8b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -17,7 +17,7 @@ SRCREV_machine_qemux86 ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
 SRCREV_machine_qemux86-64 ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
 SRCREV_machine_qemumips64 ?= "ccb2a788551a7951563ac44a27175c6f28501008"
 SRCREV_machine ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-SRCREV_meta ?= "fc8c30398dbc3cdea787a1042242d4aab689d0ae"
+SRCREV_meta ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


