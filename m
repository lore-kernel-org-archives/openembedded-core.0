Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238ABC48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:13:25 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.4824.1708035199530118855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mjKdkqAS;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: ticotimo@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-21e085b9e61so794481fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035198; x=1708639998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gnmm0QI90NBU1GR4zCD6y5wF+tsQVI+SwKAyAzPDW8s=;
        b=mjKdkqASFzraNHKneIGFgDnXlyrpiiw7NbTs23UF9m32ApxTUYhs96clws1/VrqQ/g
         m82bFd1b8vDrHW/xi4y/ryikFh44HBQArONXwLGG4tz1Iudo9WaVFaZesilROzqriZIF
         sFpMMuMv1Ep8ZLGbxWtexpshLY8lfroJ7UOViIVOP7cOnvET+bjNHs5mpEDYtAt9+0Z/
         2mBD6ziZ6dT3NffGluRPtS/Uq0BryYiVsQveROYXqZyxmh2Gr/2OP/jFbPTTxFwk9E7n
         m2vKAjDHN5SYcuNOi3fksdhiQYsFvtF2wrETF54YpDcF+nLj6R1eSq2cxDwue9jNc5A1
         LoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035198; x=1708639998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnmm0QI90NBU1GR4zCD6y5wF+tsQVI+SwKAyAzPDW8s=;
        b=ZpjqXoY3BYJrjr/MxGXdJz8332VeSoOpX4iX1+NmWbA3tIHl9UtoV5DNGMTx2OO+mW
         PJwUCZnPP6h49zGIH4yBHZ2FLB53YB43QcezNNcZ0bGJEsIRPM0ulKDd8V17WscS+IB0
         92L80i81YPXzjxhqCpKROflNpNeggQfSFEZumE5U2KBK7nRxMkfgL9CR8X2tD9CfIW57
         CtppkqeMgyJc4VTDdRCTggG3MqNnzZegFI3rMg0Q2+OELfN5LyqB1OmKEBAiF9HrfJ19
         2tS95h8J3fvWR0jaQv9ISeluH3Y909ki9JpbSWSnhHgFes3qeW885nYRUnunvg+YMjsi
         YTWg==
X-Gm-Message-State: AOJu0YyKF5/6Pa46oOkRcN+1smsIErzg6UP41EOiJZsuAinYSrOOpmVq
	cj/PRj/EqDqul6y+hQn33h1FcS/tcMXXkETtdsbCdfKE9gB13vVUwq7Hea3R
X-Google-Smtp-Source: AGHT+IHgoUvZevY4m7NC2B+DcupGqEWH8Sqrnn6i7vnQ3INubmqfXcTiVUI0Lfsw06uzyNnpZRY2Ww==
X-Received: by 2002:a05:6870:f153:b0:21e:579f:a4f3 with SMTP id l19-20020a056870f15300b0021e579fa4f3mr1501992oac.47.1708035198540;
        Thu, 15 Feb 2024 14:13:18 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:ef9e:327e:12eb:73bf])
        by smtp.gmail.com with ESMTPSA id k131-20020a636f89000000b005d8b89bbf20sm1862466pgc.63.2024.02.15.14.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:13:18 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-poetry-core: upgrade 1.8.1 -> 1.9.0
Date: Thu, 15 Feb 2024 14:04:55 -0800
Message-Id: <20240215220454.1541163-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195709

This version deprecates "poetry.core.masonry.builder", but we detect
"poetry.core.masonry.api" in recipetool and nothing has broken our
build of wheels.

Thanks to Ross for noticing that the
"from poetry.core.masonry.builders.wheel import WheelBuilder"
is not a massive change in practice.

Changes:

1.9.0 - 2024-02-02

Added
* Add a to key in tool.poetry.packages to allow custom subpackage names (#672).
* Add support for path dependencies that do not define a build system (#675).
* Add a tool.poetry.package-mode key to support non-package mode (#661).

Changed
* Update list of supported licenses (#659, #669, #678, #694).
* Improve support for PEP 691 JSON-based Simple API (#664).
* Establish zipapp compatibility (#670).
* Rework list of files included in build artifacts (#666).
* Improve performance by treating collections in packages as immutable (#663).
* Deprecate poetry.core.masonry.builder (#682).
* Deprecate scripts that depend on extras (#690).

Fixed
* Fix an issue where insignificant errors were printed if the working
  directory is not inside a git repository (#684).
* Fix an issue where the project's directory was not recognized as git
  repository on Windows due to an encoding issue (#685).

Vendoring
* fastjsonschema==2.19.1
* lark==1.1.8

https://github.com/python-poetry/poetry-core/blob/main/CHANGELOG.md#190---2024-02-02

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested by running meta-python-image-ptest-python3-tomlkit. All tests pass.
Manual python3> import poetry.core; print(poetry.core.__version__) worked as well.

 ...ython3-poetry-core_1.8.1.bb => python3-poetry-core_1.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.8.1.bb => python3-poetry-core_1.9.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
index fcb6d30ee00..dfb29c4b863 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "67a76c671da2a70e55047cddda83566035b701f7e463b32a2abfeac6e2a16376"
+SRC_URI[sha256sum] = "fa7a4001eae8aa572ee84f35feb510b321bd652e5cf9293249d62853e1f935a2"
 
 inherit python_poetry_core pypi
 PYPI_ARCHIVE_NAME = "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
-- 
2.34.1


