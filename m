Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCC6D71C73
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 18:03:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB8I3kho003984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Dec 2016 10:03:47 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Dec 2016 10:03:13 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 8 Dec 2016 12:58:55 -0500
Message-ID: <20560579aca09fc070a5aab90656ed2335ebcbc1.1481216659.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1481216659.git.bruce.ashfield@windriver.com>
References: <cover.1481216659.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] linux-yocto/4.x: CVE-2016-8655
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
X-List-Received-Date: Thu, 08 Dec 2016 18:03:46 -0000
Content-Type: text/plain

Backporting upstream commit 84ac726023 [packet: fix race condition in
packet_set_ring] to address CVE-2016-8655

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 16 ++++++++--------
 9 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 529fa205f199..de3582a7aa05 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "47e987ba389beac0c7983dd37f215807eee86881"
+SRCREV_machine ?= "f3ffbf4880a5103504a4e11c9427b0bdbf222939"
 SRCREV_meta ?= "44719fa8f73fd7c444044ad3c04f5fc66f57b993"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 45c59b94afd5..d6e9626c00eb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2abc21f69ad9c72b296a85cd738254b5483da229"
+SRCREV_machine ?= "61d7bf47fe27b7dfd9a73b0a6de2d78a29af8b74"
 SRCREV_meta ?= "b846fc6436aa5d4c747d620e83dfda969854d10c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index c939bbabd112..8ed9d8f3743f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "aa9ab71e9d9539c7f81282a47e87dea79c2e0f4e"
+SRCREV_machine ?= "b2d665b3453891cd066c8a172af0b7785c365f57"
 SRCREV_meta ?= "b22e47739683444916dc64548df1dbf6856500a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 28ddfa993635..80be144e4ee4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.36"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f75d58721859cd2ce5382bcdcae35479a6ce9f21"
+SRCREV_machine ?= "fec49247816d7045aa8abe0047bcd4737af9a853"
 SRCREV_meta ?= "44719fa8f73fd7c444044ad3c04f5fc66f57b993"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 28c3dfad8cc7..dfd947cf75ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.36"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9cc72ea6194abae764a2db8f6a32cde60e739d7c"
+SRCREV_machine ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
 SRCREV_meta ?= "b846fc6436aa5d4c747d620e83dfda969854d10c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index e1de91461f43..43dc34bd25a4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.8.12"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c12f4b364b6638843f5b9049c7fd467503bf30a8"
+SRCREV_machine ?= "e274a507b23c23bf0dd6502d0c38fae731c11511"
 SRCREV_meta ?= "b22e47739683444916dc64548df1dbf6856500a5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 70ff99de1dd0..b55487782776 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "6f0ca13105ff444e5adcea39d68c5f7707b1d23b"
-SRCREV_machine_qemuarm64 ?= "f75d58721859cd2ce5382bcdcae35479a6ce9f21"
-SRCREV_machine_qemumips ?= "d5bd5d3069bfccfb76c420f27e1e6fd94aaa3dcc"
-SRCREV_machine_qemuppc ?= "1006b2e79cf808a2e8a74a1b0325dec9b4d0873e"
-SRCREV_machine_qemux86 ?= "f75d58721859cd2ce5382bcdcae35479a6ce9f21"
-SRCREV_machine_qemux86-64 ?= "f75d58721859cd2ce5382bcdcae35479a6ce9f21"
-SRCREV_machine_qemumips64 ?= "985d7f27f0ad497a0072320fbbf05626e27c741a"
-SRCREV_machine ?= "f75d58721859cd2ce5382bcdcae35479a6ce9f21"
+SRCREV_machine_qemuarm ?= "c8ab8bf2bdff3b355710065725f4e272bf0a5a5d"
+SRCREV_machine_qemuarm64 ?= "fec49247816d7045aa8abe0047bcd4737af9a853"
+SRCREV_machine_qemumips ?= "475a0182d9e940351a3fecaecb31e55effad45ad"
+SRCREV_machine_qemuppc ?= "88a3e5a3a8f693d25b09b64cd2be5df783933f74"
+SRCREV_machine_qemux86 ?= "fec49247816d7045aa8abe0047bcd4737af9a853"
+SRCREV_machine_qemux86-64 ?= "fec49247816d7045aa8abe0047bcd4737af9a853"
+SRCREV_machine_qemumips64 ?= "9ffd7155a07e7cfed2229b3a78d2278f3b56f13d"
+SRCREV_machine ?= "fec49247816d7045aa8abe0047bcd4737af9a853"
 SRCREV_meta ?= "44719fa8f73fd7c444044ad3c04f5fc66f57b993"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 2246555a3ff8..7d734ac423dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0166111980b931967bf3449d3d040aac6ff523a8"
-SRCREV_machine_qemuarm64 ?= "9cc72ea6194abae764a2db8f6a32cde60e739d7c"
-SRCREV_machine_qemumips ?= "90bf4bfeee3d0ca1cf0077dc1e0045cd9237e392"
-SRCREV_machine_qemuppc ?= "9cc72ea6194abae764a2db8f6a32cde60e739d7c"
-SRCREV_machine_qemux86 ?= "9cc72ea6194abae764a2db8f6a32cde60e739d7c"
-SRCREV_machine_qemux86-64 ?= "9cc72ea6194abae764a2db8f6a32cde60e739d7c"
-SRCREV_machine_qemumips64 ?= "fd20390d53c24f1ef0293b2c26b8e883e87e91f3"
-SRCREV_machine ?= "9cc72ea6194abae764a2db8f6a32cde60e739d7c"
+SRCREV_machine_qemuarm ?= "2859bb3c9e1bb307d9e4e03032fd8a529137552f"
+SRCREV_machine_qemuarm64 ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
+SRCREV_machine_qemumips ?= "3c4c23020da8a0596a64c8784c6d3a2dfa1ea324"
+SRCREV_machine_qemuppc ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
+SRCREV_machine_qemux86 ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
+SRCREV_machine_qemux86-64 ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
+SRCREV_machine_qemumips64 ?= "5d05923ecc402c127b92543ee44b890de5c53a7e"
+SRCREV_machine ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
 SRCREV_meta ?= "b846fc6436aa5d4c747d620e83dfda969854d10c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index 4be42679551a..090358873b46 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9e3e856bc06ddaacc5f4075603630fcca76810f7"
-SRCREV_machine_qemuarm64 ?= "008b4cdf62307da4e07082fd8782d70ba07500cb"
-SRCREV_machine_qemumips ?= "c86ac5b3228b43304d8b2f1d49a0e4bd66207342"
-SRCREV_machine_qemuppc ?= "5a245217d5271d1961df408b9a723a4eb188e0bf"
-SRCREV_machine_qemux86 ?= "45f25516edd8636f1fec250f6e3020408cd30be9"
-SRCREV_machine_qemux86-64 ?= "45f25516edd8636f1fec250f6e3020408cd30be9"
-SRCREV_machine_qemumips64 ?= "7bfa2a19b1aa9f1389f8276d6a7669472517b18a"
-SRCREV_machine ?= "45f25516edd8636f1fec250f6e3020408cd30be9"
+SRCREV_machine_qemuarm ?= "2bb25d9e29ff91d3266e6abe12c6c1a6b6508e98"
+SRCREV_machine_qemuarm64 ?= "4b1b4bfb6cf27609b37eb44cd7fee700cd402123"
+SRCREV_machine_qemumips ?= "d116a8bdd1d90fe3dde092f119a2dde1674b02c4"
+SRCREV_machine_qemuppc ?= "ef0e5cfd16edcb52ec2e3d5abdcb97d8881b2c3d"
+SRCREV_machine_qemux86 ?= "021b4aef55b44597587a1ce5879be642b3dca155"
+SRCREV_machine_qemux86-64 ?= "021b4aef55b44597587a1ce5879be642b3dca155"
+SRCREV_machine_qemumips64 ?= "1b20066b88c3abdde1f6c449b6562a516b4cce6d"
+SRCREV_machine ?= "021b4aef55b44597587a1ce5879be642b3dca155"
 SRCREV_meta ?= "b22e47739683444916dc64548df1dbf6856500a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


