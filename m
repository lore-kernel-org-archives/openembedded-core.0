Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43EEC677F1
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:21:02 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.28075.1676931656448552141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=y2GpvfrS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id u10so2684209pjc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9BP38ivoEeQSt+rtFpaH10VJ3PnDP4SmflkkKKIe04=;
        b=y2GpvfrSQA8VHXBH4RqXB6iF/XVMcPECWi6K+hpvSifZBQRuDJIS/+aLiYMLIv0qba
         XBaNwnYWE3+YIMfnWmHyiZqfvIdtf4QHyqzqYCHVV2DVUMB6x4sE5uW4/k24tamCAbgO
         ts6WyuGYguI4FpNj+Ox4p24oF7Lkh0VKeiqoXrgphv891OkRYagz4qMQUV5DDTVz6iTy
         9Jp701OIX/fKg9JbFOVUoa0zjmQ6I3YWQrzxkd/xxp81v+Ajo31H/BTPJdN7YWTTtXXW
         h58P6X/GNng7s5DklyRMLOSiJRkL8b6gPs9BoGiECJx5CsAMxmZ27lkY2EgihV466IeL
         UuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9BP38ivoEeQSt+rtFpaH10VJ3PnDP4SmflkkKKIe04=;
        b=t091UXLSI1lvj1j4T5t9/CBMCY6Q48z8OrlersOQPUz1st4UmT6AbvyJK2pCz9EL3p
         H3ayCjRz6SPgG2+AEL8AFqzn2E7eKcPQ/0emOsUR/rVBoCr+Xt1Y8ko5S/C8SHUFR7QU
         LshEEviPtEXrhxuNzpYj1y6o9yTOCa4FvcYc5s6TjGYZZq+CbCTPwNLbeOTkNMlZIvSE
         v8I+U2k8G7/p5uVlJI5ci2dDHaVI5LtAo7FbWtHEhTN/YUipJ5RGNnu5Tc7JQKB7HJWf
         LjlwlJ16LSnxneL/kvVeUNQ3mkp8BB/KCEJvbiVN+KJyXljmuWbbcn+gtZRMbsiOF5bA
         TVvw==
X-Gm-Message-State: AO0yUKVuL88kzbBd0ePavlpnJi1pfBmJeFoz6MIoRX9+GfasW+un6smK
	kc/2Po6QBRKlaCtRF32IkfUtr2FtI9yzAgaMwuc=
X-Google-Smtp-Source: AK7set/ngaXiIuW+aE2bCzA6xRnyKpzTPWh+Q+SBicPzm4Nq+NrTjLlro6BDLd2zCPzHPU5n9WixZA==
X-Received: by 2002:a17:902:ecd1:b0:19a:b302:5176 with SMTP id a17-20020a170902ecd100b0019ab3025176mr3102711plh.46.1676931655460;
        Mon, 20 Feb 2023 14:20:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/16] oeqa context.py: fix --target-ip comment to include ssh port number
Date: Mon, 20 Feb 2023 12:20:21 -1000
Message-Id: <4a9bf2d4693fd9e6eb2186a39e50c7e1630fb823.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177474

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Providing ssh port number is supported too with
"--target-ip 192.168.0.10:22".

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 637919b9df0abc06da5b2f9b389cf25376bd6b7c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/context.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index d707ab263a..8a0dbd0736 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -67,11 +67,11 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 % self.default_target_type)
         runtime_group.add_argument('--target-ip', action='store',
                 default=self.default_target_ip,
-                help="IP address of device under test, default: %s" \
+                help="IP address and optionally ssh port (default 22) of device under test, for example '192.168.0.7:22'. Default: %s" \
                 % self.default_target_ip)
         runtime_group.add_argument('--server-ip', action='store',
                 default=self.default_target_ip,
-                help="IP address of device under test, default: %s" \
+                help="IP address of the test host from test target machine, default: %s" \
                 % self.default_server_ip)
 
         runtime_group.add_argument('--host-dumper-dir', action='store',
-- 
2.34.1


