Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 016A37D0D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:36:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2R8ZX7i008684
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 01:35:59 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.190) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 27 Mar 2019 01:35:54 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Mar 2019 16:45:51 +0800
Message-ID: <a892b80005fac12fcc398968bfb3c5ab9d1237ee.1553676312.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1553676312.git.Qi.Chen@windriver.com>
References: <cover.1553676312.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libarchive: fix up CVE IDs in patches
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
X-List-Received-Date: Wed, 27 Mar 2019 08:36:08 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/libarchive/libarchive/CVE-2019-1000019.patch | 2 +-
 meta/recipes-extended/libarchive/libarchive/CVE-2019-1000020.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000019.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000019.patch
index f6f1add..7f39893 100644
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000019.patch
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000019.patch
@@ -1,4 +1,4 @@
-CVE: CVE-2018-1000019
+CVE: CVE-2019-1000019
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000020.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000020.patch
index 3e63921..25a76fd 100644
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000020.patch
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000020.patch
@@ -1,4 +1,4 @@
-CVE: CVE-2018-1000020
+CVE: CVE-2019-1000020
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-- 
1.9.1


