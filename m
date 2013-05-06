Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UZOV4-0004bQ-R2
	for openembedded-core@lists.openembedded.org;
	Mon, 06 May 2013 18:43:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r46GOoZO009905
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 May 2013 09:24:50 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.136) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 6 May 2013 09:24:50 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 6 May 2013 09:24:37 -0700
Message-ID: <4fd4706eb14b57e7458371a6299921b689aa3043.1367857109.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1367857109.git.bruce.ashfield@windriver.com>
References: <cover.1367857109.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/3.4: iwlwifi, ext4, brtfs warning and -rt fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2013 16:43:23 -0000
X-List-Received-Date: Mon, 06 May 2013 16:43:23 -0000
Content-Type: text/plain

Updating the yocto 3.4 SRCREVs for the following fixes:

206d4bb powerpc/perf: run irq-work under softirq context in rt
8a969f9 arm/perf: run irq-work under softirq context in rt
79ba946 iwlwifi: fix unused variable warning
59d93fa ext4: remove unused variable in ext4_update_super()
2385eee Btrfs: fix compile warnings in extent_io.c

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 88c05e2..f92fac1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "7302a8f84da657ff72ca5a27b9212c9d3bee2fbf"
-SRCREV_machine_qemuppc ?= "494b16c51c6f6dc272eb820eaa57028ca8ee9da2"
+SRCREV_machine ?= "206d4bb6338b4e561bb4690b7e63e552245ebd74"
+SRCREV_machine_qemuppc ?= "84bf0022638ea805c227da3c7bcc333b1bd3ad4f"
 SRCREV_meta ?= "80b4b5110dca5184b57e85f1e775fb006a2e85ad"
 
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 54202b0..1cc5075 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -12,7 +12,7 @@ LINUX_VERSION ?= "3.4.36"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "c994390cfa28339cbc1ec3b56eeec83a5fa75bb7"
+SRCREV_machine ?= "79ba9469f349566c49ae007326198e3241a0d5d3"
 SRCREV_meta ?= "80b4b5110dca5184b57e85f1e775fb006a2e85ad"
 
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index b81b9ac..a54bfc0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,12 +3,12 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "7cc80532306889b75619f8a1b713048e25f59e19"
-SRCREV_machine_qemumips  ?= "debce6677988e03b50c369aba5861d4f9b2e557d"
-SRCREV_machine_qemuppc ?= "ddbc382cbc45a009e9ce17f7d448fcfd050ab5fc"
-SRCREV_machine_qemux86 ?= "c994390cfa28339cbc1ec3b56eeec83a5fa75bb7"
-SRCREV_machine_qemux86-64 ?= "c994390cfa28339cbc1ec3b56eeec83a5fa75bb7"
-SRCREV_machine ?= "c994390cfa28339cbc1ec3b56eeec83a5fa75bb7"
+SRCREV_machine_qemuarm ?= "169d2f318fdfe980cac9b688bd38f508cd4436d6"
+SRCREV_machine_qemumips  ?= "80467d492ecefd82f733632b08323a728587c277"
+SRCREV_machine_qemuppc ?= "e954091f4a17ad1dfdec3989382aab55dc666e79"
+SRCREV_machine_qemux86 ?= "79ba9469f349566c49ae007326198e3241a0d5d3"
+SRCREV_machine_qemux86-64 ?= "79ba9469f349566c49ae007326198e3241a0d5d3"
+SRCREV_machine ?= "79ba9469f349566c49ae007326198e3241a0d5d3"
 SRCREV_meta ?= "80b4b5110dca5184b57e85f1e775fb006a2e85ad"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.7.10.4



