Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA16EE57F1
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:24:07 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.35261.1726097040006086775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wzeZRLH0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7c3e1081804so233796a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097039; x=1726701839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rb5zPqUl7o9vmYjTq6y/lNSw7rhAgVfCuXzr6NEAodM=;
        b=wzeZRLH0dZRUjKPbXJqf7os19gxrXSs6HH5vKBzuVMzo9Ey6tljWucE9GApFWjmnXI
         PZSDmXFr2fLd7oeygrEcRAIRFUSmOtEtgHcxKj9Y8m6QfOME44P0+JGLk10p9z6O6x3O
         MrBFfmn4XKGjr9KIhsCvRqpYXBCAbNqoOLqc+S9iBo/qtpc2rmcgALOazB0o7XZLWJCW
         wDBsL5EgNEdEoNneuIyVikMA48dyUR4HFT8uybGIKaGBP4XKv4oyswtqXgiU7A/Dw1qm
         wzgMngCJiOkrC8n3OEq1CEjoLgPwGqpOXcTmALLOanqdA0cihQ45KzH4q5FCgVnnD7Rm
         2ZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097039; x=1726701839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rb5zPqUl7o9vmYjTq6y/lNSw7rhAgVfCuXzr6NEAodM=;
        b=pR5rFBbhLR5461RJOpWpe9egM2b59munN89BnXijAemK/sRgHpzZ+gFNueoBUFZva9
         u551L0yh8yL+fJjtobbalJrTRND4Xz6LPOOSPYfyeRlLj+c2m/8oM5VdTmOnu5WPYDcX
         XHDMCT6cSmUhVJj8Hc6WBijmTHbtDjhoU9fhfhnDENZIaEObEeErHm4T/JrqAm6efF8r
         W5ayhCJB7NK3XNul4+fuZW8j7OA+DKNpc4zblERVklUNbcakvdbMfvPUeu2Rfc5Z/9Wc
         LAUV9xDzkyEIETKGZ9txfQJweY92/u5vAxaeOYtQhca0nM0o/L5OHTtRPIJRwv+fkN4w
         mRCA==
X-Gm-Message-State: AOJu0YwsFYhbQWpPbS2OkhBhiisW1NBP8ODeXNMQMWCN86a0tT/l/T/1
	hjQNGWiYEvcCU9WrYgxJk/xy7JvZxd4f+3AJb70UTy0bTvKbSveOd89qtyfozGmcmuqISliNoX5
	u
X-Google-Smtp-Source: AGHT+IEu32XGwSLgRgKUv1iQK7E2zvLyDnTW07Ci+9OQx+NZ25e2H+gs8ODka7clEq4qKYilHBpnGw==
X-Received: by 2002:a05:6a21:114d:b0:1c6:ae03:6607 with SMTP id adf61e73a8af0-1cf75ea27bcmr1190760637.6.1726097039217;
        Wed, 11 Sep 2024 16:23:59 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/22] unzip: Fix LICENSE
Date: Wed, 11 Sep 2024 16:23:14 -0700
Message-Id: <33e92e85b1632e933c3099a45ba53c6904eb6b88.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204411

From: Niko Mauno <niko.mauno@vaisala.com>

The contents of the LICENSE file included in the current source code
package match those of Info-ZIP license, which seems to originate from
the year 2009:

  This is version 2009-Jan-02 of the Info-ZIP license.

(From OE-Core rev: e7c9368e56a6ad90b4ffbba1b765e2b3a331c796)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index e3fffa30ab..cf532c09d6 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Utilities for extracting and viewing files in .zip archives"
 HOMEPAGE = "http://www.info-zip.org"
 DESCRIPTION = "Info-ZIP's purpose is to provide free, portable, high-quality versions of the Zip and UnZip compressor-archiver utilities that are compatible with the DOS-based PKZIP by PKWARE, Inc."
 SECTION = "console/utils"
-LICENSE = "BSD-3-Clause"
+LICENSE = "Info-ZIP"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94caec5a51ef55ef711ee4e8b1c69e29"
 PE = "1"
 PR = "r5"
-- 
2.34.1


