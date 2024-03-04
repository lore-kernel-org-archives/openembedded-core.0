Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71951C5475B
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 02:48:56 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.89669.1709520534139314826
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 18:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VoQyLKE8;
 spf=pass (domain: konsulko.com, ip: 209.85.214.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dc139ed11fso38840085ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 18:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1709520532; x=1710125332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XoeMYhSqmYwMnaAoCrXZjXSD971V0KaQ3wmQoenCkAw=;
        b=VoQyLKE8WvqCwE49k0LQ5m1FrvKwl70a7V/7f8ZkvqkTQ5L759mmhWJZBnaNndAYKr
         emx/JdNbHynFYsrJHtjn0b4BKTKcXUPZlxrLc+9kCckbqv2jP+ghwWRPBNesRmWx4UZM
         dKP6WAXV8Rji94fdZofXVYF4F36MYQtU1aSwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709520532; x=1710125332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XoeMYhSqmYwMnaAoCrXZjXSD971V0KaQ3wmQoenCkAw=;
        b=p6nFOaP4Gbt3+JZtOCY1hcdtZUax2SFt/kT6SEeU2Bt/UUn7MCDcubNm7GlxNLof5j
         hbdxsEYvDPWtgM3YYcxr/I4ATd9Csoq6A0v5tMAN7eFAmXgFPst6kkl8+HhAs9P7H0TR
         xdvC59iWHObIYWK6PXSqBenak+G2yG/sPQRUMRa5UXVreUaoHn01AOH6242SGkx4eaZT
         6q/33Rors4Y0c0x9PaQP3hp+NkMOLL27Mqd6SxhMscacfjbrq807xlFEX00NGqMpHSEU
         OCpfOmS8zJRE8mHiB1nWfurBdxH3f/jTBHh/uhayUBGzy/iJrMQrlrPj3purLriYFMs3
         PxzA==
X-Gm-Message-State: AOJu0Yx6ixzYbOCaut1QK9w97nHs7ArYo4FTEOTh0SSKGdGVphu2kDcB
	OZKFyxhEJ+z7fuPTjcKAST+TaPydczn+7f0p0FZSV1DY2oAVraFnR2NP7SqB2k4WzKK82ubns4D
	sa5U=
X-Google-Smtp-Source: AGHT+IEVxohwZH6Y6g7a0dPB4NWCMrT7M+cSTEu0Epas2rZMrQeKeybw6RQjNJltvUjU0Ph8zNqDsQ==
X-Received: by 2002:a17:902:654a:b0:1dc:b887:35bd with SMTP id d10-20020a170902654a00b001dcb88735bdmr9255195pln.5.1709520532544;
        Sun, 03 Mar 2024 18:48:52 -0800 (PST)
Received: from localhost ([2601:1c0:ca01:19f0:98c:a88:21dd:cea5])
        by smtp.gmail.com with ESMTPSA id mq12-20020a170902fd4c00b001dc8f1e06eesm7264176plb.291.2024.03.03.18.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 18:48:52 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-hypothesis: upgrade 6.98.12 -> 6.98.15
Date: Sun,  3 Mar 2024 18:47:19 -0800
Message-Id: <20240304024718.2691289-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 02:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196583

https://hypothesis.readthedocs.io/en/latest/changes.html#v6-98-15
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-98-14
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-98-13

6.98.15 - 2024-02-29
* This release adds support for the Array API’s 2023.12 release via the
  api_version argument in make_strategies_namespace(). The API additions
  and modifications in the 2023.12 spec do not necessitate any changes in
  the Hypothesis strategies, hence there is no distinction between a
  2022.12 and 2023.12 strategies namespace.

6.98.14 - 2024-02-29
* This patch adjusts the printing of bundle values to correspond with
  their names when using stateful testing.

6.98.13 - 2024-02-27
* This patch implements filter-rewriting for text() and binary() with
  the search(), match(), or fullmatch() method of a re.compile()d regex.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested with buildall-qemu core-image-ptest-python3-hypothesis
I saw an issue with qemuarmv5-musl, but not obvious it has anything
to do with this upgrade, seemed like just a qemu timeout

 ...hon3-hypothesis_6.98.12.bb => python3-hypothesis_6.98.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.98.12.bb => python3-hypothesis_6.98.15.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.98.12.bb b/meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.98.12.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb
index a74c3af401d..a17abe58c0f 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.98.12.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "584ef03a847464b0d14a63e53fcc3335a75b1f1eb3bcc770a03ff950ee4e279e"
+SRC_URI[sha256sum] = "1e31210951511b24ce8b3b6e04d791c466385a30ac3af571bf2223954b025d77"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


