Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46179.1795625650407987238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dle2kOa5;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so10006724c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625650; x=1796230450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0utFjXh1I2glkYL/hJ9TCmZWGbvHXT0xgYwdRwU2yKk=;
        b=dle2kOa5D09A4Lv3ijA7gR9hVG/7cdQSAkEvIad0fUIbT9STJAIdAsWTmKvKr/xCuq
         1mGTd0y2jPhRuBkZW+U4rYD3JYh8rBgleAaxBpu/vUbEgwC3mPaCDDgVZiUeVS0IRd4E
         10DAAanxmHxvTJZpUcCaOdx8a3B0R3YYPD/ikWynV+b6Ph78Vj/9FgiiRA6096sW8yrr
         lDleZK3si/pFMPOgQUVD655Fj6yDliFURzKOc3kP/zdB5KyA8/XLNno0rLGRAbJqsgv5
         jlAvzdlwoTCkH4IRRReUpe3M3lAUgB+RASNTm/mCMWvxUk0lpOMBZ4JEM15MlMK68wD0
         7uGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625650; x=1796230450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0utFjXh1I2glkYL/hJ9TCmZWGbvHXT0xgYwdRwU2yKk=;
        b=MvI4do1k3dn89xFjhXe4yxi/9/PwwHYqMHUhe4Q5Mki22bDpp0T4k/nhjnT0sI2Peh
         jHPknAAurh8y1usgB6k/pRhq2ahxEzqBYIk6yAX9UjltKpy1xgpsG38tm9J0e+jx+0zo
         fn650uM4UrJUGgOV7gDNv27wqyVtgd1bohcJOFjxCmxJ5H+lOkMLT6YoM7rj7L08vQyJ
         AE0Z3R+pPy7OdWBwm9MN//cjkL1rKggnPR4j7G6z+60YnogPR4fFNAXhIRxkHumCRXw3
         wXAYcfezuNct/Im3fCFNA9B47ZWhclDA7BDm9BqDNJ8pCks1pBh/SC6pMm18krfXu+jF
         0SfA==
X-Gm-Message-State: APuU4Z9kr/CG26anOIXjS2Ooi4xQJfk5zCtpoivFtg1ERwGKIcWatf9/
	XS0z+qt3OFbJi1PwSz2x1vQ9NZ/tNpbuUOTgIeXzvydrg7CpC5SqcFgH4ZouLi8g
X-Gm-Gg: AZFdTZczluYgi/L2UwM34e8CXns9odAhUvPgN/Dl7qu+bAlVF5V8PaOZSfJ3WR6K3Pc
	paPoa938xhv8ZQjDYWI4GH9N0I2aEAmkT2rt/mOCtUlaY1+Ue72NevLL60X4sPa9Gp1CeqpjIB4
	wppSQfXpdAuJEfdYB1uqUAN9umUdx6T+PYb+qpdtr3BrZjHjgk0jqjRXZ57Q51lu1GZTgICu6kd
	RqR6IQwfzIsBnpqbkxYMtFnltog20h42RhFGFQyXaoQqvg8Pxs1VBGyZxWobnyXrKJYroo5dCP0
	wA/wA0+/ffed3+1i2H5FyMenNjZVV2r4tGhMO6n9JrKVfpM0s3S027dWs8vcBNiqp7S3CQvkC99
	ycEHK5buJRX4mNjevLsyVG39oerv/ZRp5P5XTthWcYaGOpeHCLNdpUx1r7Kmz3ttctaGvFwK3rc
	5WuwYlw6W3PVv6EhGjwRTinp0Q1/FUzFR78sWB3iUYWRxoXiPHb1jd/0fPmkxqT3HPzV7ES+CZe
	DMkAdYws8vMhrgDXAsfSpWM+YE+FVaG8lf4SJs/JGnUO9GdZRXF4ozumD9SKVbG7lBDUVYHxxm/
	aVMIHHBGUJ8y3zxwW5E/g0y58lul9dSuOGK8STXWYYqydHW1AR3ji2tF1tqKyTADoy7jNVDK/Ai
	ftGgvR2NkE0KFXjb/VvIQIfyxw2XGzG0EWu7sC/nmCl1771zuhA3ya4g25Vy5dpiCGKJWP9KS0D
	Ao+/j/rqmim2ipJ/GaTzdirYf/rBYzgfmRD3FGKvLdak1UhxSrEgHAWXB0nCe+JWINTNzPJZIhQ
	yuVCgP1DkPC82YN8dBeGpLiS8qvu9BPStKQCTOHlW3W4P/2VTp39W3XSqfkykdtWxVIByPgmZiT
	hB4N/np194GjgtamCJg3yCYX2A==
X-Received: by 2002:a05:701b:4502:10b0:1b5:3616:5968 with SMTP id a92af1059eb24-1b556898b59mr19025706c88.14.1795625649531;
        Wed, 25 Nov 2026 08:54:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm49044477c88.13.2026.11.25.08.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:54:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v3] gawk: Fix intformat ptest failure with clang
Date: Wed, 25 Nov 2026 08:54:05 -0800
Message-ID: <20261125165405.2553247-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251230
Content-Type: text/plain; charset="utf-8"

format_int() relies on undefined behavior when converting out of range
doubles to integers, which clang optimizes in a way that makes the
intformat test fail. Add a patch to range check before converting.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
v2: Use the patch suggested by gawk maintainer ( Arnold ) which also fixes =
the problem.
v3: Update patch status as its now applied upstream

 ...efined-behavior-converting-out-of-ra.patch | 52 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.4.1.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undef=
ined-behavior-converting-out-of-ra.patch

diff --git a/meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undefined-be=
havior-converting-out-of-ra.patch b/meta/recipes-extended/gawk/gawk/0002-pr=
intf-Avoid-undefined-behavior-converting-out-of-ra.patch
new file mode 100644
index 0000000000..aa2b2c1de8
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undefined-behavior-=
converting-out-of-ra.patch
@@ -0,0 +1,52 @@
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
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git=
/commit/?id=3D58356d4681f7e9dc2f48f7dc099346dc3f03d441]
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
