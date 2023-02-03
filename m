Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B1BC636D4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:51:11 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17886.1675446645464898998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QUN7Gjf3;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id m13so5976388plx.13
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7DhWG2+fdjp5YFl2hcBkuOUhaRS1BzRlWZKUydYlAo=;
        b=QUN7Gjf36KrkyCyUOqGAf2gPk7lNOh4tmjibmKUc58vDHdL0/xtI9Di55l+zImRt0h
         NCUF0f1US5mbqUea18hg8C7cga9+kGeQk9KNXA2OeEhHvPuxr7XWGsqgX7mo7mEGcQjE
         mA7dyHlt5Qy0tTXasw0U8co1f17e/mL4CPVM2XfJ2trCVvYEQStQnUNgZLjte0A6IXEA
         2AaGFSTYvwGTTFTbWpbFpUw0/Z0YPLQmc6CZ9FwSdaHn+95qqaCsDt5lPIUen6q/zhc3
         5qd6+pEYc51+CfN/F9mb023rn73o+IImdXxJQVH0nwe7B6799t0gRtqxh1awUT8dz2/y
         10xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7DhWG2+fdjp5YFl2hcBkuOUhaRS1BzRlWZKUydYlAo=;
        b=vOMgP+Vv0TrOku4Ar2MdcOT74VMmRUx7DfFWb/g9sjNtIGhYNGDFAig9NCu9sCWzVB
         Ybt6xwE9M+tDP0xUIAGTXhe1p+iOe5v+arScbpukwLKAS7UgDKgDeKRP+YGgPgrFV746
         VHKaueoucYbWWZVgFo7cELdT+FF1q65fjyfqrBTT+4ddaFFrjNZm3NVqm1HUqnO7aEwt
         0OLjnmXHYedVW4WOPFhTE8siSN0/iRNaAEGY4tzQOiTqNHeV0kKIBWZHXJfkLfSrvHt8
         ixYrxJ1K7WXfeTCt88FfTeUc5E/1JF447IZrdTwYJQ3+fcd2AkI7LnsvUeB38HOW3Rol
         PC5Q==
X-Gm-Message-State: AO0yUKX7XyThwJhKLMPhtqB6Xia8bkDE+t5AkVAgci06vo7XIV4wm/my
	BdUvhbTBnbN9YZ9juO+CccbSMafK4yM=
X-Google-Smtp-Source: AK7set/7Zuem3orAsTrs4gcE9HKHJnH+ohw4KyW+QjgxYdj0/NvuBDThGW96xqoC6A40V/9lRV4Uzw==
X-Received: by 2002:a17:90a:1a44:b0:22b:bafb:179c with SMTP id 4-20020a17090a1a4400b0022bbafb179cmr11425176pjl.26.1675446670004;
        Fri, 03 Feb 2023 09:51:10 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.51.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:51:09 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/14] python3-sphinxcontrib-htmlhelp: 2.0.0 -> 2.0.1
Date: Fri,  3 Feb 2023 09:50:31 -0800
Message-Id: <543390693f24edde12bab3a395057fb33e132227.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176744

* inherit python_setuptools_build_meta

https://github.com/sphinx-doc/sphinxcontrib-htmlhelp/blob/master/CHANGES

Release 2.0.1 (2023-01-31)
==========================

* Drop support for Python 3.7 and lower
* Fix deprecation warnings from Sphinx 6.1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...lhelp_2.0.0.bb => python3-sphinxcontrib-htmlhelp_2.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-htmlhelp_2.0.0.bb => python3-sphinxcontrib-htmlhelp_2.0.1.bb} (70%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb
index cd8b987e0c8..39589881daa 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24dce5ef6a13563241c24bc366f48886"
 
-SRC_URI[sha256sum] = "f5f8bb2d0d629f398bf47d0d69c07bc13b65f75a81ad9e2f71a63d4b7a2f6db2"
+SRC_URI[sha256sum] = "0cbdd302815330058422b98a113195c9249825d681e18f11e8b1f78a2f11efff"
 
 PYPI_PACKAGE = "sphinxcontrib-htmlhelp"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


