Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C3FC636D7
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 23:58:53 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.26261.1676591926729018875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 15:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cdHfKLp2;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id r8so3870462pls.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 15:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZFBTryG+knwKW2ivifyrVK4H7B+08hkUKNQhhIiBeU=;
        b=cdHfKLp2RkuK0Lr57ahNhpGQfj6hfGKCKnScpYYhxYP4CHtI/y+CQ4jwKB+0Usg8Uf
         EgdQU1wGcGmBKV12oY8LemUp0eWsM3oCN5QOCcztFe2KUshGD/5YtJ0N85VtrajJjCdV
         DfOGASQUzRN/r/9AYqRQsCDA+xhSdx6jDiit7pFpxXIm4IRI8Vu/WXYcad6BOgExl9Pp
         puL9kdPFz+COSyvRLMjjtZv81CRQuTJixWk2XCJtPDh1ul1gTdf3PXPC1bw2LeWGvD5Y
         sO8iHBcMyL53siXQryERjKAyWShsOo7Ee0/d6pR5ExgpYS1TZP23Yl6tXEwHVpvQPR3J
         3j6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZFBTryG+knwKW2ivifyrVK4H7B+08hkUKNQhhIiBeU=;
        b=eddiLnW9m6qxJZY+TX6VDCjpiiXUtcvvLKeq38bNFJlU7NnMc7tsa8rsdqgTMjC/9x
         mg0jYf7ks2tQ0Xa3USrYsQjdXi52/glUH3+loRiJD6n9F2Pj7at38BeVWwfJUyu9RR3V
         p04zplNXCON5x19yTzLLwqfDETToUZYLXZCosy1cl4RJ/eRyGFi1HYXswIFlaL7y4fKO
         EvwvZUVanHAXMwhZy+yDobuuGw/v1dIkW8jgfTxzTTPCpganVKNpk5N9yEZkOo8+rH2/
         a/mTUWRMeredcOvfbxSsJL8eLW2GA3iGNAXNMBdgkDS5270694JCHqP0Mv859+vMNsOu
         sygw==
X-Gm-Message-State: AO0yUKWx7e+H1J6JRg4fS/GkFBhH957zm9zIaulnmTxK5B5FYQnxOMU6
	tq07nMnNlqoWqN0SGRyRnLHHU5DFSs0YtA==
X-Google-Smtp-Source: AK7set/47NImz19aoeGQFLeMhCvPWNJcC3amJYuKlU/6xo5VLx3vR4iBGyxl0EKciz8dAZT6FKw02A==
X-Received: by 2002:a05:6a20:8c1b:b0:c7:5f49:8cf9 with SMTP id j27-20020a056a208c1b00b000c75f498cf9mr1266515pzh.35.1676591925651;
        Thu, 16 Feb 2023 15:58:45 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f2f2:691e:e829:c393])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a174600b00230dc295651sm1729300pjm.8.2023.02.16.15.58.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 15:58:45 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] python3-hypothesis: upgrade 6.66.0 -> 6.68.1
Date: Thu, 16 Feb 2023 15:58:30 -0800
Message-Id: <39a6402453a72798d78e53fd27951c94ef01e7e1.1676580166.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1676580166.git.tim.orling@konsulko.com>
References: <cover.1676580166.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 23:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177301

https://hypothesis.readthedocs.io/en/latest/changes.html#v6-68-1
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-68-0
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-67-1
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-67-0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All tests pass on qemux86-64

 ...ython3-hypothesis_6.66.0.bb => python3-hypothesis_6.68.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.66.0.bb => python3-hypothesis_6.68.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.68.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.68.1.bb
index 3101845e48c..1db31515ccc 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.68.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "2fb334ab068dc6e7c02d49a1c694f66bd1f681197eeed94406650a59eebef870"
+SRC_URI[sha256sum] = "b37bd77b4b7f404a59ff965e24be8aec4209323866e34ececdf416522c6d0854"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2


