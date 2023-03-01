Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BA8C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 18:11:10 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.30585.1677694255173015535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 10:11:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uw5cduUr;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id x34so14258847pjj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 10:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=He1zgXBk0f83Df3iQLhbvUseDYosV4i4Bdlqn05KsI8=;
        b=Uw5cduUr9b/GQLuJK+rxiZVqCAQycVICyVIMBxS2g6ux0pB/FHRanT0K0aKCZP3W9e
         o3zkWCDFOKL1+pYMA+3VR83lmsTVMkUCmJS7LMbaaQnCxFQbQU6HjCaq4stsHCB+iUlA
         Hg/x9Je/3Tu+ziM9kqU5pLYfVgr7K2locFQRs3jhFtO9mnFjq5xQ4uC+GRJ6+u/xfV9o
         EvLgkX0lVZS98k9jtEmOLjhSysWZ4RH7OzkCtwBV1Q90SJLkiRPklY4lfjJds5IjQwUa
         omidi6lek+BJcIDhJOVRxZ5Dd1hGk6QJcCcSSSxU75X5wO7CAkTTnprrE6SovtFVWu5x
         68Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=He1zgXBk0f83Df3iQLhbvUseDYosV4i4Bdlqn05KsI8=;
        b=ah03j2wZAX8JlPaQ8KsVQVh/NOBV0nUMHyYutbQQVXAwQea9OxmOeJW8W/Gp8j3ImF
         DblD8qaeJtf8o+TEvvIAUuUh9Ih9WNDLtM6DU1WMv6WuaSgPhintXo+0sqOBxJU9aHik
         fzJ7dTZmnGS9oxOL9TXXD4QFJJJjF8WVPSS5v2Aa4q8r8XCxjZiqZDssv6D60brtG+vA
         x4hciFiCcXf3rsdz41L/SrpzXbolS8AX2tyyRbB72gweajG41saN36al0Styk5e4zLGl
         zRln7dL4hdnCuzQIIRRB5awPAzcBR/oZiHgch3I8BKYfMZUhw8FFzmrySY1ubBctFHiK
         0U4g==
X-Gm-Message-State: AO0yUKUdXewKekrtmwA4U9tWj2+6PZmucDi6B6NlYT0zhLp/FsLsHOPP
	WxRCNulna2UHsFgfNaVlKxRu0fYcXoJL1A==
X-Google-Smtp-Source: AK7set8CBRs1/mC05zNF2K3axRdlt2MGgTO3SvUKDspyac0vPlCYf5q6tE5m9In0nhVgfNQHDmg6ug==
X-Received: by 2002:a17:902:c406:b0:19e:2631:7bfd with SMTP id k6-20020a170902c40600b0019e26317bfdmr9683233plk.45.1677694260711;
        Wed, 01 Mar 2023 10:11:00 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:8ecb:2eaa:9ab3:bdee])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902780500b0019928ce257dsm8715614pll.99.2023.03.01.10.11.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 10:11:00 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] python3-hypothesis: upgrade 6.68.1 -> 6.68.2
Date: Wed,  1 Mar 2023 10:10:40 -0800
Message-Id: <b9384e278bb14a4a3e9988475c7ffb86bdd09802.1677693991.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1677693991.git.tim.orling@konsulko.com>
References: <cover.1677693991.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 18:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177948

https://hypothesis.readthedocs.io/en/latest/changes.html#v6-68-2

6.68.2 - 2023-02-17
This patch fixes missing imports of the re module, when ghostwriting tests
which include compiled patterns or regex flags. Thanks to Jens Heinrich for
reporting and promptly fixing this bug!

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on qemux86-64

 ...ython3-hypothesis_6.68.1.bb => python3-hypothesis_6.68.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.68.1.bb => python3-hypothesis_6.68.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.68.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.68.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb
index 1db31515ccc..23e842f2e28 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.68.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "b37bd77b4b7f404a59ff965e24be8aec4209323866e34ececdf416522c6d0854"
+SRC_URI[sha256sum] = "a7eb2b0c9a18560d8197fe35047ceb58e7e8ab7623a3e5a82613f6a2cd71cffa"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2


