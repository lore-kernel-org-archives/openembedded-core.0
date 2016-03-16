Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 509D17002B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 16:48:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2GGmPTk025178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 16 Mar 2016 09:48:25 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 16 Mar 2016 09:48:24 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 16 Mar 2016 12:48:18 -0400
Message-ID: <d8ba7a45bace9ee62a041535841fdce0e55b2ef9.1458146315.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1458146315.git.bruce.ashfield@windriver.com>
References: <cover.1458146315.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/4.1: Thermal: Enable Broxton SoC thermal reporting device
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
X-List-Received-Date: Wed, 16 Mar 2016 16:48:27 -0000
Content-Type: text/plain

Mainline backport for thermal reporting.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 4d9f5fbff88c..025aff1a1eb9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "0872aaf9d3a4b718ba6ad17a7706843cb556992d"
+SRCREV_machine ?= "da361d8a72a039a08e497b095a91905ccc8ae1d2"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index b2fac8a3578c..e7facd253831 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b5f6aa9957ddc28eafede6678b4c9ff49240bc19"
+SRCREV_machine ?= "00c73599b59d497539f10d6a61a419abb4183f2e"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 9093590f8b11..0eecf99933fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2b83b94ab36113da6d63e525e0686d1e9fefbeca"
-SRCREV_machine_qemuarm64 ?= "b5f6aa9957ddc28eafede6678b4c9ff49240bc19"
-SRCREV_machine_qemumips ?= "a5c91d6ff822f3920fd9a20b0deefa6e23acef32"
-SRCREV_machine_qemuppc ?= "b5f6aa9957ddc28eafede6678b4c9ff49240bc19"
-SRCREV_machine_qemux86 ?= "b5f6aa9957ddc28eafede6678b4c9ff49240bc19"
-SRCREV_machine_qemux86-64 ?= "b5f6aa9957ddc28eafede6678b4c9ff49240bc19"
-SRCREV_machine_qemumips64 ?= "2299caefd7d36e0fe868316045ceb58b9ae369f9"
-SRCREV_machine ?= "b5f6aa9957ddc28eafede6678b4c9ff49240bc19"
+SRCREV_machine_qemuarm ?= "c20a22ffa386e548069809884d9f0a20f9499469"
+SRCREV_machine_qemuarm64 ?= "00c73599b59d497539f10d6a61a419abb4183f2e"
+SRCREV_machine_qemumips ?= "b6e13683017f0e9b53df799e13bce196fdbbe665"
+SRCREV_machine_qemuppc ?= "00c73599b59d497539f10d6a61a419abb4183f2e"
+SRCREV_machine_qemux86 ?= "00c73599b59d497539f10d6a61a419abb4183f2e"
+SRCREV_machine_qemux86-64 ?= "00c73599b59d497539f10d6a61a419abb4183f2e"
+SRCREV_machine_qemumips64 ?= "ccfd34d494cbccfce581972fa348077d9257070d"
+SRCREV_machine ?= "00c73599b59d497539f10d6a61a419abb4183f2e"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


