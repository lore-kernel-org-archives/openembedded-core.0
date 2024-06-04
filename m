Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B01FC25B7E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 07:01:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.15356.1717484505039533169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 00:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FH83rl2b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-421338c4c3bso7172445e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 00:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717484503; x=1718089303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rMf9byzp0GJnPHpHdjoL0wPz/+FvVan9y571cu+XBAA=;
        b=FH83rl2bzjCDnIGo+SNhYxweH+KD0XMyZ1A/r+X4s3EryQXnURdiD53XvPVjrz7tjD
         ayUSCs4otTnobNpohd17kWlrf3keHQnTop26OapRs19wW7WUctNqKxs7ckSS0R37rHqw
         SAv/2McTTG529usQ1jmsFENg1npquDbzZNkAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717484503; x=1718089303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMf9byzp0GJnPHpHdjoL0wPz/+FvVan9y571cu+XBAA=;
        b=Ee/o2cspm2axLT/+EYri8wqdHnhVnDdiQwv49OShj9akmG32c0A+LM0XLcrkvtwQtS
         ssqKp4oKCoQe5yVMKhUmsQhxVtAMPJOy+hLS7WrK/WRP6KCuOGVt0XVQ64TKFxCFiDTS
         i4llCLxxI98T7FvIeZkH7zgXjHuEFOiurBEJHJtxPRn3eoZZ6pAKmW8/xMeo9t/AN7df
         ybd7Wnb2l+jOEsuCWXrZazHtQPE8XlUr8c2e3uxQkKhe6TVP/fdUvaIrZHwGcoRix9tF
         kSxu8lzMrErJsRTZKss2kgr/eNUNYAw9lFd2lTXTovKaj3K+R+xDMbX8FVrrfwLOUcmT
         6rjw==
X-Gm-Message-State: AOJu0YzNS4EAMfqFDCDX/WeQT2r/1NnSf5qkP8rPjWhvdhP5xMWAGWpD
	+4Ho3nIxQ5V6Ks/EW5GC84/L111vel1OHebLh5lJX4RSsq6w8JLMEBjFDrUtQyeRbA/EVEm3s2L
	R
X-Google-Smtp-Source: AGHT+IHCkeRUwCX9MwiuIztf9eCChUrheGur1w1n5U9VdPAxI8e6mQxHnHLzF0umwIB/h2titURzdA==
X-Received: by 2002:a05:600c:45c3:b0:421:20ac:1251 with SMTP id 5b1f17b1804b1-4212e0b0922mr83831825e9.40.1717484502993;
        Tue, 04 Jun 2024 00:01:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9a5c:ae3c:1b90:53c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421387ea07csm92461785e9.15.2024.06.04.00.01.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 00:01:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-jinja2: Upgrade 3.1.3 -> 3.1.4
Date: Tue,  4 Jun 2024 08:01:40 +0100
Message-Id: <20240604070141.3609519-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 07:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200295

Switch to use flit core since upstream changed.

They also changed the capitalisation under pypi.

The license didn't change but the file was renamed, probably as it wasn't
rst.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-jinja2_3.1.3.bb => python3-jinja2_3.1.4.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.3.bb => python3-jinja2_3.1.4.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
index 636fb35811b..2c020370113 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
@@ -2,17 +2,17 @@ SUMMARY = "Python Jinja2: A small but fast and easy to use stand-alone template
 HOMEPAGE = "https://pypi.org/project/Jinja2/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "ac8bd6544d4bb2c9792bf3a159e80bba8fda7f07e81bc3aed565432d5925ba90"
+SRC_URI[sha256sum] = "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
 
-PYPI_PACKAGE = "Jinja2"
+PYPI_PACKAGE = "jinja2"
 
 CVE_PRODUCT = "jinja2 jinja"
 
 CLEANBROKEN = "1"
 
-inherit pypi setuptools3 ptest
+inherit pypi python_flit_core ptest
 
 SRC_URI += " \
 	file://run-ptest \

