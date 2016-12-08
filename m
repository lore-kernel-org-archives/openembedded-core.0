Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1F8476069D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 18:02:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB8I2YWi017130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Dec 2016 10:02:36 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Dec 2016 10:00:02 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 8 Dec 2016 12:58:49 -0500
Message-ID: <68bfe1e429cb8d12eab066130782d3fef261332c.1481216659.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1481216659.git.bruce.ashfield@windriver.com>
References: <cover.1481216659.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto/4.4/4.8: Fix remaining kernel_configcheck warnings in Intel BSPs
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
X-List-Received-Date: Thu, 08 Dec 2016 18:02:36 -0000
Content-Type: text/plain

Integrating the following meta-data change to remove warnings during
kernel configuration checking:

  bec7e0ace0e5 leds.cfg: Remove CONFIG_LEDS_TRIGGER_CPU
  cc857e64ea34 bsp/intel-quark: Remove bosch-pressure-sensor-i2c
  3198ab25af74 features/i2c: Support I2C_MUX by default

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 5842d716e7d6..35dcd473d51b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "85e8c6c297d6d4a6f6694b69812030fff07a88fd"
-SRCREV_meta ?= "24ea5324fc90c7cb15ce1a08cdd294f22c6e6382"
+SRCREV_meta ?= "2d1114e7b6f39e8e4c442ad18e2eda1a918c7e48"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index fe663b1711f1..980e4b14ed7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "df64f1041f15871cffb254d7136072d1d4859284"
-SRCREV_meta ?= "1dc615a67779fdfd36548fd48e54bd19b6e6209e"
+SRCREV_meta ?= "f768e31c67f7c67b27ff2c1ba857eef2367de974"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 6accc1850dea..8c3043b78c6c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
-SRCREV_meta ?= "24ea5324fc90c7cb15ce1a08cdd294f22c6e6382"
+SRCREV_meta ?= "2d1114e7b6f39e8e4c442ad18e2eda1a918c7e48"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 0ff18b8d8cea..82daf48585e6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "78e5c86c1c194e2045e8eb2c948d00f2dbb1f31c"
-SRCREV_meta ?= "1dc615a67779fdfd36548fd48e54bd19b6e6209e"
+SRCREV_meta ?= "f768e31c67f7c67b27ff2c1ba857eef2367de974"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 2f2b85b02f2e..dd56a9640f9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
 SRCREV_machine_qemux86-64 ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
 SRCREV_machine_qemumips64 ?= "baea2f5605baba0d49a9afac8a46717193ccef90"
 SRCREV_machine ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
-SRCREV_meta ?= "24ea5324fc90c7cb15ce1a08cdd294f22c6e6382"
+SRCREV_meta ?= "2d1114e7b6f39e8e4c442ad18e2eda1a918c7e48"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index 16058ed83329..6c7ab52f1552 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "9acf42c4475aa0699b2692d7f27f22d699b36337"
 SRCREV_machine_qemux86-64 ?= "9acf42c4475aa0699b2692d7f27f22d699b36337"
 SRCREV_machine_qemumips64 ?= "ff92ef8e2b67415b5e6fd4cd15489cb43de8c932"
 SRCREV_machine ?= "9acf42c4475aa0699b2692d7f27f22d699b36337"
-SRCREV_meta ?= "1dc615a67779fdfd36548fd48e54bd19b6e6209e"
+SRCREV_meta ?= "f768e31c67f7c67b27ff2c1ba857eef2367de974"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
-- 
2.5.0


