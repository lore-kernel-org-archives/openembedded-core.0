Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30CC86F877
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:25:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2RIPEk3026215
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 11:25:14 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 11:25:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Mar 2014 14:24:57 -0400
Message-ID: <e4d4693897ef961b78668a20bc42e66cbeb6c704.1395944068.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395944068.git.bruce.ashfield@windriver.com>
References: <cover.1395944068.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 02/13] linux-yocto/3.4: update mohonpeak.cfg for SATA, SMBus, LPC, WDT, crypto & highmem64g
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
X-List-Received-Date: Thu, 27 Mar 2014 18:25:18 -0000
Content-Type: text/plain

Updating the meta SRCREV with the latest configuration updates.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index ef380adafe8d..dfe11e4925c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "74369c14c79dbb546ce1e387b1363e808ea4f5b1"
 SRCREV_machine_qemuppc ?= "71694a302cda24cc8a7c5f772e8306111ffcfb6c"
-SRCREV_meta ?= "8e88bf72b72afb3b638e751ea2a5c89394cc196b"
+SRCREV_meta ?= "ef4cd500d4b64680f7a319d399b8a12f9ecc9fe6"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 6ed19500e367..7db9099fece4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -13,7 +13,7 @@ LINUX_VERSION ?= "3.4.82"
 KMETA = "meta"
 
 SRCREV_machine ?= "c29f5c8952c0f3ef27773d78e5cc64e437a357cb"
-SRCREV_meta ?= "8e88bf72b72afb3b638e751ea2a5c89394cc196b"
+SRCREV_meta ?= "ef4cd500d4b64680f7a319d399b8a12f9ecc9fe6"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 1a3ccdd7bd1f..878422985b12 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -17,7 +17,7 @@ SRCREV_machine_qemuppc ?= "85868d48f06911b7dddaf0180af96c8f2e874922"
 SRCREV_machine_qemux86 ?= "c29f5c8952c0f3ef27773d78e5cc64e437a357cb"
 SRCREV_machine_qemux86-64 ?= "c29f5c8952c0f3ef27773d78e5cc64e437a357cb"
 SRCREV_machine ?= "c29f5c8952c0f3ef27773d78e5cc64e437a357cb"
-SRCREV_meta ?= "8e88bf72b72afb3b638e751ea2a5c89394cc196b"
+SRCREV_meta ?= "ef4cd500d4b64680f7a319d399b8a12f9ecc9fe6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


