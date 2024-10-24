Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D63BD0BB60
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 19:04:53 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.4519.1729796692563971199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 12:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hUA4cEwb;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-718123ec383so774270a34.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 12:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729796691; x=1730401491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETxevPVTLduaxM7LLWbBc/qT/NppgDV48+k3Q2d/w9g=;
        b=hUA4cEwbDEuKDvMQVYbWFzh9BOR+vsdTFs8+T7gi0rhNfsGkuUahNpBsNvUXHBA4yg
         j2RYo2hGf7aL/wcjYQKbuqfRREJcosIFTw/49CgQRSnG4VD7bvMg9mF5X0cAd1ycAn3c
         aUeiKscRz6lfk+Kqrt9kNXmqFL8M38ESBqvulEbaF/SDWHlxMh0wQvlKFdfDXkPOhVpb
         8VVRELD224XMkUERELt3UsQliBpX4MeNVG9ivIeuc7QZpA3okd8CILS/KBGOL5OB7dHm
         k2H5havU3pIrsTFRiBqCSgOq6q5k4MUjgNLxnqE3MwonTantACJB2JA2jODHn54/JPNW
         v3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729796691; x=1730401491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETxevPVTLduaxM7LLWbBc/qT/NppgDV48+k3Q2d/w9g=;
        b=xOKTwZA5yLOuIYg1wjhThO1NX3tyxyJSwWKzdQQQcEBzjpVortFIIxvg7oGImAGtga
         Bzk8MFkzhFqcpzfmU7szL11HpAfqoRLH0P+eyILKvJGZsYXjhoZL+cEVaB5I8z1eKxSR
         Zc1fXMYN7lmsIFY32gGLL9RcZQ/iLg1sZ1HM7qLO5DFwYVVu716cNdaobXxA6FkpZQfW
         M6tqQAGQXQBj7eEnBZswki85xF5CEToQ2IC+oRzX6ljm27NyKpXV8E9pWHy8sgjonXFe
         +xfypUeTLybYXgK4mh2lo8EMe5rOvd2W6SS8Uko12YyXJZo7BuBo6/P+Cen/8DA6lngb
         eutA==
X-Gm-Message-State: AOJu0Yy5JR1X2qNiNOcCElHxsMt9VfWuBdOgryeVlfF46XCp3W1wYyUh
	6Rs+3Kn2W/migNsraTvQr83IuSjeJysdBA82eHjFUeME1XKCOWnJHE3+jQ==
X-Google-Smtp-Source: AGHT+IGTsmEUgnwJ8NMQbiXx2GGFbIFBklB8L3EqadUCSo0k6EQyfC3LSPSkZOEDkXdfEcLj688etQ==
X-Received: by 2002:a05:6830:6f01:b0:710:f74c:1b2d with SMTP id 46e09a7af769-7184b28856cmr8216836a34.2.1729796691212;
        Thu, 24 Oct 2024 12:04:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4437])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7182ebd5af8sm2233242a34.55.2024.10.24.12.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:04:50 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 4/4] lib: package: Copy locale license
Date: Thu, 24 Oct 2024 13:03:10 -0600
Message-ID: <20241024190438.3630946-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241024190438.3630946-1-JPEWhacker@gmail.com>
References: <20241023212013.995247-1-JPEWhacker@gmail.com>
 <20241024190438.3630946-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 19:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206307

When creating split locales, copy the license from LICENSE:${PN}-locale
if set, otherwise leave it unspecified (which will result in falling
back to LICENSE)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/package.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 104b880b9e1..16359232ecd 100644
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
@@ -698,6 +700,8 @@ def split_locales(d):
         d.setVar('RPROVIDES:' + pkg, '%s-locale %s%s-translation' % (pn, mlprefix, ln))
         d.setVar('SUMMARY:' + pkg, '%s - %s translations' % (summary, l))
         d.setVar('DESCRIPTION:' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l))
+        if lic:
+            d.setVar('LICENSE:' + pkg, lic)
         if locale_section:
             d.setVar('SECTION:' + pkg, locale_section)
 
-- 
2.46.2


