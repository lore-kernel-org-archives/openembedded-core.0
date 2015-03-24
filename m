Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AC09273BFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 18:57:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2OIvtnd027235
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Mar 2015 11:57:56 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 24 Mar 2015 11:57:55 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 24 Mar 2015 14:57:50 -0400
Message-ID: <293b7a5d863933f86a68973cdeb74c848e934637.1427222980.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1427222980.git.bruce.ashfield@windriver.com>
References: <cover.1427222980.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/3.19: configuration updates and stable import
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
X-List-Received-Date: Tue, 24 Mar 2015 18:57:56 -0000
Content-Type: text/plain

Updating the 3.19 SRCREVs to pick up the korg 3.19.2 release, as well
as the following meta data changes:

  ed82e1ac3196 features: soc: fix typo in baytrail.cfg
  76bc151242d7 tiny.cfg: Enable BINFMT_SCRIPT

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 20 ++++++++++----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index 98ffc5a3cc37..d5a07dd68918 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.19.1"
+LINUX_VERSION ?= "3.19.2"
 
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8c38c1015bbb5fc121018f67ed45a7eb2f357cfe"
-SRCREV_meta ?= "e3303ca4bd7d7a5a3d9a9a9a9467c4c70db4258d"
+SRCREV_machine ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
+SRCREV_meta ?= "8fc194deced3f83e78b0671c6ff8b45bdb7f80e7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index 31321c55e984..ac1856abcecc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -11,19 +11,19 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a40304a6dfdad6618420854121ee91cf09481bd4"
-SRCREV_machine_qemuarm64 ?= "8c38c1015bbb5fc121018f67ed45a7eb2f357cfe"
-SRCREV_machine_qemumips ?= "6f1c5213591d7a35efc542a0971c70dcd16ea00e"
-SRCREV_machine_qemuppc ?= "6b9a1cb9e10e76d8a3102c046656c93651fde9ab"
-SRCREV_machine_qemux86 ?= "8c38c1015bbb5fc121018f67ed45a7eb2f357cfe"
-SRCREV_machine_qemux86-64 ?= "8c38c1015bbb5fc121018f67ed45a7eb2f357cfe"
-SRCREV_machine_qemumips64 ?= "723d6e1eb8dfa06f374d925d2c36e22feb1a2c86"
-SRCREV_machine ?= "8c38c1015bbb5fc121018f67ed45a7eb2f357cfe"
-SRCREV_meta ?= "e3303ca4bd7d7a5a3d9a9a9a9467c4c70db4258d"
+SRCREV_machine_qemuarm ?= "473e2f3788730c51e82714a9785325b6308f6762"
+SRCREV_machine_qemuarm64 ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
+SRCREV_machine_qemumips ?= "d43f1cbf282d020f7aa31d68a54b2876d2c0e81b"
+SRCREV_machine_qemuppc ?= "35de413056b86191963ffe686913da31b978a9b3"
+SRCREV_machine_qemux86 ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
+SRCREV_machine_qemux86-64 ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
+SRCREV_machine_qemumips64 ?= "d35649ef8cbb0a0404be5c721377b138866181ad"
+SRCREV_machine ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
+SRCREV_meta ?= "8fc194deced3f83e78b0671c6ff8b45bdb7f80e7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.19.1"
+LINUX_VERSION ?= "3.19.2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


