Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E05CCF9C71
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 09:00:22 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.32269.1727082019612701599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 02:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a2+oyjDh;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c42e7adbe0so4674787a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727082018; x=1727686818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utcCPzgnfEOmm11tyFQqj41Us0cZSnC+Tcrl5jAnsRo=;
        b=a2+oyjDholEVxRmT6ddmwshzMAx8XNrAvF8cyEFgO6V7paSqlpgocHZYGKnULN95c/
         q+Pyi/GzgB5dxIiWeRsr87a1zaohS/v0vmS5fhUvDirqouflx6BCF9rkrZK5tLNFdKez
         VvUJnxFDuBByq8rWJgQFhAcD+ABTyCxqZYqYcFW7haFDOxic13bkeoV8bLuNNWbrSV14
         R6P5hxq5pwF4px3iIF/Dkr7wU+fU08KvuOiKuwihur9uCt8IbW2fs1cTSJPlKZAW8axe
         3AfaedjDs2WgGKOUsIpCYvEYiztzuW33175kyebkGZch3UUtaWXJlJIWhroiMXXj/ZAm
         lsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082018; x=1727686818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utcCPzgnfEOmm11tyFQqj41Us0cZSnC+Tcrl5jAnsRo=;
        b=StXZ4y8R5WdGdfWjv8KKGjN83RrQW2S6WtVJ4ez/95vHxoIy7IlA/Opdqecknl2PAc
         8MELphYMff38aO8Io0MxzBaZbtKG103PhbqeqjMQ1Fq5fKQnhsNkSdXUlxt+78IRsCTJ
         Pvm+Unlu8znpnDbNIiT7PfaGm2fwr5t6YC/hRKXjq4lcaL/yZK1jMZBGbyhUaVNZzUt8
         2DC410B4+AikfF5AR4SGT4yZCuaQw0M+EzxcbYSb/PoJcyoWjy4P8NkV9Me4qd5i1J0I
         +qzsEvSxP8GOsfV7p8Zuk554LaWOxUaL2czBNNhXtyvYlosE1Z2aKUhyrAUPJ8/uuFdm
         tRzA==
X-Gm-Message-State: AOJu0YzgIvqu0OTzmAUeMCBX8ckNf5XTxSMgWPF00aSIoiMxWLVKjKhd
	Q0JqpBzHYCJWIx1pXOm0TVe1xDSvPiECKnluCaIr9VgrD4xGeisRiD+tFrID
X-Google-Smtp-Source: AGHT+IGabKOPsddhb1Q0uIRf7Q1nllNX66bUKBPjg1xgEvAKufl+56VUNNBfZ22CqEvTRIewRV2Lfg==
X-Received: by 2002:a05:6402:2712:b0:5c5:c5fb:d405 with SMTP id 4fb4d7f45d1cf-5c5c5fbd4bbmr399030a12.9.1727082017729;
        Mon, 23 Sep 2024 02:00:17 -0700 (PDT)
Received: from an.. ([2a02:810d:600:2744:e855:ba31:e4ab:c4bc])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb94a01sm9872262a12.91.2024.09.23.02.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 02:00:17 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH 4/4] scripts/install-buildtools: Update to 4.0.21
Date: Mon, 23 Sep 2024 10:59:48 +0200
Message-Id: <20240923085948.49447-4-an010@live.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923085948.49447-1-an010@live.com>
References: <20240923085948.49447-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 09:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204799

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


