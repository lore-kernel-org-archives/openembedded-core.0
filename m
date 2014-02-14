Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 691546F00C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 19:14:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1EJE4A1015935
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Feb 2014 11:14:05 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 14 Feb 2014 11:14:04 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 14 Feb 2014 14:13:56 -0500
Message-ID: <4bbbbfbe765d8ad0e0a41821ccafeb1999cca6c1.1392404866.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392404866.git.bruce.ashfield@windriver.com>
References: <cover.1392404866.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/3.10: add minnow-io feature to LTSI
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
X-List-Received-Date: Fri, 14 Feb 2014 19:14:07 -0000
Content-Type: text/plain

The initial merge of the LTSI 3.10 content was missing the minnow-io feature.
This has now been added to standard/ltsi and merged to all branches in the
tree. We also update the meta branch to ensure that the existing feature
will not attempt to apply patches to the tree, since they have now been
integrated.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 1c057726d2db..b5bde68cfd3c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,9 +3,9 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "f6d02c6f5184c6be256edff161acbf29789c89d2"
-SRCREV_machine_qemuppc ?= "e883b7073c758d82e3b409ef98c35099ad69a63b"
-SRCREV_meta ?= "713abc0efa9fc21234b2f342d0a849e4a4a36c65"
+SRCREV_machine ?= "f17f18f928d3af8b18b69fdf224b3e4ed86dbfbf"
+SRCREV_machine_qemuppc ?= "82c9f3bfe1c97ba8b653bff8d4e030cf54bc1de7"
+SRCREV_meta ?= "d57f7367a5f44a47b84425bb48601b41c6d0ed8a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 5e33b1f77c78..48d6082a6b14 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "3.10.28"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "e9cdab78bed262dbeadc7f403989f20972bcddde"
-SRCREV_meta ?= "713abc0efa9fc21234b2f342d0a849e4a4a36c65"
+SRCREV_machine ?= "3e0a296fae952d8d93eb0f96566bf6d4a978c8ee"
+SRCREV_meta ?= "d57f7367a5f44a47b84425bb48601b41c6d0ed8a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index baea8aeab719..32d5fee02186 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "978f148bf7dd253c901d4b16401309fc50eed0a9"
-SRCREV_machine_qemumips ?= "0d1b0e40b279433b1a96ed8ee02a10f6d2c7bea7"
-SRCREV_machine_qemuppc ?= "ae9aa3e76bcc720993b02830b1cae9b15ae9b6c6"
-SRCREV_machine_qemux86 ?= "e9cdab78bed262dbeadc7f403989f20972bcddde"
-SRCREV_machine_qemux86-64 ?= "e9cdab78bed262dbeadc7f403989f20972bcddde"
-SRCREV_machine_qemumips64 ?= "38d9a2f8f334e1896629572f25968f34d8fb188d"
-SRCREV_machine ?= "e9cdab78bed262dbeadc7f403989f20972bcddde"
-SRCREV_meta ?= "713abc0efa9fc21234b2f342d0a849e4a4a36c65"
+SRCREV_machine_qemuarm ?= "51f493f9716a76fbfe911bfdefca7e9a42a5ca13"
+SRCREV_machine_qemumips ?= "633b2257f21082fd3a784a4417b421e9cd008045"
+SRCREV_machine_qemuppc ?= "37465d34ea1aba381082d22a880774b3b3b31af3"
+SRCREV_machine_qemux86 ?= "3e0a296fae952d8d93eb0f96566bf6d4a978c8ee"
+SRCREV_machine_qemux86-64 ?= "3e0a296fae952d8d93eb0f96566bf6d4a978c8ee"
+SRCREV_machine_qemumips64 ?= "fe1fab7061b8369deca03b2ec59f186bdbe2b8d9"
+SRCREV_machine ?= "3e0a296fae952d8d93eb0f96566bf6d4a978c8ee"
+SRCREV_meta ?= "d57f7367a5f44a47b84425bb48601b41c6d0ed8a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


