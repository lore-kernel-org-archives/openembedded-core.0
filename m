Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17775.1795526368584838163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 05:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=DQFJNI1K;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a42b34e930so3937915f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 05:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795526367; x=1796131167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=es0O+4jf/WYqL/PYtNlTs8RnAYyBCSDXeS24tPZZd2E=;
        b=DQFJNI1K7G6j+3V8RvVac95BfSHUGPtE+JczVlYJmGGPVuaaFp7+P4qQ5YV4+ZV7tp
         PvqNi2HY35rmgf/w8bnWsEM/vpMMWqaxTC2UPnqzsWFLq9/uY3x5LRfWJuh8y64dT/37
         kLDOqnXLAVqU559D0iMlIwCfhv0zR3uLYTn4Rg5W1xjoVPmLDnCK8g6R0z8FN+DIVdyz
         KNcdC6kVNe+Po6a4oqmDaGuOUls4UVD5vICz1UJevwc0owtSQ/eDATD8f0tHwoHvzC71
         F1Gn7pPtaqNcr/2bi3idcJookSDQi9sMpjiBQ6Tc1sEgJSsyKAl+vbcYiufSlWWIVFq2
         1ItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526367; x=1796131167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=es0O+4jf/WYqL/PYtNlTs8RnAYyBCSDXeS24tPZZd2E=;
        b=QbEz2jlsiV/SggdnCLzK5U6ewnwVwVMMZLxj79Z/RG+2epgLY63f3b420QFP3XfTBo
         DUJXRDsOOj03SFrNjdlDROHZv6qJ+BPtVhEcQXo5lGPprPCM1qa2BMnjKivrvGbQvUcB
         UYFhlJM73pHOxSVuevMQwEdHGYvW1Y8Z/ulrAL7L/dezm0xxfU5omPSPSFGZTN9QBMMZ
         anuOF+XClyFTZzaMJItbuMM3AJUCryYHnyzjQZpgv1abNyl/ZGOzUVUAfiFS5wkcAZqX
         6PM0SR+kezxxYHa9lD75A7Z1Aazugdf6ravZlb5jGpRcxWM26+yhA3nDm4DC8S+QmGvn
         EUGA==
X-Gm-Message-State: APuU4Z+IRyiFfwQi66OImzjYw52ov+dBS/y6DF8Ys/daAijaWm0khPmB
	nXY/PwkY56eoe9PzR4eseparFnRVLo3slexWGmz/6dh+wd9iEmx7qandozCjuMpx6xRAngePQ9X
	reUf/pfM=
X-Gm-Gg: AZFdTZdjKF24Zs94YIYKII4hTqlN9XWLRMIjBiz4cGqU8t7tnRg98MU6AYrYCelUiEG
	GwhD1VMA5d2m2BYLAEEOrxsnkci+k9tri1OfnLIF2Z0Po4pDjOlCiWeleu3DCyX0NNN0/P4IakV
	PjL+qJLBZbxPcxYDa+/04b87tMKOL5CEwd/+9bSYfnBDuw043dfPNv6FhQ+S4JgUl9ni1zp7cJs
	LcFBE9myEiWdBNumcvqJtlGZjYDd2yXw5SFgZi+1OJg4fbJ5otVEgNEa2C50dhaoBVQHGqN57RJ
	Kyx8+ubIBpF7ASl9r+mBoQGvFffeEhWkMgap13tcdbQJfeIcXGcNvJW6rSOoJWfwmOgNidIbNsz
	8u/LUPBAEQmFs0Khy/Goos3nfQ/P47U0fjK0F5GLVHuqQf+a+dpYcBdlGoGjZov7BAotHeK0+Ow
	VmhEOknc6eXIQW1X0pbonhSQO3xlUVMsRR0xtKc9QwaOkt4IJTDeB6qp9PbAaw1bBVnw2UloxW7
	Jz4XwsI/myDf2kNWEBSPnWAA2GIX27ItPSYX0Sb8M1SXs2N2lOhTdv7xpd9aMaS59sC7dfC/wwn
	8MlPeWyMH1eITD4v03AjFFlfvMqxhSCof3tjZ/mZkTbtbOGCNBSWN8s6QKe4habNhEgoyPdgI44
	/TjJ1sS+M5zXKYOycTcQJB7St+D6u
X-Received: by 2002:a5d:64e5:0:b0:4a4:f208:6a37 with SMTP id ffacd0b85a97d-4abb4e642fdmr28154277f8f.42.1795526366745;
        Tue, 24 Nov 2026 05:19:26 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm28085970f8f.50.2026.11.24.05.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:19:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [wrynose][PATCH] pseudo: Upgrade 1.9.12+git -> 1.9.13
Date: Tue, 24 Nov 2026 14:19:22 +0100
Message-ID: <20261124131922.803547-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 13:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251030
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
