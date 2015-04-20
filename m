Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8D965CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:09:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3K89N58014552
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 01:09:23 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Apr 2015 01:09:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Apr 2015 01:09:16 -0700
Message-ID: <1b6b7c3b5df8db3c18f0001f64a5f974a8993e8d.1429517334.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429517334.git.liezhi.yang@windriver.com>
References: <cover.1429517334.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] cracklib: 2.9.2 -> 2.9.3
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
X-List-Received-Date: Mon, 20 Apr 2015 08:09:22 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{cracklib_2.9.2.bb => cracklib_2.9.3.bb}       |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.9.2.bb => cracklib_2.9.3.bb} (90%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.2.bb b/meta/recipes-extended/cracklib/cracklib_2.9.3.bb
similarity index 90%
rename from meta/recipes-extended/cracklib/cracklib_2.9.2.bb
rename to meta/recipes-extended/cracklib/cracklib_2.9.3.bb
index fceca54..51afc45 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.2.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.3.bb
@@ -15,10 +15,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
            file://0002-craklib-fix-testnum-and-teststr-failed.patch"
 
-SRC_URI[md5sum] = "559072fdfc095cdb763c4de3471a889e"
-SRC_URI[sha256sum] = "c1c899291d443e99d1aecfbc879e4ac9c0cbc265574f47b487842da11e9759f5"
-
-PR = "r1"
+SRC_URI[md5sum] = "1e18ed9a593719af71b6440f16f91182"
+SRC_URI[sha256sum] = "9c55afcdc01ae90aad0af0f9e4de0db9ba2fadf88cdf3a585a08a3530d25dba5"
 
 inherit autotools gettext pythonnative python-dir
 
-- 
1.7.9.5


