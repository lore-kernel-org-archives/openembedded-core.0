Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7BBA716FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 04:43:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s914hl36005861
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Sep 2014 21:43:47 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 30 Sep 2014 21:43:47 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Oct 2014 00:43:35 -0400
Message-ID: <ee6a55b43302ca33d07e7372c9313af9acf37d83.1412137857.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1412137857.git.bruce.ashfield@windriver.com>
References: <cover.1412137857.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/3.17: update to v3.17-rc7
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
X-List-Received-Date: Wed, 01 Oct 2014 04:43:52 -0000
Content-Type: text/plain

Updating the 3.17 tree to the rc7 release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 18 +++++++++---------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
index 9c33985fab98..eae08540e6e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.17-rc6"
+LINUX_VERSION ?= "3.17-rc7"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "8b5bc69a2e44100313cf2a5073a07f495a6ff08e"
-SRCREV_meta ?= "6050ee24b0b51ccaf35894afc5def0b59f434977"
+SRCREV_machine ?= "268b7677421eef003a84f31c6bd0b8ec3acc1e36"
+SRCREV_meta ?= "84b57b01050dd9e5a004e265e70120e2a792f38a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.17.bb b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
index 68208ebeb909..02f10a3aaf0f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "787dbffa74ebb7e0f3d8ade959623c69c9c066a0"
-SRCREV_machine_qemumips ?= "417faf05188f982bb1d47709f7c152a5cf116a0d"
-SRCREV_machine_qemuppc ?= "975512c7f6caa812869c4fa0ed1788072bf383f6"
-SRCREV_machine_qemux86 ?= "8b5bc69a2e44100313cf2a5073a07f495a6ff08e"
-SRCREV_machine_qemux86-64 ?= "8b5bc69a2e44100313cf2a5073a07f495a6ff08e"
-SRCREV_machine_qemumips64 ?= "39878abc7e56c23cd4bc87b2c5d812d489903dee"
-SRCREV_machine ?= "8b5bc69a2e44100313cf2a5073a07f495a6ff08e"
-SRCREV_meta ?= "6050ee24b0b51ccaf35894afc5def0b59f434977"
+SRCREV_machine_qemuarm ?= "d156e4658a13349f7a30adafd436e32fb722d248"
+SRCREV_machine_qemumips ?= "5aa58a6ca9d4efe79ddf66c9d09695b42c84a3b6"
+SRCREV_machine_qemuppc ?= "cc4943bf3b93f9c424b63c357ab2c9f71384f3ac"
+SRCREV_machine_qemux86 ?= "268b7677421eef003a84f31c6bd0b8ec3acc1e36"
+SRCREV_machine_qemux86-64 ?= "268b7677421eef003a84f31c6bd0b8ec3acc1e36"
+SRCREV_machine_qemumips64 ?= "798c30525b1e0eacfa3ff97c4bb17c45b9b4b220"
+SRCREV_machine ?= "268b7677421eef003a84f31c6bd0b8ec3acc1e36"
+SRCREV_meta ?= "84b57b01050dd9e5a004e265e70120e2a792f38a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.17-rc6"
+LINUX_VERSION ?= "3.17-rc7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


