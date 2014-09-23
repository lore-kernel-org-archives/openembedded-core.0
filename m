Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 359D36AFB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:57:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8NEvrtM025464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Sep 2014 07:57:53 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 07:57:53 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 23 Sep 2014 10:57:43 -0400
Message-ID: <2c106138c86853b4999260bb0f87f8072531482a.1411483823.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1411483823.git.bruce.ashfield@windriver.com>
References: <cover.1411483823.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/3.17: bump to v3.17-rc6
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
X-List-Received-Date: Tue, 23 Sep 2014 14:57:53 -0000
Content-Type: text/plain

Updating the 3.17 recipe to -rc6. This is nearly the release kernel, and should
have very few changes aftert this point.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 18 +++++++++---------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
index 4da9c851e275..d1054c3abb73 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.17-rc5"
+LINUX_VERSION ?= "3.17-rc6"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "724ab25b085554741753709941e768cae1a2121e"
-SRCREV_meta ?= "62a1fd63023ab6b18114dd093be86d0854474c41"
+SRCREV_machine ?= "6cd8a70a8c51c4167f96695fb74356de6bab1c50"
+SRCREV_meta ?= "eebdfd73e01f53a042d8b03b785db9f998d69b19"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.17.bb b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
index af6b41e81fcf..6ce141d9188b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8aa46f1d04208040be52feb422f2aae48655b51f"
-SRCREV_machine_qemumips ?= "b32a452b97972bcaba5a67383f209cec06dfe089"
-SRCREV_machine_qemuppc ?= "72b05f144a4d5331ae33bff0b6f4a70fb90d2b3a"
-SRCREV_machine_qemux86 ?= "724ab25b085554741753709941e768cae1a2121e"
-SRCREV_machine_qemux86-64 ?= "724ab25b085554741753709941e768cae1a2121e"
-SRCREV_machine_qemumips64 ?= "6dabf96a2fe457e4cb8821721936e9fb72556494"
-SRCREV_machine ?= "724ab25b085554741753709941e768cae1a2121e"
-SRCREV_meta ?= "62a1fd63023ab6b18114dd093be86d0854474c41"
+SRCREV_machine_qemuarm ?= "1d23a0b00164e5ba372988456090d95312f58083"
+SRCREV_machine_qemumips ?= "2f0e803b12728d7af5ab3967c50ef3342d946c65"
+SRCREV_machine_qemuppc ?= "ad01ce94ff8ebaedfa470ee16890255cf6887cc4"
+SRCREV_machine_qemux86 ?= "6cd8a70a8c51c4167f96695fb74356de6bab1c50"
+SRCREV_machine_qemux86-64 ?= "6cd8a70a8c51c4167f96695fb74356de6bab1c50"
+SRCREV_machine_qemumips64 ?= "823eecd78233f65582724ea1d9c8c6002518ecb0"
+SRCREV_machine ?= "6cd8a70a8c51c4167f96695fb74356de6bab1c50"
+SRCREV_meta ?= "eebdfd73e01f53a042d8b03b785db9f998d69b19"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.17-rc5"
+LINUX_VERSION ?= "3.17-rc6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


