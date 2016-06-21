Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCBBF7318F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:20:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5LFKWam001262
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Jun 2016 08:20:33 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 21 Jun 2016 08:20:32 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Jun 2016 11:20:27 -0400
Message-ID: <a851124d1ad7270f2151821681d4e74c0786c62c.1466522266.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1466522266.git.bruce.ashfield@windriver.com>
References: <cover.1466522266.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto/4.4: sensor driver backports
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
X-List-Received-Date: Tue, 21 Jun 2016 15:20:33 -0000
Content-Type: text/plain

Backporting the following mainline commits to make additional sensor
drivers available:

 iio: st-accel: add support for lis2dh12
 iio: accel: add Freescale MMA7455L/MMA7456L 3-axis accelerometer driver

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 23188a5371ed..58ab2a7dd913 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.13"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
+SRCREV_machine ?= "13852755ecbf491848afbe40e66fc152bc70915b"
 SRCREV_meta ?= "870134f4bfa6208d6e5339e065486be3b6e693a5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index d69ecec90d55..7017aeb7a42e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "cdfdcbd7ee553dc2e483813054a378ef9eaa44b6"
-SRCREV_machine_qemuarm64 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
-SRCREV_machine_qemumips ?= "b1f51ad1d4e95be437bf7725e094d6ad1b8286b0"
-SRCREV_machine_qemuppc ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
-SRCREV_machine_qemux86 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
-SRCREV_machine_qemux86-64 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
-SRCREV_machine_qemumips64 ?= "4b17815085dbd2a0408d7969bf4689a4c2b12942"
-SRCREV_machine ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
+SRCREV_machine_qemuarm ?= "6f2317f8a00a3eb6a2b28ca51f336f61eb6fe160"
+SRCREV_machine_qemuarm64 ?= "13852755ecbf491848afbe40e66fc152bc70915b"
+SRCREV_machine_qemumips ?= "9fc8fc49e5065f1ee76e964a4c0257291ab3e62a"
+SRCREV_machine_qemuppc ?= "13852755ecbf491848afbe40e66fc152bc70915b"
+SRCREV_machine_qemux86 ?= "13852755ecbf491848afbe40e66fc152bc70915b"
+SRCREV_machine_qemux86-64 ?= "13852755ecbf491848afbe40e66fc152bc70915b"
+SRCREV_machine_qemumips64 ?= "d1c1f36412d196b560ed9f19392e291b5492b94c"
+SRCREV_machine ?= "13852755ecbf491848afbe40e66fc152bc70915b"
 SRCREV_meta ?= "870134f4bfa6208d6e5339e065486be3b6e693a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


