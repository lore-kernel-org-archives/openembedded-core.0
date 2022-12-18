Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A866C4708E
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:49 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.32107.1671380007449700902
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=kv9XjbGe;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so10719961pje.5
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPbG6El2UBo6Z7Nf4YQOoSSBZXuUF9oRLLtJboaiEpM=;
        b=kv9XjbGeJBUkKoyH+IwrN48dfM/7XgvODu8h6T9adXNguQGRunCdn8yQkI2VMjxcJz
         SEa2AJn5644FTHakZQaJQEw0ov6dmtLGLg3Sc92Q1utOeZmaEseIuTiq9LghkIKZVJQV
         OEHSkSNyNwp0Qohmn3f5WyfTyxV6fq/sh9xbRlO07SFn4PhmwdreElnAx6LZqyFzjPyC
         2VMtAW7A7ymCAJvXWsfxMZXxVKp6TiyMGpZrk8aY5q2yFGAeUtrWNRLKro3kFzcdvdGF
         ut8PC8cXYbWU9opjFRwSJhW5MuaRiEmblRViuOHzf//0ENKkM8SIs1naUog5wqX9d8h9
         atEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPbG6El2UBo6Z7Nf4YQOoSSBZXuUF9oRLLtJboaiEpM=;
        b=GY55CGVacL3zfDNrCd1SjiSZHtDEsIApuoZRdZckm55CAgDIzPfSLgN6RgjR0FmAhm
         RWUOuSb5fTG+pFGiqz2Dlt/gAkmZKsp0ZYshbAbKohTPPkvUDjEUXeBfnArXBXNxHkuO
         GGamOimirHLoVtUjgSOHUoPFfCWItRC8YI5RmS1j3i45wVjRYqIqmAmn2OxO5ub0CGpw
         wJmQMtwl8FsZ0gj09R5XfPxW7YY3lraD/qKbHtUT6mSFknJQcNRkehbRYF81DnY9gRQt
         1ZicThZ64VdPNs+jsU3o/FoNhDSk5KwmC7QMYRKwarK/ktMwfYX6wmnn/B0t9U0LwXZF
         Ba1w==
X-Gm-Message-State: ANoB5plEjliP70kYfqx1l/90sTYshOtBm+qTo2MZYOBFyTdvjcwU3nc0
	l5WZAOn/IETSORTBaKsvZ31Ln3nLegX47ytOCgQ=
X-Google-Smtp-Source: AA0mqf6OcoaXebtS41RNEQRqcdB2IwZxkTxPqAYf1Cq6eGk9mbUVVrIsnaYwaISTHX1wJN80/TtSbA==
X-Received: by 2002:a17:902:f602:b0:187:4920:3a3c with SMTP id n2-20020a170902f60200b0018749203a3cmr42214117plg.33.1671380023300;
        Sun, 18 Dec 2022 08:13:43 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/19] combo-layer: remove unused import
Date: Sun, 18 Dec 2022 06:12:59 -1000
Message-Id: <240c7dcad2f2e25efa269618c3bd6c549289207e.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174802

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ebfab6c3034d41252d19c6e1a0ba79072aa51146)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/combo-layer | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 045de65642..c122f4b5e4 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -21,7 +21,6 @@ import re
 import copy
 import pipes
 import shutil
-from collections import OrderedDict
 from string import Template
 from functools import reduce
 
-- 
2.25.1


