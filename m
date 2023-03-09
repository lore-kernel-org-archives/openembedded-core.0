Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B6EC7619A
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.16012.1678375206331469382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jbkglZNW;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id j2so2225094wrh.9
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+jeNTTjQOiFloJeBtIXb0IN54IMWRM5+kUC77gkjzU=;
        b=jbkglZNWSipVe6F423NI4Qateu/VCOxsfLMZ5VxgAYvgbBiW872S1l009KNU9pq4iF
         nq8zsxF/xWRYXMI1VMwGsZZbO5K5NeHUMAbyGlh8gx664cYCGbLYeOdEJnDNBC+KOmBh
         iC0cyMhrlcOPXySyQkol8DgRxzcp8RZnZBMx4GkOr5FBnWv/BQRfPJ+fCaY9aamJX+b7
         j1bJZRKnlpB/5gz0nlTl0UuGK2jwxCFcdJXCacMpx5XjSwbodunNG8M+6joa9akF4mOt
         teX/4/2nwXTdq4mCKyXQctC7WhI0GZkg0sGy8WiJixtY1jPYie93FYDbfRa7c6o5wRDU
         Woqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+jeNTTjQOiFloJeBtIXb0IN54IMWRM5+kUC77gkjzU=;
        b=pW/Wn4Qmx/+Z8AO7Ha08Gz/YGkAFDVx9J9J1qiRr95ncs7WghNdkdZIOS6y9XP8jv9
         MtMKH5Wewrt5Rq141BYG/Xvg6aG3hMc6inIqav/Snn0duqZh9CpwgPAiG0xMTEjHAglw
         Dg15q4e9FbWLY0XZX7YYEdMh/4g0hVVXfJZgjG57o53fqrJDU2WFVleHKGWrQ67GZFLH
         7xdvDB+cT0+AE8AZzAHSAAqVWXf3UR2uHjCQqeIMPo8XjSd/00KRjcEnvRYePvLffHU2
         MSvJPW4yM41TIUiv803xSqi29bhsgQGMeMd8JD1qHfR7sgqT6fDERfWaiEQQodC/tT2X
         fhGQ==
X-Gm-Message-State: AO0yUKUT0hYul+gXv1rsuQiRNp7MFCdBLROHGjFflyQUh/bRso82zOHY
	BVdAJEAneV1rWa+S1v9Dai6UR86Jz8E=
X-Google-Smtp-Source: AK7set/UjvkhQIuyJaxaZzCEIEp7/gz8atQpkWYtonHhmwMsjN35hrbUe7ImzjPm99wKjWdGGtcLYg==
X-Received: by 2002:a5d:5253:0:b0:2c5:5d21:7d4c with SMTP id k19-20020a5d5253000000b002c55d217d4cmr14711878wrc.43.1678375211855;
        Thu, 09 Mar 2023 07:20:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/26] libgit2: update 1.5.1 -> 1.6.2
Date: Thu,  9 Mar 2023 16:19:46 +0100
Message-Id: <20230309151958.3619193-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178238

License-Update: added bsd-2-clause due to
https://github.com/libgit2/libgit2/commit/aa1605dd1484cf7350d736c7677c7a9ee6352316

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgit2/{libgit2_1.5.1.bb => libgit2_1.6.2.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.5.1.bb => libgit2_1.6.2.bb} (64%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.5.1.bb b/meta/recipes-support/libgit2/libgit2_1.6.2.bb
similarity index 64%
rename from meta/recipes-support/libgit2/libgit2_1.5.1.bb
rename to meta/recipes-support/libgit2/libgit2_1.6.2.bb
index 59866ce385..25108ed56c 100644
--- a/meta/recipes-support/libgit2/libgit2_1.5.1.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.6.2.bb
@@ -1,12 +1,12 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
-LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=112e6bb421dea73cd41de09e777f2d2c"
+LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5bdf47bbc9a39dc6ce076d59e322dc17"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.5;protocol=https"
-SRCREV = "42e5db98b963ae503229c63e44e06e439df50e56"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https"
+SRCREV = "25ec37379ed07b10c4ecc6143cf6018cabc8f857"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


