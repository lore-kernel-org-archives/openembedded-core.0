Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1E3C4167B
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:03 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.7371.1651727156256665817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Srfoaws5;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id t5so3882371edw.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eYWbBhl5V2K6g0iT4l+DEeLMg2ogTsbrfIjmiSpiqqQ=;
        b=Srfoaws5pTtmsTivDsx8ulvpl9nr730XUxM0QtGXnRDHth1L62keUACMsTZvZBtJpi
         94x0lwR+A+CrnKUXFuEVG+BISxcyIs0iSCHol55GWXMKUFQwQTS/f0ex0tXQiML6tEBn
         7xMWK8NuC1z8YLul5Thfyxz+NyjOYCMCwCs4hPFjuLmxRqiDJKtr9vXSCMK7kYWFQD4I
         D1uHfNCEUo5yPp3tHN5r7S/BK7GFXY827vlS8ykI3cJsRlfLb7sRiDAV86vPvfY1PTMa
         sssNPZjs+PbzXJvJP8gSoiNke109+WlJmpmROTnZMcIeDpAcQP4JMseyp9J8bHvl5cv3
         WUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eYWbBhl5V2K6g0iT4l+DEeLMg2ogTsbrfIjmiSpiqqQ=;
        b=ZEzcZ9NFx6+zUivWF+DyvtoFu8wW3LDzUoLJxLbGCdwb+v0i2pUyhRbnbzNM3X3IIl
         X0PqLCjWSvxRnCCvF0xA+OsahNDyiOdXbNZMEjWCcEEyPPqAfjCOfEvuM/Zd28jYIWGq
         dC7RkUY6th/y4c2esVj/tlm17r4xoC35JMhKdyy+rZcHt07dUAdSbU3126EflO74cNTs
         HOkEqVzYqfeByuAj+tBzjcrxQKuKuu+3SNw37+tN3bgXhc0dRVLbmYd3UGpyt6AdNATr
         NpAvCPyiFYB+GDEBZEcY33cI1UTkd8tX+QzZ4kqh7fqKyauj4uX0U3DBUL/EhdHGwGQa
         8hYA==
X-Gm-Message-State: AOAM531SmBwTGVyjoYg7nq6Ejw77XkhbsapNhKfROnNqxGXPKrBUnVtY
	g3GBbfOd3yRrbzcG3I8Gci10jU7Tsis=
X-Google-Smtp-Source: 
 ABdhPJyoNK6MInv+OzYyXBF7A50VWMRBY7fPkhApLH3x/r0qoujs0hdt7J7YUL1JZ+2Z1gJ14CR8JQ==
X-Received: by 2002:a05:6402:298b:b0:41d:675f:8b44 with SMTP id
 eq11-20020a056402298b00b0041d675f8b44mr27377313edb.377.1651727154808;
        Wed, 04 May 2022 22:05:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/61] python3-mako: upgrade 1.1.6 -> 1.2.0
Date: Thu,  5 May 2022 07:04:53 +0200
Message-Id: <20220505050544.651895-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165239

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb} (59%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
similarity index 59%
rename from meta/recipes-devtools/python/python3-mako_1.1.6.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.0.bb
index 71e5d96ba1..11e5f326bd 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
@@ -2,16 +2,18 @@ SUMMARY = "Templating library for Python"
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
+                  ${PYTHON_PN}-markupsafe \
                   ${PYTHON_PN}-netclient \
+                  ${PYTHON_PN}-pygments \
                   ${PYTHON_PN}-threading \
 "
 
-- 
2.30.2


