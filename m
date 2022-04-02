Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E78C64E7C
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:48 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web08.10742.1648899307271152635
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Apr 2022 04:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=rlrVRRss;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.174, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f174.google.com with SMTP id h11so7044583ljb.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Apr 2022 04:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4iL1szt3c59U41AfaiACNTZpt7UTtZsL4oLj9vig0Q=;
        b=rlrVRRssN2UbBvT/5t+pjQh37qDbJONuAfi04MMUr+pA/OTxjWURnqqdTOB9j28hiB
         ip9lQQUKe0ZvCH9ELmrgBiP9cKNhGC0hOrmcNPWN+rJlRuYq87APYQW/GVY3+7iZ/6lS
         JgVL42JzOChJqCQu3U7RFwBvsuYklHXvOyww2fpHf+2kCnIhNr6Frd1J+KGYEdZaeNc3
         Htalmyn6/wDJXLMDn8ioniwr5urZOLrIngFl5wou1d5OeBfehFcUWx4O+D4ofzRYkyFF
         fBgXLAOzcHIquHeG+ATwxR8kiYExhhat9fiuT3k8nLFql+0GsJeWOoXlwHPsVsrMPLdZ
         0Viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4iL1szt3c59U41AfaiACNTZpt7UTtZsL4oLj9vig0Q=;
        b=fXsmbnI/vhBFaCPv6z5GsrJgb7XLL4lhcFRJW54JVsvgDfpPo0jShQm4G1TD7BGY29
         DGvdMX4iAq4Jp33ZHXEiJrGXrCGBQzSBeRmQ4S68IJFdePSbDrNN2jhkKxPdGaWolMQD
         TLL9q/GvgvwlQw7kMlG8zW0N20+Lhci7807LSu02SCN5K0FidpEDv7ICpQkXiBS7XjU8
         LjZsm9e40yOcaEeJn3DEm2+OiX2+nOnsEsSJmj77R8eWAZxExIBcgHnJ5KZLAq7UjVKX
         9KGb+VFhzNXF7x0ZZCuskA3Y4SfJWIxmmnpG3JpHfji43D2jVfHq30knn/7RECjKWan3
         hG4Q==
X-Gm-Message-State: AOAM532kz7YpXfTnNLoUEl25PhrS2qh2xaKV/BRsV+kPKGXUoGum2nIt
	uNA7EW+Vp8y6fpt7D8aV0RpGD54bcN8FGViY
X-Google-Smtp-Source: 
 ABdhPJw1jR+MPHqU2FzWBONDWql/FtLU8+u1fIZ1Bti/z6ZAKm3yO40xF0mMR8kLRdGS57oeXoDkZw==
X-Received: by 2002:a2e:82c5:0:b0:247:e81f:8b02 with SMTP id
 n5-20020a2e82c5000000b00247e81f8b02mr15883176ljh.90.1648899304756;
        Sat, 02 Apr 2022 04:35:04 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 d2-20020a194f02000000b0044a2b77cd8dsm501644lfb.105.2022.04.02.04.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:35:04 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-mako: update to 1.2.0
Date: Sat,  2 Apr 2022 13:35:02 +0200
Message-Id: <20220402113502.1885773-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163955

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-mako_1.1.6.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.0.bb
index 71e5d96ba1..1acbda533d 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
+SRC_URI[sha256sum] = "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
-- 
2.25.1


