Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 42BB06E64A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:03:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659220159"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:30 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:26 +0200
Message-Id: <9cfec5528b18089fa018ff8c1ac6c9530fc10547.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/19] gnupg: update to 2.1.11
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:16 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/gnupg/{gnupg_2.1.10.bb => gnupg_2.1.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.1.10.bb => gnupg_2.1.11.bb} (90%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.1.10.bb b/meta/recipes-support/gnupg/gnupg_2.1.11.bb
similarity index 90%
rename from meta/recipes-support/gnupg/gnupg_2.1.10.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.11.bb
index 5a4f2e8..8e2189b 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.10.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.11.bb
@@ -15,8 +15,8 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://autogen.sh-fix-find-version-for-beta-checking.patch \
           "
 
-SRC_URI[md5sum] = "f0a7cb09fe119f8b82eba7efecd27dc0"
-SRC_URI[sha256sum] = "93bd58d81771a4fa488566e5d2e13b1fd7afc86789401eb41731882abfd26cf9"
+SRC_URI[md5sum] = "873302c475c4c90badb67daac90ebd5d"
+SRC_URI[sha256sum] = "b7b0fb2c8c5d47d7ec916d4a1097c0ddcb94a12bb1c0ac424ad86b1ee316b61a"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.7.0


