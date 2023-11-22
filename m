Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE5EC61D99
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 16:38:20 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.24382.1700671091575558452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 08:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X45zmyOR;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cf6373ce31so69775ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700671091; x=1701275891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3AoAvUNYbUOE628XxGjWMhCc6FbiS9rEP5gY63Q3B4=;
        b=X45zmyORY0KmjrX4edThC4a25DePzrfsuSQRbg3c6LaQB9zdobYwuZnOxR+qjY4BVZ
         ZRyLaRcmnuM+s+YYhZ++pymD5orkTqL7Tmcmqze7azQeQJ9e8vBtx9dHBl0g6TpcW2XU
         67jJVxlP3/ErkuDnTwzuwzIbG59KZn32jtfJy/dVSbQvtBDLBrCuVPlUAQLMZqk6n2Yc
         xaVARanQO2sJJWVj58DSBgi7GQT7vev3/duwWiwn8qdRjPKhoKOkRBMxWz2l0g+Yl3Xw
         UaOXP3ag3uDHjDkfY/zbO1W+BnSDL03W0Bbym3B+cf2a9tIZTpimB2xwNOkehhvKSJHc
         fTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700671091; x=1701275891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3AoAvUNYbUOE628XxGjWMhCc6FbiS9rEP5gY63Q3B4=;
        b=TN+YNAhB6v8U/ehcZVxRfpi5PXb0xzUBReyBk6BhDQdkmRH2kpB/ojEP3Xq4l5U5vB
         Ark6IxCpFsKnOMEaPLgNTkq584ooRkCyI1VIHaR+v7JNlIqTlT3K6hX3ajXmPU86xu5N
         pkQllF9peCfg6AmgyqiwERcGpTqjcDmIurgwrW1RVw4A7bulg9RySlzVTBm8t+z3s07X
         9NUQ7SSTLGP+77wbq0SccdSnXMy11hyokNogHNBth6h7pAX8LVCEHlXb3iyci+WNW002
         4MKXG7+CkQZw74CstU4PbNxKp6flqj59T0Ovj4+0B+qclXaqYqFlg2KWdtpyGDX0IcM4
         oOwQ==
X-Gm-Message-State: AOJu0Yw+kJ/xo6oPHiJtbz7cQAd3p5BR0Js9D/q9Tt4ERyAb6KRAxuyN
	qj/R1U7kARol7zkeji30ubBne8elsbYm5A==
X-Google-Smtp-Source: AGHT+IHSWOVTFeTi4RjLEBj8Ky0gw44UgHr999LsCDiiQC8ChmCx4Zc8KRuoNx1Ap8tdegrLnip56Q==
X-Received: by 2002:a17:902:e84c:b0:1cc:5671:8d9 with SMTP id t12-20020a170902e84c00b001cc567108d9mr9918943plg.27.1700671090548;
        Wed, 22 Nov 2023 08:38:10 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0::b328])
        by smtp.gmail.com with ESMTPSA id i1-20020a17090332c100b001cf5d1c85cdsm6154138plr.218.2023.11.22.08.38.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 08:38:10 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] python3-sphinxcontrib-applehelp: 1.0.4 -> 1.0.7
Date: Wed, 22 Nov 2023 08:37:50 -0800
Message-Id: <8862e58775a44193991e50da863395553895d5eb.1700670471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700670471.git.tim.orling@konsulko.com>
References: <cover.1700670471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 16:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191118

* Upstream changed download file name from sphinxcontrib-applelhelp* to
  sphinxcontrib_applehelp*
* build-backend is now flit (inherit python_flit_core)

Release 1.0.7 (2023-08-14)
==========================

* Use ``os.PathLike`` over ``pathlib.Path``

Release 1.0.6 (2023-08-09)
==========================

* Fix tests for Sphinx 7.1 and below

Release 1.0.5 (2023-08-07)
==========================

* Drop support for Python 3.8
* Raise minimum required Sphinx version to 5.0

https://github.com/sphinx-doc/sphinxcontrib-applehelp/compare/1.0.4...1.0.7

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...p_1.0.4.bb => python3-sphinxcontrib-applehelp_1.0.7.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-applehelp_1.0.4.bb => python3-sphinxcontrib-applehelp_1.0.7.bb} (52%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.7.bb
similarity index 52%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.7.bb
index e352601466d..ec3670641db 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.7.bb
@@ -3,8 +3,11 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7715857042d4c8c0105999ca0c072c5"
 
-SRC_URI[sha256sum] = "828f867945bbe39817c210a1abfd1bc4895c8b73fcaade56d45357a348a07d7e"
+SRC_URI[sha256sum] = "39fdc8d762d33b01a7d8f026a3b7d71563ea3b72787d5f00ad8465bd9d6dfbfa"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
+
+PYPI_ARCHIVE_NAME = "sphinxcontrib_applehelp-${PV}.${PYPI_PACKAGE_EXT}"
+S = "${WORKDIR}/sphinxcontrib_applehelp-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


