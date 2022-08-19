Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D8EC32792
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.462.1660894081385256460
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DZmObV4b;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 s11-20020a1cf20b000000b003a52a0945e8so2070229wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=PFbGkuBNt8JXBhHh7gKRYcN+i5XuQPqx4NkencfSBi0=;
        b=DZmObV4bIbRN4OX3oARAACdeSJcHejvNZ5j86TouEc+dsZMYRtlqhHVN+mibkriaha
         YfUZ8bXBYnwEbwQImqCbNhXxt0ffKTXASSojZjNR8pWDG6EtFXJtBfWYvutBI0CkFwZW
         +o/VS64YG6+LXicLSKOiqBJFl7tXTppsn1E/tPPB+JfM0VITk6ccqp8U0MC5Jfzf7HjP
         rnp/0Q4Zys/F8JiRyPg6HbdSzB+BRru5c1rH+FPg7OiNrUQR4/XNBddCyMb0cUO98Oig
         BoeRoJHLcveelEVgRmULu0s30FwzYspoj5slnl+Ule2Ff0bbv0KYqryyJgJirTES1PFR
         ePIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=PFbGkuBNt8JXBhHh7gKRYcN+i5XuQPqx4NkencfSBi0=;
        b=L6l/9OKxjMbl6eeZZTdJ3NeVh5osblExQ8fCqg5RWL1sV7+4FGkV7JOGQG7hETyMnH
         n59Ws8xchai7zRULLrdWW+oeK+Oh+F2HUclOUSJW83sS4Se1NJapwhvOpEkPVWfedUbI
         WQGFGTFWMgeY+AEEfBkno0bBmTu54+aXfRROTSyBGZYl2yRpKtIriZ7mr6ckswVyzdtW
         /z6gE0HPYOSs3p6L/DbbscBHhMXAekwM8V1x9QdPPGB0GzGGJSq2Cn3cx+E2nsqgUNCh
         jOQ7wWEpFEBiwrLLp1YkQSbPHt57SzaDV9fKouKlHiCWmKg1pjc7l8zqtV+NxfD7uJ9i
         q7AQ==
X-Gm-Message-State: ACgBeo3z3T/mw0JrYPcpFkMuAnIXxwnVsnQng8eAXFcXBg+MUTAUnTtq
	H7NAosoV5T2z+lInxHmOBesWlWXPD7M=
X-Google-Smtp-Source: 
 AA6agR6crkt9XAZmMVz9p4v83TA22lEYDQURRIEG/zeyMobjkLp3ke2aUrbkwt5Ht0zRhDV2af++mg==
X-Received: by 2002:a05:600c:1c93:b0:3a5:cceb:4d6f with SMTP id
 k19-20020a05600c1c9300b003a5cceb4d6fmr3964402wms.82.1660894099261;
        Fri, 19 Aug 2022 00:28:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/42] webkitgtk: upgrade 2.36.5 -> 2.36.6
Date: Fri, 19 Aug 2022 09:27:21 +0200
Message-Id: <20220819072727.2236928-36-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169607

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../webkit/{webkitgtk_2.36.5.bb => webkitgtk_2.36.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.5.bb => webkitgtk_2.36.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
index b3fe357010..37b977f9ba 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
 
-SRC_URI[sha256sum] = "d5532fa884c943dc48f1911473dd663aba407a3b35caa7b04bac1419b41e5908"
+SRC_URI[sha256sum] = "1193bc821946336776f0dfa5e0dca5651f1e57157eda12da4721d2441f24a61a"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.30.2


