Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17780.1795526385512960706
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 05:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=RGeIsZaU;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49412eb1474so2905760f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 05:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795526384; x=1796131184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PoOx5PhDsGyJM01PapcjnnoX8xbd0kq/+9JOuocsLgE=;
        b=RGeIsZaUOTzBuOAu2EMD8IGQVS+fmnn7/uotXmF2vI3ilWaN1uFtOhUJpW4XMjSuWn
         IDn9MOP3djROmOsMr3qFrMESHrAo5RDHRgpfq2ZOPN7YqC9vxu7RTkYvKFFpNC8PdQqC
         8z/g4shF+Y8wy9AKvR8MmeinrGbpzEOPQC/nTO4jGhrz9KwZ0KdZAfnNFRZbFq++WEkQ
         fx0519T1OY1GCe51lT821WWPMQUWDhwI3XE63uFDOCC8vscdIdMZrTe2bOo5MJs15+Fk
         ldP8TMSZVHb8GokoRAtLglBGt6uOnqjFGvyjJE6oIBV9flAM7qNCfgKLYHP5qmfG4Gdu
         Qhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526384; x=1796131184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PoOx5PhDsGyJM01PapcjnnoX8xbd0kq/+9JOuocsLgE=;
        b=NmbVJH5GlR5fke62FVO0hGtXcbQWbFPIrYZQG/Ro4qCzvTPXYaKqb7XRMyGBiV3yxR
         82djICjUbpEFR587srgnviVjR8YmGDUMGL8nHgH8tzKAz61zAEWHrWm8/BXCrBloeznu
         RzeAoqFqc4Hhq1tC4YUc9KXgZOkki5dzTkHVR/UjFCEM7qm+9mDuFsxEIJz6kM2qakOG
         39WTXqZbm4+2AjA2bWRDxGK6Q2X+fdC0ajv1irF23mSGpgLxh8TefFL56eFbOCrghUDx
         MMUyk/Fkaforck7FwDR+4Ckz0uSlBQnBHNPNrNvE9gILCal0JC9rpuqAN3JUOyLAQtWl
         fB1A==
X-Gm-Message-State: APuU4Z/TbDw0AscGWNK6dUqw+cpRMUUqIOWZ1RFvM846NeJ+mQnzzOo2
	j3zBn9HzZ+xSFjiRmiv5mmc8cYGp6aRrerQNPmpvAEW1J6THYI+AgkQ2RH28lzRb++Z7jwVCdLw
	CYHoyi5g=
X-Gm-Gg: AZFdTZfTz4ZcdheRW1YnI5fdtge4v6vD6dt6SDEVExeb1hL5g7Opmu2UQQR4NzYjoL2
	wrFENMRd+sX9DJdqD6Vp6roCqJNJJ8cIytMNAtTVF7cc/ll+HAFOd1z5h+4YkAr/h/lrb1Xnx3a
	mH2Ej5AESvf3T/aCusDJgRCEg/8XONGdXijj2S3xSi+t4YeUgcVA1Ttq0TIPjIjHDKuJQfLmK/P
	V0AL2rIz0zi5RsAKOQ9LBbtrYBeSBPMeUcNDw8AaS79lgz1N/qpCUj4HqybRHoXlnH+hVuwvjtX
	xijfxay4GBtRBo9J7PGsShrtr9RCsk1j8SM4qJuDweLCU+6bJsgFsLD+M11W0BzYy6I7+qrueE+
	JbNLiJJLpr+4OxCKmGk2HsdhGYeeiwcsxCPxkLohSpwTCOZj27VZ1S6QmeEBAV0Jxta7pnaClPz
	AvPJ+5HQrXcNw+nOWs/Iy4Hih9bUTVRL0OMZChd1SEd9t/iFH2XuqP8TbUp9vHBO7N1k6VY0HUM
	a5PxaPFNUwniBILq/xuCm7Kowrpf+i3fyc2Vl6Nai1lmid43p6uiZA1fxA6HAqUA0xyubTDNmpR
	wXe8sdr8DAxobL1/sFa/uoOjZHz+ZsuwKaxIciggEMTX+fVSEUBIbEx8Y1e+V75UvablEffT6ge
	sh3fAPpFpB7AzAfwgb7UoH3C5Ih3ldeL9eYoyozjCZBnCtsNeMms=
X-Received: by 2002:adf:e009:0:10b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-4abb4c7ab68mr19871985f8f.26.1795526383732;
        Tue, 24 Nov 2026 05:19:43 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm25722749f8f.23.2026.11.24.05.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:19:43 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [scarthgap][PATCH] pseudo: Upgrade 1.9.12+git -> 1.9.13
Date: Tue, 24 Nov 2026 14:19:41 +0100
Message-ID: <20261124131941.804698-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 13:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251031
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

Changelog[0]:
* test: Skip open_tree tests when the function or syscall is unavailable
* makewrappers: Don't generate unused _int paths with noignore_path
* ports/linux: Don't require <linux/mount.h>
* configure: Require GCC 5 or later
* pseudo_client: serialize path changes across clients
* ports: hold the path lock in create and metadata wrappers
* ports: check created files under the path lock before recording them
* test-parallel-ops: Add a parallel create/rename/link/chmod test
* README.security: Add information specific to file/process security
* AGENTS.md: Add to assist future developers
* Declare 1.9.13 version

[0]: https://git.yoctoproject.org/pseudo/log/?qt=range&q=e627b0dcb639f387db935fae1f9b93b30cded5e1..pseudo-1.9.13

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch | 4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb                   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
index f42b32b8d9e..1540ac78e1a 100644
--- a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
+++ b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
@@ -25,7 +25,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 diff --git a/Makefile.in b/Makefile.in
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -120,7 +120,7 @@ $(PSEUDODB): pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o | $(BIN)
+@@ -123,7 +123,7 @@ $(PSEUDODB): pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o | $(BIN)
  libpseudo: $(LIBPSEUDO)
  
  $(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o $(SHOBJS) | $(LIB)
@@ -37,7 +37,7 @@ diff --git a/Makefile.in b/Makefile.in
 diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c
 --- a/pseudo_wrappers.c
 +++ b/pseudo_wrappers.c
-@@ -100,10 +100,13 @@ static void libpseudo_atfork_child(void)
+@@ -101,10 +101,13 @@ static void libpseudo_atfork_child(void)
  	pseudo_mutex_holder = 0;
  }
  
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 764f81b6832..74e7424224a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "e627b0dcb639f387db935fae1f9b93b30cded5e1"
+SRCREV = "26afebdaafa416eefa51553fc28d827719c5aed5"
 S = "${WORKDIR}/git"
-PV = "1.9.12+git"
+PV = "1.9.13"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
