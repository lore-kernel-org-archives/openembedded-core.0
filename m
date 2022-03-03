Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3177C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 20:44:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.16280.1646340265987046731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 12:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lW0kiQCh;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id e2so5828008pls.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 12:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SbGQgx++i6Fb3q1UgUNFKq+qo4SmWR6KNVZco8Wjmrk=;
        b=lW0kiQChtmq5xAX8pYic+BJaAKL9HzUVdEruEOMM5SzTGNvYJ8hjlibO7jPNB9cK1J
         ez5AcNrxZm7jCi3naiXhyxdWESt5ACJZFopgK8D5eh/YKmIexeSUyz7Y2iMgTZkK7trz
         fcTAzIJSHK399V/mlPnZVAmfhw/7gjiyS9BY2Mws95teBgPwUiTK2ki88lZ3uDvlYZrj
         u2l+hqhGPDJlFnDRUHdX3qCByyL47fOFcqFBvUS5xzy85WyK+sE5/AYtUQUsn/4jlRvN
         C1YuDz4f9TLGPb9AG94hc0Y1VNGcSZaipY7YvEqrWmgKGSDPGvNFCg0vZUKhGJ9Eufbn
         ywgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SbGQgx++i6Fb3q1UgUNFKq+qo4SmWR6KNVZco8Wjmrk=;
        b=JC18wtACTCfG0GuLBkbglXHnPfLYexaoryLxE29w2MJq0E1wKu9VlTaZQ8OpVdyAZ4
         GIaR7FVtBoqOCKDSho2QX5uQJexIcAAuACGavAyOs0PdQ/ehz0hRuIIA98ddVrolbbCX
         AQkzGeYyhrAE/YJ7lQI2Kg4+lyIO2V5tajehjipOoJoF3TsTjeQ1lC8xhCwjx93v1XSe
         5gsYJvnoTP1p4SumBFrwdU9z+rEITDXY21G5S3kkbBTE9wujnrewDwOZA4w29RquZMsT
         HKwPfcMXvsOnCbNVnoR7CQOtu1aJ0vSec5XzSN5SmqsouNsbjJiMDdbvRTm+mK98f4zG
         S1XQ==
X-Gm-Message-State: AOAM531OgyE/Zm3zOd12I5V9XA0MjciKylP+kJGdr0y7hJg1sRx3h0pr
	oTnrwbeHnRSoQQLtbwDeUnwCvnObHfs=
X-Google-Smtp-Source: 
 ABdhPJxUGStFogcmmvKsfZdnCQGB8wiGRhPCub2RdwqJdD4M7738B/wXTOK7+EjdtasCEQN3uc2aXQ==
X-Received: by 2002:a17:902:9a41:b0:149:a13f:af62 with SMTP id
 x1-20020a1709029a4100b00149a13faf62mr37765875plv.147.1646340264869;
        Thu, 03 Mar 2022 12:44:24 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:e8f6:820a:4d41:403d])
        by smtp.gmail.com with ESMTPSA id
 nh8-20020a17090b364800b001bc422b7b47sm2959899pjb.15.2022.03.03.12.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 12:44:24 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] python3-jsonschema: upgrade 3.2.0 -> 4.4.0
Date: Thu,  3 Mar 2022 12:44:10 -0800
Message-Id: <20220303204410.1206736-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303204410.1206736-1-tim.orling@konsulko.com>
References: <20220303204410.1206736-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 20:44:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162700

Upstream changed from setup.py to pyproject.toml+setup.cfg

inherit setuptools_build_meta

For changes see:
https://github.com/Julian/jsonschema/blob/main/CHANGELOG.rst#v440

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...n3-jsonschema_3.2.0.bb => python3-jsonschema_4.4.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_3.2.0.bb => python3-jsonschema_4.4.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
index c7efe33a832..4c142296410 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "https://github.com/Julian/jsonschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
-DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "f1a0b5011f05a02a8dee1070cd10a26d"
-SRC_URI[sha256sum] = "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
+SRC_URI[sha256sum] = "636694eb41b3535ed608fe04129f26542b59ed99808b4f688aa32dcf55317a83"
+
+inherit pypi setuptools_build_meta
 
-inherit pypi setuptools3
+DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
 
 PACKAGECONFIG ??= "format"
 PACKAGECONFIG[format] = ",,,\
-- 
2.30.2


