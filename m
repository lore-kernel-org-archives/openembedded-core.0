Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A48CF9C73
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 23:05:41 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.2803.1727219138998791461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 16:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aoCIqVqw;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53653ff0251so6915029e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 16:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727219137; x=1727823937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utcCPzgnfEOmm11tyFQqj41Us0cZSnC+Tcrl5jAnsRo=;
        b=aoCIqVqw909MDoqqVBl2hWGwHapQcIjhu0PVVK0MDWjdzR6iHD8lwwVSPDXwhNHM1y
         /6p9umJ63V2lY/gQEFhYKjT6rcStMVJxi8pVk1snaBp3w72ZEzWYH1Fzj1NLZaxn/s+3
         QlKaMV7HAEaGMYgodSyn1joxghMkF3eg/RQtcprL/zqoiXiG3vM/rMsB/dlLpa7y8zp2
         2rffzHu0LAW/4Ir2l7rLtIj7MbxC9OuBTiyjnSCDYXZ2VW+m5b5Q/eXsRVUL+A0TsAP0
         WHIwGGQCDcIOSdyt7rYfDlTHvD967AWGXz/MZP5Rbw41BEylxnjZAMLIpFp08y/lSWpn
         kBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727219137; x=1727823937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utcCPzgnfEOmm11tyFQqj41Us0cZSnC+Tcrl5jAnsRo=;
        b=Afod2lTJ+Ntb1VA1ZNTnLH7heCwKD+LUBprdeVUOAMxfj169r/1bnVaUCfSmrf3xps
         hD62vaqMMqTHftZKtUiLrQAqPJZ1Ja422RBiTxYUr+I2htWtHmG2fPFFCeZrU9yDCTb7
         BRcuqpqLDSciUiuxzw9GQr7tCf+MXy2yEmVykffVpmX0DZ1U+K26x80v+u20zNgZR8zC
         vffem0CbjVZIZMrAtsDTsB8/rGbz5pnic0kax0K611yAb0Nyq5X7wP86/XaVz/xjPfjT
         VeF4owPVOeO4eMBLNhea3Z9XH/4XfQGU9YKkMM69GYNuGtgJ8fb2LSdx+faBk+OnWopy
         KPNA==
X-Gm-Message-State: AOJu0YzB1bNm5MbyFed65JBzMR0twSUhkh+2x7UA22oZMRWl6P7B5af5
	XltJQrL4csO19lePm47GrKHPyi5fycjSebs0SGa83M9+mr2bQcNK6fKLvu9+
X-Google-Smtp-Source: AGHT+IE/qMivjxpqskF9J3PczWcyKar5CplPAmPM6w1lSyHq6kH2IRkBgiMrzvp/9AOiMQSzUEj6xw==
X-Received: by 2002:a05:6512:3996:b0:535:6cde:5c4d with SMTP id 2adb3069b0e04-5387048d11cmr414428e87.3.1727219136809;
        Tue, 24 Sep 2024 16:05:36 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:600:2744:7bc8:c715:17d:4d03])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf4d75cdsm1291721a12.81.2024.09.24.16.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:05:35 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [kirkstone][PATCH 4/4] scripts/install-buildtools: Update to 4.0.21
Date: Wed, 25 Sep 2024 01:05:17 +0200
Message-ID: <20240924230517.19994-4-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924230517.19994-1-an010@live.com>
References: <20240924230517.19994-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 23:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204887

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.21 release of the 4.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 4f85fe87d4..9054eb5f36 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -56,9 +56,9 @@ PROGNAME = 'install-buildtools'
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
-DEFAULT_BASE_URL = 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.1'
-DEFAULT_INSTALLER_VERSION = '4.1'
+DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
+DEFAULT_RELEASE = 'yocto-4.0.21'
+DEFAULT_INSTALLER_VERSION = '4.0.21'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


