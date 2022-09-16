Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FD2C6FA91
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:45 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.862.1663362520418492160
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ijiJn+op;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id z6so5450682wrq.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=G8LgEqWJ07nKDeBvzTAhJBGko3sMVjOPu9XiYJdy/E8=;
        b=ijiJn+op8HvNuE7ebhKxGRrNBMV0Mv42c8f50PAMm71cUE6COwQqSJVRP27sBiTlWB
         jwxbruxVGsRGhRUf2PjFLGcIVg6oElcc+QD/5BMfs8fRhiRh7PFudOFfxS0JcYjP2HbV
         0Irxk0Vu8z/AqKrjlhI+V3DAHelk+3zm9tlfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=G8LgEqWJ07nKDeBvzTAhJBGko3sMVjOPu9XiYJdy/E8=;
        b=Kp/1T1g4sA9E/G6Bwa6COk0k+rmqBYkBRypKrEQorilxKe0HARLJiGma2DVJXN2Djj
         PjvLd91nHmlwuCnAkEaqN6BwlbJMCYb/bzun6fnP6FSflJw3dLkSTI53CYkA83iafMCt
         IfyLImgJ6l/VQmaM8FjNwRGNySTZeT1We1JWgXhv3UEf94j8gRYhxQIHsUCEWhzzlOl0
         2uiiEcqS3k7phN66+yyFxOkPrNDE4B/QtfXmVgekj6XNungjvMylNRS3nuNXSvaDpuUb
         UnWnGvF7aXrFcHjcRno/NyVcDViYqppuQwEDAdRtZbVZuhZZ/Njo7s9a0D9UpqfubLiq
         36wA==
X-Gm-Message-State: ACrzQf3MZYUn/ClIpLj3LLrc+evkBG1sG0KG+Ij/znLOaHD5jKQmOEDz
	jI6/3mefFEzB3lr1DDPLJre1OhDsAd2CUg==
X-Google-Smtp-Source: 
 AMsMyM71+VHh46n26FiNrlTozBuzo6nce5qnAZmAAbcfbeJsojtwUNuN8J9DrjFsUkBvqOAVRCASLw==
X-Received: by 2002:a05:6000:1048:b0:228:6898:aa50 with SMTP id
 c8-20020a056000104800b002286898aa50mr3910178wrx.233.1663362518296;
        Fri, 16 Sep 2022 14:08:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/24] python3-numpy: upgrade 1.23.2 -> 1.23.3
Date: Fri, 16 Sep 2022 22:08:10 +0100
Message-Id: <20220916210818.1228761-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170814

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-numpy_1.23.2.bb => python3-numpy_1.23.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.23.2.bb => python3-numpy_1.23.3.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.23.2.bb b/meta/recipes-devtools/python/python3-numpy_1.23.3.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.23.2.bb
rename to meta/recipes-devtools/python/python3-numpy_1.23.3.bb
index 960dcf94104..1e591c260f6 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.23.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.23.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://run-ptest \
            file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch \
            "
-SRC_URI[sha256sum] = "b78d00e48261fbbd04aa0d7427cf78d18401ee0abd89c7559bbf422e5b1c7d01"
+SRC_URI[sha256sum] = "51bf49c0cd1d52be0a240aa66f3458afc4b95d8993d2d04f0d91fa60c10af6cd"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.34.1


