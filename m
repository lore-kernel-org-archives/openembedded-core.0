Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB181C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 21:30:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30921.1785706207441567779
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 14:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DlEtSfvQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso8958465e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 14:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785706206; x=1786311006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3fZQf0sgvs3zX+dDyJNBlwDvpzZ+mCEJu4cfIubTxcc=;
        b=DlEtSfvQvvSOfTN0Iw0fLF93gExxq3NI2/ORcU7AnrQmq8EPGqmygbvdBz0E98TTJn
         MVaPjsjV0OIbo+pbXA4qSDHdANdM5Oamcum3vX0JTcRVj6Y8UvoTN3jAROl6JpMUkDUX
         6ESBcXJ35oeryOHbiUPVY8q20IVeqWL8ynZhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785706206; x=1786311006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3fZQf0sgvs3zX+dDyJNBlwDvpzZ+mCEJu4cfIubTxcc=;
        b=aQfS4d1Q4cpFiVAgU9qKIiaspOQKj1lDES4VXthWJO6ByFjFXPmDqE9huUXkF1o2A8
         NMDx7DqBVecUDFqDhN+dX1hRuQisWfeKOGw46ELPSxbOiQ+Bm2vavvovxZhza21CoUR6
         RTVNpcS7gom8SYy7SqPaP1TUbDwhi3ETGorW1GY+80knNTZ/PoEI29+V9YhoBNJGEaR+
         /t343pD4t0mgkk9PeVnkbLAc2+MSWeCupZv3XO5uHSljlLmzm3siLcwWTmJ5SLEwv+01
         iyFxHYEWRogHbD6d879x+u9+wLI0ys0Bc+YutTrHEcEP1p0vpo9dxGenled3YtjN0uFR
         Oo7g==
X-Gm-Message-State: AOJu0YxC4HToFfTkc+45VrMlctQYRPx8/v5QKfQpQn4Zw0JgccaeAerp
	lo4vCvjvcXIDfZAsd++VOZYDevVZ7maskJoUKs2c757GxIznWmb+iyoWh/SwmiZJJ5drHqVlKv5
	gZoM4Elk=
X-Gm-Gg: AR+sD13Xt8vc6zaRDjaIRXVIy4chC7PdQVlgylLN3HV9O6gXtFTsmmiiZ2foLTrW/Si
	nb93GXx9CZT3cZymxgHcx4Nv052uLJnStbt5r5vSf4DojpXKuBQsRu+YHKx0xAKB/at3bslK5le
	F0b9etf/6L8dCjrJEsmUHXnCJEiUuj31syf+olWPbEC6rIm0As9+2fNSTbMsKoIzZkbBkRCD7PG
	ZdqwxVC2O0lIOrLgH1gYaC2P8yZ4yFeERPhYCYXj1Z3Ycw07pw+soNhDVSrZmlwPnSe+Dx1kAeB
	q0qB0rtUOFsAx0ubk2iYHgS9SIfNvVejQ4Q8laiwOkwL8HsiBArZXokICE6nVlOjI1dTnHf1tjh
	mrf1jy2yxdRoEzSKpUOMx88kHQvCstT9j6Y26EWWx0FyBgzx+rlJUu2TBKRADqiEiGme06QszQG
	MM2CuMbmGHrQZuJLvIacb1WmdE1QS7U+hJngTFIOrJEcy8r4Sy2AkwCow8hMbgNXCqdd/dD5I//
	pxMtEx99BQmWraB9A==
X-Received: by 2002:a05:600c:564b:b0:496:c93d:e2f with SMTP id 5b1f17b1804b1-4980c65e93bmr114583205e9.15.1785706205760;
        Sun, 02 Aug 2026 14:30:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm275720105e9.13.2026.08.02.14.30.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 14:30:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemboot: Correct task dependency tree
Date: Sun,  2 Aug 2026 22:30:00 +0100
Message-ID: <20260802213000.457180-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802213000.457180-1-richard.purdie@linuxfoundation.org>
References: <20260802213000.457180-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 21:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242589

If we're writing to IMGDEPLOYDIR we need to do it between do_image
and do_image_complete.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/qemuboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index d1794c7899d..72cad65adbc 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -127,7 +127,7 @@ QB_DRIVE_TYPE ?= "/dev/sd"
 inherit image-artifact-names
 
 # Create qemuboot.conf
-addtask do_write_qemuboot_conf after do_rootfs before do_image
+addtask do_write_qemuboot_conf after do_image before do_image_complete
 do_write_qemuboot_conf[depends] += "${@ '' if bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')) else (d.getVar('KERNEL_DEPLOY_DEPEND') or '')}"
 
 def qemuboot_vars(d):

