Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 496526E730
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 05:57:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0F5vjhl001581
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Jan 2014 21:57:45 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 14 Jan 2014 21:57:45 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 15 Jan 2014 00:57:44 -0500
Message-ID: <b58ba1cebca8be200a6c438b6a146ae4100c2c4e.1389765320.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389765320.git.bruce.ashfield@windriver.com>
References: <cover.1389765320.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/3.10: mohonpeak bsp config and scc files
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
X-List-Received-Date: Wed, 15 Jan 2014 05:57:46 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 3 ++-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index d301c06eae37..4541a946b707 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "957ba6ae6c1d81b57da6a36b93f1b2a0ced2f45d"
 SRCREV_machine_qemuppc ?= "37e40b7017a9c78d676b19716011494dc7cb6369"
-SRCREV_meta ?= "778d5f6259f0b8e28a46d8a764979e20e5a8ffc4"
+SRCREV_meta ?= "4d658aa580df62232a4a84957b02496436dc17c4"
 
 LINUX_VERSION ?= "3.10.25"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index e7565c626c5a..0903c708b9a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,8 @@ LINUX_VERSION ?= "3.10.25"
 KMETA = "meta"
 
 SRCREV_machine ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
-SRCREV_meta ?= "778d5f6259f0b8e28a46d8a764979e20e5a8ffc4"
+SRCREV_meta ?= "4d658aa580df62232a4a84957b02496436dc17c4"
+
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 33e745692b25..d0772fddc5f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemux86 ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
 SRCREV_machine_qemux86-64 ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
 SRCREV_machine_qemumips64 ?= "67efb2993ec7726df5567e2572fd64e34e29b46d"
 SRCREV_machine ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
-SRCREV_meta ?= "778d5f6259f0b8e28a46d8a764979e20e5a8ffc4"
+SRCREV_meta ?= "4d658aa580df62232a4a84957b02496436dc17c4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


