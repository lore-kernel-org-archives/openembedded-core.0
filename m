Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 70DDE7002B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 19:04:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jun 2016 12:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,518,1459839600"; d="scan'208";a="834070148"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Jun 2016 12:04:01 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2016 22:03:48 +0300
Message-Id: <1466708628-25003-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466708628-25003-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1466708628-25003-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] pythonnative.bbclass, python3native.bbclass: use DEPENDS_append instead of DEPENDS +=
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
X-List-Received-Date: Thu, 23 Jun 2016 19:04:26 -0000

Otherwise -native variants of recipes that use these classes don't get a proper python[3]-native
dependency for some reason.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/python3native.bbclass | 2 +-
 meta/classes/pythonnative.bbclass  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index d7b2d35..ef468b3 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -2,7 +2,7 @@ inherit python3-dir
 
 PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
 EXTRANATIVEPATH += "${PYTHON_PN}-native"
-DEPENDS += " ${PYTHON_PN}-native "
+DEPENDS_append = " ${PYTHON_PN}-native "
 
 # python-config and other scripts are using distutils modules
 # which we patch to access these variables
diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
index bd239fa..4e0381b 100644
--- a/meta/classes/pythonnative.bbclass
+++ b/meta/classes/pythonnative.bbclass
@@ -5,7 +5,7 @@ PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
 # PYTHON_EXECUTABLE is used by cmake
 PYTHON_EXECUTABLE="${PYTHON}"
 EXTRANATIVEPATH += "${PYTHON_PN}-native"
-DEPENDS += " ${PYTHON_PN}-native "
+DEPENDS_append = " ${PYTHON_PN}-native "
 
 # python-config and other scripts are using distutils modules
 # which we patch to access these variables
-- 
2.8.1


