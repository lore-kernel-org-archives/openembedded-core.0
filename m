Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CC78B763BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:12:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S2CZ50028025
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:12:35 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 27 Jul 2015 19:12:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:12:28 -0700
Message-ID: <3e91fe6d33715a8d26b454499ec4dd219ad89c12.1438049511.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438049511.git.liezhi.yang@windriver.com>
References: <cover.1438049511.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] cracklib: 2.9.4 -> 2.9.5
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
X-List-Received-Date: Tue, 28 Jul 2015 02:12:34 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{cracklib_2.9.4.bb => cracklib_2.9.5.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.9.4.bb => cracklib_2.9.5.bb} (91%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.4.bb b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
similarity index 91%
rename from meta/recipes-extended/cracklib/cracklib_2.9.4.bb
rename to meta/recipes-extended/cracklib/cracklib_2.9.5.bb
index 24730b8..c0ffe33 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.4.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
@@ -15,8 +15,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
            file://0002-craklib-fix-testnum-and-teststr-failed.patch"
 
-SRC_URI[md5sum] = "b31f7e3618cda7a2ac38588067275013"
-SRC_URI[sha256sum] = "f2a866b4b9808344228ea6d68b69e3ba9a8a99210e23dfd718d4b95c60be8958"
+SRC_URI[md5sum] = "376790a95c1fb645e59e6e9803c78582"
+SRC_URI[sha256sum] = "59ab0138bc8cf90cccb8509b6969a024d5e58d2d02bcbdccbb9ba9b88be3fa33"
 
 inherit autotools gettext pythonnative python-dir
 
-- 
1.7.9.5


