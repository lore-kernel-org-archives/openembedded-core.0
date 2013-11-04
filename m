Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0364B6D290
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 05:56:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA45uTRv017727
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2013 21:56:29 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.89) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 21:56:28 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 4 Nov 2013 00:56:24 -0500
Message-ID: <c8a2b02a8321c1441a9bba3ebd1ed726e83a4ebf.1383544482.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383544482.git.bruce.ashfield@windriver.com>
References: <cover.1383544482.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/3.10: haswell-wc and crystalforest support
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
X-List-Received-Date: Mon, 04 Nov 2013 05:56:28 -0000
Content-Type: text/plain

Updating the 3.10 SRCREVs to add support for the haswell-sc and crystalforest
boards.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 848b04a..ce7c789 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,9 +3,9 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "57bf925362d72bbcd800e0d7d7606387bff1db12"
-SRCREV_machine_qemuppc ?= "60d63f2aece6d7ddb1ef50168fe2bc0586dbdbf9"
-SRCREV_meta ?= "43dd30e1955545a264fda63b4f66bb8f5cd875f9"
+SRCREV_machine ?= "919b378578a8f931ee87092f1ce2608a6c2815db"
+SRCREV_machine_qemuppc ?= "be60fd54789f04941b51665970ef121089f9b93e"
+SRCREV_meta ?= "aa4a6574195b220cacd9c1e8dcbba7b0b1085eb6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 8fce274..f0c781f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "3.10.17"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "05de57c692983035c9ec2cdf53234f73d2b15f23"
-SRCREV_meta ?= "43dd30e1955545a264fda63b4f66bb8f5cd875f9"
+SRCREV_machine ?= "375aee37c2508899b6a8c0bdff7d4d67cb75fb36"
+SRCREV_meta ?= "aa4a6574195b220cacd9c1e8dcbba7b0b1085eb6"
 
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index cc09531..2c2b74b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "f1714b2190a2a66caa9b775c7c9e80e731620b7d"
-SRCREV_machine_qemumips  ?= "0ff63d9064c97748eb99ecfe83eaca2288431502"
-SRCREV_machine_qemuppc ?= "fe8f8e061e437fd12187e002123b019eb4876405"
-SRCREV_machine_qemux86 ?= "05de57c692983035c9ec2cdf53234f73d2b15f23"
-SRCREV_machine_qemux86-64 ?= "05de57c692983035c9ec2cdf53234f73d2b15f23"
-SRCREV_machine_qemumips64 ?= "e4fb43c587b9ee44b1032d234594646124e29cb2"
-SRCREV_machine ?= "05de57c692983035c9ec2cdf53234f73d2b15f23"
-SRCREV_meta ?= "43dd30e1955545a264fda63b4f66bb8f5cd875f9"
+SRCREV_machine_qemuarm ?= "47ba9c54bfa38b70e2c7500a7e30a738c667cb95"
+SRCREV_machine_qemumips  ?= "b9d36bdb86b595d9823392402b31bdb76439054c"
+SRCREV_machine_qemuppc ?= "e13586324a05aba0f0cf2523ad9eecda2edd3b94"
+SRCREV_machine_qemux86 ?= "375aee37c2508899b6a8c0bdff7d4d67cb75fb36"
+SRCREV_machine_qemux86-64 ?= "375aee37c2508899b6a8c0bdff7d4d67cb75fb36"
+SRCREV_machine_qemumips64 ?= "44eaa7b02aa1e4b8e539c2227702f74f9fcbcfea"
+SRCREV_machine ?= "375aee37c2508899b6a8c0bdff7d4d67cb75fb36"
+SRCREV_meta ?= "aa4a6574195b220cacd9c1e8dcbba7b0b1085eb6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


