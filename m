Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8058377002
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 15:32:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Sep 2015 08:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,462,1437462000"; d="scan'208";a="797539737"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2015 08:32:56 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 18:34:19 +0300
Message-Id: <c8274a56a32fedca57f68f757c27acf0525b98b4.1441293149.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/12] uclibc: update PV to 0.9.33.2 to match latest upstream release
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
X-List-Received-Date: Thu, 03 Sep 2015 15:32:56 -0000

This fixes upstream version check. The git revision that is fetched
is unchanged.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 14a577f..f4af36a 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,6 +1,6 @@
 SRCREV = "ca1c74d67dd115d059a875150e10b8560a9c35a8"
 
-PV = "0.9.33+git${SRCPV}"
+PV = "0.9.33.2+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
 
-- 
2.1.4


