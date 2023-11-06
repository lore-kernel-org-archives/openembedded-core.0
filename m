Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB167C0018A
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 16:43:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.59711.1699289025182276571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 08:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ff29BUze;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40806e4106dso28751605e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 08:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699289023; x=1699893823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQWAgVG2OBBa1TX5CczJdBHhTg8KYSIRfXuR/mb+biA=;
        b=Ff29BUzeDvCJBKXWbUraEr9TTQlngm2RwKTt/+M4g5utcCqMDQ7tMkGU70xIFomtpf
         kYCSc2EJJxQCm8ofVqCf3d0l54E8GM5N6hLpBDU8pMhUbC4idlLvKWUCSJm2B0+0m9Bg
         2q3mWiKknApuqM6zwe3l3c8FcuL06OFbjAl/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699289023; x=1699893823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQWAgVG2OBBa1TX5CczJdBHhTg8KYSIRfXuR/mb+biA=;
        b=OwHmL+sdI13gfxLZ9YwogxJw7rCHoEbix7Hz0jy2ylaV1LnwC2uUXESLCJOyg/eqQ+
         zKNiD7uTtmgVF0uK9LxhjAonQF+rVa3dlBbO4A/1LEvHdTDSM6aYCkKsS9weZZsTNQKG
         fE7C0r5p2P+26L5XpXAJWyt/FzIdXapLavjqih0Y9hH9qNGJ6WPg6ULXohV7MnEtKL0g
         Nb41XpJgpJxjDCR30MU56q6SPM6aViR1Zr8kjW5jb6pJ0FHpQf85oJXy1/ZBvd49UxjW
         3sclIIHsUpHXRVIPvm8pwS89L2dbig0pxZ366RlEP352A3O0zutfx42+JUwlIkVT0N1i
         Vv0A==
X-Gm-Message-State: AOJu0YwZ1DrJ+n+uWPcCygoP+0sdHW8MlYvWFjayHfk58p880JsKnQGH
	B3h8oAwLPYg2twMBPc3mQsGEu+dRILIe1AEx5+4=
X-Google-Smtp-Source: AGHT+IHvtwc7pXSedb2jMcLC22pyoh9xZfacXgZa8omtS6s7lyVrSIQz1Kv6SlHFAvZPfRmQIsN4NQ==
X-Received: by 2002:a05:600c:45c6:b0:405:3924:3cad with SMTP id s6-20020a05600c45c600b0040539243cadmr22201wmo.15.1699289023264;
        Mon, 06 Nov 2023 08:43:43 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c4e8600b003fefb94ccc9sm13131383wmq.11.2023.11.06.08.43.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 08:43:42 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] go-vendor: Minor style tweaks
Date: Mon,  6 Nov 2023 16:43:40 +0000
Message-Id: <20231106164340.1213043-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106164340.1213043-1-richard.purdie@linuxfoundation.org>
References: <20231106164340.1213043-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 16:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190237

Drop a len() usage that isn't needed, drop a comment that isn't needed
and use bb.fatal() to end the task with an error.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/go-vendor.bbclass | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 5b017b0b9da..2426bddfba4 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -41,9 +41,6 @@ def go_src_uri(repo, version, path=None, subdir=None, \
     return src_uri
 
 python do_vendor_unlink() {
-
-    # We unlink
-
     go_import = d.getVar('GO_IMPORT')
     source_dir = d.getVar('S')
     linkname = os.path.join(source_dir, *['src', go_import, 'vendor'])
@@ -58,9 +55,8 @@ python do_go_vendor() {
 
     src_uri = (d.getVar('SRC_URI') or "").split()
 
-    if len(src_uri) == 0:
-        bb.error("SRC_URI is empty")
-        return
+    if not src_uri:
+        bb.fatal("SRC_URI is empty")
 
     default_destsuffix = "git/src/import/vendor.fetch"
     fetcher = bb.fetch2.Fetch(src_uri, d)
-- 
2.39.2


