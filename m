Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF3196AE8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 13:40:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5QDeYKJ015374
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Jun 2013 06:40:34 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 26 Jun 2013 06:40:33 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 26 Jun 2013 09:40:28 -0400
Message-ID: <7ff09e5b92adc410511048da4e53e05670d1085c.1372253710.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372253710.git.bruce.ashfield@windriver.com>
References: <cover.1372253710.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/3.4: ltsi: sync to LTSI commit 5f05247ed
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
X-List-Received-Date: Wed, 26 Jun 2013 13:40:35 -0000
Content-Type: text/plain

Updating the 3.4 branches to the latest LTSI baseline.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index d9a894a..1655da8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "a4a8406d906163dcdab2d29420a9bc46668fc8d9"
-SRCREV_machine_qemuppc ?= "0c20eafa8b950b1180f1701ba45026ea5e713482"
+SRCREV_machine ?= "2a1d3b50a2889587d0fed92ccb09051a9e300735"
+SRCREV_machine_qemuppc ?= "0168221d2c818898b69890624e1aacbb8ec1aea9"
 SRCREV_meta ?= "9473a39c59bf9c07a316486d272652bacb9ad3ac"
 
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 0955846..b69d9d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -12,7 +12,7 @@ LINUX_VERSION ?= "3.4.46"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "de0c0ed674dfdbd808657e299fc720d8a97cb868"
+SRCREV_machine ?= "778950f1e0b5c5af7e92c43220c3c4f4e3324cb5"
 SRCREV_meta ?= "9473a39c59bf9c07a316486d272652bacb9ad3ac"
 
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index ade96be..ae10448 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,12 +3,12 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "7054a5db2c1869e0e0b294459fc4770113a8df52"
-SRCREV_machine_qemumips  ?= "46b3cf22c01e40ef035b78f0542a9007aa0cf507"
-SRCREV_machine_qemuppc ?= "1f2475ab9eefbb479c8a481475ddb3043d47b74a"
-SRCREV_machine_qemux86 ?= "de0c0ed674dfdbd808657e299fc720d8a97cb868"
-SRCREV_machine_qemux86-64 ?= "de0c0ed674dfdbd808657e299fc720d8a97cb868"
-SRCREV_machine ?= "de0c0ed674dfdbd808657e299fc720d8a97cb868"
+SRCREV_machine_qemuarm ?= "ccc8f93d42a56511b8867ff3eeba76290309bc2c"
+SRCREV_machine_qemumips  ?= "23607b7f3ca690d62a43c58b8358fa5b75c55b2a"
+SRCREV_machine_qemuppc ?= "d48004092883cfdee8a5092b375ac635742c39cb"
+SRCREV_machine_qemux86 ?= "778950f1e0b5c5af7e92c43220c3c4f4e3324cb5"
+SRCREV_machine_qemux86-64 ?= "778950f1e0b5c5af7e92c43220c3c4f4e3324cb5"
+SRCREV_machine ?= "778950f1e0b5c5af7e92c43220c3c4f4e3324cb5"
 SRCREV_meta ?= "9473a39c59bf9c07a316486d272652bacb9ad3ac"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.7.10.4


