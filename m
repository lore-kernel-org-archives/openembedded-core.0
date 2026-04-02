Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D537DCC6B3D
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:55:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17637.1775141709301631062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 07:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fAm1asb7;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adam.blank.g@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so7310645e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775141708; x=1775746508; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKxP2KBhTBqkiLG3TfJAsJYbYU/58IJeFcBRDTeXn4I=;
        b=fAm1asb71vxni98z+aVIferMV+enVnisN5mfxuqkWuOraxGmfljvXogqoAGFE5Nfg6
         21ta24di6BCNhKM3tmB77lB9/7yt9Rh/wlo8p2bQt1hV0EWv1FXCTNLxAYrV8UVinFOp
         1eHormOX8CUYA1Z5ViD585ujSNtXqAAnK1GqOMj+FMi1dwj1sQnRzj6hiFzsKhHgmSOX
         AV96Yc/e1vEn6XcP1onqpcyqyu6XOxMb2IMPe1xiaHJdsahsHSuvCV3dHjTl8pi53/ig
         eMkdLSdX145hpJfNyeHTeFA+GF0nbUgkFCwqsTFh58egc9wsV0PraC295orDYLGIph0E
         +ihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141708; x=1775746508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKxP2KBhTBqkiLG3TfJAsJYbYU/58IJeFcBRDTeXn4I=;
        b=seio158Q5nKgJwwiukvDoNMv25CoiFMD4uWSepmJBWl/mlVz2uSTwpnLwIhZVAUNQe
         Vdy/B2VND95Rowj6M/5H8mWocTqcESyd3b6KJ0g/2d7ndUOz1668mocD7eTWpB980RBR
         7pfy5PPdmfIREy5TOWm8PizrPRfifI4Eq1B9YdT4DUHBud4fiNd3EPHPIvmrl1l06rBr
         odmEiY2bBbg2++PGMwiNvQhDKX6sYu1meT/LBCLoWxNmzTdwhCy8a8OCv2pMvJHoeuTd
         +BbrAm1eWNL8iwVslGjBv6NSwOBKR3oKm9aTrXNuw7Ii5DOndnofIUaieMcyPwB6/XlU
         21NQ==
X-Gm-Message-State: AOJu0Yzlkb6WETq/ZFk9YDa68fQqvGcIuKVJRu1uc5sNu2yfZCuLdtXx
	B9z5GbSs0VXrHI4Y0GhIQ85HO3xwX5rtwletvCz3Eh1WNZ+h9PIlpBq4
X-Gm-Gg: ATEYQzyLwgcv6YaZWP6JxA9g7waYmAnHN9NgQ8M+tgN/nTlDaW1ZdHZCzOjVQfkk3S4
	lXHcRVv8BCSYs2m0D0LokrWOgZyTyIxrR2H9Y9t6VqcgFgNS2hnIE7ar7GRHlGnWAGYRSdP3HAZ
	C9PQrW/H3GhkF4Hwnvrq/7Ce4tE7c3nHQcridzvx4+G3gfsWgVlHzte0XNecUxwac6e9rZ0r6WA
	LoyuWl/3k7m9wIkiSKrJuJhd17IuJo5hUciZLQoqkfYgQxhWXfxUu3iJrIXpuLicNiLHumPDT00
	6tOa1+uWKRyG7UmHnOsshZijLQPmLQ64auFZktOQGu29y1zZTFOtKjCsIoAvnqLICVU2eR8XHuU
	HFKq84qz2ETvyqdMJ1YTN4gJn0KbCnb+2OXCJpU9rzAHl4Tp5cRo9TS2oyG4+m0mfGefHVFePql
	WZiIML57EifsLdLIMJUeZ00uOAUoI8yA==
X-Received: by 2002:a05:600c:890c:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-4888e0990c5mr36254815e9.9.1775141707583;
        Thu, 02 Apr 2026 07:55:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:5efb:8aef:32b2:ddfa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a7162cesm98841235e9.13.2026.04.02.07.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:55:07 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Thu, 02 Apr 2026 16:55:00 +0200
Subject: [PATCH 3/4] sstate: remove dead code and unify path operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dead_code_and_unification-v1-3-5a3906b6340d@gmail.com>
References: <20260402-dead_code_and_unification-v1-0-5a3906b6340d@gmail.com>
In-Reply-To: <20260402-dead_code_and_unification-v1-0-5a3906b6340d@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775141702; l=1577;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=QDDz4JNlsbni79G3POf5sQE/siQUpXvaQnlyDYCk81A=;
 b=jnbWj95DtXUVvd8wIE9MOCc7qglCw6/btZ+J9V6u9CA1phWnEeCa9X+rigmnaKrO4d0R9c58L
 LG6KevJ9zj1CvZEDTtL82cyXocbH9oN3nMb7hGMh79cqunDsgt8m+Qy
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 14:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234535

Most substring replacement operations performed on
'dirs' and 'plaindirs' are implemented in the same
pattern, except two. Unify the implementation.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-global/sstate.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 88449d19c7..6d5ff265c5 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -333,9 +333,9 @@ def sstate_install(ss, d):
     for plain in ss['plaindirs']:
         workdir = d.getVar('WORKDIR')
         sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")
-        src = sstateinst + "/" + plain.replace(workdir, '')
+        src = plain.replace(workdir, sstateinst)
         if sharedworkdir in plain:
-            src = sstateinst + "/" + plain.replace(sharedworkdir, '')
+            src = plain.replace(sharedworkdir, sstateinst)
         dest = plain
         bb.utils.mkdirhier(src)
         prepdir(dest)
@@ -639,7 +639,6 @@ def sstate_package(ss, d):
     for state in ss['dirs']:
         if not os.path.exists(state[1]):
             continue
-        srcbase = state[0].rstrip("/").rsplit('/', 1)[0]
         # Find and error for absolute symlinks. We could attempt to relocate but its not
         # clear where the symlink is relative to in this context. We could add that markup
         # to sstate tasks but there aren't many of these so better just avoid them entirely.

-- 
2.43.0


