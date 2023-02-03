Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43253C05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:51:11 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.17903.1675446663082409502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:51:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WhT7C+3S;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id c10-20020a17090a1d0a00b0022e63a94799so9504016pjd.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HI0J4/QE76Z3jjFiq45+c2zJeRJXFNBWoiNNdI7ZfJY=;
        b=WhT7C+3SyyjqPCTYDUBVOnSyK5KtiOPWPwYlTBDbeXiD1ShCAskoDFEhxhrGdEWj9T
         eFfS6MfNhb5RLzgEpLHr8jVLOY7UvqnDOdw5ATc4Dcygew80c693imCGNNWsXkojPAP7
         v1ZOji1MEBBAYV8uDu7cK7Kv1xf0+RlMnLM+1C6CeRv9ASvlN5oCRce4qGUR03Bdnwpb
         IywdvJOyi6PgCjz+z1NJ0pPZ8RG93TydGgdubYl8VpF9tenSOiFoSwB7fclJg7H7+Abf
         GksFMjWgq0mTQCeD05cGj4zg9sUw5z6/2kCO/HdJOhgxBf1oJNIHAXwRC7RWs+JdSm7p
         F+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HI0J4/QE76Z3jjFiq45+c2zJeRJXFNBWoiNNdI7ZfJY=;
        b=BemmZytkO0BloeFl/3NWOGTotnUWmlOolYPVEAXrNRE+SVBVxAntxHv/s8yH0tiKqD
         JRYeFHVYVP2y3NBFw9UdIGbobNxL9S3QsLU3zHZtr/ZEzU9kcKuHQGRXgu6Tx6kCz+jU
         QsIaS4XS960OMcXHUUhasYJ6DT0v9173pDNOuXM1pqfG7IWnG7ClgJOWdi5BEIGSzZYR
         99NG20VT782J+2wbb4iAxM0f1AbByHb8HNdxQTeAWld4vXitsBJq7KBnyeplIVIX9Ev1
         qdxsGG+3yZojinOsbMLFC8MPBbKPX6p2/+N5x7MFBgAnd5Ux+EKBE71kbWbf8yapDJtp
         yufg==
X-Gm-Message-State: AO0yUKUUY0RsQr0NR7FqCzxoZ1belKH8xLheErZvBw6uq0CGJwh5gPVc
	+F0TD9NUee36IDqc+n3wcMZ1GmoWncQ=
X-Google-Smtp-Source: AK7set8lOk949oR41ztUUSeFmcf9xnMJhcitx/7g0NWrTLXF+QCX2o3J/Sh0VKwth57TREpPF+GM1g==
X-Received: by 2002:a05:6a20:3a83:b0:bf:58d1:ce8e with SMTP id d3-20020a056a203a8300b000bf58d1ce8emr4845318pzh.13.1675446662062;
        Fri, 03 Feb 2023 09:51:02 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.51.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:51:01 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/14] python3-pytz: upgrade 2022.7 -> 2022.7.1
Date: Fri,  3 Feb 2023 09:50:27 -0800
Message-Id: <acc803a5bad4def02d2d11363fc57a0008899712.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176740

https://github.com/stub42/pytz/commits/release_2022.7.1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-pytz_2022.7.bb => python3-pytz_2022.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2022.7.bb => python3-pytz_2022.7.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2022.7.bb b/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pytz_2022.7.bb
rename to meta/recipes-devtools/python/python3-pytz_2022.7.1.bb
index a6a69c8b596..553b9cfa181 100644
--- a/meta/recipes-devtools/python/python3-pytz_2022.7.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "7ccfae7b4b2c067464a6733c6261673fdb8fd1be905460396b97a073e9fa683a"
+SRC_URI[sha256sum] = "01a0681c4b9684a28304615eba55d1ab31ae00bf68ec157ec3708a8182dbbcd0"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-datetime \
-- 
2.30.2


