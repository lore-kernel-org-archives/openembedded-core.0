Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9533FC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 01:34:49 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.4416.1644456889030294979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 17:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T4/1ZNYX;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id w20so490373plq.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 17:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HrwWCplIDXP2zr8TB7f7xgck8rKYXRR0uY+TzG3+nM8=;
        b=T4/1ZNYXli9kn5Yo7EBTzkto5cKVvbEAl2ZHOstBL2fEon77K+FASQd3yKkq7uTGFl
         rcr/80Z4gUyQVZs4DeXKa5gE4b7Tm55gSUrm0Cie5Eh+Z1SSNgWdagmG5UxXR0/xRdHp
         RUU5LamiJT4v1C814clpJtLgJycdaShBNptykcg5NoyEuD8fre54R5xktIRd2Rv8yDO/
         cu17xzrap6qomFzspNUWdz6Uz3udzbNF8utL6YWiO2Utfk36AkH3T78BBwaTtld1LZjp
         VQLpBfcUXMl65CvYWsft0TyK4/BAcEbXa4kAAu5RUtWWvqDlYGhOmi4z/KLlXFG3PVNV
         8L6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HrwWCplIDXP2zr8TB7f7xgck8rKYXRR0uY+TzG3+nM8=;
        b=tTMlwCk2TWuHRIL0laKmGS8cEGJWTH9nseXmQgD51PppGP9V86pdNzX2Gtb58oLS2a
         ZBXv4Aig9CxrkCG/8jF2xMbXa96fm0IkMngMrXO+2Mm3Bf7dL1Em7MPI2++NcKpIcxNX
         t1AvNXcU9klvQse+GBZuzNeTtASWpo6PD0KlrfdVTvjNRVz5P7ciKZxC9QPwGVZZdauC
         1csw0zHliFiEkFLQpYlct6N/ghYKhYloToCDmceluamA0kQ1JbCeFXbWc1INkHdvvOQP
         xCVdLOh8JrRkHlNtoazrQ2+ml77YEiW9I3rLqej9GePKAnQvoJw5LabWBBVzrJlxoLaw
         jBJw==
X-Gm-Message-State: AOAM530BD54NBv6LpPKf/nKfAaIX3fDhiFcqNjnKPeUnooGsTkd4zF+G
	wFMqMAaejmo02+Cm7PIBfIIqRZsiGe6C3w==
X-Google-Smtp-Source: 
 ABdhPJwnQ0L7qGG/LGORUyAVhsEt27zFSXhptZFFXzr4wewMzEUrmqx2btRHoOtrw9U8YWhTzUr5zA==
X-Received: by 2002:a17:90b:4b83:: with SMTP id
 lr3mr175249pjb.135.1644456887856;
        Wed, 09 Feb 2022 17:34:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id pi1sm65875pjb.10.2022.02.09.17.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 17:34:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] man-db: Fix build with clang
Date: Wed,  9 Feb 2022 17:34:44 -0800
Message-Id: <20220210013444.2688705-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 01:34:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161597

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ariable-declaration-to-function-scop.patch | 41 +++++++++++++++++++
 meta/recipes-extended/man-db/man-db_2.10.0.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch

diff --git a/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch b/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch
new file mode 100644
index 00000000000..820b17b5de6
--- /dev/null
+++ b/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch
@@ -0,0 +1,41 @@
+From 4b5e00ad020ec327cbc934528d02aa8c4fe3910b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Feb 2022 17:30:16 -0800
+Subject: [PATCH] man: Move local variable declaration to function scope
+
+There is a clang bug [1] unearthed here, so help clang by re-arranging
+code without changing the logic, until its fixed in clang
+
+[1] https://github.com/llvm/llvm-project/issues/53692
+
+Upstream-Status: Inappropriate [Inappropriate: Clang bug]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/man.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/man.c b/src/man.c
+index c91abf1..3240eea 100644
+--- a/src/man.c
++++ b/src/man.c
+@@ -352,7 +352,7 @@ static void init_html_pager (void)
+ static error_t parse_opt (int key, char *arg, struct argp_state *state)
+ {
+ 	static bool apropos, whatis; /* retain values between calls */
+-
++	char *s;
+ 	/* Please keep these keys in the same order as in options above. */
+ 	switch (key) {
+ 		case 'C':
+@@ -383,7 +383,7 @@ static error_t parse_opt (int key, char *arg, struct argp_state *state)
+ 
+ 		case OPT_WARNINGS:
+ #ifdef NROFF_WARNINGS
+-			char *s = xstrdup (arg ? arg : default_roff_warnings);
++			s = xstrdup (arg ? arg : default_roff_warnings);
+ 			const char *warning;
+ 
+ 			for (warning = strtok (s, ","); warning;
+-- 
+2.35.1
+
diff --git a/meta/recipes-extended/man-db/man-db_2.10.0.bb b/meta/recipes-extended/man-db/man-db_2.10.0.bb
index 6a8ac2e3e34..a604930198e 100644
--- a/meta/recipes-extended/man-db/man-db_2.10.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.10.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
+           file://0001-man-Move-local-variable-declaration-to-function-scop.patch \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
 SRC_URI[sha256sum] = "0a8629022f7117dc7fc6473c6fdb14913b24b106059bb056abee87dbd6070c79"
 
-- 
2.35.1


