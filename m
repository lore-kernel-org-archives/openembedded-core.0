Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C65CC433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 23:42:19 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.2565.1633304538650512430
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PNlxztN/;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so17727977wmc.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PHwhINeRNKhUeJjWLYTh/oXBo7OiRTBQ/RRH5OFzC+k=;
        b=PNlxztN/gWLBSodYOd2iksX1iooqJGqzCIT8Jx4ZGvheaf6LVEm4A3HXpG7fSJC53F
         iKHcY6ktxfjyl/94Mih1NGAFHF6aTAYddXQXEeJMolzhXpV6s/S4p6+Ay37uWBMf0RTh
         McZ8DdANJ/dOCTA6+kxp7F2r+nFPZVv7KRWfTSusxyOmfpcylSTpcGMA25xCJfFIs6HH
         hk/2g03b0R0YB1X1+6FfOibLsQFAvVUUZx2jGu8OIVtQTwIxf2wqKJTeb8xqMRLPVLqp
         +RTtgaF1+SOz6xYUqBz7He25wfEHD40TdWFyHV+pxjfamsN71l/DFdLJg3THbkL7cabA
         s6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PHwhINeRNKhUeJjWLYTh/oXBo7OiRTBQ/RRH5OFzC+k=;
        b=Zq7rtBJqF3qXNKkzekAzmKoXmPn3H7twxS47Ho5IBq2mdad9UVbGQiLI1zMVZ2D5uI
         4vtIJTgajTIVKMBqpQf/WjfEHsD8otGg9gUC6WdWMmJBr3cAQMLnTfCUWG+D7kdtdsYk
         0CUMLPaD+ssoOLETZo7kr+oHezo7yRJtN2Hm1wNBzhxplFkUyFI/s/fPiwkFzhq2TmVA
         50YsdWmxpzN4C3Eze5KFCtq+NmDcZ+1GmXwKEHMbL4KEuVYRtRPgWfRdv5+rMOPuCSmm
         SRfKNsLpNyZhtagq1oG+MUJV3gQTqcpO7BNX0b30tq900ceN3TJv2sAlJN7hXuj9Owju
         rSRw==
X-Gm-Message-State: AOAM5310SvTpN48Yjr9J5pOtifW7h+0K5hLbl+Rj1PQRfiCMmdVpfB5Y
	TeBYiKBb4sUhzvQjYtLdl87i1EUoLfRJrw==
X-Google-Smtp-Source: 
 ABdhPJyiKAdCLrOpKPFoB/SrOzlddJGDaW49odPznM8krnbw6kyaSkOrQie1OiZPeJXuGm6gQoGMmA==
X-Received: by 2002:a7b:c048:: with SMTP id u8mr15386447wmc.113.1633304536993;
        Sun, 03 Oct 2021 16:42:16 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f3sm8831893wmb.12.2021.10.03.16.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 16:42:16 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 04/12] gstreamer1.0-plugins-bad: 1.18.4 -> 1.18.5
Date: Mon,  4 Oct 2021 00:41:58 +0100
Message-Id: <20211003234206.949967-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003234206.949967-1-quaresma.jose@gmail.com>
References: <20211003234206.949967-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 23:42:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156568

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...plugins-bad_1.18.4.bb => gstreamer1.0-plugins-bad_1.18.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.4.bb => gstreamer1.0-plugins-bad_1.18.5.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
index 81c8391213..6209a62712 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-msdk-fix-includedir-path.patch \
            "
-SRC_URI[sha256sum] = "74e806bc5595b18c70e9ca93571e27e79dfb808e5d2e7967afa952b52e99c85f"
+SRC_URI[sha256sum] = "a164923b94f0d08578a6fcaeaac6e0c05da788a46903a1086870e9ca45ad678e"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.33.0


