Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UZOV5-0004bs-Ny
	for openembedded-core@lists.openembedded.org;
	Mon, 06 May 2013 18:43:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r46GOrtw004510
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 May 2013 09:24:53 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.136) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 6 May 2013 09:24:52 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 6 May 2013 09:24:39 -0700
Message-ID: <6e1f24c5e2b51db0d402c90336498d74bf23babc.1367857109.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1367857109.git.bruce.ashfield@windriver.com>
References: <cover.1367857109.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/3.4: update to v3.4.43, ltsi-65311d8 and v3.4.42-rt56
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
Content-Type: text/plain

Updating the 3.4 kernel trees to the latest korg, LTSI and -rt stable
releases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index f92fac1..0c882f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.36"
+LINUX_VERSION ?= "3.4.43"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "206d4bb6338b4e561bb4690b7e63e552245ebd74"
-SRCREV_machine_qemuppc ?= "84bf0022638ea805c227da3c7bcc333b1bd3ad4f"
-SRCREV_meta ?= "80b4b5110dca5184b57e85f1e775fb006a2e85ad"
+SRCREV_machine ?= "cd1372eb10dc0b20815916205fa91d84c1c012fc"
+SRCREV_machine_qemuppc ?= "5e5ef5cca422434085b4e158674dc642b79dedda"
+SRCREV_meta ?= "1bab5bd090948b4cc4c4ed57c834603a3cf9f235"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 1cc5075..1cdc2a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.36"
+LINUX_VERSION ?= "3.4.43"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "79ba9469f349566c49ae007326198e3241a0d5d3"
-SRCREV_meta ?= "80b4b5110dca5184b57e85f1e775fb006a2e85ad"
+SRCREV_machine ?= "fff57da7886cf5e99c07adf6649610cb1cd89330"
+SRCREV_meta ?= "1bab5bd090948b4cc4c4ed57c834603a3cf9f235"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index a54bfc0..887bdf1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "169d2f318fdfe980cac9b688bd38f508cd4436d6"
-SRCREV_machine_qemumips  ?= "80467d492ecefd82f733632b08323a728587c277"
-SRCREV_machine_qemuppc ?= "e954091f4a17ad1dfdec3989382aab55dc666e79"
-SRCREV_machine_qemux86 ?= "79ba9469f349566c49ae007326198e3241a0d5d3"
-SRCREV_machine_qemux86-64 ?= "79ba9469f349566c49ae007326198e3241a0d5d3"
-SRCREV_machine ?= "79ba9469f349566c49ae007326198e3241a0d5d3"
-SRCREV_meta ?= "80b4b5110dca5184b57e85f1e775fb006a2e85ad"
+SRCREV_machine_qemuarm ?= "a4026fce19f8b2d28f37ea264693bd70126a7ade"
+SRCREV_machine_qemumips  ?= "372aba9e80c5f86a1f6795a7b2292a05159ef108"
+SRCREV_machine_qemuppc ?= "c456ec65de4d2ac099312b0ed8e4098b29447929"
+SRCREV_machine_qemux86 ?= "fff57da7886cf5e99c07adf6649610cb1cd89330"
+SRCREV_machine_qemux86-64 ?= "fff57da7886cf5e99c07adf6649610cb1cd89330"
+SRCREV_machine ?= "fff57da7886cf5e99c07adf6649610cb1cd89330"
+SRCREV_meta ?= "1bab5bd090948b4cc4c4ed57c834603a3cf9f235"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.36"
+LINUX_VERSION ?= "3.4.43"
 
 PR = "${INC_PR}.4"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



