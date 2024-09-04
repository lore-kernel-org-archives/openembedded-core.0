Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B785CD4F25
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 20:11:30 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.60250.1725480689101446626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 13:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=erN7/mOB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-374b5f27cf2so3450108f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 13:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725480687; x=1726085487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DeTnEexGR+iRgmNjDxBYqogRGtTfyGXwY8wdzvbwETE=;
        b=erN7/mOB9P0zDGGoPhb3UNldaWRwGSnr9oXJ/+6+LCvBGg6ls3zYrc4EnegSMnF6bE
         nQ9YNcVOB+4IcOcvRs44zMOzYQDrLnUofwfCMMeTcpyWWl7wCoiZw9l5sSofbPk7G2qo
         bdfY3cIZnssAEBhGBwxEWcEVGb8OmMYdttz4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725480687; x=1726085487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DeTnEexGR+iRgmNjDxBYqogRGtTfyGXwY8wdzvbwETE=;
        b=NDf8fk6q3K0p+VmcWPmB1/N0NTy7LOLtP7nf4/aMUslJafMBl/gQ8xxiP5DEjgG/Mz
         H7b9Kq1dbY4LZ+Mk11UTDDgeZ0gAKm4dm4sil4/fi2F7PbtL6mrAox0oCP+0toI2sNxS
         02qN257CPMCgi6aBG7BpjWvDxYjmdGL1KKczZA+oACTz7DvjUTgybhqS0GqWRjbTD5mI
         K+IIpvjBZfcWPGsgMvaVIUN7YPslrXQVlV2MSM8z13UwvXfBBK+3obebnIKGAL31w2cl
         vB6n7ebQspyaTaaj82xtx+N65k5j1tOJYppPbqErYYoiuWJ8CjErpGWTfzpTH1rdilbl
         /5qg==
X-Gm-Message-State: AOJu0YzSWr14WrPT/7VwnsV8IjWZrDIgko2U8yChDSRirrqqxQrQGdfI
	iTsJtj31qkO4bXKZVIjiM1Jw359vyaJxuJxQ7rJ/3fp/lFbR0nr7F2uwy0UB1tTR4Fw2E0S5e3T
	z
X-Google-Smtp-Source: AGHT+IFNe83KfVTgCsrDiLMqIxErq3tJLau8fv1dCaV8X2TmTP5OlYESJU8rRe/cR2RuSoQX8DB/vw==
X-Received: by 2002:a05:6000:1f82:b0:376:df1f:1245 with SMTP id ffacd0b85a97d-376df1f1562mr4177131f8f.39.1725480686948;
        Wed, 04 Sep 2024 13:11:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:546b:bbd:261c:b907])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efb37efsm17722969f8f.109.2024.09.04.13.11.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 13:11:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: 2.6.2 -> 2.6.3
Date: Wed,  4 Sep 2024 21:11:24 +0100
Message-ID: <20240904201124.1176125-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 20:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204211

Includes fixes for CVE-2024-45490, CVE-2024-45491 and CVE-2024-45492.

https://blog.hartwork.org/posts/expat-2-6-3-released/

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/expat/{expat_2.6.2.bb => expat_2.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.6.2.bb => expat_2.6.3.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.6.2.bb b/meta/recipes-core/expat/expat_2.6.3.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.6.2.bb
rename to meta/recipes-core/expat/expat_2.6.3.bb
index 6c9db91bef5..5ae694a0041 100644
--- a/meta/recipes-core/expat/expat_2.6.2.bb
+++ b/meta/recipes-core/expat/expat_2.6.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "9c7c1b5dcbc3c237c500a8fb1493e14d9582146dd9b42aa8d3ffb856a3b927e0"
+SRC_URI[sha256sum] = "b8baef92f328eebcf731f4d18103951c61fa8c8ec21d5ff4202fb6f2198aeb2d"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 

