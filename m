Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F48872C98
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 07:16:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0J7GhUR002781
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 23:16:43 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 18 Jan 2015 23:16:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Jan 2015 23:16:36 -0800
Message-ID: <223577f184cb41cbbde265f983c30879f95eaee6.1421651689.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421651689.git.liezhi.yang@windriver.com>
References: <cover.1421651689.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] mklibs-native: upgrade to 0.1.40
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
X-List-Received-Date: Mon, 19 Jan 2015 07:16:47 -0000
Content-Type: text/plain

Remove the do_configure_prepend, it never worked since the sed command
didn't use '-i'.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...bs-native_0.1.39.bb => mklibs-native_0.1.40.bb} |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.39.bb => mklibs-native_0.1.40.bb} (73%)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.39.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
similarity index 73%
rename from meta/recipes-devtools/mklibs/mklibs-native_0.1.39.bb
rename to meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
index 9885561..b2fcae5 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.39.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
@@ -12,11 +12,7 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.x
 	file://sysrooted-ldso.patch \
 "
 
-SRC_URI[md5sum] = "38a579a531401eb76f4bab4ccfb774a2"
-SRC_URI[sha256sum] = "fa2881ab4fe72b0504878357f1fc6b17920459b56e8a60dfb083ca28fb64e733"
+SRC_URI[md5sum] = "e1dafe5f962caa9dc5f2651c0723812a"
+SRC_URI[sha256sum] = "1db24ae779d21ccfed49f22e49a2b7ee43ec0e9197bc206d81cd02f96e91e125"
 
 inherit autotools gettext native pythonnative
-
-do_configure_prepend() {
-	sed "s+MKLIBS_VERSION+${PV}+" ${S}/configure.ac
-}
-- 
1.7.9.5


