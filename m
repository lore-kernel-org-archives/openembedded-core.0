Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F4CC5320E
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:08 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.71671.1724736247507774239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KsMlMY6w;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c09fd20eddso2115670a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736246; x=1725341046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5nsklMNjpyZUATxHZUc76XBlD8VrTsSuVjD76PcfWc=;
        b=KsMlMY6wq2YXeE4jvX33+jsSsYlSOPPSBmuf7TtYU5nuf8HxqlblArpjfxOjeVO9G7
         FOVZOwHJ9AoRkBm58w50h3CCpSxtGyohS7WTb/RMefyb3/Scwez82Vm/7dwle5T2cfjD
         LGRQ4bTnbd2z46SqY9pNphCf5UqPfsPAIqQXhHzD6yReJScqwy8utMJdX7SC76Yon8d9
         dqh9pBw6zypADg7QXvvfD/H/jk6fW6AxGejftznEzll0+f0IfebvJjc/szw2odFqsOge
         7mIAZWG23X9Fc/beH70rtVuVwraLL4RvzQJT/nuVd9d35TOqdDe41VeeKW6d+hK42PLc
         zu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736246; x=1725341046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5nsklMNjpyZUATxHZUc76XBlD8VrTsSuVjD76PcfWc=;
        b=tlXyqG5WdJlFBjx0UQ+n5uplQKpU+HpxQCSiMOhAAJI60W1RzdIAOk1ddISExxXeTX
         2Eg5TBDEKD0RXhvMD1vTKmHG4cHle+bEm3vDnUUnbavZ7ZTeQV3kFcOM0OmQ3zN7vH5H
         F5JqMDp+5oX1kXKhryIyyI5YuN8wI0cptbuNvv6/KZTuMxAQgkbbHlt/x/IimrBgJfFc
         5BH5GSKuor74liJgr9sDqJhw8aQ8/Ey+empMun1/SfZG+b8o1IQEnUvKcbVSaaSePC7P
         Rsf9kr71EfxR32kT9EhyRdgMHjjpQS2RQgwE65X3/YJ0677znIzux1POYne7uesbMDBH
         p0mg==
X-Gm-Message-State: AOJu0YxpU6LXVNhNpOA/QBe8QOC9zpHrhcXL8wV1jiXa5ofiLCVKALx6
	R954lgWnET2V8AS2L0GsDqfnCqPE09q6D3jwgKJ8wNR8iDd5jgnYyycDfw==
X-Google-Smtp-Source: AGHT+IHZ2l9DZMuXnkiQhQskH6VjnZG8Vmbl1Q1bJMwXHHaa1PjZHy/0CpnUpJ7gcOW6jwKQRJ9UQA==
X-Received: by 2002:a17:907:2cc6:b0:a86:7021:1368 with SMTP id a640c23a62f3a-a86e39dc9b2mr125813766b.21.1724736245565;
        Mon, 26 Aug 2024 22:24:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/34] python3-pyopenssl: update 24.1.0 -> 24.2.1
Date: Tue, 27 Aug 2024 07:23:34 +0200
Message-Id: <20240827052354.1319810-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203790

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-pyopenssl_24.1.0.bb => python3-pyopenssl_24.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_24.1.0.bb => python3-pyopenssl_24.2.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_24.2.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_24.2.1.bb
index 9ef3145bf86..d9ccd553a19 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.2.1.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "cabed4bfaa5df9f1a16c0ef64a0cb65318b5cd077a7eda7d6970131ca2f41a6f"
+SRC_URI[sha256sum] = "4247f0dbe3748d560dcbb2ff3ea01af0f9a1a001ef5f7c4c647956ed8cbf0e95"
+UPSTREAM_CHECK_PYPI_PACKAGE = "pyOpenSSL"
 
-PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
 
 PACKAGES =+ "${PN}-tests"
-- 
2.39.2


