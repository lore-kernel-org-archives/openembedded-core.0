Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F158EC46467
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:35 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.16012.1672594706166223781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3/borBKK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id g16so17483061plq.12
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5HpjNzeQZQnzImpUzd5TZVFGxJfvO/Rl4AnJsz/oDk=;
        b=3/borBKKHJNGsjjfk4u7Mm2ZLH4yTmmrMsGXtC+OU0zt69hG5BBmC7/7woddkOBvjy
         y891+IJSMC0EIDsPyO6KWpgZS1OubhdDbuM1MkO8GwF4oXAG3i6mcdlh3Q9AqBcD6YfD
         76ru1t3WTui1qdU/z6fudWxin4aMT8XwQ2ZTEtmpIVoPvfOYSHQV/hjqj+Yy4QW4whNI
         u4KXL0qTpeubIvnJxki+orDS+roL901grnqF5nV/bhQwR/vYrSyrbB8zY8Gpc/AlJM6N
         f8LJ3cMbD+ZztHLXQ0F7GW6gL1sEtKZylBrVEmdfk1q3sn+ohP+zrgsdb+FNsoGlRAz7
         YjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5HpjNzeQZQnzImpUzd5TZVFGxJfvO/Rl4AnJsz/oDk=;
        b=ySGfLxveoR9gk9klknvg9WdK6i9F+6q3+FUgVya9dxdS6Xlp6G4hCEZ8sGEL5DVdPf
         5/J47CXjB3wk9AgEA6F6hw7+617pJe/3e5gtB6743VHka+PbmtCNFklQqZ6qpvDU4UkV
         RjVepB8tbcS+vO+/L7yj3djTIJgU6TlfJHXJPOxfJ8q1eePoyhgnXekGjcXPxC/rT1Rg
         /9hQKR5hsXzVKebSBNtW1drS/tKnJtZXDknMactsim/H/SLqFOMf+Tw0pfpgnWglDh1X
         S7pGdCKi3y1QWJW/VL0ZfBeC6GkMPXkDUCd3FSJdmR2wWHgXUJTxKvFjZe3aJsJC1BxW
         ZSnw==
X-Gm-Message-State: AFqh2kqgjWfuzIGCoY84tmYLERTWvpJD98h938gJpNTRnSsbV7zm6nXg
	Lf5V/oogUCH8DiQRBhbelC8dmC644KXetYAoIi8=
X-Google-Smtp-Source: AMrXdXvYilhm07VNAfH60FAp5rPoIASuVjy2y4IFibl0FHxyOlf2LUqt/FQ0ppOkKGMHx0sBoZ2KEA==
X-Received: by 2002:a05:6a20:1455:b0:a4:829f:a43f with SMTP id a21-20020a056a20145500b000a4829fa43fmr58748228pzi.2.1672594705196;
        Sun, 01 Jan 2023 09:38:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/29] libnewt: update 0.52.21 -> 0.52.23
Date: Sun,  1 Jan 2023 07:37:36 -1000
Message-Id: <b7717c018ae26ad8a070d62cf21c78c2543b8189.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175202

From: Alexander Kanavin <alex.kanavin@gmail.com>

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


