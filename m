Return-Path: <misla011@fiu.edu>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 667FF7EC5D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 01:02:51 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id u184so405506qkd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 18:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=PkB0cfaWmaTTxOJ+lGZfRLmpSFEvAjArn2OLSYSLbD4=;
	b=T5cJvbvi0OIQauLQL/K6/EvYQ+GrB04mYAig+7NmrCd4kL7OSuOeuxIHpmmAln3uAV
	QSFbs/n8exhBa5i3QX/GPcHCdLR0neyepn1yE1JNaMER4wlj+VCZEz6LgFTrpUQTMLvx
	NC3uwG7yCdZ4OOH8lapz78icP4Wn1txwVqqOBpSgEhOAGNQR9RRoYCh/CC8grQRndDB9
	8JkCun6e3gLnuxFbs+4VrjuZLsgK4KUHWOFmbayAqj5BBa5xPLgJ2CEcx2teRe5GnsDc
	XGoghkxuV3OnnqPbuH0Uq9tAfIjnCwA7UP8wkheB4pAutMil+Ln1AMsxQhbIW5e8JzId
	VBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=PkB0cfaWmaTTxOJ+lGZfRLmpSFEvAjArn2OLSYSLbD4=;
	b=HcdVoecR5XBAbVf0IgurdnnycKWFFbdes3kARdG1nBuRUebRB5LiVscACTvwDacn8p
	6/GoV9d8GlJFbMbmC7lD2eGLEYf+YDjKaAC+SAtDPiQTFxnmQ8bLfdnBYSHWwUxvrXsX
	MdCYEIA+vXVfFLYTdkApPP4BQ/B+HPKa83Ph+OrhyIwe8OP8Ex6ywiDP0X1JW7qTN78l
	6hwZLs16Bd0CPpqJzO2180y/NpQvUUI/2RgZebBsjTOwrNqt4RtnyWoDljNkfX3uCwsa
	opXBDEWWSAbrmu9FIXle3zjqQ7yZseaFpbIUZe1iR7dBk32V2mBzqb9MmLPCro+M3CTV
	GqFg==
X-Gm-Message-State: APjAAAWm/l/O7xtt+S/a5HArKwxzw0neIx+1O88nddHh32rjKTPtSeN+
	+YWQPkKBjsN1Hoh8I+z6dkCCPIV5bqw=
X-Google-Smtp-Source: APXvYqwyZAiXB1lbtZjaZEwZK2CnltDBrRC7mHXHI1URhZFgad5HNqLH74iLlLzt4Q3TyeiJA8dn/g==
X-Received: by 2002:a37:66c8:: with SMTP id a191mr866178qkc.108.1569459771869; 
	Wed, 25 Sep 2019 18:02:51 -0700 (PDT)
Received: from
	muislam-yocto.h0ebkyng4k5ejcojahceueqbfb.cx.internal.cloudapp.net
	([40.84.59.7])
	by smtp.gmail.com with ESMTPSA id p77sm316334qke.6.2019.09.25.18.02.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Sep 2019 18:02:51 -0700 (PDT)
From: Muminul Islam <misla011@fiu.edu>
X-Google-Original-From: Muminul Islam <muislam@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2019 01:02:40 +0000
Message-Id: <20190926010240.52085-1-muislam@microsoft.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Reply-To: muislam@microsoft.com
Subject: [thud][PATCH v2] pango: Security fix for CVE <CVE-2019-1010238>
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
X-List-Received-Date: Thu, 26 Sep 2019 01:02:51 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Muminul Islam <muislam@microsoft.com>
---
 .../pango/pango/CVE-2019-1010238.patch        | 39 +++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.42.4.bb   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch

diff --git a/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch b/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch
new file mode 100644
index 0000000000..309ff2d083
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch
@@ -0,0 +1,39 @@
+From 7e3b9e1c88799a4da39da5d3a4a6dd652d859201 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Wed, 10 Jul 2019 20:26:23 -0400
+Subject: [PATCH] bidi: Be safer against bad input
+Reply-To: muislam@microsoft.com
+
+Don't run off the end of an array that we
+allocated to certain length.
+
+Closes: https://gitlab.gnome.org/GNOME/pango/issues/342
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+CVE: CVE-2019-1010238
+Upstream-Status: Backport
+---
+ pango/pango-bidi-type.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/pango/pango-bidi-type.c b/pango/pango-bidi-type.c
+index a49e06d9..d169525e 100644
+--- a/pango/pango-bidi-type.c
++++ b/pango/pango-bidi-type.c
+@@ -179,8 +179,11 @@ pango_log2vis_get_embedding_levels (const gchar    *text,
+   for (i = 0, p = text; p < text + length; p = g_utf8_next_char(p), i++)
+     {
+       gunichar ch = g_utf8_get_char (p);
+-      FriBidiCharType char_type;
+-      char_type = fribidi_get_bidi_type (ch);
++      FriBidiCharType char_type = fribidi_get_bidi_type (ch);
++
++      if (i == n_chars)
++        break;
++
+       bidi_types[i] = char_type;
+       ored_types |= char_type;
+       if (FRIBIDI_IS_STRONG (char_type))
+-- 
+2.23.0
+
diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index 22fe3af15d..34732fdd4b 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -15,6 +15,7 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
 
 SRC_URI += "file://run-ptest \
             file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch \
+            file://CVE-2019-1010238.patch \
 "
 SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
 SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
-- 
2.23.0


