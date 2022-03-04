Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A871CC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 17:20:18 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.1123.1646414417604001022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 09:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LLHzTX51;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 k5-20020a17090a3cc500b001befa0d3102so5714550pjd.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 09:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WGZMta12jqQR2epwcCg3IcxM/a8mob4iSj/NSpuX050=;
        b=LLHzTX51e4xC5I/5/2eOqqGn2Uneu6p9IiWApmeTmhN70/wbm/0prCZpaTZHxaTOHt
         HCCLywMd8cs0B1EztHTwmigLaVgugLdRA2aQ/WhIRN/Ye87tZMwlqQFAepCtuTxOGM1v
         qQVuWYipqTlAq2Xl5Wsgem7uehwiip4P3fxeHPdUWL2HI5+brUB0PVmdo11IkYztVYoJ
         jijpXH96XmyRICIq4kRT9nUV4HkC8Oi9mN6aW/zOoyZAiosJ8V+JnFb23N05IxtoaZvy
         1BMf4iplVLupvhI3R2WYYLGeduIycdUA3YB5j/wqMJz/FPkY8KK8CGZiRn7AWhJEsGp8
         HUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WGZMta12jqQR2epwcCg3IcxM/a8mob4iSj/NSpuX050=;
        b=2wEHPAYdMnyd+RsPmUs6GfgL/4trcs+gFYa2Lrym3zpGHN63dDw4+rEMNSn1NchngN
         53ATZrK8Ac0E0UeKtm3dBehzBd9OeiNqgIf+4WJpi7fdsUsa27eRhfie7+8PGYYym5vl
         cDNQ0qgJfVw4ng+5tpQ4FdTfEMynUxsboD3R8CxfiIl0PQUxWxFRN747m9eK0p/bXA1I
         QkwSzdL6gUj1t5R0MX4J68/536+Sl3rNZVzjpOmxJFIv1XF5ZO3r41CNf4Pk5GOXBoI5
         fawaNtVUzMYPv5JTa7UiZYus8W0lM5mV0EfINdpmL0LNz5kkgYsQLFL2jDTtXTuTBHiO
         Z/lQ==
X-Gm-Message-State: AOAM533OSR6lJbhqEuHPSlA67Bj8ARsU/eGOkFhUHJX1vetdW+evyiBQ
	8VQ18Xh/gqXjXJOJ9I1t4kacdiIxmhU=
X-Google-Smtp-Source: 
 ABdhPJzWmwyTVKSQltoV3iDXL1UHTMJb2aR1oBdIsgVwrf400Pmb+0mj2g0GOdlGMSiyeWydDpBagg==
X-Received: by 2002:a17:90b:3846:b0:1be:fbc2:1f61 with SMTP id
 nl6-20020a17090b384600b001befbc21f61mr11630581pjb.209.1646414416520;
        Fri, 04 Mar 2022 09:20:16 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:6dce:93ef:d2d6:2670])
        by smtp.gmail.com with ESMTPSA id
 kb6-20020a17090ae7c600b001bee8664d82sm10278468pjb.35.2022.03.04.09.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 09:20:15 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2] python3-importlib-metadata: upgrade 4.10.1 -> 4.11.2
Date: Fri,  4 Mar 2022 09:19:40 -0800
Message-Id: <20220304171939.1421472-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 17:20:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162748

inherit setuptools_build_meta

v4.11.2
369: Fixed bug where EntryPoint.extras was returning match objects and not the extras strings.

v4.11.1
367: In Distribution.requires for egg-info, if requires.txt is empty, return an empty list.

v4.11.0
bpo-46246: Added __slots__ to EntryPoints.

v4.10.2
365 and bpo-46546: Avoid leaking method_name in DeprecatedList.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Change in v2:
  * _actually_ inherit setuptools_build_meta

 ...etadata_4.10.1.bb => python3-importlib-metadata_4.11.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.10.1.bb => python3-importlib-metadata_4.11.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.10.1.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.10.1.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb
index ff40def563f..25be7e7fb67 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.10.1.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "951f0d8a5b7260e9db5e41d429285b5f451e928479f19d80818878527d36e95e"
+SRC_URI[sha256sum] = "b36ffa925fe3139b2f6ff11d6925ffd4fa7bc47870165e3ac260ac7b4f91e6ac"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.30.2


