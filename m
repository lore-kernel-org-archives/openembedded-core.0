Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C28F16FF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 00:31:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B0VdAs023957
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Jan 2016 16:31:39 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 16:31:38 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 11 Jan 2016 08:30:36 +0800
Message-ID: <3cb28a7edb40f7e138cdc4c15f5cca5802a3018a.1452472146.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452472146.git.hongxu.jia@windriver.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] ghostscript: 9.16 -> 9.18
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
X-List-Received-Date: Mon, 11 Jan 2016 00:31:38 -0000
Content-Type: text/plain

Remove '--without-jbig2dec', since upstream did not
support it very well which caused build failure:
...
|make[1]: *** No rule to make target `obj/sjbig2_.dev',
needed by `obj/sjbig2.dev'.  Stop.
...

The same to option '--without-jbig2dec'.

Already file a bug to upstream:
http://bugs.ghostscript.com/show_bug.cgi?id=696497

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../ghostscript/{ghostscript_9.16.bb => ghostscript_9.18.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_9.16.bb => ghostscript_9.18.bb} (94%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.16.bb b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
similarity index 94%
rename from meta/recipes-extended/ghostscript/ghostscript_9.16.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.18.bb
index d584c49..665c677 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.16.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
@@ -34,10 +34,10 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[md5sum] = "829319325bbdb83f5c81379a8f86f38f"
-SRC_URI[sha256sum] = "746d77280cca8afdd3d4c2c1389e332ed9b0605bd107bcaae1d761b061d1a68d"
+SRC_URI[md5sum] = "33a47567d7a591c00a253caddd12a88a"
+SRC_URI[sha256sum] = "5fc93079749a250be5404c465943850e3ed5ffbc0d5c07e10c7c5ee8afbbdb1b"
 
-EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
+EXTRA_OECONF = "--without-x --with-system-libtiff \
                 --with-fontpath=${datadir}/fonts \
                 --without-libidn --with-cups-serverbin=${exec_prefix}/lib/cups \
                 --with-cups-datadir=${datadir}/cups \
-- 
1.9.1


