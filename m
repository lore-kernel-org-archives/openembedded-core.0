Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2481FCD8C8F
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:26 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6126.1780698857138746666
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OqT/hpMH;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso19684005e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698855; x=1781303655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEv8NpQ/qwibSsYTKBX0Nvv3xvFl4LCRtXEk9djm7G4=;
        b=OqT/hpMHd6dvhXwoIYtRuECoc+PsKl92qPZXM6SSDmkOuQmk43w5Rii/b0vlagHDCL
         3yHKLv7HpyZYuCeYkTsci3t4RVcJh1cxLwJfGQmJ66UlDXo7I7UQ51PCKD1eRXZm/eB3
         zJkv0izWOOA3i8+y/OzxCOms7tSuOojRU33ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698855; x=1781303655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oEv8NpQ/qwibSsYTKBX0Nvv3xvFl4LCRtXEk9djm7G4=;
        b=VSqVAahVyZuucH6axKDIy2XlmNzufLOK7rKfBrnMqjufiXvrvE6Uad7QsWEGTdt6PI
         nzdMYPryz/TVHL2SH7pjx/siKE39JojZBwZVjwxhnmQxLRlmjs2E0kOPLSQ/TsoVIDdY
         otWEqkC6T/Qqhg6YOEHqED1i5ufoaWjxXMyC8waM5443MXRwDhGsWS5oYCB9s1LwipuR
         rNBv0D9ZN7ivTl3x/pd8I3uKVF4MIVzKj3NWWLw5YVk21Hozmz7ph+mWlPPaiMrDULWm
         Z5KlOw99zu0GegsmYmIJvNRAGKrS4+abZtGKboRN5rnlT+cGJXYqP8yRu+pRVcKsikVp
         ZxKw==
X-Gm-Message-State: AOJu0YwHD/b3RoqohVlVr3yOfv1S2CyHcUuJAeABPm3IriIkcDAj3lFZ
	ZvfgC9T3ilstVWS6OgUExBCSw8rFc2ZH93vYGhgJFwIo90fQETvzKx11bCQoxqoczJp1cxx3j2I
	xkDjh
X-Gm-Gg: Acq92OEj4TOxlcy64vlHlu5G5pueeDpYQ3czagd+AM5EMSZ/4Ls4wMjJiKrJJQNkCC9
	izK66abxequ7kXrfER1DEgm+BcHgIZ/nVwVQlMsG9Ykky1co4AWx2NSCIVPTKlte4FW6I0l/DU/
	wN1u38qzX+X3tM0vYQfvXFms+6Klr47twb7m1gmRaKf+wx7ZYGryQSJdWapikQK4ssqlwhOC/he
	RfuQeJeyDhxiZ23EuG9xmNAa7upwWuE8NasECnWV8zrUn8/EV1gC2rmC1Rn94AwYFwMcHVjTngQ
	Jm3TElmX3Uj0CEg24EJWLyB0KQEjYylRMSAUBGrHDN13d4RfSf+GkPm0K1DB5iYN7iylbnrSBb3
	uhGRZy4qTfJnLqYuGisCuo78ZsT1CAkE30ByiLgzojO0IXoeK3YjZgCo2c+5pR9+UPdUdoF1rar
	q1kA+Rg2hQplzbwhd49QmchbKZlhF2VgqrmOno9uNbA0/0pZinOjBkiBU8QaQsmAtMAmh4JItHP
	cATFfAxpS+u/flsVpMFbE20R3lnGOu3Ci2QoSQ=
X-Received: by 2002:a05:600c:19d3:b0:490:48df:2793 with SMTP id 5b1f17b1804b1-490c25fa410mr95231455e9.26.1780698855521;
        Fri, 05 Jun 2026 15:34:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/25] systemd: update musl specific patch to apply
Date: Sat,  6 Jun 2026 00:33:49 +0200
Message-ID: <0e66eb22a34e17939cfdaf5cdad84361b7f18e6e.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238191

From: Martin Jansa <martin.jansa@gmail.com>

It doesn't apply after udev-builtin-path_id.c was also updated by
CVE-2026-40225-01.patch in
https://git.openembedded.org/openembedded-core/commit/?h=scarthgap&id=fc2d33dbb2d5180b77c10865156db342f9d582da

causing do_patch failure for scarthgap builds with musl:

Hunk #1 FAILED at 39.
1 out of 1 hunk FAILED -- rejects in file src/udev/udev-builtin-net_id.c
patching file src/udev/udev-builtin-path_id.c
patching file src/udev/udev-event.c
patching file src/udev/udev-rules.c
Patch 0003-src-basic-missing.h-check-for-missing-strndupa.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-musl/work/core2-64-oe-linux-musl/systemd/255.21/temp/log.do_patch.215528
ERROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-core/systemd/systemd_255.21.bb:do_patch) failed with exit code '1'

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0003-src-basic-missing.h-check-for-missing-strndupa.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
index 715a0c7ec83..41db643258b 100644
--- a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -655,10 +655,10 @@ diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_id.c
 index 91b40088f4..f528a46b8e 100644
 --- a/src/udev/udev-builtin-net_id.c
 +++ b/src/udev/udev-builtin-net_id.c
-@@ -39,6 +39,7 @@
- #include "strv.h"
+@@ -40,6 +40,7 @@
  #include "strxcpyx.h"
  #include "udev-builtin.h"
+ #include "utf8.h"
 +#include "missing_stdlib.h"
  
  #define ONBOARD_14BIT_INDEX_MAX ((1U << 14) - 1)

