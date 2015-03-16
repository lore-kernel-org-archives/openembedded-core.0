Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 76970738EC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 17:27:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2GHRD49022343
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Mar 2015 10:27:13 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 16 Mar 2015 10:27:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 16 Mar 2015 13:27:08 -0400
Message-ID: <94cccc68b34ceca60130713381027b0852b17f32.1426525757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1426525757.git.bruce.ashfield@windriver.com>
References: <cover.1426525757.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/3.19: integrate korg -stable update
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
X-List-Received-Date: Mon, 16 Mar 2015 17:27:13 -0000
Content-Type: text/plain

Updating to the latest and greatest -stable release for the 3.19 series.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 20 ++++++++++----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index d10449aab365..98ffc5a3cc37 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.19"
+LINUX_VERSION ?= "3.19.1"
 
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "43b9eced9ba8a57add36af07736344dcc383f711"
-SRCREV_meta ?= "f7a81274b461d0c748964d75c24bea8574d350fb"
+SRCREV_machine ?= "8c38c1015bbb5fc121018f67ed45a7eb2f357cfe"
+SRCREV_meta ?= "e3303ca4bd7d7a5a3d9a9a9a9467c4c70db4258d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index f1bf3bea9016..31321c55e984 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -11,19 +11,19 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "91b64df8cdcdacb9ef8d707a0c34f55a09bf170d"
-SRCREV_machine_qemuarm64 ?= "43b9eced9ba8a57add36af07736344dcc383f711"
-SRCREV_machine_qemumips ?= "7c67469a4c77a977c46f218de7e2f4699292d28b"
-SRCREV_machine_qemuppc ?= "7dc29d4265b44ad28ea3ec950b1a86be08933ce8"
-SRCREV_machine_qemux86 ?= "43b9eced9ba8a57add36af07736344dcc383f711"
-SRCREV_machine_qemux86-64 ?= "43b9eced9ba8a57add36af07736344dcc383f711"
-SRCREV_machine_qemumips64 ?= "b7ab9d4bac55415f125c81f529dbbefb07de98ad"
-SRCREV_machine ?= "43b9eced9ba8a57add36af07736344dcc383f711"
-SRCREV_meta ?= "f7a81274b461d0c748964d75c24bea8574d350fb"
+SRCREV_machine_qemuarm ?= "a40304a6dfdad6618420854121ee91cf09481bd4"
+SRCREV_machine_qemuarm64 ?= "8c38c1015bbb5fc121018f67ed45a7eb2f357cfe"
+SRCREV_machine_qemumips ?= "6f1c5213591d7a35efc542a0971c70dcd16ea00e"
+SRCREV_machine_qemuppc ?= "6b9a1cb9e10e76d8a3102c046656c93651fde9ab"
+SRCREV_machine_qemux86 ?= "8c38c1015bbb5fc121018f67ed45a7eb2f357cfe"
+SRCREV_machine_qemux86-64 ?= "8c38c1015bbb5fc121018f67ed45a7eb2f357cfe"
+SRCREV_machine_qemumips64 ?= "723d6e1eb8dfa06f374d925d2c36e22feb1a2c86"
+SRCREV_machine ?= "8c38c1015bbb5fc121018f67ed45a7eb2f357cfe"
+SRCREV_meta ?= "e3303ca4bd7d7a5a3d9a9a9a9467c4c70db4258d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.19"
+LINUX_VERSION ?= "3.19.1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


