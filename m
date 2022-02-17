Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95F4C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:09:58 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.1770.1645114197806947679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L4dQH/w4;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id p9so8443635ejd.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5yR6xcXN3UJeq47u4csNgjsyR1eUshUmhapNqYypH/s=;
        b=L4dQH/w4fV3KQqFg4SkJUOOQ9yR6P8a247ftdADY000EoK4MJTM9Dmi44mpKtbeWYn
         Uw/YbC9YZ/rDTQknmtFpoJ2QadaX/oMCjreWpg1ahQ3OGzk79S5oKPL8hxvvn24wS5dI
         p9Rm+qL5mk021bgFnMQLM8lDw8blWPbt5GqfyRVyjlP0iYGX5kpONqSiZQnNXlQ+agpF
         J6cF71BpKzxCjiXR+IzIBUY7gRJUVMcmfUdkPE0X9leXwNo+RwwzuNckSva+6NQcb+nz
         iS1q2LPT1gk7rBT9hISgrWfVDcvfpZO0I8Kg09LmDZyn05SdN3bSuHZKexaXIsrb2t0u
         oIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5yR6xcXN3UJeq47u4csNgjsyR1eUshUmhapNqYypH/s=;
        b=uYy3urq/rW1ngRKN/wdM5Uki1uBA3qJbilXH5IerLA8Yr264pEbkf9V+ZI/QAUAk53
         +609Uo7hRhrV/St/1t1eiIH+HeZJeoZqrovouJwme8gRApKG0spNFInNHSvhGLgQ4lvT
         NEdJrFxQ9evopSDv1i0skl5avdRcg5I8FhQrRUA6hJU+TKrQKn0ZD4960yP7RiNlH6X4
         mmcK/ez7AbbfkZri92aBZl/azVBcgGr+5rqz0nuA3uzBVI8DXE80kHaXxdZX04r1MVbv
         IpdhFvkFRDOP5n9k6mXHQL8Ib3DazzU1fAzqirsMeWzga3bwrtCCHHk9PuwvnnlskDKE
         sM5A==
X-Gm-Message-State: AOAM533f57uG9thxIW9PSMqvNjzvW5GedEEj6y4spPRnXW+I7JBYWAXq
	gqZ/UfAbHq9phMMIw/3VNGo4+H9312s=
X-Google-Smtp-Source: 
 ABdhPJytDXZPnfaLScl08PRn6tL1iGArWmS8MLUj9iyw4qkwXGxVFe8ZDwlKVxW2Us2untbX5IzizQ==
X-Received: by 2002:a17:906:5a94:b0:6c5:5aa4:da87 with SMTP id
 l20-20020a1709065a9400b006c55aa4da87mr3022100ejq.381.1645114196306;
        Thu, 17 Feb 2022 08:09:56 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:09:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/28] man-db: update 2.10.0 -> 2.10.1
Date: Thu, 17 Feb 2022 17:09:19 +0100
Message-Id: <20220217160939.1424397-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:09:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161825

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ariable-declaration-to-function-scop.patch | 20 +++++++++----------
 .../{man-db_2.10.0.bb => man-db_2.10.1.bb}    |  6 +-----
 2 files changed, 10 insertions(+), 16 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.10.0.bb => man-db_2.10.1.bb} (93%)

diff --git a/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch b/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch
index 820b17b5de..dc6966629c 100644
--- a/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch
+++ b/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch
@@ -1,4 +1,4 @@
-From 4b5e00ad020ec327cbc934528d02aa8c4fe3910b Mon Sep 17 00:00:00 2001
+From 126dfefb5fddf411ad0a1316209e9c1b47abfcd2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Feb 2022 17:30:16 -0800
 Subject: [PATCH] man: Move local variable declaration to function scope
@@ -10,12 +10,13 @@ code without changing the logic, until its fixed in clang
 
 Upstream-Status: Inappropriate [Inappropriate: Clang bug]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/man.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/man.c b/src/man.c
-index c91abf1..3240eea 100644
+index f16fae8..333df03 100644
 --- a/src/man.c
 +++ b/src/man.c
 @@ -352,7 +352,7 @@ static void init_html_pager (void)
@@ -27,15 +28,12 @@ index c91abf1..3240eea 100644
  	/* Please keep these keys in the same order as in options above. */
  	switch (key) {
  		case 'C':
-@@ -383,7 +383,7 @@ static error_t parse_opt (int key, char *arg, struct argp_state *state)
- 
+@@ -384,7 +384,7 @@ static error_t parse_opt (int key, char *arg, struct argp_state *state)
  		case OPT_WARNINGS:
  #ifdef NROFF_WARNINGS
--			char *s = xstrdup (arg ? arg : default_roff_warnings);
-+			s = xstrdup (arg ? arg : default_roff_warnings);
- 			const char *warning;
+ 			{
+-				char *s = xstrdup
++				s = xstrdup
+ 					(arg ? arg : default_roff_warnings);
+ 				const char *warning;
  
- 			for (warning = strtok (s, ","); warning;
--- 
-2.35.1
-
diff --git a/meta/recipes-extended/man-db/man-db_2.10.0.bb b/meta/recipes-extended/man-db/man-db_2.10.1.bb
similarity index 93%
rename from meta/recipes-extended/man-db/man-db_2.10.0.bb
rename to meta/recipes-extended/man-db/man-db_2.10.1.bb
index a604930198..897f8d8ce0 100644
--- a/meta/recipes-extended/man-db/man-db_2.10.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.10.1.bb
@@ -9,11 +9,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://0001-man-Move-local-variable-declaration-to-function-scop.patch \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[sha256sum] = "0a8629022f7117dc7fc6473c6fdb14913b24b106059bb056abee87dbd6070c79"
-
-# remove at next version upgrade or when output changes
-PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".2"
+SRC_URI[sha256sum] = "2ffd8f2e80122fe72e60c740c851e6a3e15c9a7921185eb4752c1c672824bed6"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS:${PN} += "base-passwd"
-- 
2.20.1


