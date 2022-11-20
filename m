Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FC9C43217
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:20 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.13225.1668953779098764303
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0jqbXoRN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id g62so9107154pfb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wX2/TYn0xPtaXKjQhGB74R9yhOS852hfNPhU2peJ/Rs=;
        b=0jqbXoRNrXu7sNsOoWFwMUkc5hS4VoM8i+aTrR3wYo4YSWXPO/EfCTTrRT+eLoL5Me
         RsEb85yjxHZMhA9oB33sePlCJWtUyb7M84Uak89BoGk1eRlUvgAx71Yp+G+SwOa7/7sd
         jv2geQNDYtdjCVQO+0PRVDQPJCZqwzOWKme1NMgXj9rEHT50wGYmnT+aTaW2V10ny2ff
         hnidbypA9lqvXXbYI2bOZ0azZ3qy0KIydfmKCWUNQRmTvYyb0pR3bw5eqWtANXKujGqb
         DRGrJFpRnxwkLewhHik7QnpzObnlCw3EO3VmVNcSmBKnGuBlP0P35pi9HW6/VgRGHqnw
         qTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wX2/TYn0xPtaXKjQhGB74R9yhOS852hfNPhU2peJ/Rs=;
        b=dFdX8aIKYgrzCLq4tRdKbWdGo+syozmOKWKgPPdZ1oWh7p8nyVxEUnBpbJ+Ch92pj9
         xUa7kBukMsjE3MZGq87Um1Yb4mACx0/uxFZ2H9hD2rt1MPPmlMTlDfxP690RPq0EeVwk
         FXQRW4WlsRcenq3XjCGWik+1vk/d/OGIHmju/8PALLz6tJ8WYaVybCzwLQeWuq6hu6IK
         I+is0VCUH8NxAGkZyQUGz0tN8Fu1FFQD/BY4fGp4PpuWIIROGt7rTFEHt9nB5drHn1KE
         db0tJuIdZMMWOFvTExfSjdXF962eqo+cxy6s8tb5NDQePn4kEvEwTDU6CTzLJgYdbU5a
         NtkA==
X-Gm-Message-State: ANoB5pkNTexMZva0CZdQr6/aJVmgI1wOEZtDROOALCFXkKjqJIE73QvF
	La59EPqTDFizMm3ka5I+S91aPIY0YyuNeMOoYOI=
X-Google-Smtp-Source: AA0mqf61tG3Wajz4GIhh6ie23WB+uv4eB3aHWM0+9jcDhRw6BwXTl7hScgWbdPmizcj+VTvy4Cy9Mw==
X-Received: by 2002:a05:6a00:4c11:b0:56d:93d8:d81a with SMTP id ea17-20020a056a004c1100b0056d93d8d81amr16315483pfb.14.1668953778070;
        Sun, 20 Nov 2022 06:16:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/35] kea: submit patch upstream
Date: Sun, 20 Nov 2022 04:15:11 -1000
Message-Id: <aba10f1c085110bd7c17e671aad23c3694980e52.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173622

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e8f0e3a01262ecb83185ec5e84e6f359d7d64d1d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 78f475a495..451b409c88 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -12,7 +12,7 @@ Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
 Because they are all commented out, replace the expanded libdir path with
 '$libdir' in the config files to avoid conflict.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/2602]
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 ---
-- 
2.25.1


