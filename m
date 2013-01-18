Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Tw4bZ-0000Rh-Ig
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 06:35:15 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0I5JaTG006246;
	Thu, 17 Jan 2013 21:19:39 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 18 Jan 2013 00:19:30 -0500
Message-Id: <35e6bc2991c36737b027fb78db8309ad968d69e2.1358485481.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358485481.git.bruce.ashfield@windriver.com>
References: <cover.1358485481.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1358485481.git.bruce.ashfield@windriver.com>
References: <cover.1358485481.git.bruce.ashfield@windriver.com>
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/routerstationpro: enable GPIO_SYSFS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 05:35:16 -0000

We had a request to enable GPIO_SYSFS to allow easy use of the available
GPIOs in the board out of the box. This is a simple / contained config item
to enable, so there's no reason not to.

[YOCTO #3519]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 2674090..bcac395 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "729e8634f75bf10582916eae6b5b96325785c001"
 SRCREV_machine_qemuppc ?= "15ce18fac50c49ea4893b0d7ed3d0086ef9c7448"
-SRCREV_meta ?= "d9646442b3763097a425c4e728525685bafc4b89"
+SRCREV_meta ?= "2cbb5aca2c25e37b04828cf0b7d90e2f22af816e"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 083cdf5..984476f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -13,7 +13,7 @@ LINUX_VERSION ?= "3.4.24"
 KMETA = "meta"
 
 SRCREV_machine ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
-SRCREV_meta ?= "d9646442b3763097a425c4e728525685bafc4b89"
+SRCREV_meta ?= "2cbb5aca2c25e37b04828cf0b7d90e2f22af816e"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 35f0074..0ac51b9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "1c8a1aa8cc839f0328edbfe0d755100368bc4ae6"
 SRCREV_machine_qemux86 ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
 SRCREV_machine_qemux86-64 ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
 SRCREV_machine ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
-SRCREV_meta ?= "d9646442b3763097a425c4e728525685bafc4b89"
+SRCREV_meta ?= "2cbb5aca2c25e37b04828cf0b7d90e2f22af816e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.7.10.4



