Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 503AD6D290
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 05:56:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA45uRQr014856
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2013 21:56:28 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.89) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 21:56:27 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 4 Nov 2013 00:56:23 -0500
Message-ID: <069689924e63da9f1bbdb56349b0b31d5619c0c9.1383544482.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383544482.git.bruce.ashfield@windriver.com>
References: <cover.1383544482.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto-3.10: bump to 3.10.17 and -rt11
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
X-List-Received-Date: Mon, 04 Nov 2013 05:56:27 -0000
Content-Type: text/plain

Updating the SRCREVs to reflect the integration of the .17 -stable release
and the preempt-rt up date to -rt11.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 603edde..848b04a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "cea2d99f298cd3e356f273631a647c93a178881f"
-SRCREV_machine_qemuppc ?= "a93e52c77f25a018be54c82e3ccfa0a50555117b"
-SRCREV_meta ?= "452f0679ea93a6cb4433bebd7177629228a5cf68"
+SRCREV_machine ?= "57bf925362d72bbcd800e0d7d7606387bff1db12"
+SRCREV_machine_qemuppc ?= "60d63f2aece6d7ddb1ef50168fe2bc0586dbdbf9"
+SRCREV_meta ?= "43dd30e1955545a264fda63b4f66bb8f5cd875f9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.11"
+LINUX_VERSION ?= "3.10.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index e0b17dc..8fce274 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.11"
+LINUX_VERSION ?= "3.10.17"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "3f6c8243ed67011f70b27952d42657cf3a2c3115"
-SRCREV_meta ?= "452f0679ea93a6cb4433bebd7177629228a5cf68"
+SRCREV_machine ?= "05de57c692983035c9ec2cdf53234f73d2b15f23"
+SRCREV_meta ?= "43dd30e1955545a264fda63b4f66bb8f5cd875f9"
 
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 9b280cb..cc09531 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -3,18 +3,18 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "07224529d7ceb1e16eb815b8dd4c03ad9d58653d"
-SRCREV_machine_qemumips  ?= "7747c5a158a99b8a668fd526f1f7f1f7f7e03d3e"
-SRCREV_machine_qemuppc ?= "d63375e4b0a2de3ba110b83f78d6be6e01ec5c9e"
-SRCREV_machine_qemux86 ?= "3f6c8243ed67011f70b27952d42657cf3a2c3115"
-SRCREV_machine_qemux86-64 ?= "3f6c8243ed67011f70b27952d42657cf3a2c3115"
-SRCREV_machine_qemumips64 ?= "9a4f9f4d44fdcd25fe365216b366bc346efb23d0"
-SRCREV_machine ?= "3f6c8243ed67011f70b27952d42657cf3a2c3115"
-SRCREV_meta ?= "452f0679ea93a6cb4433bebd7177629228a5cf68"
+SRCREV_machine_qemuarm ?= "f1714b2190a2a66caa9b775c7c9e80e731620b7d"
+SRCREV_machine_qemumips  ?= "0ff63d9064c97748eb99ecfe83eaca2288431502"
+SRCREV_machine_qemuppc ?= "fe8f8e061e437fd12187e002123b019eb4876405"
+SRCREV_machine_qemux86 ?= "05de57c692983035c9ec2cdf53234f73d2b15f23"
+SRCREV_machine_qemux86-64 ?= "05de57c692983035c9ec2cdf53234f73d2b15f23"
+SRCREV_machine_qemumips64 ?= "e4fb43c587b9ee44b1032d234594646124e29cb2"
+SRCREV_machine ?= "05de57c692983035c9ec2cdf53234f73d2b15f23"
+SRCREV_meta ?= "43dd30e1955545a264fda63b4f66bb8f5cd875f9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.11"
+LINUX_VERSION ?= "3.10.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


