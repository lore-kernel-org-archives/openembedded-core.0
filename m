Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FC1F65F28
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 15:08:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s45EAIEp016793
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 May 2014 07:10:18 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 5 May 2014 07:10:18 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 5 May 2014 10:10:12 -0400
Message-ID: <dc2302bf7616dcaec1b65c72a559b68f85c72d59.1399297986.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1399297986.git.bruce.ashfield@windriver.com>
References: <cover.1399297986.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/3.10: mei.cfg: enable Intel chipsets
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
X-List-Received-Date: Mon, 05 May 2014 15:08:26 -0000
Content-Type: text/plain

Importing the mei meta data change from the yocto 3.14 kernel tree.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index ff1e13fe64f6..893d9852c08d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "8aa9023c5e2e2ca4180e971da9a2c139d5b3c79e"
 SRCREV_machine_qemuppc ?= "3dd7fd5d191245ab92889e69060ff732bdec770b"
-SRCREV_meta ?= "1eb79862c2959cfa305773e7f785d6d1810bf190"
+SRCREV_meta ?= "617c6158c3d5b931f0d6131e0b0a7b374c792599"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 57f12fe9ecdc..7081cd18aa57 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,7 @@ LINUX_VERSION ?= "3.10.38"
 KMETA = "meta"
 
 SRCREV_machine ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
-SRCREV_meta ?= "1eb79862c2959cfa305773e7f785d6d1810bf190"
+SRCREV_meta ?= "617c6158c3d5b931f0d6131e0b0a7b374c792599"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index f6e05c2c6edf..e5774f99470e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemux86 ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
 SRCREV_machine_qemux86-64 ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
 SRCREV_machine_qemumips64 ?= "ebd521c1b609b445d8baf522d71453d4c26a0440"
 SRCREV_machine ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
-SRCREV_meta ?= "1eb79862c2959cfa305773e7f785d6d1810bf190"
+SRCREV_meta ?= "617c6158c3d5b931f0d6131e0b0a7b374c792599"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


