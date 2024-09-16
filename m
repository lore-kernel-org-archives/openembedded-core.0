Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C77C3ABC8
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:20:06 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.128386.1726453197978188842
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KbKY7TCy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-206bd1c6ccdso24346455ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453197; x=1727057997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N75Mijarpimc0DFbdeFby/NE0AYn5KPj/hCM9SrZx5I=;
        b=KbKY7TCyZ/cTzY6pDDKljFe8oNX1nVQo3CCVe3op495UzV7ZjqG1BAgR6dgihErztC
         CxsadwCxrFaFVZc2XVgdfks05dJX6hZ+Fl8jCaHvdryKK2D0TWjT0L0k9mQqZMRqcHnr
         VRbrQN+eox3Q+yfiK+FDjlYrpi6SAryn2LVt5ZgVLuIIR9FmY8YSIjDE0EvvJNf2nwgo
         vpDlXyfhKsiwkfHsCeTrBXPPckL5UgBsnZ+Q/FZjkTKo7OKTg1lRfTtQPwqSz6pxb/Fm
         lEX45MWryWezTmm/9g9gdylUZa87kwJ3cmFSJCUPa9hxhb0k8KbCsLpuRCTWb8juX6c9
         i2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453197; x=1727057997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N75Mijarpimc0DFbdeFby/NE0AYn5KPj/hCM9SrZx5I=;
        b=j1/Vy8My1UF3fk8Js40SJIqaksZd5HNkX1qmPNRfKOtRQUgz74o3Mn8GMxGX6H/2GO
         /d14cS+KqQ8ZAP8BYDa0RJoUBUOf5muD+yAQPlHe0eerdTebw6aB1bfLXLACzsxORl4f
         X8/d5uthkFN6T2KBSFa9R0o5C4ypOZxVGalPznCkqo/qai/mJBF31SWD3wZbQBvnfnuU
         u461STEO6bbtHlp3cM4SKS6FFd3RHsBsRBy+CbUWHb2E4IkyEsy4XKySxCqd6LsFbXzL
         ZUiz+KSMYtB9+4FwxmGeT7W2qKYQdLWEII4NPInxBAj2t4t3xTfzT9eLA1+BGgv/xCdl
         Ufbw==
X-Gm-Message-State: AOJu0Yw7z5iSvyEmhIniC0hDo8gG0vav+xs1xPoSBsdSyxrLzLTQLCQd
	EdDvPsORnWB+f1AlDlGSPfbpd5DGwcQuSUdcn0N2twe2kQ9/uozJseBQmb5Aa405EGHYIvqrwRq
	IIgo=
X-Google-Smtp-Source: AGHT+IFi6gOwusZO3kKOtVZd9eNuFoTFLVmdmGUxWn/YuDudmuThBa44XuE2vpmTtIvuoe/UtSfqhg==
X-Received: by 2002:a17:902:f790:b0:206:bec6:4864 with SMTP id d9443c01a7336-20782b693a9mr157896935ad.50.1726453197259;
        Sun, 15 Sep 2024 19:19:57 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794764144sm27698175ad.304.2024.09.15.19.19.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:19:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/11] tiff: Fix LICENSE
Date: Sun, 15 Sep 2024 19:19:33 -0700
Message-Id: <5495cf45ce74e79be3b8d9b1195f65e253c62828.1726453060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726453060.git.steve@sakoman.com>
References: <cover.1726453060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204597

From: Niko Mauno <niko.mauno@vaisala.com>

The contents of the LICENSE.md file included in the current source
code package match those of libtiff license, which seems to have been
the case since 1999 commit
https://gitlab.com/libtiff/libtiff/-/commit/0ef31e1f62aa7a8b1c488a59c4930775ee0046e4
where it was added with filename COPYRIGHT and was then changed to
LICENSE.md in 2022 commit
https://gitlab.com/libtiff/libtiff/-/commit/fa1d6d787fc67a1eeb3abccb790b5bee969d424b

(From OE-Core rev: 71d8e8b03349ab18dca558055c2b3a3687785ddf)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 89681be634..6bf7010ba2 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Library provides support for the Tag Image File Format \
 (TIFF), a widely used format for storing image data.  This library \
 provide means to easily access and create TIFF image files."
 HOMEPAGE = "http://www.libtiff.org/"
-LICENSE = "BSD-2-Clause"
+LICENSE = "libtiff"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
 
 CVE_PRODUCT = "libtiff"
-- 
2.34.1


