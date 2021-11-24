Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6FEC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:46 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.4105.1637788484821301399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HFxFF1NL;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id t6so5080027qkg.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MkeMM+lA/Zxp7jgJ4V+Tukv1Dp1WqEN5wbOFUu/tOms=;
        b=HFxFF1NLCjZzOgs+ARW7vzE3QVTxhJ23ploK4ZjGQgHm6Vyv+ZUEL3wns5XI08acox
         L1Cxn6tNb9BVWqvpGoq6li/I2dBsa9OoV1uOtlQqTO7f56QIO3W2vac7Q5MK37jqFagC
         cAHuEWEiorJM8ZjFvKvuk8yECLVFCmpa7/pyhG0Lj3K6tdNHRX3T0XuxMs2a1oAwQJ/J
         GyD9gfNLMnrSIlSdEuADvjeevDXz/mOPsG2eTNAbF/00Jxd9O8XQ4qW0VzGbI/ALKUj5
         c4svshDlWxYzLEUJgJspiQWCMs9cLk8v4/qiyFWRahFBkozMaAEnw2D8I3SFvzv4ndrG
         dyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MkeMM+lA/Zxp7jgJ4V+Tukv1Dp1WqEN5wbOFUu/tOms=;
        b=lq2cJUYJ0yvrwUL4zPBL6SOhRLcXck7CqLJqrKhGKijvwFiyKUOHSEh0iTmb/Spo0d
         phrEq/9DLnyLEEQOrGWKUi5hhOKjD4F3xun864UWZDdWYOyEYpfvaU53M+SC4uw0uyPV
         /DtdcmwKynhsTBO5c4AbG5O1EbWuaO6sMKJs4KQ80beb/XZZ8LhgtX84vvY0wUDN+vT1
         x19n9gGl9N+FiMVwrcXxIAsZSvnl6WJEvxUac1DeLkd+Gx1Xqus934fUYONFPe4n4JvB
         bLVk3xX4moLK102tL8g7+/ePUcL3S7BQd1pN22Y8C5gyDglHvghrDt9DeT/EwtTljBV2
         zzbg==
X-Gm-Message-State: AOAM531CXbQHq7FjKhSHwPiASV+dW3XGUeZUD7TNQ2+daK2ZlD7rbcSf
	TmaFabzEJnUYeocTBwWFZtA=
X-Google-Smtp-Source: 
 ABdhPJwVn34kbGjfTuosMlPjvjpK1qZLWg/PYkDudY55x5qDFHJ4ldVFce3K5r26gYpFNHtJkpSgRg==
X-Received: by 2002:a37:5f44:: with SMTP id t65mr9652464qkb.32.1637788483968;
        Wed, 24 Nov 2021 13:14:43 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:43 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 15/20] maintainers: update for kernel dtschema checking
 dependencies
Date: Wed, 24 Nov 2021 16:14:21 -0500
Message-Id: 
 <2abfc319d9c5654fe87470c3237e53b9b95f4df2.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158761

From: Bruce Ashfield <bruce.ashfield@gmail.com>

These packages are required for dtschema checking in the
kernel build. Adding myself as the maintainer.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5423358e77..c717cfbbe1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -597,16 +597,21 @@ RECIPE_MAINTAINER:pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr
 RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-dtschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-pyrsistent = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-hypothesis = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-idna = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-importlib-metadata = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-iniconfig = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-python3-python3-jsonpointer = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-python3-jsonschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -628,6 +633,10 @@ RECIPE_MAINTAINER:pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksan
 RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-pytest = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-rfc3339-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-rfc3986-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-rfc3987 = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-scons-native = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -636,12 +645,15 @@ RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-strict-rfc3339 = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-toml = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-tomli = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-typogrify = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-vcversioner = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-webcolors = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-zipp = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-qemu-helper-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.19.1


