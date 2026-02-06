Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A89EE2094
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 12:19:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10280.1770380359836010264
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 04:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K++oEvEs;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806bf39419so18841655e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 04:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770380358; x=1770985158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3Y3MxAJFwTJpsOD80tx0UAfUAdZbLWSvnJEC5HaXmA=;
        b=K++oEvEsTuIVDPCnG5sr0Q6QUpq/lxVx8KMnqePU7SNHu4cQ5yVQLa2uVuoy9O196t
         WDZd4RK2cEKpQl/dKthJuOoobxns0DvxdTLo8xovfgDHR5o4auoucrZkQ9NbaNuEzdyp
         pIopca+gp6leKp6+fFFReY5QyNPcaDvCOLCJ8LpMq5gLicSg5dZRs8mhH8sUDXxGaSA1
         Iv6P9NPHng8DHP3UQ5C1DySkjB2C9djo0buOThVBxQQNLAFjT+x8QKbCfnasj44+nXwE
         6l6SXH1fFSiWNDM9eecz/vJ1ch4iLzcUfdjSmNoX2WcosJNEmwJ4qZVMehmzi9OQCAKi
         OP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770380358; x=1770985158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P3Y3MxAJFwTJpsOD80tx0UAfUAdZbLWSvnJEC5HaXmA=;
        b=trPzCGmEr42MJgtrXC+hXkjOs/B3HG/ka4dA5X0A2bvdF43S0lZeQOpH7L4snWO2gq
         /lWK6GqM/pmc0cJEMJ7gOAxKqLOWQ8hupDvrl8PvZfCehN8C5SB/k7M8Whl34phAf/+O
         z4Ddwd85yfTV5Ippzq3tDBXo3wiobRjExgIbb+nLKyU/Vy39z6wSQOxuilNc1dN9BcSo
         dAyjiKuBvHwqRlXhs5N8tejSltzPNmgkO0XpHJu1n71b+cbEcZ3Qm0vS0DonvMAtcH5M
         kiRv3nSpSxHEtNfQJ0OthXCLW2SRjo0xAE0CZf47jhh7LnkkeDhOVQrnmeUJZKDPuqga
         C4uQ==
X-Gm-Message-State: AOJu0Yw7iW4oy8modyZ5hHYXHIjuu7Oi+Vwo3y6fNOeWUzj8XGzKXth6
	5SBFZQ3qF3OCe9dyyIYUNeIv+qwjKIIemtVSKKMb5BaeFnkYbrjc4+VT9Y/+Kw==
X-Gm-Gg: AZuq6aICT/9YA7Awch5R47vFjdQoE2k09uuVAuKRB5o2CdH1xJKIYs0ym4uXapEGYAP
	rpU5oZ6S5rTTKJEk4SBbAYVOqlwgFjsnhj45/6CVDIq7SyPJ+meltzFGrFK0mGRtsCCnkWKkAyq
	5cj5bWsD08VULb+lXpZH9ij2C1n8l/ayOFbpyW7+UO8ALwwZsesiQd1jlV1Y9LjZmPtHD+RfTZT
	Jf886C3VmhqQAYXQuS4Gd4hNvyk315EDmNDposKFdMc75RXUb+nV7pg1Fbq6acIrxh5P8ovSq0X
	xR/HmM65koiOmE+5gORp8MW2bbsqZ7fYGpfbtBUA4WeXXMp8QBuIFkxvg/JJS1IWcY5Kyn+YLfB
	mH1kLNTKP4g7TPiNcS5u9gWljJBDm5jh4DdhlzHm6RgnacMCbxox0rHmjWM2Uj52+8ENcFMLMpS
	/haWkoG2GBRU+0/SAbfV7CfMY8ldvZK03b
X-Received: by 2002:a05:600c:3041:b0:477:9a61:fd06 with SMTP id 5b1f17b1804b1-483178ebf68mr57165535e9.8.1770380358124;
        Fri, 06 Feb 2026 04:19:18 -0800 (PST)
Received: from acert-swift3.. ([95.90.195.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320638ff7sm53719565e9.0.2026.02.06.04.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:19:17 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
Subject: [whinlatter][PATCH] scripts/install-buildtools: Update to 5.3.1
Date: Fri,  6 Feb 2026 13:18:55 +0100
Message-ID: <20260206121855.1895055-3-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206121855.1895055-1-aleksandar.nikolic22@pm.me>
References: <20260206121855.1895055-1-aleksandar.nikolic22@pm.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230617

Update to the 5.3.1 release of the 5.3 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 93f3e2d678..c3f257ff93 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.2.3'
-DEFAULT_INSTALLER_VERSION = '5.2.3'
+DEFAULT_RELEASE = 'yocto-5.3.1'
+DEFAULT_INSTALLER_VERSION = '5.3.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


