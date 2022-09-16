Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD969C6FA86
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:34 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.893.1663362513532199412
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AKzTnRH9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id d2so2383626wrq.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=ZDyAcdsjELjQQVPAZBCkJJYUpRgGVH5BTu+8AIdsSO0=;
        b=AKzTnRH9tvq2FRloKG/Ne7U9Hcd1P8T8/AadjRIuehZTSeuRBzIHSkY3hH7ClBtgtJ
         wTQnMeoFTKjHafOV+Mrz1oTA9GhBwbDUvD0q6eTPDBGZRlbcffOfX73hkA/9PllKXlWj
         O/UEVunSONylcJPRBCtd9x2+4W1UB1IO3HMQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZDyAcdsjELjQQVPAZBCkJJYUpRgGVH5BTu+8AIdsSO0=;
        b=ps3fJAO5YcRa9YrLNMDV1d1Ot9vlh23uZaoRwKR5utSbKGz/xhzFs688NYTZN76ZfC
         DLvnJpulyTAQYhBnrRP4mQSY9jwa6Om6g0k7bkUPsNIRkbs3dal08yTgfJJAOy7dhrsa
         dZyWKw97852UPP8NAzRdEdNSps+9mv7iprqZ8QOgGvG6QCXZypxSmtXRxCJY7MKjskUK
         Esm3dhVRoMLrayeE+/uNqxkr7OWvqO5i3LezYODaeh8RJewDBQms1vOMBD9RCLczhFpe
         fx8fkVrTCw2ClFaS0Os3csd/YMf/G+SHTckZia4U9M4yICIi2U8/pkNWdtxDT6lwlALa
         i4Tw==
X-Gm-Message-State: ACrzQf3nkR9Tcm/GAg95xfWfxQTqYV1Nnh+RiafIbhrQz3uHU8vFqD9J
	Vitv2HtmVj61bDdcisjN0towRi86xxrRhg==
X-Google-Smtp-Source: 
 AMsMyM7nx7Uo1wG7TTvpQe9CS+cN3+W4Xh8hiEUmCa3H+qnImZeI+h0jbw/BJ4CXxDEB5mNLvWVgJw==
X-Received: by 2002:adf:d4c9:0:b0:228:de3a:220f with SMTP id
 w9-20020adfd4c9000000b00228de3a220fmr4142334wrk.597.1663362511398;
        Fri, 16 Sep 2022 14:08:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/24] python3-hatchling: upgrade 1.8.1 -> 1.9.0
Date: Fri, 16 Sep 2022 22:08:05 +0100
Message-Id: <20220916210818.1228761-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170809

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-hatchling_1.8.1.bb => python3-hatchling_1.9.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.8.1.bb => python3-hatchling_1.9.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.8.1.bb b/meta/recipes-devtools/python/python3-hatchling_1.9.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.8.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.9.0.bb
index bfdb664715d..011f5ed1101 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.8.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.9.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "448b04b23faed669b2b565b998ac955af4feea66c5deed3a1212ac9399d2e1cd"
+SRC_URI[sha256sum] = "b57c7362f437b9426e4b94228a21d2ac5804fbb2abcb01adde2544a35bb303cd"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.34.1


