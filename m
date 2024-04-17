Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E62C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 12:52:23 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.11929.1713358336025180381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 05:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P53uk65b;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ed267f2936so4401061b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 05:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713358335; x=1713963135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWumcTzUJqb1jLMUT89sC0jhDXNiKrUSpT5Fj4PA2DE=;
        b=P53uk65bkesy189hxQYfBgav1JKWbz9MhJZJIv0pbSXexJHCaq2SUOpBvd4nx06E8P
         RJh/iGdedDZVfl7emYflGd0tDbTJ/yIuvgYvokt9JL9xCF0LMnzi1VXy2gazS68OamJR
         bceEaPz0GmyTnr6taepQb7YtHCh8FINjKSARkMaf9dj38tVntslxQ37ExmbpuTx+U2KN
         fQeyf9PvraV5LBTLu9Sba21dqJrWvFzfEC7ARS0puDZv3i2Z3OSir9jV8GYq+qrLMjd6
         yYtqo/fvlpmWORgR29meSyNWpkRbr2uTvWqXmxDlRkfs0pkgaMohGl6bMqgogGFrN7R7
         SyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713358335; x=1713963135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWumcTzUJqb1jLMUT89sC0jhDXNiKrUSpT5Fj4PA2DE=;
        b=OBOxvH/zhflmSMeoiAgqZy6FUg/QgU665J18p6mLkuMKod5ntNxeo9YmkK7yc/VZHD
         K657Ln9UWz0AtiVb0Q2+LaQJXuKy8kv7dDM1wAiS2D3EICPwOhy3wjaOVGA0djg8DnDK
         QRefb6kh50nsLb1PyEHAwesU6xaKpToQmC9PgDgTK64vJcE7KLdE8bSajSiYAHA6Nmxk
         vixGkbcBzTAuvbl/Nip/W099uqnSmymH3BJFqhO71UXn7R7tg/mBB4lbRZvbbVOlzVqT
         6rSpW4FTyJjECwkh+0NeborTf042MoQShO8wucZaxwmCyhR4M8RXV+1sWgjOz31VQ09K
         b/Ew==
X-Gm-Message-State: AOJu0YyTdlwQ9xUePLGZiivKQVcmfAmLYCL8psNBJCO+Wutaf/4Q+BAA
	mXP2oeqd4JhYw0t7KrZX6XiatNOlhI4R2dEXiNnAeMg07fDV4IVvGWRhPg==
X-Google-Smtp-Source: AGHT+IGHuuCo7XkOBAcFFUp6iq5gqCO2MeXEz5DG8Wdg+9bCHbHAf1WNW4QT2KZEKIGG54AOMoKwBQ==
X-Received: by 2002:a05:6a21:6315:b0:1a9:c214:b7d with SMTP id wu21-20020a056a21631500b001a9c2140b7dmr12192433pzb.2.1713358334862;
        Wed, 17 Apr 2024 05:52:14 -0700 (PDT)
Received: from L-14805.kpit.com ([43.231.237.174])
        by smtp.gmail.com with ESMTPSA id ka26-20020a056a00939a00b006e694719fa0sm10949015pfb.147.2024.04.17.05.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 05:52:14 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
X-Google-Original-From: Poonam Jadhav <poonam.jadhav@kpit.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][dunfell][PATCH] ppp: Add RSA-MD in LICENSE
Date: Wed, 17 Apr 2024 18:21:57 +0530
Message-Id: <20240417125157.240195-1-poonam.jadhav@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 12:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198466

ppp package has "RSA Data Security" license text
in Message-Digest Algorithm source file md5.c and md4.c
Add RSA-MD in LICENSE field for ppp package

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 51ec25e660..98ef518c14 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap openssl virtual/crypt"
-LICENSE = "BSD & GPLv2+ & LGPLv2+ & PD"
+LICENSE = "BSD & GPLv2+ & LGPLv2+ & PD & RSA-MD"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
-- 
2.25.1


