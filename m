Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9F9C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:14 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.3415.1647298153282022044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ANyv0X8l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id h15so26293254wrc.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TiDDEreCTFBihNvO1qfmOlf+sdik+9F76hdovF337nY=;
        b=ANyv0X8lblBMI7qb0aP5FjYxLSZ35JMxXxcZR6Y7irsSdwiDAsdYao2aCvzVO1tpSZ
         p7ZiHe+D2DE8olwl/s9/bPP81S/jaZzlQ+NOqjPwIPn6Oa9gPqvhU6QKKnuEdDqRIOw+
         lszm/i3T35mWkvO3jTaBD7KbXoet3+UB1DjEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TiDDEreCTFBihNvO1qfmOlf+sdik+9F76hdovF337nY=;
        b=x3BEGWpoMJD0lMrmWZ72aOUAAbsvHMijU7dbPsyg2WkRWTIo8Zsr8Q6ljpDi8IA6fb
         CdrVAFQKVBb5p3AcwEYCxzvXU0GBInZDW/3LnF8KfklFmLI4qDfjPqCmDNdgrrv+k7Bz
         Pic4LBD4eEY9XO7OvfaUquqENY87P42s4UlLdZrsu5/ApyXAUW5VrDQ8lSdMFNvPO1NG
         Meu9bqp++g3qUvwqgxAy4qmBdoYtt6GEcVFakDvdwMhpa5hzc0VWB3yEgJSbX/BDKO6Q
         ouS6n+72XWyXhf/TiFaEyCRtWJ+MWtEyE9d477TA+CVY3Vfc29nM1uZLxjuFSvE5783a
         Ir6g==
X-Gm-Message-State: AOAM5330hjOFwrO2p1QxwaJeAG1pmI7qHS5Cf3hUuIc8P49Ho1yL6D55
	iu+JFk3l2ee9Z98iMb4TsGMKuGTn+by6eq1W
X-Google-Smtp-Source: 
 ABdhPJz6CTzuiqOASBLuAa9j+6emC95fPX0k8ZFSplfPCXYh6M9fH4tGAKEzljaP60gsGu5PWxjywA==
X-Received: by 2002:a05:6000:23a:b0:1f0:2359:9cd5 with SMTP id
 l26-20020a056000023a00b001f023599cd5mr17755340wrz.335.1647298151605;
        Mon, 14 Mar 2022 15:49:11 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:49:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 32/33] python3-cryptography: remove obsolete
 PIP_INSTALL_DIST_PATH
Date: Mon, 14 Mar 2022 22:48:36 +0000
Message-Id: <20220314224837.834776-32-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163198

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-cryptography_36.0.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
index 09f940272a4..e33eaa50834 100644
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
@@ -21,8 +21,6 @@ SRC_URI += " \
 
 inherit pypi python_setuptools3_rust
 
-PIP_INSTALL_DIST_PATH = "${S}/dist"
-
 DEPENDS += " \
     ${PYTHON_PN}-asn1crypto-native \
     ${PYTHON_PN}-cffi-native \
-- 
2.32.0


