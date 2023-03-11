Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06829C7618A
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 22:42:09 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.55881.1678574521231312174
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 14:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YciVB7Dq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id l1so8139943wry.12
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 14:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678574519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQGmrXXC/NzifmXRaeR2fu4zU5cX1vPor61syMfkuvk=;
        b=YciVB7DqKOPigoZ5ZXrOdfzd+cnHlaIuSHOTK/lwesflVHhjWchTyYCpdOCOW69nxd
         1JxkVI4MokG4vM1cGN9bhrTQjijVExRJSvORAOAeOtRLIuMaef8m0S6EAcOhNGHxp3dZ
         CDUdYNwnE15G9cUIDkeU3yjVUd9btDhfIXIZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678574519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQGmrXXC/NzifmXRaeR2fu4zU5cX1vPor61syMfkuvk=;
        b=Fy+EmWMuQ/LUjVVYrxpNripQNq3fUgw69ficJID+QcHBituzIImzleRsRlw7QtGdZT
         WYTB1nYomQGoWVo8DxqBbfPxBzT2qVCegg1LICg1MqiRtNj8e7dU6V2uqCa0UtWEkz3y
         Qo7xSz8CNnxb8JA0u68W7H24CjnitzVKLsB/77K+/mnXzjQPx0HP0Zhh8S39FCtwkP5d
         aMx9ZBJM/1vFjfvd+28ftBKYaafaejWkBwCKV7MXSqkeKWNrmdArIEo9FEewhRCw2EHv
         s1CRJTOKuw7REb7GHIT8RieEEQziiz6ctImK+l+gf4w46O5zidKdqNxojEXlEvB8+g83
         0xmQ==
X-Gm-Message-State: AO0yUKVa1vnyExJUwSvHCU1BMqdnHlE2YbutE5IkM9KuqHkABNP4LJOk
	9AYBprPFJwZWgGhrb2VO5A/foZdP0U7NFY0cRpA=
X-Google-Smtp-Source: AK7set+C5iw0l1LkPn0pe18f1NId5zr3jOqvx4HKdvAqU0/PO3vxpJURdwiZVxnLlOV/n653gDh32w==
X-Received: by 2002:adf:e5cf:0:b0:2c7:e60:abe8 with SMTP id a15-20020adfe5cf000000b002c70e60abe8mr4725324wrn.9.1678574519210;
        Sat, 11 Mar 2023 14:41:59 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003dc5b59ed7asm3933164wmz.11.2023.03.11.14.41.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 14:41:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] gstreamer1.0: Add missing gconv ptest dependency
Date: Sat, 11 Mar 2023 22:41:52 +0000
Message-Id: <20230311224155.3442306-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
References: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 22:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178371

Add dependencies on missing gconv module to fix execution in minimal images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb
index 2f80b9ee3ed..11002e667d5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb
@@ -67,6 +67,8 @@ FILES:${PN}-dev += "${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
 FILES:${PN}-bash-completion += "${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
 FILES:${PN}-dbg += "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
 
+RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-iso8859-5"
+
 CVE_PRODUCT = "gstreamer"
 
 PTEST_BUILD_HOST_FILES = ""
-- 
2.38.1


