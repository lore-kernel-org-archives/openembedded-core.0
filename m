Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA77C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 01:48:35 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.89269.1701740909986187676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 17:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YmMXGyqO;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: ticotimo@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6d855efb920so2914815a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 17:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701740908; x=1702345708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0WqLO+xVhQtFYpRTXY++Rbgh4cpaobbWXCpIcKHvtwA=;
        b=YmMXGyqOuiDwbSWfoTRroxY3Z1NO1JObqgFw9xbvAgngD81J00eBCQ4Y5JaIu2yHV8
         H2A/itOns4r3UL4S+IGaLpDtWsz/l75WHbzIbhFg5zH2obvky6824wus8xqS6iPXTJ11
         KNbM9pR7Skt7ky1UNseGgzgbwSzU/B9iL8/m+WKQBzMZxyIPC7U4ke6v0jSppnomlM+D
         NxoPhoN8Rog/bL3dOB4TX3JfEUyQzrKdNdpKV0bPKgnm58ZGEJx0QCM87AHY8HVQU4AL
         Fx2XdMCl1dMQcqg8BMxGx05TT8RTaM9tTGZCyQLjgeEG65FE5xzbC2c09yH5i8xc2Pbc
         S4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701740908; x=1702345708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WqLO+xVhQtFYpRTXY++Rbgh4cpaobbWXCpIcKHvtwA=;
        b=fsAC51A5jmXK0eeYrSBHq3R7tybuefnl6dh87eeq2gdn3qZq8ENgs9nOtF15hro7vw
         0pWrkq/YPmNliutlmS5rImNavWh8FTm7EDRGACHx9/Z5je6XmcRJ096hDh9HOuLyJ8wT
         J3eX0ki/qb/NEw9th4kdpJX8KrYsKE40GL9NTJbQ8/agMcpy9OjTZillnIUVxO8YcJFW
         yj0ytpu+WNC2tyIRlJJUw0oVGBcSYIHq7c0iy2Ai6CaOxiHUDJREwQrbJkDQdrYjrywl
         k58+bgALbBmtAMog4ZfT0X0lH2qLPM/6D/YwCyEPX0VbmO+ualLDStnZECGP2H8N2Y80
         HN4w==
X-Gm-Message-State: AOJu0YyJ9vEgMy/RyWHwQ5yfyGjam7Q4YLvxhU/AGogdamMr6iiMB/UM
	NtLYkfvKyJqDvCbUHNLfi7U527szMPo=
X-Google-Smtp-Source: AGHT+IE2TbiAXRpZSTizXrdnqgMQwIr6g0eKwytggoZq29hZEEtLToy48QU0UIK1/PqjY/oNG1s8Ng==
X-Received: by 2002:a9d:6f8a:0:b0:6d9:a4e9:5079 with SMTP id h10-20020a9d6f8a000000b006d9a4e95079mr2144894otq.55.1701740907916;
        Mon, 04 Dec 2023 17:48:27 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:926f:4feb:70b6:eaf2])
        by smtp.gmail.com with ESMTPSA id gu7-20020a056a004e4700b006ce350d946csm4602965pfb.41.2023.12.04.17.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 17:48:27 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-pygments: upgrade 2.16.1 -> 2.17.2
Date: Mon,  4 Dec 2023 17:46:58 -0800
Message-Id: <20231205014657.3086552-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 01:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191772

* Drop redundant DEPENDS
* PEP-517 backend is now hatchling -> inherit python_hatchling
* Drop PYPI_PACKAGE as upstream download filename is now "pygments"
* Add UPSTREAM_CHECK_PYPI_PACKAGE since upstream path is still "/Pygments/"

https://github.com/pygments/pygments/blob/2.17.2/CHANGES

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested basic "python3; import pygments" on core-image-full-cmdline for qemux86-64
Tested 'devtool latest-version python3-pygments'

 ...-pygments_2.16.1.bb => python3-pygments_2.17.2.bb} | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.16.1.bb => python3-pygments_2.17.2.bb} (61%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.16.1.bb b/meta/recipes-devtools/python/python3-pygments_2.17.2.bb
similarity index 61%
rename from meta/recipes-devtools/python/python3-pygments_2.16.1.bb
rename to meta/recipes-devtools/python/python3-pygments_2.17.2.bb
index 240d01d0dfa..8b98064b784 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.16.1.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.17.2.bb
@@ -4,15 +4,10 @@ HOMEPAGE = "http://pygments.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
-inherit python_setuptools_build_meta
-SRC_URI[sha256sum] = "1daff0494820c69bc8941e407aa20f577374ee88364ee10a98fdbe0aece96e29"
-
-DEPENDS += "\
-            ${PYTHON_PN} \
-            "
-
-PYPI_PACKAGE = "Pygments"
+inherit python_hatchling
+SRC_URI[sha256sum] = "da46cec9fd2de5be3a8a784f434e4c4ab670b4ff54d605c4c2717e9d49c4c367"
 
+UPSTREAM_CHECK_PYPI_PACKAGE = "Pygments"
 inherit pypi
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


