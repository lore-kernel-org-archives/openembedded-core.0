Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3129C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:36 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.70913.1670929885131388622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gSggjOa8;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id h7so15219201wrs.6
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7i8GNCDPdMGzah4RWUxYJRmeEVG5un+WlK00ivZkLLw=;
        b=gSggjOa835CrQujGPXcpaRMeAxNyC8CcDwcl29RUFY8fYx7fkuVTy85S7b3UJj+OyZ
         K1UgA35XfYb1DBbdv+ZcAFnfA/d64/nUeEqajhykCLXBxf/6+vDrLVI9WkdZhx88kTJ0
         6dcWwAh5LgrcmHsLh0HJO4sO4r63oViPwro2v01IcyczLJCpN9I73PMjGEQ3XFDJq2Ou
         85ILS67Dou7NsxR/5YlS3WpSpQ/+idTwyVaMwR4YFllt3rwwT3j8AU1LWhvK5XGm+iQ9
         XBbzedlEhNuyqx70/kwIDJ4GtBYQRQ8m1NM9CZRPTqwKf0n/0TSgeIVzOwzcXM87MGX7
         EHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7i8GNCDPdMGzah4RWUxYJRmeEVG5un+WlK00ivZkLLw=;
        b=QeAd1DASTD6jesJP5laE22SG6ljp7vsZibmfuTiOUhcGrqS0afn+yif8Y/uqpLJLCp
         TgiDDVWRaHsU5nPaML0ql2lWAEhpx8B+mzg6wauitvTF+SEuCUGPnShi/cMxeRdtKc5q
         44T20fhaJ8+sJUUX4mcRjbOTe5CMNAesEee5/MeUnAUK63dBjMRAekg87ifd7a0ijF/M
         vfkI5VHfq55XJ/FfiEY4r2HZf/YLNDVUl0/ATT8NyjhhD6AlsKupsHipsGhd+Wa3pvRc
         +AEIg5/AjiFJxXR/WAmSY7dASfYJvQfw3lWKndBdGA4bHQ6CKzH5FTO0e1fN50iHpykw
         QukQ==
X-Gm-Message-State: ANoB5plK0DKB3xuPaU9u4odgHZjp1TzNGPOVEiWJdfA26dWDYg+5yk8L
	a6aE6CLQeTnXBAfIAa31d5va9lkLCYE=
X-Google-Smtp-Source: AA0mqf7nX64H2uc+PjWIzB2TVQWHE0W2Hn+uos+kIgZeEAg67S6rITkaz9KIXRTL7HiFLSH0zEapmQ==
X-Received: by 2002:adf:aa8a:0:b0:242:91e:6a78 with SMTP id h10-20020adfaa8a000000b00242091e6a78mr13457458wrc.34.1670929888081;
        Tue, 13 Dec 2022 03:11:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/24] libnewt: update 0.52.21 -> 0.52.23
Date: Tue, 13 Dec 2022 12:11:02 +0100
Message-Id: <20221213111118.149697-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174517

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
2.30.2


