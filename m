Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9BECF7017B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 17:53:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u44HrMkX012615
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 4 May 2016 10:53:22 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 4 May 2016 10:53:22 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 4 May 2016 13:53:09 -0400
Message-ID: <b44e76471e5bf53b1d67619aa4010e643c2043b3.1462383941.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1462383941.git.bruce.ashfield@windriver.com>
References: <cover.1462383941.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/11] linux-yocto/4.1: make ltsi content available
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
X-List-Received-Date: Wed, 04 May 2016 17:53:23 -0000
Content-Type: text/plain

In the better late than never category, this commit integrates the
ltsi content into linux-yocto 4.1. We we already matching LTSI on
the kernel version front with a small gap in patches. With this
commit, we have a "ltsi" branch that is pure ltsi on the mailine
kernel, and then that commit is merged into standard/base (to
make it available to all BSPs).

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 8d02a909595a..b0c4520fc7d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "1947ac40bb819120f1e0dff6ae281cc024ce77bb"
+SRCREV_machine ?= "c97948997745a5bb634829bb520c0765535d223b"
 SRCREV_meta ?= "a4f88c3fad887e1c559d03ae1b531ca267137b69"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 1bbfff28a469..ba6ce74e84e4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.22"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "60332e45b2685ed78ed61f3c27ce931e12b1dfdf"
+SRCREV_machine ?= "d03753ddb28a1141e550a67c99ac95789a424fc5"
 SRCREV_meta ?= "a4f88c3fad887e1c559d03ae1b531ca267137b69"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index e61f5b11f909..e644dfc4daa3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "aea95f103a4f5fccc342bb763af9cfba0623fccc"
-SRCREV_machine_qemuarm64 ?= "60332e45b2685ed78ed61f3c27ce931e12b1dfdf"
-SRCREV_machine_qemumips ?= "df85b27d70cb259662a00f5ad860eb3deba63b7f"
-SRCREV_machine_qemuppc ?= "60332e45b2685ed78ed61f3c27ce931e12b1dfdf"
-SRCREV_machine_qemux86 ?= "60332e45b2685ed78ed61f3c27ce931e12b1dfdf"
-SRCREV_machine_qemux86-64 ?= "60332e45b2685ed78ed61f3c27ce931e12b1dfdf"
-SRCREV_machine_qemumips64 ?= "d371bd9361507ef0b03544f2190a63211fe31c87"
-SRCREV_machine ?= "60332e45b2685ed78ed61f3c27ce931e12b1dfdf"
+SRCREV_machine_qemuarm ?= "f781d64949f776cbfa5274a548becdcf6b596341"
+SRCREV_machine_qemuarm64 ?= "d03753ddb28a1141e550a67c99ac95789a424fc5"
+SRCREV_machine_qemumips ?= "192043960081896baaa24c2af702c7124bfe4286"
+SRCREV_machine_qemuppc ?= "d03753ddb28a1141e550a67c99ac95789a424fc5"
+SRCREV_machine_qemux86 ?= "d03753ddb28a1141e550a67c99ac95789a424fc5"
+SRCREV_machine_qemux86-64 ?= "d03753ddb28a1141e550a67c99ac95789a424fc5"
+SRCREV_machine_qemumips64 ?= "351bc6968f63ea6f27cbd7f1678ddc53a9168fd1"
+SRCREV_machine ?= "d03753ddb28a1141e550a67c99ac95789a424fc5"
 SRCREV_meta ?= "a4f88c3fad887e1c559d03ae1b531ca267137b69"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


