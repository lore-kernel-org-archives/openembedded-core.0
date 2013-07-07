Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id A73236B0EB
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jul 2013 02:07:15 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id h1so4957434oag.33
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 19:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=fNvqYlSMPxg0lnbKBmr36Ys1Xd75Jw19h2/aBSWCFN0=;
	b=KPubX3MyK68CBT3cMUuAc3+rmwNALt4oMHgioSD5EvGGWcCNxAZ1ZjB2vou2SEFHe9
	dxOeVfbYHxtMKP3OdxHp58zy4JhLI5CILVoCwh1ORECrgV/tW/GkTcIg6sb+0Wi1tqDv
	zRkMU/gCS4//01b8N2wAw4FRsfzg34pgIxpT/UNEYlBCNpuexnbKtaG5NAtQl1IGKjy2
	6Rz2hp1q6h3C0Gj3oia2fTq22pUItJqVW36NUOqSRx0RENwd0OqoEzgCQjKnfwL3mkgQ
	I6TAlOMKUgwqsSTAR8d8ij9v5aNt7/dCgY5p0YItOBX5AqKRwSQQ81mPTOiUUq3w4/vH
	qXWw==
X-Received: by 10.182.32.4 with SMTP id e4mr16465384obi.16.1373162836550;
	Sat, 06 Jul 2013 19:07:16 -0700 (PDT)
Received: from localhost.localdomain ([96.44.77.72])
	by mx.google.com with ESMTPSA id
	mq1sm25398536obb.14.2013.07.06.19.07.14 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 19:07:15 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sat,  6 Jul 2013 22:07:06 -0400
Message-Id: <dd626321f93b7d145b05bedd54eba9d1947a1d6c.1373162626.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1373162626.git.bruce.ashfield@windriver.com>
References: <cover.1373162626.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1373162626.git.bruce.ashfield@windriver.com>
References: <cover.1373162626.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.4: update to v3.4.52
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
X-List-Received-Date: Sun, 07 Jul 2013 02:07:15 -0000

Updating the 3.4 kernel to the latest korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 1655da8..5e50cde 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.46"
+LINUX_VERSION ?= "3.4.52"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "2a1d3b50a2889587d0fed92ccb09051a9e300735"
-SRCREV_machine_qemuppc ?= "0168221d2c818898b69890624e1aacbb8ec1aea9"
-SRCREV_meta ?= "9473a39c59bf9c07a316486d272652bacb9ad3ac"
+SRCREV_machine ?= "1a7a6b495dd6f68e3e2a8a716ceabd283da7f480"
+SRCREV_machine_qemuppc ?= "0ce0666df1e29a74ccfd65bbcf8286b2e632cc3f"
+SRCREV_meta ?= "7250de4d4afc2558082cd42b8a0d151903436e8f"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index b69d9d5..a61fe70 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.46"
+LINUX_VERSION ?= "3.4.52"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "778950f1e0b5c5af7e92c43220c3c4f4e3324cb5"
-SRCREV_meta ?= "9473a39c59bf9c07a316486d272652bacb9ad3ac"
+SRCREV_machine ?= "cdd7a546922ca1c46c94adeec3b9c90dc9aaad2d"
+SRCREV_meta ?= "7250de4d4afc2558082cd42b8a0d151903436e8f"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index ae10448..beb67ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "ccc8f93d42a56511b8867ff3eeba76290309bc2c"
-SRCREV_machine_qemumips  ?= "23607b7f3ca690d62a43c58b8358fa5b75c55b2a"
-SRCREV_machine_qemuppc ?= "d48004092883cfdee8a5092b375ac635742c39cb"
-SRCREV_machine_qemux86 ?= "778950f1e0b5c5af7e92c43220c3c4f4e3324cb5"
-SRCREV_machine_qemux86-64 ?= "778950f1e0b5c5af7e92c43220c3c4f4e3324cb5"
-SRCREV_machine ?= "778950f1e0b5c5af7e92c43220c3c4f4e3324cb5"
-SRCREV_meta ?= "9473a39c59bf9c07a316486d272652bacb9ad3ac"
+SRCREV_machine_qemuarm ?= "89c1e24271fba1c235959cb96c91dba98c542821"
+SRCREV_machine_qemumips  ?= "99e87eb8b1e985eb6addf7590c4e837ff7c7e873"
+SRCREV_machine_qemuppc ?= "62f5c50609c93c5b70736a4374cee8075ab82566"
+SRCREV_machine_qemux86 ?= "cdd7a546922ca1c46c94adeec3b9c90dc9aaad2d"
+SRCREV_machine_qemux86-64 ?= "cdd7a546922ca1c46c94adeec3b9c90dc9aaad2d"
+SRCREV_machine ?= "cdd7a546922ca1c46c94adeec3b9c90dc9aaad2d"
+SRCREV_meta ?= "7250de4d4afc2558082cd42b8a0d151903436e8f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.46"
+LINUX_VERSION ?= "3.4.52"
 
 PR = "${INC_PR}.5"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4


