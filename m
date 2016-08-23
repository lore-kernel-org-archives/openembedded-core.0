Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 824B775E2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 00:39:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7N0dPL9003526
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 17:39:25 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Aug 2016 17:39:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 17:39:21 -0700
Message-ID: <1c8e809f656bd55ac96723b77d73f7b3a067f17f.1471912673.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471912673.git.liezhi.yang@windriver.com>
References: <cover.1471912673.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] subversion: 1.9.3 -> 1.9.4
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
X-List-Received-Date: Tue, 23 Aug 2016 00:39:25 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../subversion/{subversion_1.9.3.bb => subversion_1.9.4.bb}          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.9.3.bb => subversion_1.9.4.bb} (96%)

diff --git a/meta/recipes-devtools/subversion/subversion_1.9.3.bb b/meta/recipes-devtools/subversion/subversion_1.9.4.bb
similarity index 96%
rename from meta/recipes-devtools/subversion/subversion_1.9.3.bb
rename to meta/recipes-devtools/subversion/subversion_1.9.4.bb
index 626276d..3ce83c1 100644
--- a/meta/recipes-devtools/subversion/subversion_1.9.3.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.9.4.bb
@@ -15,8 +15,9 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \
            file://0001-Fix-libtool-name-in-configure.ac.patch \
            "
-SRC_URI[md5sum] = "243036eb28b50ce517fc228eb3250add"
-SRC_URI[sha256sum] = "8bbf6bb125003d88ee1c22935a36b7b1ab7d957e0c8b5fbfe5cb6310b6e86ae0"
+
+SRC_URI[md5sum] = "29121a038f87641055a8183f49e9739f"
+SRC_URI[sha256sum] = "1267f9e2ab983f260623bee841e6c9cc458bf4bf776238ed5f100983f79e9299"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=af81ae49ba359e70626c05e9bf313709"
 
-- 
2.9.0


