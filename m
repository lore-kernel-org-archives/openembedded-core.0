Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4DCB7725D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:16:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBAEGOLk014100
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 06:16:24 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.92.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 06:16:24 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 09:16:12 -0500
Message-ID: <6ca6cfd6c7b765a7ee47f93bc65bf8a012c3e3e8.1418220684.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418220684.git.bruce.ashfield@windriver.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] linux-yocto/3.14: update to v3.14.24
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
X-List-Received-Date: Wed, 10 Dec 2014 14:16:30 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index b2ad078bcad4..fc86725806e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,13 +3,13 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "0a875ce52aa7a42ddabdb87038074381bb268e77"
-SRCREV_machine_qemuppc ?= "b993661d41f08846daa28b14f89c8ae3e94225bd"
-SRCREV_meta ?= "fb6271a942b57bdc40c6e49f0203be153699f81c"
+SRCREV_machine ?= "baad552ea168dc31db31f0be188edefaa28a4aec"
+SRCREV_machine_qemuppc ?= "db4221ed2e1c6c617ad07d3374f630bbb59cf8b5"
+SRCREV_meta ?= "fba2d0cdb745e0f807ce134fd9d1524b7bed9742"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.14.19"
+LINUX_VERSION ?= "3.14.24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 79bd6935a22c..d168a2acbbb1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.14.19"
+LINUX_VERSION ?= "3.14.24"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "902f34d36102a4b2008b776ecae686f80d307e12"
-SRCREV_meta ?= "fb6271a942b57bdc40c6e49f0203be153699f81c"
+SRCREV_machine ?= "c100e8665052051487a17169748c457829d3f88c"
+SRCREV_meta ?= "fba2d0cdb745e0f807ce134fd9d1524b7bed9742"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index a2f4b4dccf0b..c30227e16021 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "127b621f2a4d3b1111e24423c12fac001e047c1c"
-SRCREV_machine_qemumips ?= "c3b9f1b2397f0847ab4844d1cdb8e02574434d78"
-SRCREV_machine_qemuppc ?= "73e2411cdd91764d0601c0869857f53381c2a177"
-SRCREV_machine_qemux86 ?= "e19a1b40de44e756defdfb40349342d8037609bd"
-SRCREV_machine_qemux86-64 ?= "902f34d36102a4b2008b776ecae686f80d307e12"
-SRCREV_machine_qemumips64 ?= "1c4d70272dde4b695697dd8705a031420480f712"
-SRCREV_machine ?= "902f34d36102a4b2008b776ecae686f80d307e12"
-SRCREV_meta ?= "fb6271a942b57bdc40c6e49f0203be153699f81c"
+SRCREV_machine_qemuarm ?= "b768ebfe28a20b65aba734b9f6646a3fa0adc89b"
+SRCREV_machine_qemumips ?= "c76146e6c8a015c1225141fc55d867a3e47453c6"
+SRCREV_machine_qemuppc ?= "e54ab8451c482b695ff7a0c580ef2fb1be605299"
+SRCREV_machine_qemux86 ?= "146fcb1dd7b3c5547d67f04d50b082f0723741e9"
+SRCREV_machine_qemux86-64 ?= "c100e8665052051487a17169748c457829d3f88c"
+SRCREV_machine_qemumips64 ?= "71621ee758600abd3cf7187d7a8e7d51f4052c53"
+SRCREV_machine ?= "c100e8665052051487a17169748c457829d3f88c"
+SRCREV_meta ?= "fba2d0cdb745e0f807ce134fd9d1524b7bed9742"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.14.19"
+LINUX_VERSION ?= "3.14.24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


