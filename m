Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9BC610D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 19:30:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8PJUFx1017359
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Sep 2013 12:30:15 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 25 Sep 2013 12:30:15 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 25 Sep 2013 15:30:12 -0400
Message-ID: <994a6fb0e0fe77ece4f1282d61652525d92d348c.1380137299.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1380137299.git.bruce.ashfield@windriver.com>
References: <cover.1380137299.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.10: common-pc* config updates
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
X-List-Received-Date: Wed, 25 Sep 2013 19:30:17 -0000
Content-Type: text/plain

Bumping the 3.10 meta branch SRCREV to import the following config changes
for tghe sugarbay and common-pc wifi fragments.

   dad2b7e common-pc-64: add kernel CONFIG options for sugarbay platform
   37c617d common-pc-wifi.cfg: add support for broadcom wifi drivers

[YOCTO #5117]
[YOCTO #5238]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index b6ad4d4..48e4ff8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "f1e003e9441f0366d7b9a2209ef3108438745ea3"
 SRCREV_machine_qemuppc ?= "12be459359d5b20dbf856aa3649304c6f618d420"
-SRCREV_meta ?= "4f689aa30a2c9cf5dceb2fa3696d2cb208ee9173"
+SRCREV_meta ?= "dad2b7e1ceed654fba89907f3e14050007699b90"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 15ae4c5..8ef61e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,7 @@ LINUX_VERSION ?= "3.10.11"
 KMETA = "meta"
 
 SRCREV_machine ?= "e1aa804148370cda6f85640281af156ffa007d52"
-SRCREV_meta ?= "4f689aa30a2c9cf5dceb2fa3696d2cb208ee9173"
+SRCREV_meta ?= "dad2b7e1ceed654fba89907f3e14050007699b90"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 5dea36f..8010019 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,7 +10,7 @@ SRCREV_machine_qemux86 ?= "e1aa804148370cda6f85640281af156ffa007d52"
 SRCREV_machine_qemux86-64 ?= "e1aa804148370cda6f85640281af156ffa007d52"
 SRCREV_machine_qemumips64 ?= "6973844d304411893420a7e57545edc4dc854bd7"
 SRCREV_machine ?= "e1aa804148370cda6f85640281af156ffa007d52"
-SRCREV_meta ?= "4f689aa30a2c9cf5dceb2fa3696d2cb208ee9173"
+SRCREV_meta ?= "dad2b7e1ceed654fba89907f3e14050007699b90"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


