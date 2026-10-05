Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF134CA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 15:37:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23059.1791214655626547481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 08:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=e17KyQpH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8EE0A1A116D
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Oct 2026 15:37:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64000601A5
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Oct 2026 15:37:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4285E103307DB;
	Mon,  5 Oct 2026 17:37:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791214649; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=AwwSMKqfLg0UPGJYIA3J47fnnsaebL9oCbluYKISIMI=;
	b=e17KyQpHOwWOTKoCbg9aES6VUDZ/qW+A3eHS2AVhfTKbEW8xMpnJatlY8hJCXSSky+25KS
	TWBoVEggnaFU71xx3Dp29GqWnM5CK9m3cI/PS2AnLGvLx/TbIQ/FpLHA3m4+MEPiw60S5L
	d+w/T8qH3gfSHTKRIqAXO3gjRPG8CtHSvmDDLGBsXBfar4mSRB6KaI8g9K1Uet6P0w18BS
	We89mZpXsl7P6+COzTnp6YF0hdotYXa9PpVCgfyDEYDBymMHq7F5E8e2pbbgbgXJ4YAOh7
	C9pDSIvwL8AWO1dGoEz4T4gUwZIDAYoCTniFzBBTbinLPmAQ4Y51cbsPVI8VkA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 05 Oct 2026 17:37:18 +0200
Subject: [PATCH] libpcre2: Remove testoutput3C file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261005-mathieu-pcre-patch-v1-1-b43f0fe15f42@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAC3Ew2oC/x3MQQqAIBBA0avErBswK6GuEi1kGnMWlahFEN09a
 fkW/z+QOAonGKsHIl+S5NgLmroC8nZfGWUpBq20aZTqcbPZC58YKDIGm8lj1zKRM8YNpKCEIbK
 T+59O8/t+zLqjPGQAAAA=
X-Change-ID: 20261005-mathieu-pcre-patch-43eccf66f9c0
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791214647; l=4847;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=LaTWBOlSp8XVWE3ETcN7fnSJtpzPMqTxR/T5bLW36Yc=;
 b=g+zYfyXp7vHZ23ApcRmwRTtQgt/3zsNH/e50HVs7v/bDXmiLxOIDUn62pgGhJ1PHX4L73MF2u
 VAZ6AxpaeYbDzZdDrSKZ6GZuqOxfpYyxGmBxxWnyubA0Ggm3V50DkB0
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 15:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247245

This file had to be added to fix an issue with version 10.48. Said issue
is no longer present in version 10.49.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-support/libpcre/libpcre2/testoutput3C | 174 ---------------=
------
 meta/recipes-support/libpcre/libpcre2_10.49.bb     |   2 -
 2 files changed, 176 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2/testoutput3C b/meta/re=
cipes-support/libpcre/libpcre2/testoutput3C
deleted file mode 100644
index 2af67a8d0367..000000000000
--- a/meta/recipes-support/libpcre/libpcre2/testoutput3C
+++ /dev/null
@@ -1,174 +0,0 @@
-# This set of tests checks local-specific features, using the "fr_FR" lo=
cale.=20
-# It is almost Perl-compatible. When run via RunTest, the locale is edit=
ed to
-# be whichever of "fr_FR", "french", or "fr" is found to exist. There is
-# different version of this file called wintestinput3 for use on Windows=
,
-# where the locale is called "french" and the tests are run using
-# RunTest.bat.=20
-
-#forbid_utf
-
-/^[\w]+/
-\=3D Expect no match
-    =EF=BF=BDcole
-No match
-
-/^[\w]+/locale=3Dfr_FR
-    =EF=BF=BDcole
-No match
-
-/^[\W]+/
-    =EF=BF=BDcole
- 0: \xc9
-
-/^[\W]+/locale=3Dfr_FR
-\=3D Expect no match
-    =EF=BF=BDcole
- 0: \xc9
-
-/[\b]/
-    \b
- 0: \x08
-\=3D Expect no match
-    a
-No match
-
-/[\b]/locale=3Dfr_FR
-    \b
- 0: \x08
-\=3D Expect no match
-    a
-No match
-
-/^\w+/
-\=3D Expect no match
-    =EF=BF=BDcole
-No match
-
-/^\w+/locale=3Dfr_FR
-    =EF=BF=BDcole
-No match
-
-/(.+)\b(.+)/
-    =EF=BF=BDcole
- 0: \xc9cole
- 1: \xc9
- 2: cole
-
-/(.+)\b(.+)/locale=3Dfr_FR
-\=3D Expect no match
-    =EF=BF=BDcole
- 0: \xc9cole
- 1: \xc9
- 2: cole
-
-/=EF=BF=BDcole/i
-    =EF=BF=BDcole
- 0: \xc9cole
-\=3D Expect no match
-    =EF=BF=BDcole
-No match
-
-/=EF=BF=BDcole/i,locale=3Dfr_FR
-    =EF=BF=BDcole
- 0: \xc9cole
-    =EF=BF=BDcole
-No match
-
-/\w/I
-Capture group count =3D 0
-Starting code units: 0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P
-  Q R S T U V W X Y Z _ a b c d e f g h i j k l m n o p q r s t u v w x =
y z
-Subject length lower bound =3D 1
-
-/\w/I,locale=3Dfr_FR
-Capture group count =3D 0
-Starting code units: 0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P
-  Q R S T U V W X Y Z _ a b c d e f g h i j k l m n o p q r s t u v w x =
y z
-Subject length lower bound =3D 1
-
-# All remaining tests are in the fr_FR locale, so set the default.
-
-#pattern locale=3Dfr_FR
-
-/^[\xc8-\xc9]/i
-    =EF=BF=BDcole
- 0: \xc9
-    =EF=BF=BDcole
-No match
-
-/^[\xc8-\xc9]/
-    =EF=BF=BDcole
- 0: \xc9
-\=3D Expect no match
-    =EF=BF=BDcole
-No match
-
-/\xb5/i
-    =EF=BF=BD
- 0: \xb5
-\=3D Expect no match
-    \x9c
-No match
-
-/=EF=BF=BD/i
-    \xff
- 0: \xff
-\=3D Expect no match
-    y
-No match
-
-/(.)\1/i
-    \xfe\xde
-No match
-
-/\W+/
-    >>>\xaa<<<
- 0: >>>\xaa<<<
-    >>>\xba<<<=20
- 0: >>>\xba<<<
-
-/[\W]+/
-    >>>\xaa<<<
- 0: >>>\xaa<<<
-    >>>\xba<<<=20
- 0: >>>\xba<<<
-
-/[^[:alpha:]]+/
-    >>>\xaa<<<
- 0: >>>\xaa<<<
-    >>>\xba<<<=20
- 0: >>>\xba<<<
-
-/\w+/
-    >>>\xaa<<<
-No match
-    >>>\xba<<<=20
-No match
-
-/[\w]+/
-    >>>\xaa<<<
-No match
-    >>>\xba<<<=20
-No match
-
-/[[:alpha:]]+/
-    >>>\xaa<<<
-No match
-    >>>\xba<<<=20
-No match
-   =20
-/[[:alpha:]][[:lower:]][[:upper:]]/IB
-------------------------------------------------------------------
-        Bra
-        [A-Za-z]
-        [a-z]
-        [A-Z]
-        Ket
-        End
-------------------------------------------------------------------
-Capture group count =3D 0
-Starting code units: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
-  a b c d e f g h i j k l m n o p q r s t u v w x y z
-Subject length lower bound =3D 3
-
-# End of testinput3=20
diff --git a/meta/recipes-support/libpcre/libpcre2_10.49.bb b/meta/recipe=
s-support/libpcre/libpcre2_10.49.bb
index 5fa7c3db3b4c..8e0c44fb4c48 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.49.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.49.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.md;md5=3D6720bf3bc=
ff57543b915c2b22e526df0 \
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2=
 \
            file://run-ptest \
-           file://testoutput3C \
 "
=20
 GITHUB_BASE_URI =3D "https://github.com/PCRE2Project/pcre2/releases"
@@ -64,7 +63,6 @@ BBCLASSEXTEND =3D "native nativesdk"
 do_install_ptest() {
     t=3D${D}${PTEST_PATH}
     cp -r ${S}/testdata $t
-    cp ${UNPACKDIR}/testoutput3C $t/testdata/testoutput3C
=20
     for i in pcre2posix_test pcre2grep pcre2test; do
         "${B}/libtool" --mode=3Dinstall install "${B}/$i" "$t"

---
base-commit: d8195f7a0813c959e5e3337ff8297e99f7549e93
change-id: 20261005-mathieu-pcre-patch-43eccf66f9c0

Best regards,
--=20
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


