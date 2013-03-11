Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UF3xW-0000Jv-Q5
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 15:44:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2BERYi6018279
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Mar 2013 07:27:34 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 07:27:34 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 11 Mar 2013 10:27:13 -0400
Message-ID: <f1530667966c158628877d49881a05e084150a7b.1363011775.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363011775.git.bruce.ashfield@windriver.com>
References: <cover.1363011775.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/3.8: bump kver to v3.8.1
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
X-List-Received-Date: Mon, 11 Mar 2013 14:44:26 -0000
Content-Type: text/plain

Updating the linux-yocto_3.8 SRCREVs to reflect the integration of the
korg 3.8.1 -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.8.bb |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 7c1dff7..d1e0308 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "351d133943b50a9dfeee07661d44254722a19f04"
-SRCREV_machine_qemumips  ?= "d529d082041142435587bd442b1235dbe1c72950"
-SRCREV_machine_qemuppc ?= "8dcd155ad408658e9180d1630da2ac7e0ee70542"
-SRCREV_machine_qemux86 ?= "b170394a475b96ecc92cbc9e4b002bed0a9f69c5"
-SRCREV_machine_qemux86-64 ?= "b170394a475b96ecc92cbc9e4b002bed0a9f69c5"
-SRCREV_machine ?= "b170394a475b96ecc92cbc9e4b002bed0a9f69c5"
-SRCREV_meta ?= "c2ed0f16fdec628242a682897d5d86df4547cf24"
+SRCREV_machine_qemuarm ?= "0bed12bdbdd7a2aa39d8390b7a802dd72244b963"
+SRCREV_machine_qemumips  ?= "4328dc8c1b73bdfe90656f217d99dc4ffa47da1f"
+SRCREV_machine_qemuppc ?= "c12eb257c5fd9441b434c1216c3d987c89ecdd68"
+SRCREV_machine_qemux86 ?= "3fa6521f19ce15c8e950042f843f33986ef2546d"
+SRCREV_machine_qemux86-64 ?= "3fa6521f19ce15c8e950042f843f33986ef2546d"
+SRCREV_machine ?= "3fa6521f19ce15c8e950042f843f33986ef2546d"
+SRCREV_meta ?= "27988ba5eb2dd797a355e7d92fd78e78c7066757"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.8"
+LINUX_VERSION ?= "3.8.1"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



