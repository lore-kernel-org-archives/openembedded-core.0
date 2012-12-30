Received: from mail-bk0-f50.google.com ([209.85.214.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tp884-0002Z6-7r
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Dec 2012 02:55:57 +0100
Received: by mail-bk0-f50.google.com with SMTP id jf3so5065275bkc.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Dec 2012 17:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=wECB/tXSiyUtbM7TTRj2EMdjVCMMHAnQ38QiaWZsMK0=;
	b=P2VIvjZC8BvRB6YduW6wFN/ECj0eB2PJugSGlFBvN8l75WcOegwBssIdTBVcrrQHvT
	0V9jQumukN1yEVUq2dMvgSA3YkJKKqC52VyAExhhzFmKYHZnbVNtij9/F94RKeDI4FQa
	SpFV3aZR+yNawYYiUBFl6WQUCGZztFAvPfxOlNX98/S1okM8bToPKndJPH/mWcsAgwbr
	GQfKPYq3pKTitSndIw+vUUAsksx+5vc8lZiowybRJG2PTPjv6Hh2gMCZz8H1NrTQRRnG
	UlVcbkxeNfjYG6j4h3e4tGMLz+xKYz2UamMZJwG/5Vo4GejgRkI04oEz7xHaIzFgWke4
	yAtg==
X-Received: by 10.204.5.145 with SMTP id 17mr17562457bkv.98.1356831658702;
	Sat, 29 Dec 2012 17:40:58 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id z5sm25248321bkv.11.2012.12.29.17.40.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Dec 2012 17:40:57 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tp7tY-0003X2-6s; Sun, 30 Dec 2012 03:40:56 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Dec 2012 03:40:53 +0200
Message-Id: <1356831654-22420-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1356831654-22420-1-git-send-email-cazfi74@gmail.com>
References: <1356831654-22420-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH] harfbuzz: add recipe, version 0.9.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Dec 2012 01:55:57 -0000

OpenType text shaping engine HarfBuzz is dependency of pango >= 1.32

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb |   27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb
new file mode 100644
index 0000000..d2b3e9b
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Text shaping library"
+DESCRIPTION = "HarfBuzz is an OpenType text shaping engine."
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
+BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
+
+LICENSE = "Old-MIT | UCDN | ICU | HarfBuzz-old"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
+                    file://src/hb-ucdn/COPYING;md5=994ba0f1295f15b4bda4999a5bbeddef \
+                    file://src/hb-icu-le/COPYING;md5=0ac60acf068e2cc9facdf86169a9c13e \
+                    file://src/hb-icu-le/license.html;md5=9136737088bbfbbf86d9a714da49fb89 \
+                    file://src/hb-old/COPYING;md5=6e8442c12d498ce55cfe39fc60f97981 \
+"
+
+SECTION = "libs"
+
+PR = "r0"
+
+SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "e901ffe556d706b7d43b272f83be7f09"
+SRC_URI[sha256sum] = "3d8dd4ebbc38da011485ef181f8ff072b4b0d7e305bbda19b355f217d25169cf"
+
+inherit autotools pkgconfig
+
+DEPENDS = "icu"
+
+BBCLASSEXTEND = "native"
-- 
1.7.10.4



