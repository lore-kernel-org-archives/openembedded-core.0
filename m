Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 738DA77AAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 12:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490186669; x=1521722669;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=Jj7FqEdyjVi3wbAAtmZLQzsEmz7rFvOw4j8/N/q3T/4=;
	b=Miz6nMZYNVEH8Qj3wst12cveKUp5FgYXippYSU+eFMB/K0eldC9DbwB1
	iKP1A1kxek1PyhcY9fu4zZHwoJw7Tw==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 05:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="837386387"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2017 05:44:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 14:43:37 +0200
Message-Id: <20170322124337.17061-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170322124337.17061-1-alexander.kanavin@linux.intel.com>
References: <20170322124337.17061-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/3] rpm: add a "rpm-build" PROVIDES
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
X-List-Received-Date: Wed, 22 Mar 2017 12:44:27 -0000

rpm 5.x was packaging build tools separately, so we need to unbreak
things that relied on that.

[YOCTO #11167]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index c71a41064c1..8d2527cbc7d 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -106,3 +106,5 @@ PACKAGES += "python-rpm"
 PROVIDES += "python-rpm"
 FILES_python-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
 
+# rpm 5.x was packaging the rpm build tools separately
+PROVIDES += "rpm-build"
-- 
2.11.0


