Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 004A9756F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 09:57:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S9vTtM016908
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 02:57:29 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 02:57:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 May 2015 02:57:22 -0700
Message-ID: <d3175aaaef968825c6ebc55143efef932bd18eff.1432805258.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432805258.git.liezhi.yang@windriver.com>
References: <cover.1432805258.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] cracklib: 2.9.3 -> 2.9.4
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
X-List-Received-Date: Thu, 28 May 2015 09:57:29 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{cracklib_2.9.3.bb => cracklib_2.9.4.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.9.3.bb => cracklib_2.9.4.bb} (91%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.3.bb b/meta/recipes-extended/cracklib/cracklib_2.9.4.bb
similarity index 91%
rename from meta/recipes-extended/cracklib/cracklib_2.9.3.bb
rename to meta/recipes-extended/cracklib/cracklib_2.9.4.bb
index 51afc45..24730b8 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.3.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.4.bb
@@ -15,8 +15,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
            file://0002-craklib-fix-testnum-and-teststr-failed.patch"
 
-SRC_URI[md5sum] = "1e18ed9a593719af71b6440f16f91182"
-SRC_URI[sha256sum] = "9c55afcdc01ae90aad0af0f9e4de0db9ba2fadf88cdf3a585a08a3530d25dba5"
+SRC_URI[md5sum] = "b31f7e3618cda7a2ac38588067275013"
+SRC_URI[sha256sum] = "f2a866b4b9808344228ea6d68b69e3ba9a8a99210e23dfd718d4b95c60be8958"
 
 inherit autotools gettext pythonnative python-dir
 
-- 
1.7.9.5


