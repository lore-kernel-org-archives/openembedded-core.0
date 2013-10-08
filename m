Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 076816CF3F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 21:04:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r98L4H8N015361
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Oct 2013 14:04:17 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 8 Oct 2013 14:04:17 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 8 Oct 2013 17:04:14 -0400
Message-ID: <f3e77a59bb720c9ebf1ed04c1ffd04bafda9bdfb.1381266137.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1381266137.git.bruce.ashfield@windriver.com>
References: <cover.1381266137.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/3.10: boot-live.cfg: Add CONFIG_ZISO=y
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
X-List-Received-Date: Tue, 08 Oct 2013 21:04:17 -0000
Content-Type: text/plain

Updating the meta branch SRCREV with the following commit:

[
    The oe-core live class now fully support compressed ISO images this is
    the corresponding kernel change.

    Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 3 ++-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index d55c7b9..9ca87f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "f1e003e9441f0366d7b9a2209ef3108438745ea3"
 SRCREV_machine_qemuppc ?= "12be459359d5b20dbf856aa3649304c6f618d420"
-SRCREV_meta ?= "363bd856c8101d4227d492cc911bc4ca0c4987c6"
+SRCREV_meta ?= "d671e0ec09b330d68f70f13a7813cc9ecfceaa8d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index a238b6a..6bd7ab2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,8 @@ LINUX_VERSION ?= "3.10.11"
 KMETA = "meta"
 
 SRCREV_machine ?= "e1aa804148370cda6f85640281af156ffa007d52"
-SRCREV_meta ?= "363bd856c8101d4227d492cc911bc4ca0c4987c6"
+SRCREV_meta ?= "d671e0ec09b330d68f70f13a7813cc9ecfceaa8d"
+
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 3b8121b..d49fdac 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,7 +10,7 @@ SRCREV_machine_qemux86 ?= "e1aa804148370cda6f85640281af156ffa007d52"
 SRCREV_machine_qemux86-64 ?= "e1aa804148370cda6f85640281af156ffa007d52"
 SRCREV_machine_qemumips64 ?= "6973844d304411893420a7e57545edc4dc854bd7"
 SRCREV_machine ?= "e1aa804148370cda6f85640281af156ffa007d52"
-SRCREV_meta ?= "363bd856c8101d4227d492cc911bc4ca0c4987c6"
+SRCREV_meta ?= "d671e0ec09b330d68f70f13a7813cc9ecfceaa8d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


