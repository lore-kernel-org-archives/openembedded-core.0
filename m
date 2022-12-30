Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72FDC53210
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:44:34 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.22292.1672418668513863287
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rwo28OIJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id k19so7061341pfg.11
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHBOblXxtWt9NSqsr6UeF/GmDLTv6mMYN5UtOJ3PQQ0=;
        b=rwo28OIJAL8LK7ifD+BVL485UvScggRDTgFNs4UN6/8BI/B/I3L93To5uiWTJ7TEYC
         EpForf6aeV+J7lP10pLn7Z5zxUl1rQbZ8t0LyWktpxaXyHQhBfRsEK4bgdIiCMPGwFN6
         7UqVW2WvGixUHeLBwWapi+aPCVr8Y2deGd9SaVvEWtrRnDD4RXEW1suGX/fluMr/yArX
         HL4oO1b2SQ8OKr3G09kcWHzGgMsnxjuF+cTTd/r3potac736E/1ORoZZ0a+ahZ/NGVYN
         8TCYjLVnWvSh3GY8MXWQ7dorOcw4+1S4aw4xnezdLxnztnIn/CMOoUC/5LJGQi1mrtBX
         EG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHBOblXxtWt9NSqsr6UeF/GmDLTv6mMYN5UtOJ3PQQ0=;
        b=itrpZKyQt50s7EnZKIdaBCLu8O25xb2T+//SjH+21xidPGSzRPpQKMUDogDPybUkvd
         rtfRIBPom9m1ebg3KJEj4h4OoL9Kon9z1Pi8xH+WCjjMmp2oYJwXdVJcDk+eV3N5cV3f
         /xhW/vemKhJ9av6h9fZKLQMrbsFFArrTJ9I+LWRK2atTcfrG07QGiMROqMM2y4K9pHUd
         5NV7E9Qgule9gbG6e9ayqyXRpHwx4e7bSkRp8a/QIRmeVB3Mbjo2UgwfhGHn1O1I4/3w
         BxCxmLlRJRNyS13eMonSJkqtAoNrKyc2eVTDfECCfG3CKgur7bO6uayJVcwJFme5om6S
         7ccA==
X-Gm-Message-State: AFqh2kp1arVaCU3AG1nTGNHkJmF2kX9u22Jp3nDgQSnf0kzZ0LrtZlAE
	FjZmTVjWk480IyIoGKfQyRl5YlZwjAXFa7jT57g=
X-Google-Smtp-Source: AMrXdXtcz0Z/2H0JsZYmlqybOyACzFzVpN9zeLFVM/wFVy1G7hrw0eCe9i6Wavj8xdYCVK2fOWJUcQ==
X-Received: by 2002:a05:6a00:168d:b0:577:2a9:ec82 with SMTP id k13-20020a056a00168d00b0057702a9ec82mr41748561pfc.5.1672418667570;
        Fri, 30 Dec 2022 08:44:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.44.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:44:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/22] libnewt: update 0.52.21 -> 0.52.23
Date: Fri, 30 Dec 2022 06:43:55 -1000
Message-Id: <e5aa3d25a404f6248f2cf784c2c9a8de995fe8f1.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175146

From: Alexander Kanavin <alex.kanavin@gmail.com>

0.52.23
- fix automatic height of menu/list in whiptail (broken in 0.52.22)
- fix automatic width of whiptail --yesno box
- fix automatic width in whiptail with unicode characters
- fix automatic width with whiptail --noitem and --notags options
- fix spacing with longer tags in whiptail
- avoid overlapping backtitle in whiptail with automatic height

0.52.22
- fix crash in whiptail with new libpopt
- switch from usleep to nanosleep (Rosen Penev)
- fix libnewt.pc to enable static linking (Alexey Sheplyakov)
- fix LDFLAGS order in snack linking (Sam James)
- use CFLAGS when compiling snack
- improve configure.ac (Thomas Kuehne)
- install header and libnewt.pc with shared library (Michael Olbrich)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ff12622451f1f8580f928c6771cd82daa632071c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-detect-gold-as-GNU-linker-too.patch  | 14 ++++-----
 ...-t-ignore-CFLAGS-when-building-snack.patch | 29 -------------------
 ...{libnewt_0.52.21.bb => libnewt_0.52.23.bb} |  4 +--
 3 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-extended/newt/files/0002-don-t-ignore-CFLAGS-when-building-snack.patch
 rename meta/recipes-extended/newt/{libnewt_0.52.21.bb => libnewt_0.52.23.bb} (87%)

diff --git a/meta/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch b/meta/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch
index a4b3afd959..090ed5c1c9 100644
--- a/meta/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch
+++ b/meta/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch
@@ -1,4 +1,4 @@
-From 58245b859ffbcb1780575bf1b0a018d55e74e434 Mon Sep 17 00:00:00 2001
+From 08ba909500412611953aea0fa2fe0d8fe76b6e24 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 21 Sep 2016 21:14:40 +0200
 Subject: [PATCH] detect gold as GNU linker too
@@ -9,23 +9,21 @@ Content-Transfer-Encoding: 8bit
 Upstream-Status: Pending
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 03e8bda..c2fce51 100644
+index 468c718..cd93f30 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -28,7 +28,7 @@ AC_CHECK_SIZEOF([void *])
  AC_MSG_CHECKING([for GNU ld])
- LD=`$CC -print-prog-name=ld 2>&5`
+ LD=$($CC -print-prog-name=ld 2>&5)
  
--if test `$LD -v 2>&1 | $ac_cv_path_GREP -c "GNU ld"` = 0; then
-+if test `$LD -v 2>&1 | $ac_cv_path_GREP -c "GNU "` = 0; then
+-if test $($LD -v 2>&1 | $ac_cv_path_GREP -c "GNU ld") = 0; then
++if test $($LD -v 2>&1 | $ac_cv_path_GREP -c "GNU ") = 0; then
    # Not
    GNU_LD=""
    AC_MSG_RESULT([no])
--- 
-2.5.5
-
diff --git a/meta/recipes-extended/newt/files/0002-don-t-ignore-CFLAGS-when-building-snack.patch b/meta/recipes-extended/newt/files/0002-don-t-ignore-CFLAGS-when-building-snack.patch
deleted file mode 100644
index ca235d5108..0000000000
--- a/meta/recipes-extended/newt/files/0002-don-t-ignore-CFLAGS-when-building-snack.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From f60dc1063607ca1f201ba4cbda467d8af3f78f64 Mon Sep 17 00:00:00 2001
-From: Miroslav Lichvar <mlichvar@redhat.com>
-Date: Tue, 1 Oct 2019 16:37:55 +0200
-Subject: [PATCH] don't ignore CFLAGS when building snack
-
-In addition to the flags returned by python-config --cflags, use the
-user-specified CFLAGS when building the snack object.
-
-Upstream-Status: Backport from master
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
----
- Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index be5f87b..6facd5e 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -96,8 +96,8 @@ _snack.$(SOEXT):   snack.c $(LIBNEWTSH)
- 		PIFLAGS=`$$pyconfig --includes`; \
- 		PLDFLAGS=`$$pyconfig --ldflags`; \
- 		PLFLAGS=`$$pyconfig --libs`; \
--		echo $(CC) $(SHCFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
--		$(CC) $(SHCFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
-+		echo $(CC) $(SHCFLAGS) $(CFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
-+		$(CC) $(SHCFLAGS) $(CFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
- 		echo $(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snack.$(SOEXT) $$ver/snack.o -L.  -lnewt $(LIBS); \
- 		$(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snack.$(SOEXT) $$ver/snack.o -L.  -lnewt $(LIBS); \
- 	done || :
diff --git a/meta/recipes-extended/newt/libnewt_0.52.21.bb b/meta/recipes-extended/newt/libnewt_0.52.23.bb
similarity index 87%
rename from meta/recipes-extended/newt/libnewt_0.52.21.bb
rename to meta/recipes-extended/newt/libnewt_0.52.23.bb
index 430e481b36..cd3731cf74 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.21.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.23.bb
@@ -21,11 +21,9 @@ SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
            file://cross_ar.patch \
            file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch \
            file://0001-detect-gold-as-GNU-linker-too.patch \
-           file://0002-don-t-ignore-CFLAGS-when-building-snack.patch \
            "
 
-SRC_URI[md5sum] = "a0a5fd6b53bb167a65e15996b249ebb5"
-SRC_URI[sha256sum] = "265eb46b55d7eaeb887fca7a1d51fe115658882dfe148164b6c49fccac5abb31"
+SRC_URI[sha256sum] = "caa372907b14ececfe298f0d512a62f41d33b290610244a58aed07bbc5ada12a"
 
 S = "${WORKDIR}/newt-${PV}"
 
-- 
2.25.1


