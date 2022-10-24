Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C492FA3741
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:24:58 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.19998.1666621494365146711
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 07:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3LCyq9Dy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id b11so2126959pjp.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRwXomfZPN/nxLa1dTHolvf3TJjG8zvKWhLg759Dc6E=;
        b=3LCyq9Dyccnv4eRkDTbMmZ+hFVBUHMIYf4pglkkU52ahKhjJDgcOp+UUJj3ph4ZQm/
         rAr2B8j351FWGSSfjPhsLVZqhHB7WFfY3tLpjqltzqPzCvvf1451p+2/nQ3vXHARhLQz
         uaPUAFbxO1LzVSorw//hkkMkQmMgtCW1ZCOXdh6ScFcWN+H259ylEdAZhQYDzsx8Pm3Z
         TWen4h8u1PBA0FFmm5RY52udvASheZDsoZ1iHTu9CJ48Cm6r5YG6eTNETlJPvfENFg1W
         SI8lZXvZY4qicQtzLRvBUyzH3nwWOXs3TD9f8nPPiE7agk25vdh7a1Y/+tXBaTxBgy6t
         YB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRwXomfZPN/nxLa1dTHolvf3TJjG8zvKWhLg759Dc6E=;
        b=sZBWWdoozTEgJ6vCmBNMa5GtV4xGGn2BcppWFBB4t93TmjNBLMjCz0cg/OLRjtWUgK
         sBcP26Yi5IWbPAHGSyLlwcFjF/ea1t/K2Uc7ZYQsMRLGKV3Btl3IZSJActYqBzxAVzmT
         tO1NT4exwjjjmMMmzGHaQ97gPhYiHtFkVUJNohl1V27ZoTsHXlS68dFuudCCbYjwwYAw
         de7vQzn0eqpxHz/tVkPE4QmBbHNwgq3hy7q0kilDbxreUPqqXztj3YVpn1BYfQNAd/+/
         WKU/fEJM+JdRVfBOEJsICKSuyvl12WZq1RDSGLJpm0/SeTH5B3Zr0HOkLzXKxVqBaTpT
         iISA==
X-Gm-Message-State: ACrzQf3Vc4pKyAYbLtZajZXizicOXJEFTJa5YJIIR3AvJBB/Y50NwvXC
	zsncU0SUeeawYMDCJRhpM3up0Qot8IRly6Gp
X-Google-Smtp-Source: AMsMyM6pWTsyDWQRSabJl1ThOrmSodE9sPHggvkkGrIyya5SnaPt+fx2IX6SCzvJXsoPmB2vGmbuLA==
X-Received: by 2002:a17:902:cf01:b0:186:810c:d994 with SMTP id i1-20020a170902cf0100b00186810cd994mr16222310plg.151.1666621493325;
        Mon, 24 Oct 2022 07:24:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id z15-20020a170903018f00b0017e64da44c5sm19704457plg.203.2022.10.24.07.24.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:24:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] selftest: skip virgl test on all Alma Linux
Date: Mon, 24 Oct 2022 04:24:21 -1000
Message-Id: <54bbfe94ae4514386c572564bf221edfdbb2ce38.1666621276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666621276.git.steve@sakoman.com>
References: <cover.1666621276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 14:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172097

This test will fail any time the host has libdrm > 2.4.107

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 399727de49..aeda01848a 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -175,8 +175,8 @@ class TestImage(OESelftestTestCase):
         if "DISPLAY" not in os.environ:
             self.skipTest("virgl gtk test must be run inside a X session")
         distro = oe.lsb.distro_identifier()
-        if distro and distro == 'almalinux-8.6':
-            self.skipTest('virgl isn\'t working with Alma 8')
+        if distro and distro.startswith('almalinux'):
+            self.skipTest('virgl isn\'t working with Alma Linux')
         if distro and distro == 'debian-8':
             self.skipTest('virgl isn\'t working with Debian 8')
         if distro and distro == 'centos-7':
-- 
2.25.1


