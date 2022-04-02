Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B01C64E95
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:48 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.10816.1648899640534898295
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Apr 2022 04:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=NfvWaZOg;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.181, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f181.google.com with SMTP id b43so6997165ljr.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Apr 2022 04:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X29Sd9AIHUIk5bCnxd5MXQtUiaIVjVbjrkB3XvS0748=;
        b=NfvWaZOg2hut8/evzxUtQ+ckQcaJi5Njk0LfJw97J0oP8PaX024Jb8G0h/zxuLOH+k
         zk3FP7q1ZQi3vKX5IRLq7g8lvjOy4Tr4HMrErVh5HULMnLLQTPTP9B+Mnncxi6eVyif1
         ov4d1e88Z1V45mrMHu9S0SFRS/EPDdCDrGs5ZdXKDnDfqTd4MnYysoOQ4o25AsUI8n7K
         4G/Wa0eNfAbmV6Qc5GcsahOIGY78uB4c9dNiE7LJcoUGBOBVLXsAxK312U4qnt1hROqd
         01uDqEWSoTq9FB+TgCa6P4NgE4EBDBbIWiP9mraSNQOAF7P16mm+8Vtusvw417AJkKHW
         I2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X29Sd9AIHUIk5bCnxd5MXQtUiaIVjVbjrkB3XvS0748=;
        b=sJqjDKDTPx9ssAKLmmZNou/QFvh2d1UvpBNaHAUOTGzoAsZ0E4zIneLYczkwYl/gaX
         R+YiaaIE2PJ3qLAO7j/W2+NA1favpXwjLlj/rz0KM4xa2TTtoaYeEkb473/KEtWJEo38
         M0oh4T/bI60y/0gMOEa6ltrBujiQXa7Y/SXMQlR60uo4ybzMA8WRBOGEtrW8WEAgJP3O
         Q+77FRwyB5rri4LyDN6khheYvUN3w/+uLeyOCw+uGJCCYUCIE4XraVfBgA7cFAzxSkY6
         18avFiSmePtD3dWj+2UgoTB0nC3Ee6Impd1pxHMuFuvVWqLHEN87mJaEzRtQGsynJ6Qf
         d/qw==
X-Gm-Message-State: AOAM532CDPpxQzRMVuDoMYEpGVz3EfMGfplRk+yl/r8PMm3DkAZbZkJR
	NsSJYjgZEaKWaZn3tWkesDTJ6YGNgPMCx6q4
X-Google-Smtp-Source: 
 ABdhPJwUSmyv0Pp4JKMqrYvz2dDB6n/WuPATtvn3a7sAqeHjXvoGJi4M3rsoy0HMvhMVy/rQjq+vyw==
X-Received: by 2002:a05:651c:19a3:b0:249:b26c:80d1 with SMTP id
 bx35-20020a05651c19a300b00249b26c80d1mr15763779ljb.344.1648899637880;
        Sat, 02 Apr 2022 04:40:37 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 r9-20020ac25f89000000b0044a1008c5d7sm501101lfe.234.2022.04.02.04.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:40:37 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] python3-mako: update to 1.2.0
Date: Sat,  2 Apr 2022 13:40:35 +0200
Message-Id: <20220402114035.2395065-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163956

License-Update: copyright years changed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb} (68%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
similarity index 68%
rename from meta/recipes-devtools/python/python3-mako_1.1.6.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.0.bb
index 71e5d96ba1..8abdddf362 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
@@ -2,13 +2,13 @@ SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=943eb67718222db21d44a4ef1836675f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b32291f107a8f1ea94c4a41e00a6a18d"
 
 PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
+SRC_URI[sha256sum] = "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
-- 
2.25.1


