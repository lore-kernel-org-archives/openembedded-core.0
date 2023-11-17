Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97ED0C072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 17:24:55 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.1379.1700241892109891293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 09:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lLiJ7a/Q;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6c4cf0aea06so2171702b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 09:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700241891; x=1700846691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=07+jqoa8723kOf1GFnZvKFpOnXjzJsUC9TY9WGABH88=;
        b=lLiJ7a/QqSr6wFMg7YXQ6dqw40bA3/WX7lVXTOQwR12dq4dGbZK+D+TPVx7itgAfdG
         +PP3Pi16BTXRSyKOGk4tWIvO4tmpTTzD2X0zkk0dXC6fKZrUydrJ2/bcu5e29DtJS8rD
         fkIqsmMLWB1JQ5y6h2s+JvB6GY+Cj/NtKwX6NboX56Nm7PMyYd/aJ3rrIisuGPf7vJUp
         2Wo71S66AXWXhyGr4E9MbYsSpLtAHZDfIb92v8o52xjpgD5skPGwAGXiRPDMw3V3+Ngc
         BWjGo2JxuZtx42+i+9GlLL8vcK9lM3b+AtTuCteaL/t5SAsJXcBMUp0SWwGuc7IGgC5P
         tRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700241891; x=1700846691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07+jqoa8723kOf1GFnZvKFpOnXjzJsUC9TY9WGABH88=;
        b=STP+FIbpXtmhXiaOHWvw9mMLeHnMKtSbOiCpFEAljxGv/JyBoH2Z/ciEn+8ZAIrT3c
         YOjQCf7qS9nRM0RIEXNTYvQR4mlRIEyZXDUT/mRKdYPiEoS2x6VSgvVpoVyXNxXzP6MZ
         ByN1JqA62t/6I46hUTY6s9DlqneO9M7aU2UP5W2GUF1AwRFEJIC0qzC96VwizRMORbHd
         XLwbvVQ1MFCGyFtaNI2dDhRLyVHHi2MtsLmS1AM0Vu7jX9xy7ugkbLTLYcI+ldWHNFjW
         o8sO5sde+W5qGIcounghWGbppQzYDRtn1nMVrM22gu4267NFs2TWqdcf+XBJQYPHe/zD
         eUHw==
X-Gm-Message-State: AOJu0Yy3MzTEBwJc2nDq4XD53gnqsXhqOzeJSCsg+5x1uI0Bjr+f7htv
	VC5GWaqXA8UAf3hYSuXUOlhIAQMn6qw4IQ==
X-Google-Smtp-Source: AGHT+IHTqg40A36SW6Ew2NokJ0qe37kxbbrK32+AQOadIlrupa33eAq9pJY5rm+PpgPyXas2GaGB6g==
X-Received: by 2002:a05:6a00:24c9:b0:6c3:871a:7f0f with SMTP id d9-20020a056a0024c900b006c3871a7f0fmr34853pfv.5.1700241891053;
        Fri, 17 Nov 2023 09:24:51 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:3fa:1e17:52a9:6eff])
        by smtp.gmail.com with ESMTPSA id s2-20020aa78d42000000b006be5af77f06sm1655608pfe.2.2023.11.17.09.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 09:24:50 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-setuptools-scm: upgrade 7.1.0 -> 8.0.4
Date: Fri, 17 Nov 2023 09:23:42 -0800
Message-Id: <20231117172341.559517-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 17:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190856

See 8.0.0 changelog for breaking changes.

8.0.1, 8.0.2 and 8.0.3 were bug fix releases
8.0.4 has bug fixes and other changes

https://github.com/pypa/setuptools_scm/blob/main/CHANGELOG.md#v804
https://github.com/pypa/setuptools_scm/blob/main/CHANGELOG.md#v803
https://github.com/pypa/setuptools_scm/blob/main/CHANGELOG.md#v802
https://github.com/pypa/setuptools_scm/blob/main/CHANGELOG.md#v801
https://github.com/pypa/setuptools_scm/blob/main/CHANGELOG.md#v800

* Drop PYPI_PACKAGE override (no longer needed)
* Wrap DESCRIPTION so the line length is <80 chars.

License-Update: use LICENSE file for checksum, remains MIT

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ools-scm_7.1.0.bb => python3-setuptools-scm_8.0.4.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_7.1.0.bb => python3-setuptools-scm_8.0.4.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb b/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
index bb13c654606..5467b793ce0 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
@@ -1,12 +1,13 @@
 SUMMARY = "the blessed package to manage your versions by scm tags"
 HOMEPAGE = "https://pypi.org/project/setuptools-scm/"
-DESCRIPTION = "setuptools_scm handles managing your Python package versions in SCM metadata instead of declaring them as the version argument or in a SCM managed file."
+DESCRIPTION = "setuptools_scm handles managing your Python package \
+versions in SCM metadata instead of declaring them as the version \
+argument or in a SCM managed file."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "6c508345a771aad7d56ebff0e70628bf2b0ec7573762be9960214730de278f27"
+SRC_URI[sha256sum] = "b5f43ff6800669595193fd09891564ee9d1d7dcb196cab4b2506d53a2e1c95c7"
 
-PYPI_PACKAGE = "setuptools_scm"
 inherit pypi python_setuptools_build_meta
 
 UPSTREAM_CHECK_REGEX = "scm-(?P<pver>.*)\.tar"
-- 
2.34.1


