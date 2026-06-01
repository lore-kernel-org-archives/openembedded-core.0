Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D667CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 18:13:01 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5853.1780337579368932694
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 11:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H1izxsfU;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-69d5730c579so6235269eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 11:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780337578; x=1780942378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9O/5P//IE/L8s17gVTyHZAFQHOUREm4AUOlPwTPSQI=;
        b=H1izxsfUpifCpB5JklioEVPzHFPEzlKhTXqc9LinO2TGQ62Evq2SgoSjCLpyK2fPaA
         wBOWRI56/h2PGCjJyN8gnCCaA4bCpF1fcgTZRxIrmeLNsqQqqVdYe04vnhwqsYxAHYY4
         tziUULxBRikdE/Rh7/YPQYHX8Oue707O8SMLa4aby3pdn43sWZ1l8POYQlvuYHchHFsO
         frHZewFQdbr2K8dvMIgn4rX1LZrOTy7z7ueFeZiO2C3Q22WPjRlwEIfkT/EYS2wEtRTw
         MMapNQF1JedMxsvuxNwwbaGpTuxXBBzpU4u9sKuNzwXMgZu5z/oawwe+3Bk9TduYAc3L
         tUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780337578; x=1780942378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C9O/5P//IE/L8s17gVTyHZAFQHOUREm4AUOlPwTPSQI=;
        b=bPohGaVI0cNiBYSTuA6vEUzt3DPmU6gu02ZfnVTovIeF40WENI+NfBMoccDcQRxeXy
         A338sZfNeyJJy+CI+za8XZXolTl9L5+BNh/vAgxYelUY+sOJdwL6OB27MLswpQOeuGo2
         Kbj1OGgI7JNvxwzCQIU2eVdnoZe5vjrP94BWVtOXQNOoSELUxDPGx0liB6VKE3JAUius
         rDb3kGXiLQ9WptSTAX9RRSvKxkqcKd3ekHswXSRVFyEMG4RzVxCz1Udn+yveWwR0z8Oz
         sQRgPbr2jwi1wH2QANZ8C03ODO1cQOedGCFl23OmlI7yX5jeX6cZ+AiqtoBb9HwCD3oR
         Odww==
X-Gm-Message-State: AOJu0YxpgIDt7CEGp1sGvkXh17E7XFFN2QrZXTR4HH4WwPlvva6bvxDE
	oeR4frMb4nUFyuSBc0cAsbQZwNS8H/ufO65nbjsYMoWs+PBC7QHTNRca7X2YrA==
X-Gm-Gg: Acq92OFUXuA1AvrtIVFCrWb+tEjMADgytb9YEFgYWM3qRLgOYi0UKs6vYbB3ATTKDwW
	bZ3uEIntj9OWrMrARCLsFIgyhVqvdG76OSCqj4HsqB1ngp5ZppRRxxWIGu/d4Gmd5gY42fiCP4j
	qPvm1MFmzXMuHWCxam4Zj5yOb7h1rK6ZwWeZDW/dOyv3hKwxWyEomfDnBt6n+XTEVd3UmKXSvhi
	5lPi7V6YhoaNHKipWUtUsUIkRWJroMKA30/88j6iUUZTzIqneMEbM/FhdRwdTvEnYuGx9wqXhsV
	c7WG83JuFcpDqrDneQ+Uxtzjct2DirsZ1gv4X2lBOQU5w69ORVfimqlhGk+N0x4yhW9K8Dnv3vw
	nnNmKQQBrJbKiO691rsgXC55cMBu4uKT5fzTA7j+EVTAF2jTgRnPzaeBtV807xk3zHXr4ejluHY
	1KaqhjsMvY586mXLWIBOCD61DaoCdy7+E=
X-Received: by 2002:a05:6820:1352:b0:694:96b2:9943 with SMTP id 006d021491bc7-69e10361f41mr5577025eaf.37.1780337578553;
        Mon, 01 Jun 2026 11:12:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::399e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e30afb3e6sm860649eaf.3.2026.06.01.11.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:12:58 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 6/8] sqlite3: Use SPDX identifier
Date: Mon,  1 Jun 2026 12:11:41 -0600
Message-ID: <20260601181251.123019-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601181251.123019-1-JPEWhacker@gmail.com>
References: <20260601181251.123019-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 18:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237981

SPDX has a license identifier for the sqlite license ("blessing"), so
use it instead of marking it as Public Domain

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3_3.53.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.0.bb b/meta/recipes-support/sqlite/sqlite3_3.53.0.bb
index 21295bf437..75e08e58b1 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.0.bb
@@ -1,6 +1,6 @@
 require sqlite3.inc
 
-LICENSE = "PD"
+LICENSE = "blessing"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-- 
2.54.0


