Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8C1C3ABC4
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:19:56 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.128382.1726453194450982272
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VmrdSi6T;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-201d5af11a4so44248755ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453194; x=1727057994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQdg81lspg2JvpRaoHVv2QAn/eTNYfh9bJ6xwcE7zVs=;
        b=VmrdSi6TPckSzKCQythY/aY2uESfwHpMk5wQHkfeYNIfVbho6/RAP232GE6yGXDZgN
         +6kOdLF1XR4Ji5WDF+vyVOLbyYOJFy6GqgVPjQBQaZ0JfwcJfxtA74KaF2/IySGt5tJD
         BagUtLwr73UMuc/ClTBAjqZvA/2qZ1WJbW1aLLXrA5OwUV5hTBaLYAXMgMSXtW4+D/66
         b+FqLFy3q0qYKO5zrSojPHuooMBgbhXFsKVhcOhBQuiz0M0p0JKZag/uM34mCL/aH5bl
         xEeMMldGjhSfe7w0XzXBhxcuL5KA7jSQbfbxDdjQNOKkMZICfTTkcNiHvqpzxkQ6sAnr
         dPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453194; x=1727057994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQdg81lspg2JvpRaoHVv2QAn/eTNYfh9bJ6xwcE7zVs=;
        b=G4u54s78m91tuRuHRk0fowdpBNpLWRHwTeLmmGqRVruic4Y238uTLHbgUXkr8VKvq5
         0JrEpI2nr3SQn/CACwRgmRE3owSE04pEQOvqpGMg6NgL4j3vmBjznhlnp8KnKAkkgzFq
         uHuXu9p4laNAm4Re+HcOmoNU1GHrMoQyNb15AnwQ+oxIoFpD3ouit8TTvE82RAbvqxyg
         4yEMsOsiJmSKl7zJ5DNy25fj7S+yaC2BoB+xUXfr9k2RgI9hE/muLbtA7b02sq/wD0u9
         qyIvViXPzwg417f1Nsmq80nAaGAtOpGFsBFNv183eDv0gafNGevXF7409xTsLqYh2sOK
         xrDw==
X-Gm-Message-State: AOJu0YykKkQDWPF87GkCIp/T2Uq7nth3KgDXbqJ1YOEJhVOdx/pyweUJ
	ZpR96fVSRImCkZnKZYaHtfgUrj8aZgi8n59nNr7zG7pnfNe3BDJXPb0pdjYGrUJT2j1ePuPnxV+
	rO10=
X-Google-Smtp-Source: AGHT+IF4vyOiPKNJ14V2zDEXnbAqiNySoKInwln04itgAAh0JhN8s2uSwAhNr6LpvSNBOWNH0C98OQ==
X-Received: by 2002:a17:903:41cc:b0:206:d6ac:85e1 with SMTP id d9443c01a7336-2076e308699mr201275905ad.2.1726453193768;
        Sun, 15 Sep 2024 19:19:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794764144sm27698175ad.304.2024.09.15.19.19.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:19:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/11] unzip: Fix LICENSE
Date: Sun, 15 Sep 2024 19:19:31 -0700
Message-Id: <f4b84a234662bc8f68e54d4753d9f03e4c2e7931.1726453060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726453060.git.steve@sakoman.com>
References: <cover.1726453060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204595

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
index 27076d5d9b..c13e7a008e 100644
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
 
-- 
2.34.1


