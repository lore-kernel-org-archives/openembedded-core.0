Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DEDC36EC52
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 17:34:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s14HYTb2023976
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Feb 2014 09:34:29 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 4 Feb 2014 09:34:29 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 4 Feb 2014 12:34:26 -0500
Message-ID: <274bcde5bf629e3cbac8d32560ce916520a771af.1391534980.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1391534980.git.bruce.ashfield@windriver.com>
References: <cover.1391534980.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/3.10: integrate LTSI
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
X-List-Received-Date: Tue, 04 Feb 2014 17:34:31 -0000
Content-Type: text/plain

Updating the SRCREVs of the 3.10 tree to reflect the integration of
of commit 68054859 from:

    git://git.linuxfoundation.org/ltsi-kernegit://git.linuxfoundation.org/ltsi-kernel.git

Build and boot tested on all qemu architectures.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 9bdd47ecbf65..dd1ec52626d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "957ba6ae6c1d81b57da6a36b93f1b2a0ced2f45d"
-SRCREV_machine_qemuppc ?= "37e40b7017a9c78d676b19716011494dc7cb6369"
+SRCREV_machine ?= "14651317755a87f03f8399299f2eb0b4042a2d0c"
+SRCREV_machine_qemuppc ?= "2918b5d9ee82304d67aae61a427fcb02d3edee8f"
 SRCREV_meta ?= "4d658aa580df62232a4a84957b02496436dc17c4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 6defed1c9464..a852f75ff443 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.10.25"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
+SRCREV_machine ?= "78d2a615b13a1c307d482eaa9499c1b2dee40599"
 SRCREV_meta ?= "4d658aa580df62232a4a84957b02496436dc17c4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index d0772fddc5f1..f7f4dabea8d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,13 +11,13 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e3163012f3e09fe48374ef22bc676f8b19aeec1a"
-SRCREV_machine_qemumips ?= "01a71aaf8e545c3ef88da1fe02f53d1b96a2640e"
-SRCREV_machine_qemuppc ?= "ae1b9115975ff235038d5da22b4cc984b4d76aae"
-SRCREV_machine_qemux86 ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
-SRCREV_machine_qemux86-64 ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
-SRCREV_machine_qemumips64 ?= "67efb2993ec7726df5567e2572fd64e34e29b46d"
-SRCREV_machine ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
+SRCREV_machine_qemuarm ?= "2a4d8c0884c8d08896c052a6e42c51e861cf48b5"
+SRCREV_machine_qemumips ?= "08872a160571b9bf45b6cd262b977063f12aca46"
+SRCREV_machine_qemuppc ?= "eba0c4fcc962ffddd384251b5b6ee0c61bd5ea4d"
+SRCREV_machine_qemux86 ?= "78d2a615b13a1c307d482eaa9499c1b2dee40599"
+SRCREV_machine_qemux86-64 ?= "78d2a615b13a1c307d482eaa9499c1b2dee40599"
+SRCREV_machine_qemumips64 ?= "de555074575d2997a8cd7a4b2d6dbf22e7ddfc9b"
+SRCREV_machine ?= "78d2a615b13a1c307d482eaa9499c1b2dee40599"
 SRCREV_meta ?= "4d658aa580df62232a4a84957b02496436dc17c4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.8.1.2


