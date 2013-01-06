Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrxAT-0002J9-9y
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 21:50:06 +0100
Received: by mail-la0-f48.google.com with SMTP id ej20so13476292lab.21
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 12:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=CUo23UCRklPgxdCtec4b9gPwavOpB6sdhCCdBLuaWzE=;
	b=SIkxUxdjppLzA83Z9NoVtw6s63drG+nJkbeW8BwsxlZYCJEX5jHzBQMwNjCaliHhwp
	VHfG8RTxiiE9lAuQD0+meuSHNMzBVXsiQJHRHpCHmSFrh02FMZU1UwvLZDuNEOkPuiFX
	zr/S4jNU36HocZKccXHemtDQ89PoFYcu/xriMPlRM02/O4h8vBG8j6bAN9sCAbZ09KJm
	f5cQVCg3RsRaaG+R43/8rAp4EffzWBxUOjdPovtSYj1Ev9usnXyFKc9QDHoopgQZrj9x
	l1F8pefokQRBqBUVhKG896uVbZWJv6Yaxrw2hmUnQP3hbVa1i3g4OcS/SxLa1RceooG+
	BpPQ==
X-Received: by 10.112.50.43 with SMTP id z11mr23798690lbn.36.1357504496905;
	Sun, 06 Jan 2013 12:34:56 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id iw6sm2023704lab.2.2013.01.06.12.34.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 12:34:55 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Trwvl-0000lF-JA; Sun, 06 Jan 2013 22:34:53 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Jan 2013 22:34:51 +0200
Message-Id: <1357504491-2878-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357504491-2878-1-git-send-email-cazfi74@gmail.com>
References: <1357504491-2878-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2] harfbuzz: add recipe, version 0.9.9
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
X-List-Received-Date: Sun, 06 Jan 2013 20:50:08 -0000

OpenType text shaping engine HarfBuzz is dependency of pango >= 1.32

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb |   27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb
new file mode 100644
index 0000000..da09be6
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
+DEPENDS = "icu glib-2.0"
+
+BBCLASSEXTEND = "native"
-- 
1.7.10.4



