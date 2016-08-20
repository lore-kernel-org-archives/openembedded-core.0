Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 28B25731DB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 04:30:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7K4UctQ017271
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 19 Aug 2016 21:30:38 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 19 Aug 2016 21:30:37 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 20 Aug 2016 00:30:35 -0400
Message-ID: <b96e36414f67f3ac82c3617a2b594a1513a2dea1.1471667296.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1471667296.git.bruce.ashfield@windriver.com>
References: <cover.1471667296.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/4.4: fix configuration warnings
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
X-List-Received-Date: Sat, 20 Aug 2016 04:30:40 -0000
Content-Type: text/plain

Integrating the following commits to address configuration warnings for
intel-corei7-64 and intel-core2-32:

  features: Fix dependencies and =m vs =y discrepancies for corei7
  intel-core2-32.cfg: Explicitly disable CONFIG_64BIT

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index dc6bb9af9f3e..9b0a44b79166 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9135adcfb01432abe4a95a50fca5d0395239f798"
-SRCREV_meta ?= "dab902b4cfa932810bb1dc6de003ed668f935729"
+SRCREV_meta ?= "6a12efcabe8d48e323afd277fa672eae9b7e12c2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index eb35d299df9f..114bd746d64b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
-SRCREV_meta ?= "dab902b4cfa932810bb1dc6de003ed668f935729"
+SRCREV_meta ?= "6a12efcabe8d48e323afd277fa672eae9b7e12c2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 2ec62e7fd635..f45007a361f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
 SRCREV_machine_qemux86-64 ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
 SRCREV_machine_qemumips64 ?= "aa125473aef74e7731b14f6b56c1b50589fcd668"
 SRCREV_machine ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
-SRCREV_meta ?= "dab902b4cfa932810bb1dc6de003ed668f935729"
+SRCREV_meta ?= "6a12efcabe8d48e323afd277fa672eae9b7e12c2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


