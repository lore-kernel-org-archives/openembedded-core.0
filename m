Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UAZTu-0000TC-1w
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 06:23:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1R56jSP000727
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 21:06:45 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.328.9; Tue, 26 Feb 2013 21:06:44 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Feb 2013 00:06:35 -0500
Message-ID: <a5bbf39f3bdc60073625c6dda0ebc5f1983acb3e.1361940628.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361940628.git.bruce.ashfield@windriver.com>
References: <cover.1361940628.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/3.4: remove cedartrail machine
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
X-List-Received-Date: Wed, 27 Feb 2013 05:23:27 -0000
Content-Type: text/plain

The cedartrail BSP is no longer support from yocto 1.4, so we remove
it from the tree.

Signed-off-by: Kishore Bodke <kishore.k.bodke@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index c58efe7..50cf953 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "3d56b103cd7072d520c395194e620aba2f6e52e3"
 SRCREV_machine_qemuppc ?= "09178bc8825d6fb66ddcb1785f20a022c4ba2efd"
-SRCREV_meta ?= "f697e099bc76d5df3a307a5bc0cc25021dd6dfe0"
+SRCREV_meta ?= "c0b1845314cebb21694dbb4459fcc6f80feb01d0"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 265d082..35edbd4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -13,7 +13,7 @@ LINUX_VERSION ?= "3.4.28"
 KMETA = "meta"
 
 SRCREV_machine ?= "13809f2cfd9be0ce86bd486e1643f9b90bed6f4f"
-SRCREV_meta ?= "f697e099bc76d5df3a307a5bc0cc25021dd6dfe0"
+SRCREV_meta ?= "c0b1845314cebb21694dbb4459fcc6f80feb01d0"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index ab975f2..ca43944 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "62d3cb6a8e048c4833a5501bea2f35998de0b89d"
 SRCREV_machine_qemux86 ?= "13809f2cfd9be0ce86bd486e1643f9b90bed6f4f"
 SRCREV_machine_qemux86-64 ?= "13809f2cfd9be0ce86bd486e1643f9b90bed6f4f"
 SRCREV_machine ?= "13809f2cfd9be0ce86bd486e1643f9b90bed6f4f"
-SRCREV_meta ?= "f697e099bc76d5df3a307a5bc0cc25021dd6dfe0"
+SRCREV_meta ?= "c0b1845314cebb21694dbb4459fcc6f80feb01d0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.7.10.4



