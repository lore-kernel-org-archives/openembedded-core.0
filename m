Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDD9C3ABCC
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 20:16:47 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.5814.1746735404006134479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 13:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JQza47Bq;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acec5b99052so242960866b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 13:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746735402; x=1747340202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJaWYC/RN1Pl9U+HINWQn65oVTKAG/7GIWm+I5KMbTo=;
        b=JQza47Bqfq6vfGPSSuwW8XiZz1HAAnWQuH6YKySK50ROv4gysdJbu9ivbBh+khu6U3
         yTbYWyiu+26uMFrY6tbCpUru1frTwmMP1Vx/TUG7Y7J39yjZD4PIE4eXDB0+pPBV1HNd
         KpbyamP/a7cZeSBMUyjcetbFhOZc07kLf9V0MMbXQ/Z/8cyXP8fDX60qKvQcKOkeQAEe
         r/2F5xAqV6eh+QEhIko3LppnZ/4AhQdhIcXtDhF9XmWSQWyvqk3EkzA5a5Jd9R3+Q5Ex
         9gROy4n/UUKK8K+vdQPQyt+CjqvRnnuXlMg0hHZur8s8a+cmxQAtvlzpPBMawqSGvnT/
         8fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746735402; x=1747340202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJaWYC/RN1Pl9U+HINWQn65oVTKAG/7GIWm+I5KMbTo=;
        b=LPbksERcI7spJqTw58ZxuJ7vQh4Z7UgBDPE3B76RfX0iy9H+d+yNMTtTCOb8Q9lUqm
         mEKAzPjR5xduW9ZKH/C5fg9M6j9mZ9tbIZov3I0OE6GPwTC/eo4f29+YAovMPo/F+kQG
         pWMm8NQKsM9cP1WPtAGkVvWCmCvV3v0BZxQip7g7yrQ5hdp3elezQiVeI6apkt6QsGPu
         j/BM4+fdehEkJVUaF+UgVCVNeVoKNsZogiEO/v6QVi1PZ9DbeS3Qtl88SdFX7tO5vT2Z
         CuWYHB0pWSMYj7aOsADbNp6YTrO1G6dBMLzmFXijsZKidRwdMfm2gRqHvikWTw+7MNYa
         mE6g==
X-Gm-Message-State: AOJu0Yy2H5ZAn9Okji+ImBzddW9LwVVeLhb8FHaXmT0KJaPrzrsKhEuG
	fj9b972bO10FrQn4dcWVtUcXxDiTAEuJKWOfYjG/IdmF0ykQoTc8Dsy8Wg==
X-Gm-Gg: ASbGncvBhrcIWiHZRuqFmZu1FfTbg0xId0cbV9QZ3Yh0IKjDXMuDVgpaPTAvGq38O+z
	exVfpNzdohg+iFDS8Gha6QBpFV+unNmO/xFFjWuwkE1evXh1YT2pmM9UA7eNWBRGS4rPcZWpMbI
	zBml4i7yEVHvGScaFgSpvXKgPKGYEYnaTBDsJcUr0SkmFDUaILxga2mI9sqiBu8DquurbDxVDzJ
	2FNK0rmWnV8xcDlUbpAjIEVxxwLqWylPN0obIfG+9kJgWd6KSWuq6LMcXYHz5foYWa0uawGWOCj
	IvQ2AUTRxZ62uc+QcppOrFjXCjjGVqXLRAZTlADL
X-Google-Smtp-Source: AGHT+IGJUB0Jc2Nc2+9CWhnw0wrf8apWCERmOkHj631fm2hC3hekEptrrgEtgImJJLbJt0VFY2uV0w==
X-Received: by 2002:a17:907:c586:b0:ac7:3912:5ea5 with SMTP id a640c23a62f3a-ad21934d4a0mr101038266b.58.1746735402293;
        Thu, 08 May 2025 13:16:42 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:625:1800:c942:8429:98e4:61e8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21933f4e6sm37610866b.54.2025.05.08.13.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:16:42 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [walnascar][PATCH] scripts/install-buildtools: Update to 5.2
Date: Thu,  8 May 2025 22:16:32 +0200
Message-ID: <20250508201633.44249-5-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508201633.44249-1-an010@live.com>
References: <20250508201633.44249-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 20:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216162

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.2 release of the 5.2 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 952da888ba..6750ffcbcc 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.1.2'
-DEFAULT_INSTALLER_VERSION = '5.1.2'
+DEFAULT_RELEASE = 'yocto-5.2'
+DEFAULT_INSTALLER_VERSION = '5.2'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


