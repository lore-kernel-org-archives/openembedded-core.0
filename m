Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE4F56F00C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 19:14:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1EJE4YI024884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Feb 2014 11:14:04 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 14 Feb 2014 11:14:03 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 14 Feb 2014 14:13:55 -0500
Message-ID: <2a3731dc9713c6176363caf0e3b1c4d7bd3e41ae.1392404866.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392404866.git.bruce.ashfield@windriver.com>
References: <cover.1392404866.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/3.10: arbitrary write with CONFIG_X86_X32 (CVE-2014-0038)
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
X-List-Received-Date: Fri, 14 Feb 2014 19:14:06 -0000
Content-Type: text/plain

Integrating the upstream commit for CVE-2014-0038.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 5e387a5f13c0..1c057726d2db 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "6a0719e6623a22991fae0fa45e8949d7c79e7451"
-SRCREV_machine_qemuppc ?= "9742f3fd2260676ed73d0a1b4f1bc9fc621609ef"
+SRCREV_machine ?= "f6d02c6f5184c6be256edff161acbf29789c89d2"
+SRCREV_machine_qemuppc ?= "e883b7073c758d82e3b409ef98c35099ad69a63b"
 SRCREV_meta ?= "713abc0efa9fc21234b2f342d0a849e4a4a36c65"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 6b1cbc6cadce..5e33b1f77c78 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.10.28"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "25d0ebad3e2bf9f12bd6d386ead68e1f64ceaf29"
+SRCREV_machine ?= "e9cdab78bed262dbeadc7f403989f20972bcddde"
 SRCREV_meta ?= "713abc0efa9fc21234b2f342d0a849e4a4a36c65"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index ee27db2a0e36..baea8aeab719 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,13 +11,13 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ccf8a3041cd815d3b401000345176870903cf77f"
-SRCREV_machine_qemumips ?= "5233fddda6c698399eca44320027d5ee3ba662a8"
-SRCREV_machine_qemuppc ?= "265e7bcceaa36d7cddbc20d73e451d376b66fb30"
-SRCREV_machine_qemux86 ?= "25d0ebad3e2bf9f12bd6d386ead68e1f64ceaf29"
-SRCREV_machine_qemux86-64 ?= "25d0ebad3e2bf9f12bd6d386ead68e1f64ceaf29"
-SRCREV_machine_qemumips64 ?= "7a092b58f5f8f8f7893b2ee05d3d725ac2968d99"
-SRCREV_machine ?= "25d0ebad3e2bf9f12bd6d386ead68e1f64ceaf29"
+SRCREV_machine_qemuarm ?= "978f148bf7dd253c901d4b16401309fc50eed0a9"
+SRCREV_machine_qemumips ?= "0d1b0e40b279433b1a96ed8ee02a10f6d2c7bea7"
+SRCREV_machine_qemuppc ?= "ae9aa3e76bcc720993b02830b1cae9b15ae9b6c6"
+SRCREV_machine_qemux86 ?= "e9cdab78bed262dbeadc7f403989f20972bcddde"
+SRCREV_machine_qemux86-64 ?= "e9cdab78bed262dbeadc7f403989f20972bcddde"
+SRCREV_machine_qemumips64 ?= "38d9a2f8f334e1896629572f25968f34d8fb188d"
+SRCREV_machine ?= "e9cdab78bed262dbeadc7f403989f20972bcddde"
 SRCREV_meta ?= "713abc0efa9fc21234b2f342d0a849e4a4a36c65"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.8.1.2


