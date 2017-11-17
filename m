Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1287883B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 06:08:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAH68BDT005018
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 16 Nov 2017 22:08:11 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 16 Nov 2017 22:08:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 17 Nov 2017 01:08:05 -0500
Message-ID: <1510898885-256081-3-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
References: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] mesa/screen: change patch status
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
X-List-Received-Date: Fri, 17 Nov 2017 06:08:11 -0000
Content-Type: text/plain

The patch has been accepted upstream.
Changed patch status Pending/Submitted -> Accepted.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch    | 3 ++-
 .../0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/screen/screen/0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch b/meta/recipes-extended/screen/screen/0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch
index e8db12c..1274b27 100644
--- a/meta/recipes-extended/screen/screen/0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch
+++ b/meta/recipes-extended/screen/screen/0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch
@@ -9,7 +9,8 @@ test always return true.
 We rarely use "yes;" to name build dir, so s/yes/yes;/g
 could fix the issue
 
-Upstream-Status: Pending
+Upstream-Status: Accepted
+https://git.savannah.gnu.org/cgit/screen.git/commit/?h=screen-v4&id=8c2b4061d16756ee2ed37f08db063b8215656943
 
 Signed-off-by: Jian Kang <jian.kang@windriver.com>
 ---
diff --git a/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch b/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
index bd1e863..ff8eda4 100644
--- a/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
@@ -20,7 +20,8 @@ undefined reference to `XML_GetCurrentLineNumber'
 
 explictly add EXPAT_LIBS to intel's VULKAN_LIB_DEPS
 
-Upstream-Status: Submitted [mesa-dev@lists.freedesktop.org]
+Upstream-Status: Accepted
+https://cgit.freedesktop.org/mesa/mesa/commit/?id=05fc62d89f59ce19a18bfd4e63a09624910d6caf
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
-- 
2.8.1


