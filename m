Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0572EC433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 20:15:57 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.14211.1645301755844428841
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a1Dg0/1b;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id d27so20167034wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ux/3RS+rnit/NRNR9hR1Q0QZGjJA5TnG7UdDax0bC5w=;
        b=a1Dg0/1b+uP1xqSnnsEHA+JjZ/IqZVzB7y0sBeBiBE7Q9NNk+XnNqge0E8j4TP8gGw
         i5M2/asDizy/rO5cUTKCklWVIYPgmqPJ0RAJ5I9L6Lc06FbFFv8tPVWhufG2pUPZbTrz
         FGgpKcIS1I+2RVcgIYO+szpiZER88rJ2DhrKLF018IKZv6Gc5L7kJyOlxThtrwFI4yb1
         PMkwZ2p32gr5f5FZvvpyDvFI9uAfN654Y6X5WGvrhP9ilhDc7XfPC0A5J1JoArPApQyX
         getmBrlWXhMXn+aGdOO+Yuddko+PQzPGQzv1aNwzKAHsxZ1+g1sXB/v+Yp599A4kC84D
         Fveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ux/3RS+rnit/NRNR9hR1Q0QZGjJA5TnG7UdDax0bC5w=;
        b=gDxPsL18neOp3glYGWLnfZRJjG4rAmZg1RKDxRNc8rRx/+Um6sQgyrts5fysakd1zl
         f3g5kOWN51eDCIZn9nOw050KkwLEiJa9aXWVduC844pOdFYk1jhs481MJkNnBF7fUu3i
         5dXWmBexjHsuIrV3cJL4oMTlb126YgW7Gj9GVo5/ryKdQNW5IRV6/+j93VZv4y1wTHKz
         3B6TaxFf1L2jv7XvHzxhQxN1v7hgUovCI7anzyd26De11dEu+ybywpSu4wBXtTRj5emr
         u2pWfr1ItKro/7oQ6mOIVv9ukHkhIUGHYipZ9iYpUjs04X0Xki6mzZ3hP8yWPszbsv6S
         jg1Q==
X-Gm-Message-State: AOAM530dlbU57VuMVrrUDaqckkeoEUmQMfnB6qV+rV76b55NHOszxgo3
	uOn80F73kuXDtnYQEzV0lpMOm2si2gk=
X-Google-Smtp-Source: 
 ABdhPJzMRto+HZRI6I59fzVnmaadO+maElep2w7nXnzj/jADYr+ucI2VWX97B8rXehi28QH3dFyGjw==
X-Received: by 2002:a05:6000:1788:b0:1e9:e6d5:9e18 with SMTP id
 e8-20020a056000178800b001e9e6d59e18mr1228718wrg.356.1645301754118;
        Sat, 19 Feb 2022 12:15:54 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c410500b0037bc3e4b526sm3081065wmi.7.2022.02.19.12.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 12:15:53 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [OE-core][hardknott][PATCH 09/12] gstreamer1.0-rtsp-server: 1.18.5 ->
 1.18.6
Date: Sat, 19 Feb 2022 20:15:11 +0000
Message-Id: <20220219201514.1551306-9-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220219201514.1551306-1-quaresma.jose@gmail.com>
References: <20220219201514.1551306-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 20:15:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161973

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...rtsp-server_1.18.5.bb => gstreamer1.0-rtsp-server_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.5.bb => gstreamer1.0-rtsp-server_1.18.6.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.6.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.6.bb
index 50426ad46d..f105713f33 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.6.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "04d63bf48816c6f41c73f6de0f912a7cef0aab39c44162a7bcece1923dfc9d1f"
+SRC_URI[sha256sum] = "826f32afbcf94b823541efcac4a0dacdb62f6145ef58f363095749f440262be9"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.35.1


