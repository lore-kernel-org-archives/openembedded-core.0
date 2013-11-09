Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7037D6D478
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 05:52:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA95qnRo025500
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 21:52:49 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 21:52:49 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Nov 2013 13:52:46 +0800
Message-ID: <1c91f0d5a9c8945fe7aff62eace92a012320b386.1383976190.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1383976190.git.jackie.huang@windriver.com>
References: <cover.1383976190.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] autogen-native: remove the unnecessary RDEPENDS
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
X-List-Received-Date: Sat, 09 Nov 2013 05:52:47 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The recipe only provides native packge, the RDEPENDS is not necessary.
Remove it and also two unnecessary comment lines.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/autogen/autogen-native_5.17.4.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb b/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb
index 230c3a7..28d82b0 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb
@@ -16,13 +16,9 @@ SRC_URI[md5sum] = "09f074cba57610bf4ef1147e01c8ae90"
 SRC_URI[sha256sum] = "cd2585f4794d0e9d7f2cb0b9af4f2bd429946e718473edf1cf8c49f081ca71ed"
 
 DEPENDS = "guile-native libtool-native libxml2-native"
-RDEPENDS = "automake pkgconfig"
 
 inherit autotools native
 
-# Following line will be needed for the non-native target recipe.
-#CFLAGS += "-L${STAGING_LIBDIR} -lguile-2.0 -lgc -pthread -I${STAGING_INCDIR}/guile/2.0 -I${STAGING_INCDIR}"
-
 # autogen-native links against libguile which may have been relocated with sstate
 # these environment variables ensure there isn't a relocation issue
 export GUILE_LOAD_PATH = "${STAGING_DATADIR_NATIVE}/guile/2.0"
-- 
1.8.3


