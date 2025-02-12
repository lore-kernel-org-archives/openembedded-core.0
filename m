Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A961BC021A2
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 04:35:43 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.8010.1739334942228616236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 20:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RPCjSJAc;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso44006015e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739334940; x=1739939740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYwCLwTXsWcD5PyL2nUUnTMHmh9cW8k7Toz/VlTxjHI=;
        b=RPCjSJAcez5slyi2Ki9lDBXa00KVaL1YzePAwH+zmcddtY1rIon64vvK70wlkVqmPw
         TZ1nSfZ2sprwKJUGWKnmg643igHneIBdf/32fVkMWdJMz6P2KuhxhnbsBS1kK3u0/FlO
         4v4P27l+9FrMknxzcG+dOZdimXEQS2vM/maQgYvwqjxAYRxvw22chefaVswKbDqjD4JX
         uwiSHY04Sa8biEMoCzrHjVeVNZTA65UYl/3Qu+Gr2878JFXbM28uSzxTJE9ILAo2OdjA
         BUftIzx8HgomMGnVokXIxU0E6GE85ZdFAQyqghNZA9mypxlXePxbQGTSVtckLHucOIFh
         p7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739334940; x=1739939740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYwCLwTXsWcD5PyL2nUUnTMHmh9cW8k7Toz/VlTxjHI=;
        b=dVwHt4FpwkSpFNypJRFXfCBL/yNJz5TQdC87suoJLH9FjjogghxjFon4SdTvAJFLdn
         TJOsAxp1rBOqAU+HH98r4/SdTcqUFsEQfbkSEfTXGGzef8bIL0rGYZ7azeoxsO0NdPsg
         6lZNdDbtB9EMvGinqdAkC+6y9ta5rvdjnNzw+ory+RM+G8CmRDoVaCTbkrK5r6axiPzC
         DgigCu1porvfnsyjWUzYjAtzIiRuqyv/3VH/tl7YcWicsj0IaH8z7TIkjPDB2YkW1HxG
         TY/ANDjOwREyaiBqEMvnN6GJxjk3sj033MhBUfWNGacMfp6fsQnP0u3wZ7iDAR3XmLkN
         5E0Q==
X-Gm-Message-State: AOJu0YzLE7q7M6RBBK8MR5Ta/qYivcu7DZ/J25p4zVc33N+2GsHUPRql
	Q8svN3CNitgT0WOWlYYXd0Lsgd5RXABDSJW2mangjk6PBu8asZ78ygVmug==
X-Gm-Gg: ASbGncvyhGHQDJHaVl1K3Klp/TRaTlw/bw6huXZ6Cmpd5hoinWxB/nMciyldDNqIky5
	7Asy0jy7FRrdZB6WU+tdo9R+vZvp/nYbSScy1RfrXd0wfcErM7iHVr4Niq84tMLJt3U2gbmcT6F
	jNeoGuOxqKT52qSLW9IZLHZHSZBvLmJ7P9PJlXKyrVl4q56QYtlcy7U8b0cI/iktmbh6CUQhJiZ
	UZ15Q54g9OVwFwCEJHLQUb34WT4dLTAaF40lZHYmXy7YkeN1pDzZXT3sTkY+g8UFbud+GPkp7ei
	Tw43MNGs4KT3T6PGVW1y6DslkfuPfwTv/CDHktYJvMFHGA==
X-Google-Smtp-Source: AGHT+IGDRZ9+CmNoQOL3s4w81Vmt7LqGY1vo5XS8QDZkQpm9iKXitmoWJ8ObcarBAExaoEO9BJrcRw==
X-Received: by 2002:a5d:6c66:0:b0:38d:d39a:d132 with SMTP id ffacd0b85a97d-38dea28bc52mr1101587f8f.23.1739334940100;
        Tue, 11 Feb 2025 20:35:40 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a070ea7sm7487815e9.25.2025.02.11.20.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 20:35:39 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v12 3/5] rpm: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Wed, 12 Feb 2025 05:35:30 +0100
Message-ID: <20250212043532.1258912-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212043532.1258912-1-zboszor@gmail.com>
References: <20250212043532.1258912-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 04:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211204

Point to the crypto policy file so RPM signing may work.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 45487ad32c..281fde1c82 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -100,6 +100,7 @@ WRAPPER_TOOLS = " \
 do_install:append:class-native() {
         for tool in ${WRAPPER_TOOLS}; do
                 test -x ${D}$tool && create_wrapper ${D}$tool \
+                        SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
                         RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
                         RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
                         MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-- 
2.48.1


