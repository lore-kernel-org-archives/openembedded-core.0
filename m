Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17760.1795526342190322009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 05:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=IGRp1sMi;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e47347279so2653488f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 05:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795526340; x=1796131140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=es0O+4jf/WYqL/PYtNlTs8RnAYyBCSDXeS24tPZZd2E=;
        b=IGRp1sMiWHxeH7aTx+LRM6i1M8v3dl8qh6wVb+Z21lTY6qx1Co30wUhHAKoPTCU7YQ
         yE39EJKoUP+ZrpxH3sT9aomuhZWmdyVESvwmhEZJkwIiJ+qEVPlroRmYstH2UCjBZi28
         NUKZWuTuSlACQeSXHlsHdknBKAimpaWLL4Tzqq0N8Xmuo7gHzAXKzTusH/kFi2emOaGS
         +xBEHJnZDBEr7tPKlxCvazw+y3bmWNpFJ99CHK7xpRH4XCLB4a4dkmDeZbnUmvGGwR/W
         hreex3WLK+XLR+DuPKr6QtJziKu7P4QUl37ttjzUO4M4mGAUiM1IngCLoi2iVbu9PRKh
         hGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526340; x=1796131140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=es0O+4jf/WYqL/PYtNlTs8RnAYyBCSDXeS24tPZZd2E=;
        b=IJaXctM3GWkhXeJE9gXp7PDgrQ1Em1nFXXEruwxFQISj6Tr2WKAOmgGS2j7rFb0HrJ
         5P1vp/tYSh8oRQwV+0SIombpKh06zbYCDLI3eZY4Z60ci+e3o7FZaKiE9k4VZE1DaQQe
         QB44IfQn+D4XUZYnn1KQZpx+lW38cJiF9YDBxTZpbcEu8CdgIgopGaaTME2GUZ8arOlz
         yZWzQlrLmrZtgPVPiudWuiAtlfVcLQH2u4OFzC7atsW53WTlTpDtKquUi/7qaRwTcUCh
         7EYgb6EFW6nsFNTtRYqwPKCy+rXMqgyqmQaLqVJv9lmffJltgiqd3g7mF5ATgkmKXuXC
         cLJQ==
X-Gm-Message-State: APuU4Z9bW9+EAcH679/liSE+zNC4683nA4pwmWDw1GXVgHSs4VTcIfrX
	UcFAn/yHn9f7H7eZ1kLv4ICGg6pum01lt+y8Ml/neJqVwVIy53+Ep99RSyDdJK7WSEXEW3X3mRX
	W9AeuruI=
X-Gm-Gg: AZFdTZdwSgKCluwkotpcnjOBKfV5CkuIVNRz2kgCctuEFSNYgLwGPg8eKy6wVJ3a0i9
	rjdjf3padapH11bkEh78sEUA+x/Bcz2wwnq5TzootADx0jlpvNoVKm8U4TyPuJy8PUT+LEgAhPI
	fJrESVTI3McPVc6QbwW/B9Ji+a/utnXOlrFtFsvo4mdrCxSQsGDNCeRha6dfbhiNQ46tFucSfZW
	xfIm+2nrPNia5p/8YRYrZqshLmw74QQ47kGMzvNsqGFPP9s8A9SrHbekOCeaOvDeQYA0AX3ckjM
	NTVyLnuBRKON7eVmWniXQVCA/sG21nzgVt0MCeWPXwEfJ2d08BL9mbrrd0n1DmyiDK+3iQlifaN
	kElanaSu/DsTNjc/9wAEJ7RDPE+ky/3/Jf0Bo7x/wSoK0vAp8YNKtNl2ykrfHNbAuo/nQxypdML
	aBMMA3z32xyKkegJ7gEQSzbqP73zDYxtUzQJykBhyDm83qllo5sdTDauFqt5gs+0ZY5YdbCPtSb
	k6yJuE2bOjqi6rvEZS4jLtlgjvQLW9h3jcTCgrGuEfU6xzW8k15gD1hWRNfHRLbfeZZvcFXMYIg
	8KRBld6jWTMSTHyM4rUz31d1r20QtB5MFNkB+MzSHw5FGw/Ttv4sStQvxe3YzGLE9SWt46G/4Wa
	2NeIwCCESzaShvNINQ6ME0rZCw2MZNg==
X-Received: by 2002:adf:e197:0:b0:48e:7a41:d78e with SMTP id ffacd0b85a97d-4abb36787bamr24933402f8f.19.1795526340267;
        Tue, 24 Nov 2026 05:19:00 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm28754029f8f.53.2026.11.24.05.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:18:59 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [blacksail][PATCH] pseudo: Upgrade 1.9.12+git -> 1.9.13
Date: Tue, 24 Nov 2026 14:18:36 +0100
Message-ID: <20261124131836.800875-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251029
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
index 02e86799f7b..cca7c2d11fc 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "e627b0dcb639f387db935fae1f9b93b30cded5e1"
-PV = "1.9.12+git"
+SRCREV = "26afebdaafa416eefa51553fc28d827719c5aed5"
+PV = "1.9.13"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
