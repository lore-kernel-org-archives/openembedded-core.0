Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id CB9BB7712D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 17:02:24 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 16F1F20ADB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 12:56:15 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute2.internal (MEProxy); Mon, 06 Jun 2016 12:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:in-reply-to
	:message-id:references:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=yoAmhVF0QEPIKTx+fmi9iI+B1nU=; b=GFtFo
	M+uy5JsrBX0+1SkMtE66UXodHfCLa2BnAQePqaniQyzlc1lKm/NcPFY/Ok4Z26UA
	qvhzeKs2LEmkBn6VOmbjGlZK5loEp4wsmX/p2X1CYgJtU39isH49qKgZU3fHegUk
	raT8mSkhacft0BPj8X5ZRYgQCRCPr3T9t3sSEk=
X-Sasl-enc: H6yHfJpb60l0bvcthYBg1Sk2dTsJKDcB1JXYNw/OGuxG 1465232174
Received: from laptop.tanuk.dy.fi (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 61E2AF29F4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 12:56:14 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 19:55:58 +0300
Message-Id: <6f60020d3ed62d07a83dbe072f80c17b8ae6c60a.1465231939.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465231939.git.tanuk@iki.fi>
References: <cover.1465231939.git.tanuk@iki.fi>
In-Reply-To: <cover.1465231939.git.tanuk@iki.fi>
References: <cover.1465231939.git.tanuk@iki.fi>
Subject: [PATCH 4/4] alsa-plugins: 1.1.0 -> 1.1.1
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
X-List-Received-Date: Mon, 06 Jun 2016 17:02:25 -0000

Changelog: http://alsa-project.org/main/index.php/Changes_v1.1.0_v1.1.1

Removed upstreamed patch
0001-pph-include-config.h-from-rate_speexrate.c.patch.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...ph-include-config.h-from-rate_speexrate.c.patch | 35 ----------------------
 ...alsa-plugins_1.1.0.bb => alsa-plugins_1.1.1.bb} |  9 ++----
 2 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-plugins/0001-pph-include-config.h-from-rate_speexrate.c.patch
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.0.bb => alsa-plugins_1.1.1.bb} (93%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins/0001-pph-include-config.h-from-rate_speexrate.c.patch b/meta/recipes-multimedia/alsa/alsa-plugins/0001-pph-include-config.h-from-rate_speexrate.c.patch
deleted file mode 100644
index 8e5b6a2..0000000
--- a/meta/recipes-multimedia/alsa/alsa-plugins/0001-pph-include-config.h-from-rate_speexrate.c.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 4350314c941489833a8baa930e16512e55f72a13 Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Wed, 27 Jan 2016 13:22:38 +0200
-Subject: [PATCH] pph: include config.h from rate_speexrate.c
-
-Fixes compilation against libspeexdsp 1.2rc3.
-
-rate_speexrate.c includes speex_resampler.h, which depends on config.h
-by referencing the HAVE_SPEEX_SPEEXDSP_TYPES_H macro. AFAIK it's not
-a good idea to include config.h from headers (I don't know/remember
-why, though), which is why I include config.h from rate_speexrate.c
-instead of speex_resampler.h.
-
-Upstream-Status: Accepted [expected in 1.1.1]
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- pph/rate_speexrate.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/pph/rate_speexrate.c b/pph/rate_speexrate.c
-index 0a1325c..8fc4cef 100644
---- a/pph/rate_speexrate.c
-+++ b/pph/rate_speexrate.c
-@@ -28,6 +28,7 @@
-    POSSIBILITY OF SUCH DAMAGE.
- */
- 
-+#include "config.h"
- #include <stdio.h>
- #include <alsa/asoundlib.h>
- #include <alsa/pcm_rate.h>
--- 
-2.7.0.rc3
-
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.1.bb
similarity index 93%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.1.0.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.1.1.bb
index e541017..c95ea54 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.1.bb
@@ -20,12 +20,9 @@ LIC_FILES_CHKSUM = "\
         file://rate/rate_samplerate.c;endline=35;md5=fd77bce85f4a338c0e8ab18430b69fae \
 "
 
-SRC_URI = "\
-        ftp://ftp.alsa-project.org/pub/plugins/${BP}.tar.bz2 \
-        file://0001-pph-include-config.h-from-rate_speexrate.c.patch \
-"
-SRC_URI[md5sum] = "b123e42ed881b9adbc99e4040f257c39"
-SRC_URI[sha256sum] = "3b83c329953bef99f5fe25ae04ec4a455fe6514939f3b45a5321966652b2c9ee"
+SRC_URI = "ftp://ftp.alsa-project.org/pub/plugins/${BP}.tar.bz2"
+SRC_URI[md5sum] = "69f9f3e2de3c97fc71d496e91e271fe5"
+SRC_URI[sha256sum] = "8ea4d1e082c36528a896a2581e5eb62d4dc2683238e353050d0d624e65f901f1"
 
 DEPENDS += "alsa-lib"
 
-- 
2.8.1


