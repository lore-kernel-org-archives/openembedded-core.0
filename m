Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA0CC61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 16:38:20 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.24246.1700671095633070874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 08:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hj823lj5;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cc9b626a96so51764175ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700671095; x=1701275895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3l6ODuOGbPh3sYe0nUF/uNIJErE6VLvxQ50GH7pIG9k=;
        b=hj823lj5k0wx2xa9Tv9nDwO01/HlAiZ92TDp4PbpMt5BZM1oHvudSBhxaSrX9yzTor
         uy64kikaO9p5GbOtisa0q1KLdIV3bzm7t5su5m1XSRRO/sS1fxCAPZBSYIyDj/EVH1yx
         L1fwCi3cOb6XUAiAfEHYmyr5oMIhfdTrD+CfrhoQGD8VBetRiXpPfDHK70nUrrd7WWTz
         B3v2kA6GqOBJaxLmbNZpZjXsWtbwdK/AF1ecSkBTv2kffG7dUkhhgWcAJh0NRDL7zj3f
         3RX/bbq4khGqAHRblC7rZZ5vpLyXlvXh9YW5V+VReuvbk/sKFAR9uFfsiPRpzfrhwHd/
         4ssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700671095; x=1701275895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3l6ODuOGbPh3sYe0nUF/uNIJErE6VLvxQ50GH7pIG9k=;
        b=U42/A9fccbgfBNiE9xPGHgc3sC/uEwfmcCkxtd4yded3lY5BU2XjulwI+nE+fralV9
         bmXet7Qn2zoMPcDcZOiUrFYWHBCyAvIx4Eip+VqLKFcOzKrmm8drtL8vEIjiJhyhKSF2
         cE14LP1VrIDc7EDpd+rk3xKV3TxEkInJarasxC2v3nUhchs4T0aPR62Dz33Gte6m539C
         gLqmtw13nIOXUVOG8i0vtL7qiBy9wk7NiSecjYCVcpw8viN6ICCl/tvgGrZJFowxauqL
         vmW1qYMSFZrLvg0ON5ag92YDD3CF6t5plZ09eg14Q+44iLt9tYg07jFPJxwgbir5hzuC
         yrPg==
X-Gm-Message-State: AOJu0Yz5wX+EfBn5UKsKjT9rMhiNJ8nmDiJBp8oUaaV92+dcp+nBTwc5
	gMxRWivEPIt3YXx+FFu34tQv6OL0ojWRwA==
X-Google-Smtp-Source: AGHT+IFz2fr/QIrvyydeILWun83pfDVB+jZLt1gBZGS+Dsa0eC+ebFO8Yybwfpf6jskm4SNlbQmjbw==
X-Received: by 2002:a17:903:230c:b0:1cc:7adb:16a5 with SMTP id d12-20020a170903230c00b001cc7adb16a5mr2728526plh.13.1700671094735;
        Wed, 22 Nov 2023 08:38:14 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0::b328])
        by smtp.gmail.com with ESMTPSA id i1-20020a17090332c100b001cf5d1c85cdsm6154138plr.218.2023.11.22.08.38.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 08:38:14 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] python3-sphinxcontrib-devhelp: 1.0.2 -> 1.0.5
Date: Wed, 22 Nov 2023 08:37:51 -0800
Message-Id: <235901b0deab3e7a47475bcad3efd095774b8a3c.1700670471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700670471.git.tim.orling@konsulko.com>
References: <cover.1700670471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 16:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191119

* Upstream download filename changed from sphinxcontrib-devhelp*
  to sphinxcontrib_devhelp*
* build-backend is now flit (inherit python_flit_core)

Release 1.0.5 (2023-08-14)
==========================

* Use ``os.PathLike`` over ``pathlib.Path``

Release 1.0.4 (2023-08-09)
==========================

* Fix tests for Sphinx 7.1 and below

Release 1.0.3 (2023-08-07)
=========================

* Drop support for Python 3.5, 3.6, 3.7, and 3.8
* Raise minimum required Sphinx version to 5.0

https://github.com/sphinx-doc/sphinxcontrib-devhelp/compare/1.0.2...1.0.5

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...elp_1.0.2.bb => python3-sphinxcontrib-devhelp_1.0.5.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-devhelp_1.0.2.bb => python3-sphinxcontrib-devhelp_1.0.5.bb} (56%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.5.bb
similarity index 56%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.5.bb
index 0d034366e7a..47934bd6f53 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.5.bb
@@ -3,10 +3,13 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd30d9972a142c857a80c9f312e92b93"
 
-SRC_URI[sha256sum] = "ff7f1afa7b9642e7060379360a67e9c41e8f3121f2ce9164266f61b9f4b338e4"
+SRC_URI[sha256sum] = "63b41e0d38207ca40ebbeabcf4d8e51f76c03e78cd61abe118cf4435c73d4212"
 
 PYPI_PACKAGE = "sphinxcontrib-devhelp"
 
-inherit pypi setuptools3
+inherit pypi python_flit_core
+
+PYPI_ARCHIVE_NAME = "sphinxcontrib_devhelp-${PV}.${PYPI_PACKAGE_EXT}"
+S = "${WORKDIR}/sphinxcontrib_devhelp-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


