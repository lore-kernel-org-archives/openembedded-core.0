Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798BDC41513
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 21:45:41 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.75724.1697319932721708614
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 14:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HPp5RiLR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c9e95aa02dso17890425ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697319932; x=1697924732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvnbgVaUapjqjJGD9xO0lm5/Qya4f33ktNBABaMvJQ0=;
        b=HPp5RiLRAQU4bBjmGFzAK86HqkvKAVK1ZbmTJ06ytLnMV/Z19NB6j1F9hL5Nkqqe8v
         UesOD3JSV1qAj6yzv6d93qPvmISF1LX8p/MleCYIHccj4vPaqEFqTxmnN8gOzdKSPSSk
         i0L9S2u8W7h60RdIotPAsBuqxOGswLZhFL6dlHj7t8hz00cwHIktk5K40p5nFn/fX+If
         sVypcsLM8SwACJtxBi7nBdxCdlbCbfCGrgCzkQjlAyqvuX2V7QlTDisGmtLXRkyS/EqL
         +regK9YNXIUpYsScqHKjEF5SMES9Z77jB3R6t7a05rtOHj5nIZHXCnZzjcQ145LVgGZp
         8+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697319932; x=1697924732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvnbgVaUapjqjJGD9xO0lm5/Qya4f33ktNBABaMvJQ0=;
        b=kTc51XcJqWqmOdI2hmJ677q0Ix4VTeNG5J6tUj/4Pw2vAraKoI61RzYJc309jCESVu
         uiMB3+NssidGGk3g5HN5LuEyv1A5RW8k1EW4Eyu5bFswVufY6xPdCCNf+SuyPD+fwRri
         AyWAbaVSfNIfCOD2+ZhqyF18VFEBgM22Uy4YLonuDPL+xtbrxeTqtSKeJIRulFZ/Z0cY
         y/wvryMDtkL9Qq2B/XHFACQdqFMAvimlrV41+ko5JUBU25g36UxYeKNpX9qOPS18BFPs
         cyyoR4yEy529uHqZoYbHoAtC+eIFzYM4WyTu2n8NI8oXQFkfF6ghkmrVmCNt0suylOjU
         tvWA==
X-Gm-Message-State: AOJu0Yybh9Rn+n0blbVq0Ycl0F7FjP/M9K58WfAiz5oDG+ezMKERN2VE
	87j2vlAjfRPRmND3PBNLCSaxbne2RGBx5qnAxrs=
X-Google-Smtp-Source: AGHT+IEGKzm4f+tmqeyhMdT3mUSIpEHQqDKWiDeUcRPVM0JXK68+vqWKJGxz2S2xIn40BLEoa1GNYA==
X-Received: by 2002:a17:902:d4d2:b0:1c9:e77d:62d3 with SMTP id o18-20020a170902d4d200b001c9e77d62d3mr5377057plg.10.1697319931849;
        Sat, 14 Oct 2023 14:45:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001c898328289sm5943411plb.158.2023.10.14.14.45.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:45:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/13] python3-urllib3: upgrade 1.26.12 -> 1.26.13
Date: Sat, 14 Oct 2023 11:44:54 -1000
Message-Id: <e8ae3247795d9333f6252bbec85a8e09c0c9cb48.1697319777.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697319777.git.steve@sakoman.com>
References: <cover.1697319777.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 21:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189133

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b18552f69a2eb8900981a10ba386dc4f862b29c3)
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-urllib3_1.26.12.bb => python3-urllib3_1.26.13.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.12.bb => python3-urllib3_1.26.13.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.12.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.13.bb
index 1cd69bcb10..7af95117cf 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "3fa96cf423e6987997fc326ae8df396db2a8b7c667747d47ddd8ecba91f4a74e"
+SRC_URI[sha256sum] = "c083dd0dce68dbfbe1129d5271cb90f9447dea7d52097c6e0126120c521ddea8"
 
 inherit pypi setuptools3
 
-- 
2.34.1


