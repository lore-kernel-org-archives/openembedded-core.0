Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27843.1794837629223893109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 06:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=XJuZSaFQ;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c407213696aso43276266b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 06:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794837627; x=1795442427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n8CAvlDOFRj1gfhp5rq7JGQStfh/pS+tWbRlt8bHgI8=;
        b=XJuZSaFQHxy6SfCP0kK5ZYnAg73VpOexVzK9tKghx+QdoPQ93EMV23pY6udN0CTYmK
         BSRIvluWy1/PusUeew0DdFxGX8QcyuJjx2NYPoGRLG4jkC2qA2AgJtSTNKTNWHt91ejj
         PSdjgwLLP38PPP56wph2hspQnbhpzpnWe2DnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837627; x=1795442427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8CAvlDOFRj1gfhp5rq7JGQStfh/pS+tWbRlt8bHgI8=;
        b=dVv2y7/hOvQ5I2i9pacrTALaBD+CcCyz07KnQIjyJyxHinksyzxLBiK9fXeCzp+bTb
         MUrPfWYsoTmXPrRvrdLHMy2EBnlH5UaWuuYYrdNwnHGvgqKcIL79PYA+pxk1SWlNwhbA
         1Ea7QkQmRSqOLa+uqa7B9B2CN5v/4LTte9iIpU29u/Rbv7hCNvyqH7fdb+IeGTlTJHfL
         +6Etdbu/f799ToKEGMRTva0iFnv31NGLBI9IEiKdj9A7SOfobW5mJB2M3n6h4VPv2OO3
         tVWxdySfkyV6yKXqb60KirS1ozbaG8kI+xtEa998X9omB1Zh4p8KB91nboavSBUQYbWU
         14tw==
X-Gm-Message-State: APuU4Z90Vp5f2QLzozv0R/mwlRQg67dNaEb+trxI1V0AE80C8dzruWsI
	PepjBTaM268tPND7znewlwcJF7s1Kzuf3kkqZLhm+tbTc/MRf1ii52g3AWDBoGczu58UIFHRHg3
	EuGzp9B4=
X-Gm-Gg: AYBFou2RCn8EMoNr6Zuw8/6bjYloMz3ChzihIHSncwI+Lv/sZkHwXhMFX4GUm0wmgF2
	mIqFqkKt6V4T6hB/bBPKNU/mOVoGK8D/tmvm1RPwtee162Yt4f0F9ymgefZIHNUKv3XnT3qk6hu
	2ss3Ie2aSgW9XkoorHu+xg0XI8mRxDQ3D7KgUXP8ZXnzd9IJXh0ZaXd/uS7silAYxiSXeltMYP3
	sufTjQJw38ZoPygFZn08gIEFR1AXfiNdS4Q64RsA0QJ3bGm1UFMi1wV/C5gQvCccoKnkBz2mVxy
	/WpFeUXxxiNUgIl1ofpZKRZnv4IbsrD2kpycZxiI3S4luObkVKTvXqVP2A5BlT4JTeBXUD6vQtm
	gpmDhHqOucJOcqhzaiuSTdXw5f8sBHXtOqEOEPyQsMnlPmv1eBNN89t49Zjw0t3XO10a5Mmx1ZB
	R5z4MMT/ph/tZzIuMn77CuVQUIDHiLSVv6IgYRCSdl7AlHYpBhpF8AlZikJuHeUwXikhWyE2MG4
	/AshyMTS0+r2JDqjE81nP87dYDE/QmPOGmvp+ijOqr2WSRWqzaCT19/bzVfyRDQibHAzbBlc5+b
	rHi7jOyMCabrbWBae6WoEYE/sGHy05BjlhQT1bnpoQQbJv6xxY9KSEAF/uh7zlGAbIKu/p2lGpN
	5FDYTOXL+20HsqVYJpcp/c7UN90WE8TkM1FJMsZul3wd1jNymICdvcmMqkrpBPUarB5eOJdzmYm
	ot7gQcKPHoduldQ9wB9HFDeR8jSDByBcJcCGQ9mH0lriL39nYdCJZDxFHJ124awBCeN+syq8zWv
	8Sj0hzB7Pj+QnnDLeo=
X-Received: by 2002:a17:906:2b57:b0:c50:d900:8536 with SMTP id a640c23a62f3a-c50d9009befmr321604866b.1.1794837627126;
        Mon, 16 Nov 2026 06:00:27 -0800 (PST)
Return-Path: <adam.duskett@amarulasolutions.com>
Received: from adam-linux.tail032493.ts.net (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b78cbfsm425753966b.70.2026.11.16.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:00:26 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/1] mesa.inc: require libdrm if gbm is disabled
Date: Mon, 16 Nov 2026 15:00:24 +0100
Message-ID: <20261116140024.489396-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 14:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250343
Content-Type: text/plain; charset="utf-8"

Mesa requires libdrm whenever DRI or GBM is built and the mesa
recipe never lists libdrm as a dependency if gbm is disabled.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 64f5de12b4..6ef725c9a7 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -99,7 +99,7 @@ INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '',
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
 # "gbm" requires "opengl"
-PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
+PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled, libdrm"
 
 # "gles" requires "opengl"
 PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
-- 
2.56.1

