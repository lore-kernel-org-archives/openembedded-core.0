Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 13E0D7882C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 12:27:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2018 04:27:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,340,1511856000"; d="scan'208";a="18133580"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jan 2018 04:27:38 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jan 2018 14:27:40 +0200
Message-Id: <20180110122742.1226-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180110122742.1226-1-alexander.kanavin@linux.intel.com>
References: <20180110122742.1226-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/4] gnupg: upgrade to 2.2.4
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
X-List-Received-Date: Wed, 10 Jan 2018 12:27:38 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/gnupg/{gnupg_2.2.0.bb => gnupg_2.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.0.bb => gnupg_2.2.4.bb} (91%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.0.bb b/meta/recipes-support/gnupg/gnupg_2.2.4.bb
similarity index 91%
rename from meta/recipes-support/gnupg/gnupg_2.2.0.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.4.bb
index 0176dddad24..e9f19ca8140 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.0.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.4.bb
@@ -16,8 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
           "
 
-SRC_URI[md5sum] = "789f16949fae2d003d387f49e9da4b74"
-SRC_URI[sha256sum] = "d4514a0be0f7a1ff263193330019eb4b53c82f0f5e230af3c14df371271a45e6"
+SRC_URI[md5sum] = "709e5af5bba84d251c520222e720972f"
+SRC_URI[sha256sum] = "401a3e64780fdfa6d7670de0880aa5c9d589b3db7a7098979d7606cec546f2ec"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.15.1


