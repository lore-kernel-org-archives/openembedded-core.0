Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36907C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:43 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.320.1636573182169104840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yw6mRoS2;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id u1so5848566wru.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KXOjXQL1EFY34QMeFSW90jT6v3zQzCl88u8q+nDV/1Q=;
        b=Yw6mRoS29urBr38K/LP1zCzv5rYXPt0aapTWTY+G/YfDzcmJYSxCcv9s72KefHjSW1
         G0oB08NAf2RwvFaxUcG52FZhLPoI9BkZPG4PTBdudjx5/A/TXQ1XB5OO/5+CAHlRb+NI
         98wgW5Nfmj8QEdJ0LC/CBldLLaDpjaQS2RUBXbNE6J9ljNPxiAdXEYZWaymhHxN5K3bj
         E5Y2rjSOfpn28xqZIKU/Yj4OP4FOl8qiF3JWdlgcBSYQp4clKE0FABvSgIFezC9zu3I5
         sULitOP4lyWcQ4tbLGRXpHF2pVjBMpxwseBIkwWU1+FdI3bEon/HZOQ/MY5cmRHofoDw
         hOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KXOjXQL1EFY34QMeFSW90jT6v3zQzCl88u8q+nDV/1Q=;
        b=gqm+01OGfcRavpl0OC5axMfZskts86Jz+yvLx90hbNTIzlUvW2TPZljnqC5OOuElc7
         BLD9+oqFs77rHkK8a3LBES/r89Oj5yXL55NjvjCMJDfcr8W9rIEcKzm+q8aPesQSZF6h
         paVZsg9yP9XAjxlR28Azuvfcm5lP5VGSJoG8pteoq+HInmHk77aBoC7lkdxa94QwpCJX
         ND7PVM3a03Jb/IGO9+PHOSSWI0CmikOTFnDxx6AYHLmpYJBBEXEH0dawp1EQrSniqw/3
         C8wkzDpasZWWL2Bj+HHwIPDxzc1lVrpMPftGlMQTfkoH2W1sSKyRhIJlA4oaGhopMJQf
         H/Aw==
X-Gm-Message-State: AOAM532gn88XcYfzJ6i6pChi1+2Jvt+1O9WJy4nQU0t0jMLZshDDfSmr
	g6K247QDuzgsW4wWAm733MZPVmwbNYA=
X-Google-Smtp-Source: 
 ABdhPJwRvehN54SL1CqYl8gdfqhWDZb/gAqVV6Xh6bIcF1nYesNG2vIqgKUhudp1GdNx3r/9w8pjZw==
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr1810866wrt.419.1636573180428;
        Wed, 10 Nov 2021 11:39:40 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/24] ovmf: submit patch upstream
Date: Wed, 10 Nov 2021 20:39:14 +0100
Message-Id: <20211110193937.2606747-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158085

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ovmf/ovmf/0006-reproducible.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0006-reproducible.patch b/meta/recipes-core/ovmf/ovmf/0006-reproducible.patch
index 343c21b541..846f408012 100644
--- a/meta/recipes-core/ovmf/ovmf/0006-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0006-reproducible.patch
@@ -24,7 +24,7 @@ The patch specifically:
    is used, else the output from "GenFw XXX.bin" differs from "GenFw /long/path/XXX.bin"
    with sufficiently long paths
 
-Upstream-Status: Pending [At least some of this might be interesting to upstream]
+Upstream-Status: Submitted [https://github.com/tianocore/edk2/pull/2176]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
-- 
2.20.1


