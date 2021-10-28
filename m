Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2976CC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 21:18:43 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.197.1635455921879185714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 14:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=GqxJpV6k;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.47, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f47.google.com with SMTP id b32so13190685lfv.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 14:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RgsXcLW6BP1BbJ90qyOf7stcyXwnbbLt3u9hofdcqss=;
        b=GqxJpV6kZdg5+HDIX39F8/D8mOv23bu40m8jNOR7SHO2WXrpWoQyxDNSdkg3v+j5X0
         YNKGPGEGIZ/McuRdtzECKWNgbdiy0ucUj725GdXSGzTrJhAyFjz9vvpnpQ7tVZZwrnnl
         6tS6a57QjMQi0SPrR/pOuEbykA/1+uD/U8zWfjw7KrN9gC8M9BhDjmhv2lqKSwJ2wFJG
         z6n8GXM3TkPHwC66S99/zELPaiUj1gFBK3yG8DF56eRT3Z4An2E5GzlppVtxVqX5PlL8
         OfUtv14CLGJYJJhw/HnRyLETEzvbw/3hIKcD2i+FYqUhpj7h7qVqGMXrJBiQUQ8DGSYY
         85Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RgsXcLW6BP1BbJ90qyOf7stcyXwnbbLt3u9hofdcqss=;
        b=Ft/rtHmcGrVXBQ9xWuM+gSAIKU19P4Ym81Kr7X4NVZBC5edwjURDkg3ov4ah1TeY/d
         Mb0Uj1LPNcQNG6zqj6uh/EdBvedzEbt7/Hd+vdHOeoUP6hYX7+CpibDdLn372FJUR3rR
         CZAG5yJLWP1IwIItruONc2MpNOCsBFlTsQQBZWEGyVhz47aZctC9CpJaEu6t256Gsjgu
         BcZMrJqhQuaPl9Y8AaGSZ0xBVJJW8tNPyAvr3x3lZunNH6iMzu0zydLiOuDE0U67i42y
         WJ3dWQHpmYkIO72zBJZNGv8TAb8ZlPXeIzO0Yl4d8nEyKq2XvjB0Qcpzj4RNwedHdGiE
         4xDg==
X-Gm-Message-State: AOAM5302meV6Utb7eCiKN+pBQMk9W4d4P7362VUSeNhDJgFY1SqOCPrN
	VJr7zy68KDkZJL2y4OjZPkEmaOknq23SUeAF
X-Google-Smtp-Source: 
 ABdhPJyn2sNtPugDAWaE4ki91RnRqRakBNlYfIVTahN/u40ZuWMGm9KsfN8hx9Da3kA7/OkxqcLe0w==
X-Received: by 2002:a05:6512:3c97:: with SMTP id
 h23mr6529647lfv.640.1635455919475;
        Thu, 28 Oct 2021 14:18:39 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 f33sm421390lfv.255.2021.10.28.14.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 14:18:39 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-pybind11: update to 2.8.1
Date: Thu, 28 Oct 2021 23:18:37 +0200
Message-Id: <20211028211837.1353741-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 21:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157609

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-pybind11_2.7.0.bb => python3-pybind11_2.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.7.0.bb => python3-pybind11_2.8.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.7.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
index 348af6ec9..e954dbfb2 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/pybind/pybind11.git \
            file://0001-Do-not-strip-binaries.patch \
            file://0001-Do-not-check-pointer-size-when-cross-compiling.patch \
 "
-SRCREV = "65e95ea8675ea34bdd566d6461330f25c651e5a8"
+SRCREV = "f7b499615e14d70ab098a20deb0cdb3889998a1a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


