Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A0D1F609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 19:08:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4LJ8xGR010765
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 May 2015 12:08:59 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 21 May 2015 12:08:58 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 May 2015 15:08:51 -0400
Message-ID: <ae15df46ef952ae4a0fcc2b2cfab8b8a82760cb6.1432235097.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1432235097.git.bruce.ashfield@windriver.com>
References: <cover.1432235097.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/3.14: cavium and configuration changes
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
X-List-Received-Date: Thu, 21 May 2015 19:08:59 -0000
Content-Type: text/plain

Updating the 3.14 SRCREVs to integrate the latest round of cavium
support patches, as well as configuration backports from 3.19.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 86b31738b609..7da7f83b3ad0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "0c641a6c0e38137364535b99e43657a0cbc07cd4"
-SRCREV_machine_qemuppc ?= "cfc4e296efcaa84358c9ab1cdeee6ce7c378436f"
-SRCREV_meta ?= "46df2668fa657162d11f96a6f1af138c562a03aa"
+SRCREV_machine ?= "3428de71031ede23682dd0842b9cfc23ae465f39"
+SRCREV_machine_qemuppc ?= "32c44a56a8218c3349f50d8151a10252d5e85dd1"
+SRCREV_meta ?= "a996d95104b72c422a56e7d9bc8615ec4219ac74"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index d0b71c4859b1..000f288fb3e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "3.14.36"
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b991a586470900e3de824f5ea75653aa2150594d"
-SRCREV_meta ?= "46df2668fa657162d11f96a6f1af138c562a03aa"
+SRCREV_machine ?= "bda175966009d5a94103559e6e6ae51279952f39"
+SRCREV_meta ?= "a996d95104b72c422a56e7d9bc8615ec4219ac74"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index d4ea55a2398e..c809d2e29f60 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e4f91293908648d495b4f9735768633569e39b9f"
-SRCREV_machine_qemuarm64 ?= "b991a586470900e3de824f5ea75653aa2150594d"
-SRCREV_machine_qemumips ?= "6623389731309b0ac591736d5b438de833f195c7"
-SRCREV_machine_qemuppc ?= "3217fbcd002914fba4914d2e61dabb378081fd25"
-SRCREV_machine_qemux86 ?= "8794bd6a473199b2baa7a405d44cdbfa5351b60b"
-SRCREV_machine_qemux86-64 ?= "b991a586470900e3de824f5ea75653aa2150594d"
-SRCREV_machine_qemumips64 ?= "6649ef219b3bf6da1678547b9da376367520e80a"
-SRCREV_machine ?= "b991a586470900e3de824f5ea75653aa2150594d"
-SRCREV_meta ?= "46df2668fa657162d11f96a6f1af138c562a03aa"
+SRCREV_machine_qemuarm ?= "dbd8e70653ffb6b63a1b8b7134813d3a93975ff5"
+SRCREV_machine_qemuarm64 ?= "bda175966009d5a94103559e6e6ae51279952f39"
+SRCREV_machine_qemumips ?= "b985d5039e5b14f5acac135a84f2d6541b531552"
+SRCREV_machine_qemuppc ?= "dbbdaf47fae37664ea30181b18a436b3d5401293"
+SRCREV_machine_qemux86 ?= "d3943ebf24457188669472c85d82ab32e2f95f6b"
+SRCREV_machine_qemux86-64 ?= "bda175966009d5a94103559e6e6ae51279952f39"
+SRCREV_machine_qemumips64 ?= "a594ff1fef248d72bf4ef929fa4497cf54a04500"
+SRCREV_machine ?= "bda175966009d5a94103559e6e6ae51279952f39"
+SRCREV_meta ?= "a996d95104b72c422a56e7d9bc8615ec4219ac74"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
2.1.0


