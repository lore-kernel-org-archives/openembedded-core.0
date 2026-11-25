Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34931.1795577149569067625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 19:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KW/1LQnS;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385d8a00598so7749660eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 19:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577149; x=1796181949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJ2O0nPtfmcdDMciIri63ZFATUJvu771xTf0E4mXNvI=;
        b=KW/1LQnSGda8N/nTQQds6EZrQ3Y9OMgGl36qgdBkU7i65Dnp60WGbE1ow0oKPSox08
         VASW2dwfa9RkGqyZ9BTbVETPV8OBrXyJ+H2oH4cSnGL4Ks/kl5LE0TMMoJvQiMbUIwRQ
         jkiP2bynhjwIN1EP/o0IC8wAJ6EaWOmcfTIq2esbcauxpwYV88E3JhC2T+MszjLl0lEn
         FJpF1F6OrAagQq8qgG5lOVzfmAbFNXGSUN3gLMj4U8S420sspsafoazNKH6N8DsxScrZ
         5B0441YsaKV7Ha99c1IV+I/mqpw5fKwu2+oUh01apgWVL8kHmH9VodK2dmcrMaDSkgGA
         EzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577149; x=1796181949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJ2O0nPtfmcdDMciIri63ZFATUJvu771xTf0E4mXNvI=;
        b=Ppw/zMXmOTc2l8Y3UOR545icTGHBpUL2/AegMpGYGE3L6nAEWaZRejZumxdkbaKg4w
         NHjm+q0yrU2c8keshLrsHIR7VTX3kwzK2kksBJGMzqhSVidgUiTMlm0uPI69wnwJEH2q
         /lBN5+Fqh5yE3X3CfdcOni0dCLrnyvOLL0WRY9CSNs+Blqs9d3xnTAoZ5fowKxqRjOTI
         +peWdCy11HE1kskDQmyc1yTHhP1XEKBYEDzku8VuKvDzRnNPrY0Wq2xxpr94U+TvR5uL
         E8+BClze6gZeINHXImQuWtfaauj3QjkyNixHrOcXrMM7xGOWL8f7jNrzfPx9PG22b8bq
         I5ag==
X-Gm-Message-State: APuU4Z8L35W2qbn861EtvrrDLrmSVJXZDx3AbDkqybJG7BM92M8QpJyf
	Vnl9wg5a6Osgq2ArxJfEtssPvNJZG+uoxK17TcFvctGsWLcwi4AaWW+D2qxbDyNB
X-Gm-Gg: AZFdTZe/A+ev72eFRnkvqLJ313Em+PL/aocraMdhst+9ZvP9tuIF6wTTe08H238ALKQ
	FMySnN7TSKeJup1mS99eWiFKftZdDleeN0om9ibcjKcoIgaEQ2683v7tP35JvdlLdFEzBe4HJvu
	qnZjcVbclJqfpOj0q1B8COx81ucGqb/Kz57fubEjEJsD3/LsuQdKSPpkjFO5RtLS4gsh9eGLcjx
	ExNOQjCR+K70ioUGD79ifv2gYhn/WeZGMizE9MGBmWqgDEVqgjL4dy/bs3xalfszK1gb/vHU+ev
	gfRn4oOPK1vQLO3RLFotaOXT970/9BjRTdIT8flAnyoNlsK7CTvpkZvNCeW3ou8dRckVWkV1J1l
	oDvXGOrosgievqF+Cfols4q1hBTMRbzSU6SeCM7p4J8rFk2iIKYlViQR0ZUbGAvzhKBO2becsB0
	GYeAs4or1A5BmYUOVf+TAgfaKN7EOTpQX/EU8NEQOYrTiw/c7qG0/OmKI484E6dTvBaPT6K5W/p
	vdPWUvAe8ICBTtjImNkO+zS/7EnJTm1AFAg9PJHzoXI8BruVubNYc0t2MPlmVY0QiFzRYKohMZB
	JRA0jLFUiedGASt5efoaMkKnKi7eDKM0PTtAOlUT5Ut8qOq2Pyt+JX0GunAbjQLEw9XiJgvDO0w
	rdvfE3s2HWq7bQrjA91Q1YJLMducPn8ldnBp5hYxa5M9IFQNBhy/zZeWzMxwAfF+qQxpYB3BMbF
	J0oLev0SAKHhJAT/qTMwA4bkPT/Th3kdaIWsQyQdydMdZm+UakjgKy3CFtiBiFSY3SFV2pJAqr7
	GeSSWHaIfQrHvunVbu0hNWJprCRSAhKaJ4XuCos9JtdUsQQQkx1L2fK27Cb5wkDiWi2Sk8jbkMk
	nQ0i
X-Received: by 2002:a05:7301:e0c8:b0:386:c724:cc68 with SMTP id 5a478bee46e88-386c724ceb2mr2606004eec.2.1795577148547;
        Tue, 24 Nov 2026 19:25:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm48409232eec.23.2026.11.24.19.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2] gawk: Fix intformat ptest failure with clang
Date: Tue, 24 Nov 2026 19:25:45 -0800
Message-ID: <20261125032545.536406-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 03:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251130
Content-Type: text/plain; charset="utf-8"

format_int() relies on undefined behavior when converting out of range
doubles to integers, which clang optimizes in a way that makes the
intformat test fail. Add a patch to range check before converting.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
v2: Use the patch suggested by gawk maintainer ( Arnold ) which also fixes =
the problem.

 ...efined-behavior-converting-out-of-ra.patch | 53 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.4.1.bb      |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undef=
ined-behavior-converting-out-of-ra.patch

diff --git a/meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undefined-be=
havior-converting-out-of-ra.patch b/meta/recipes-extended/gawk/gawk/0002-pr=
intf-Avoid-undefined-behavior-converting-out-of-ra.patch
new file mode 100644
index 0000000000..b81b3a9118
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undefined-behavior-=
converting-out-of-ra.patch
@@ -0,0 +1,53 @@
+From e00db6a8ee76f2618f38c0dde477cb111fb0df41 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 16 Oct 2026 08:14:03 +0000
+Subject: [PATCH] printf: Avoid undefined behavior converting out of range
+ doubles
+
+format_int() casts the value to uintmax_t (or intmax_t) and then
+checks whether converting it back yields the original value to decide
+if it fits. A double that is out of range for the integer type makes
+the conversion itself undefined behavior, and clang folds the
+round-trip check away, so e.g. sprintf("%x", 2^64) prints
+0x8000000000000000 instead of falling back to %g. This makes the
+intformat test fail when gawk is built with clang.
+
+Check the range before doing the conversion instead.
+
+Upstream-Status: Pending
+Reported upstream: https://lists.gnu.org/archive/html/bug-gawk/2026-11/msg=
00028.html
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff --git a/printf.c b/printf.c=0D
+index 02646928..590786c9 100644=0D
+--- a/printf.c=0D
++++ b/printf.c=0D
+@@ -926,23 +926,23 @@ format_integer_digits(NODE *arg, struct flags *flags=
, bool *used_float)=0D
+ 		chbuf =3D (flags->format =3D=3D 'X' ? Uchbuf : lchbuf);=0D
+=0D
+ 		if (tmpval < 0) {=0D
+-			uval =3D (uintmax_t) (intmax_t) tmpval;=0D
+-			if ((AWKNUM)(intmax_t)uval !=3D double_to_int(tmpval)) {=0D
++			if (tmpval <=3D INTMAX_MIN) {=0D
+ 				flags->format =3D 'g';=0D
+ 				free((void *) buf);=0D
+ 				*used_float =3D true;=0D
+=0D
+ 				return format_float(arg, flags);=0D
+ 			}=0D
++			uval =3D (uintmax_t) (intmax_t) tmpval;=0D
+ 		} else {=0D
+-			uval =3D (uintmax_t) tmpval;=0D
+-			if ((AWKNUM)uval !=3D double_to_int(tmpval)) {=0D
++			if (tmpval >=3D UINTMAX_MAX) {=0D
+ 				flags->format =3D 'g';=0D
+ 				free((void *) buf);=0D
+ 				*used_float =3D true;=0D
+=0D
+ 				return format_float(arg, flags);=0D
+ 			}=0D
++			uval =3D (uintmax_t) tmpval;=0D
+ 		}=0D
+=0D
+ 		// generate the digits backwards.=0D
diff --git a/meta/recipes-extended/gawk/gawk_5.4.1.bb b/meta/recipes-extend=
ed/gawk/gawk_5.4.1.bb
index d3bf532528..ba28f8832a 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.1.bb
@@ -28,6 +28,7 @@ PACKAGECONFIG[pma-if-64bit] =3D "--enable-pma,--disable-p=
ma, "
 SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.pat=
ch \
+           file://0002-printf-Avoid-undefined-behavior-converting-out-of-r=
a.patch \
            "

 SRC_URI[sha256sum] =3D "07f6f7342b7febe4313fc2c2542ad93d64fe20ad8717200109=
f105a826f5fd37"
