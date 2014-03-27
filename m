Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C079F6F902
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:25:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2RIPM5G015826
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 11:25:22 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 11:25:22 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Mar 2014 14:25:02 -0400
Message-ID: <955a2eda978e2bf5f9472e0d174cfedac9b9c592.1395944068.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395944068.git.bruce.ashfield@windriver.com>
References: <cover.1395944068.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 07/13] linux-yocto/3.10: update intel common meta data
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
X-List-Received-Date: Thu, 27 Mar 2014 18:25:32 -0000
Content-Type: text/plain

Bumping the meta branch SRCREV for the following two commits:

  df3aa753c882 intel-common: Add media-all to the standard builds
  4b0d57269dae intel-common: Add mohonpeak BSP

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 98f4936c873f..9b0c5d3e23ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "f121a3aa028df37b8050779adaa239d29aaa2edd"
 SRCREV_machine_qemuppc ?= "7172d3cbc73584e724b61ef5d13fc3519720f4c0"
-SRCREV_meta ?= "cce9fc32c10dc875bf1ae0a4a86fe3ce79138f5a"
+SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index bb41ef2b1691..baa82fd88664 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,7 @@ LINUX_VERSION ?= "3.10.34"
 KMETA = "meta"
 
 SRCREV_machine ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
-SRCREV_meta ?= "cce9fc32c10dc875bf1ae0a4a86fe3ce79138f5a"
+SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 2586ffc0d5d0..56fbd07c211f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemux86 ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
 SRCREV_machine_qemux86-64 ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
 SRCREV_machine_qemumips64 ?= "e05f0378e9c21d689eed8aacb306d2c1a044e0d0"
 SRCREV_machine ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
-SRCREV_meta ?= "cce9fc32c10dc875bf1ae0a4a86fe3ce79138f5a"
+SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


