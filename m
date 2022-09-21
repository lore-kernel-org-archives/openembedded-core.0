Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419FAC54EE9
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 02:37:59 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.2082.1663727874220068169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GYShTLcY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d82so4510137pfd.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=TPEVYYBJMjhQVHnJyuQpZIjSvpyEAr/ic6IrM2qQ3xk=;
        b=GYShTLcY0YWel46RvYO+wPAT9FHtGfC6ELBxRaLhbtS5MaNP9U/u4RfoX7jIDvyx8r
         CT3xd9uiIXoGejTfNKq4cjvTYBaLrofpiXpxbB4kbppmFiq1KWcAufXUVSbDuC5+n2U+
         Nlx3Qv4qyNS7vT661YKt9Xx2929HgHz+xCZYaIUxZWbuyyPIK9HJrJpEdmLo3f2TaUo+
         3sBSZjtiJcwL2+0/r/k/LzLNCkdL/gzyine/KfphNqzpzCtwfeVBPEAn6Hj5sY1110GN
         2noCaQauN8xy2aNqTdvQS7x8skjWSJJaUr55tddiAZPtymk59HZnjCyivCfXK8eKaTFU
         oX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TPEVYYBJMjhQVHnJyuQpZIjSvpyEAr/ic6IrM2qQ3xk=;
        b=CrHVbFucaAw3YEnV36VKk4NMBhdI769dgr2FWU+1nYx4xh9EDpKGEfgxSCtEezGtAY
         OWeCCGthrfUlJJeVjrQWqeUHEUyMAEuCS01UDlt0rOvyAb5Q81sxI3ziVLXAlQAe5F/q
         lkxH3/HnXXSKOn40F7Cv2K5jIPfVyTYx8mPN48hW+72bVJ3TLO1tnRb+AA9nvUQF3Rb4
         CeWvpPn0Rxdcc/vOTVZZc5+Ef1+HHYBrFxMKesfEIxKxjRZvc8r7paFbzZ4PVLZ2bi4v
         F63oeT9C2aldJegpxTVJHP7woNrEKQZWQvO1pGXi65Dp9J5zjOVEC05UBQpt9QDqheul
         Zc7A==
X-Gm-Message-State: ACrzQf3NVi4pphTdtUJ93ZxSTdoW1PGjmh2g5ErCB/wVD9/KkHjCZMft
	COB/sX2631M154ze8BLicItD+ykFNLKqwo0F
X-Google-Smtp-Source: 
 AMsMyM5EocYMijEhcziA/4JQrfoBHv0cwm98CDPkdHILDEAM/jedCGx8APVchEjsz7uRARdYUDMslQ==
X-Received: by 2002:a62:3602:0:b0:551:b15c:1235 with SMTP id
 d2-20020a623602000000b00551b15c1235mr5158856pfa.14.1663727873243;
        Tue, 20 Sep 2022 19:37:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 207-20020a6215d8000000b00537a6b81bb7sm670154pfv.148.2022.09.20.19.37.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 19:37:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/6] qemu: Add PACKAGECONFIG for brlapi
Date: Tue, 20 Sep 2022 16:37:17 -1000
Message-Id: 
 <f547c9610f8c17c3da9ca3f7a79902d2ffbfca49.1663727733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663727733.git.steve@sakoman.com>
References: <cover.1663727733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 02:37:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170926

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 482471a617e5f682416b7ec1a920dfaeac65f1a3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b432b01224..368be9979a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -273,6 +273,7 @@ PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
 # libnfs is currently provided by meta-kodi
 PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
+PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.25.1


