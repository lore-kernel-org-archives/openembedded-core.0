Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9829F7169F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 04:43:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s914hjt3007889
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Sep 2014 21:43:45 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 30 Sep 2014 21:43:45 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Oct 2014 00:43:32 -0400
Message-ID: <40947bb37f431bb1b7d18f0cb21811c6dddde537.1412137857.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1412137857.git.bruce.ashfield@windriver.com>
References: <cover.1412137857.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/3.14/3.17: menuconfig and cryptodev
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
X-List-Received-Date: Wed, 01 Oct 2014 04:43:51 -0000
Content-Type: text/plain

Two issues were reported with the 3.14 kernel, cryptodev was not properly
building and working on all devices, and menuconfig was not working on some
hosts.

To fix this, we pull in the latest cryptodev updates, and restore an old
ncurses patch for menuconfig.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 14 +++++++-------
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 16 ++++++++--------
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 7eecc7fe562b..1a756ecb3f2b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,8 +3,8 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "63e1f827790683d4ef01c71acfdf20b79f986d99"
-SRCREV_machine_qemuppc ?= "2c51fd8a6fcf79386e3418ff78d42390ad6b5aa2"
+SRCREV_machine ?= "1f000ea7a3aed269c78a8650672f05ff2447feb5"
+SRCREV_machine_qemuppc ?= "01a649de749d9e82291063bd23301a6e7530e100"
 SRCREV_meta ?= "0bd3ec19b64191efc9d0ba83d05c9f7f9bf4473a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index ff4a5748067e..7b6d0e0f649f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,7 +8,7 @@ LINUX_VERSION ?= "3.14.19"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "14fea2388e7b248c4e9442ac95fcbf1e4d265ee2"
+SRCREV_machine ?= "dbe5b52e93ff114b2c0f5da6f6af91f52c18f2b8"
 SRCREV_meta ?= "0bd3ec19b64191efc9d0ba83d05c9f7f9bf4473a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
index d1054c3abb73..c2bd4a1f6547 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
@@ -8,8 +8,8 @@ LINUX_VERSION ?= "3.17-rc6"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "6cd8a70a8c51c4167f96695fb74356de6bab1c50"
-SRCREV_meta ?= "eebdfd73e01f53a042d8b03b785db9f998d69b19"
+SRCREV_machine ?= "460fa8aefe8c4f695245ad3a21da96af2c341f21"
+SRCREV_meta ?= "6050ee24b0b51ccaf35894afc5def0b59f434977"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index efc193bb3c4f..7ef71f3e20b3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,13 +10,13 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1c7a46a46b2cbf68777713531647cd4b1cf22f12"
-SRCREV_machine_qemumips ?= "f3dea87bc7aaccae5c24240b378a4e09034d80af"
-SRCREV_machine_qemuppc ?= "195f2029d49fc2440cf236d5134eb2ab88b8d407"
-SRCREV_machine_qemux86 ?= "bdef75805ede16c13f4383cc53d66dad3e83da64"
-SRCREV_machine_qemux86-64 ?= "14fea2388e7b248c4e9442ac95fcbf1e4d265ee2"
-SRCREV_machine_qemumips64 ?= "b5c533e6ffba299b24d31cc2b8f32f6302f5d7e3"
-SRCREV_machine ?= "14fea2388e7b248c4e9442ac95fcbf1e4d265ee2"
+SRCREV_machine_qemuarm ?= "c21684fb4fad62bceafcc97ae592d1d1bd52cf36"
+SRCREV_machine_qemumips ?= "626a3a63414413e652daf3288903a58973d34520"
+SRCREV_machine_qemuppc ?= "a5e37ff008b4bf2c0cb573f54376cb8b48a79016"
+SRCREV_machine_qemux86 ?= "a39fd81fa54776b2ac8c288251846890c3124dee"
+SRCREV_machine_qemux86-64 ?= "dbe5b52e93ff114b2c0f5da6f6af91f52c18f2b8"
+SRCREV_machine_qemumips64 ?= "c14d3c68c725205a5724cffe9f6f688d1bc38b6e"
+SRCREV_machine ?= "dbe5b52e93ff114b2c0f5da6f6af91f52c18f2b8"
 SRCREV_meta ?= "0bd3ec19b64191efc9d0ba83d05c9f7f9bf4473a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.17.bb b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
index 6ce141d9188b..c424070da2d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
@@ -10,14 +10,14 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1d23a0b00164e5ba372988456090d95312f58083"
-SRCREV_machine_qemumips ?= "2f0e803b12728d7af5ab3967c50ef3342d946c65"
-SRCREV_machine_qemuppc ?= "ad01ce94ff8ebaedfa470ee16890255cf6887cc4"
-SRCREV_machine_qemux86 ?= "6cd8a70a8c51c4167f96695fb74356de6bab1c50"
-SRCREV_machine_qemux86-64 ?= "6cd8a70a8c51c4167f96695fb74356de6bab1c50"
-SRCREV_machine_qemumips64 ?= "823eecd78233f65582724ea1d9c8c6002518ecb0"
-SRCREV_machine ?= "6cd8a70a8c51c4167f96695fb74356de6bab1c50"
-SRCREV_meta ?= "eebdfd73e01f53a042d8b03b785db9f998d69b19"
+SRCREV_machine_qemuarm ?= "b3934b47d8a16fe323546d7dca3529bf75ef6245"
+SRCREV_machine_qemumips ?= "9b74a60868ec2e45ecaea70547331b1ef6776b14"
+SRCREV_machine_qemuppc ?= "d63220db68089d0604cadd2d0c3d345dfb0dfdb1"
+SRCREV_machine_qemux86 ?= "460fa8aefe8c4f695245ad3a21da96af2c341f21"
+SRCREV_machine_qemux86-64 ?= "460fa8aefe8c4f695245ad3a21da96af2c341f21"
+SRCREV_machine_qemumips64 ?= "9faa5776183318eb41c191bacd05913166d19eb5"
+SRCREV_machine ?= "460fa8aefe8c4f695245ad3a21da96af2c341f21"
+SRCREV_meta ?= "6050ee24b0b51ccaf35894afc5def0b59f434977"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


