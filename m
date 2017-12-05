Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D638B786E8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 12:57:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2017 04:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,364,1508828400"; d="scan'208";a="1252099882"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2017 04:57:17 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:57:37 +0200
Message-Id: <e443d83308b8e46ad73efb13910ff440a9ad34b6.1512478515.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1512478515.git.alexander.kanavin@linux.intel.com>
References: <cover.1512478515.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/13] rpm: upstream version is now known
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
X-List-Received-Date: Tue, 05 Dec 2017 12:57:17 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm_4.14.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.0.bb b/meta/recipes-devtools/rpm/rpm_4.14.0.bb
index 2320d4cb36a..e4e9c3e6341 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.0.bb
@@ -41,7 +41,6 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
            "
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 PE = "1"
 SRCREV = "da3720f62e57648fb1dc2a632744d38866139971"
-- 
2.15.0


