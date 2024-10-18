Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66E2D3F2BE
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 22:08:44 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.33716.1729289314730810693
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 15:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qb9uREP6;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e5f533e1c2so1244103b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 15:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729289313; x=1729894113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8CBUtINDV8YtRa/B+xKCLhcLleDI03OplEkc3TtxAo=;
        b=Qb9uREP6I+8hCI7g3SoMqdVSMlVi2xbAfjZ7PQ6PbIamnbIvlgTpDZw8kTAvlXyA4H
         qNp/3o9SzjDI11eZ+Cytw0cyxvcopduUD33qh+bAF31MxMMWf8hxDsaX42l62wpvYy+Y
         r8w6BvY4UbKVWmzY4yD4xEM154+hLtdTD/vey5voEPseRTxsDONZHHF5WsuUemId4vaM
         NGXYZNX9flbcrHedb+yd73PvIgeBAlnvlM8d7fSkYW1e3q1FOsfuucB7V2MZCdeDxeH6
         GDO9xlF0jbYJFWlG5g4BijVifK3ySu10SaCJSoNxztic2Y3pFE1oKEABygZwatgwgSrr
         +J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729289313; x=1729894113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8CBUtINDV8YtRa/B+xKCLhcLleDI03OplEkc3TtxAo=;
        b=rnMKzGVscYEvrnoQhML3uZhJTQvhcOhkSKtpPF5gkdGNo6FcPelJ04mk+gNSfRPhxo
         +gvbr7WO7HQs74PhL1dNZBaIRSdrO9ltXJSYrWDlcNr4/cWNuQf3wCpJDsc+qWd97+pe
         u/309dz6smhqFiO4+KMJ2OJLxmllecwo4sZADcErc3UsP8s2oRIqrdYIzd4bPV5dEmY/
         jvrzBBu7jhCQVb6eqreYJ+4zpQMMJQfcYbM3M7BqMUq+nV7XZA0Y6gDmUiBCLrqTJr+b
         OdR0c25I0Abfpn/7vlU763zRfOjSP9J5whIfJkKNX1wh7dcRsrtbmNY/XJnWwyT77QW3
         dKlQ==
X-Gm-Message-State: AOJu0YzY4n6jyG1FYP4p5LpreGVIrIwV5993FVFnM3uovWjAgnkKLyTm
	U7YMLdbPXyugolZpMDdbRrGa4TRfZH6C4GDo7d72azJYpNAwxVwajJW1KQ==
X-Google-Smtp-Source: AGHT+IGMk5jX4KFAk8Mi/dd+Dd+8jlbDCVid7CojWgUHAZ3pLR/su/0Yi6IyTqitm3ojcwJpEuCzSQ==
X-Received: by 2002:a05:6808:bd5:b0:3e6:264:2988 with SMTP id 5614622812f47-3e602d8c1d2mr3992516b6e.35.1729289313478;
        Fri, 18 Oct 2024 15:08:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::9a72])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e6029b7874sm554446b6e.8.2024.10.18.15.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 15:08:31 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 4/4] lib: package: Copy locale license
Date: Fri, 18 Oct 2024 15:59:05 -0600
Message-ID: <20241018220818.4042304-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241018220818.4042304-1-JPEWhacker@gmail.com>
References: <20241018220818.4042304-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 22:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206077

When creating split locales, copy the license from LICENSE:${PN}-locale
if set, otherwise leave it unspecified (which will result in falling
back to LICENSE)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/package.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 37fbfe355cb..be8bffbd37b 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -663,6 +663,8 @@ def split_locales(d):
     except ValueError:
         locale_index = len(packages)
 
+    lic = d.getVar("LICENSE:" + pn + "-locale")
+
     localepaths = []
     locales = set()
     for localepath in (d.getVar('LOCALE_PATHS') or "").split():
@@ -700,6 +702,8 @@ def split_locales(d):
         d.setVar('RPROVIDES:' + pkg, '%s-locale %s%s-translation' % (pn, mlprefix, ln))
         d.setVar('SUMMARY:' + pkg, '%s - %s translations' % (summary, l))
         d.setVar('DESCRIPTION:' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l))
+        if lic:
+            d.setVar('LICENSE:' + pkg, lic)
         if locale_section:
             d.setVar('SECTION:' + pkg, locale_section)
 
-- 
2.46.2


