Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E935C4332F
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.3352.1637741323152173790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GSlLjEZN;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id o29so1432577wms.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=08VVm6+aBZl/dp6IeiwDnWhWJZVRXf/gT/sUii3sEcA=;
        b=GSlLjEZNNhy8rzDTBAqdujOy1zj7KMhrjCh++kEX1TWFU3Pg+fof1MJpcKwxJ95ufM
         rupuemTzx9cabM4D7ibFLY2GdAEWgXoNf5W4KFWYzJcEK3aRJDsVi8QTpf65r/spSrZY
         t/XTOfioh8U6z8ZecDpgcdLS1sYA23dvt5qJhFpw7mUl0raUYukpRQ9n+qU9Lxn7RasQ
         EQ67zxlQtcfvAWeThCfQ8wahEJD/nYdDW4eucKD0kN0+fBXNDqD202QF/xuIjFoDa+df
         iBMsGaNmWNfbVMZbB9gmE2bqZmWCGl1GGtEt1yD/2yfncDMlK5TbARjqGbE3f8KoM5Xn
         +oqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=08VVm6+aBZl/dp6IeiwDnWhWJZVRXf/gT/sUii3sEcA=;
        b=rRlLbkR7xPokiZyBvZ6jn5a1OLQjHCjow1fqHMEeNLP3RJKAFvxLPsBOK2i664dAYL
         gKMd+CoJ/HMaG4obR4UjrWJcRHK5pY7LmcVvTc5jRUX8XEG4HyN7vRRZ/gXi7DFNE/Jz
         lo2oUC9nDh10tm7oK9K/QpUWDTwb/f7bZ3aouf2NZAOK/waXOxcDsWDQXmJzTUDHvOOh
         GHCKyF3nRxF+DUts9hWggezaZVFCAws5DEQjfwqbFgOk/gbSW6mQ25ZG8sR2vnoFcx/V
         d5jYHqzX88i24FrlZBX6FgKff/SzkmC1+4RuaPvSDosnT0pRbv37T334hopoeR3mn0gc
         T2hA==
X-Gm-Message-State: AOAM53246Peh02uxaDxOu6Pl1s4etJ3kTkbDARxfeFvzd7JZ4cOD3A/t
	HYJDSYmgZuRc8uRd77bAZGpxxVZv6+w+WQ==
X-Google-Smtp-Source: 
 ABdhPJxEh8uUNhmZcPX5YMjLwuxAO5Nvo3iqQOt1YmIlIrTfW1WioFoIMDXIT3qWzNrZHaxx1d6NXA==
X-Received: by 2002:a05:600c:b46:: with SMTP id
 k6mr12497061wmr.45.1637741321693;
        Wed, 24 Nov 2021 00:08:41 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/21] weston: mark patch as denied
Date: Wed, 24 Nov 2021 09:08:20 +0100
Message-Id: <20211124080828.530981-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158669

upstream has explained in the patch submisstion how the issue should be solved differently;
we should work towards that.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-weston-launch-Provide-a-default-version-that-doesn-t.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index 548611d933..f6ebfd8f61 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -11,7 +11,7 @@ Since starting weston as root is a valid use case by itself, if
 PAM is not available, provide a default version of weston-launch
 without non-root-user support.
 
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/725]
+Upstream-Status: Denied [https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/725]
 
 Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-- 
2.20.1


