Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC8AC47258
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 17:06:11 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.41064.1706461562825848716
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jan 2024 09:06:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j+rM3W/E;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6de2735151cso37657b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706461562; x=1707066362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86XKbSvWEu0dAag2MAMc1TB/oA/pb5AlBAzjn2FpyL8=;
        b=j+rM3W/ElCS/0vDPDP29oOELhC12pqSxoxti3ekyAm4R60JXdGdRE8EaVwEF6SbLEJ
         y+cPo9Z5PZ+r1AqhrLzis68TUtz6rfJ3xPl1zN5ebYpZc1H6RQCK9aPSkDZPPAq+V+Jv
         RxvdcvGXPXYXszgCWbVNoOpd75M7zkMq9k6ftDIQQ7OAMxp9dtTHyEHu6a3eB/erye52
         IvYhRhxclvxOFy+nTdxYqYBwacWkU0PP1nEYFLvuzvLgcFXwQcEltOvUkWv/WrtTgEgw
         wam5F90i9v9mPdOqbljdONOPWsSY401JMrkOdtK/sMlr3MjCKBWRyrJjsQqkfo4HZc1a
         sSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706461562; x=1707066362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86XKbSvWEu0dAag2MAMc1TB/oA/pb5AlBAzjn2FpyL8=;
        b=XEMCndacXWJmIlRWYC+QPo7pPcddKglaUXZ3Ug/WAiuycqg0GLEsIT7m96mhMSyK3Z
         qPuAHaT2j7Z4WBfv5wIxdQWhrOAQhFLlMd00G0UspxLPPMgadM/b0DvKyAXUhVh5D5Vd
         cT+N3fJ4xmXpbcMuFWzYRL2zec6ICt0VCSsvz75cjU0ZxW/iSEpHOnDblhEPzUMWXRbW
         Hl1d6ypR5BViofdtnD+3GRJB81Q0xFauqLGOwOmKj56ozkv8nBGH1I49n36847uitM6i
         kTXYM8j85QiChD1vQm3jYPmHJzrFhqd0rtjUiGrh6qrvKLLB302MvSd3FeEkNWnuW+aH
         Zfbw==
X-Gm-Message-State: AOJu0YwHBaCxiEdg1vneoE0uvLcJwkR/Nwn+zeOKn9A/j63iIxPvVARo
	uBIyZeQcJGDjJM1YhzsbW+nSIorz7xDFJ4r0J0+WWpTOyKEz6wzlkrliqV6oEvY=
X-Google-Smtp-Source: AGHT+IEz940zg+oXOaYTFc5zy+8WC+S+BrFxL0qHovA067KzfLN5rk3uyx/exHbSA7ZxyhSa7QXs6A==
X-Received: by 2002:a05:6a00:be4:b0:6db:7073:f845 with SMTP id x36-20020a056a000be400b006db7073f845mr1314574pfu.18.1706461561853;
        Sun, 28 Jan 2024 09:06:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e0b5])
        by smtp.gmail.com with ESMTPSA id jw3-20020a056a00928300b006d9b4303f9csm4317264pfb.71.2024.01.28.09.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 09:06:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] xwayland: Upgrade 23.2.3 -> 23.2.4
Date: Sun, 28 Jan 2024 09:05:59 -0800
Message-ID: <20240128170559.856386-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 17:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194449

Cumulative Fixes for CVE-2023-6816, CVE-2024-0229, CVE-2024-21885, CVE-2024-21886,
CVE-2024-0408, CVE-2024-0409

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xwayland/{xwayland_23.2.3.bb => xwayland_23.2.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.3.bb => xwayland_23.2.4.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.4.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.4.bb
index 9aa7b4dfcd9..092359172ab 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.4.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "eb9d9aa7232c47412c8835ec15a97c575f03563726c787754ff0c019bd07e302"
+SRC_URI[sha256sum] = "a99e159b6d0d33098b3b6ab22a88bfcece23c8b9d0ca72c535c55dcb0681b46b"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.43.0


