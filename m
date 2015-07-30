Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6715A764C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:31:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407640"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:31:19 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:50 +0300
Message-Id: <86b43671f02c22f328e3801e0711a33731156ba8.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/26] systemd: remove PV from the recipe
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:39 -0000

It is unnecessary because the recipe filename already contains it.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 83e4bce..148a077 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -27,8 +27,6 @@ inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-altern
 
 SRCREV = "85a6fabdd3e43cfab0fc6359e9f2a9e368d4a3ed"
 
-PV = "219-stable+git${SRCPV}"
-
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd-stable;branch=v219-stable;protocol=git \
            file://0002-shared-missing.h-fall-back-to-insecure-getenv.patch \
            file://0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
-- 
2.1.4


