Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8042FC433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:17:30 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.3758.1647299849651236221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M3IbtJaH;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id q20so10228756wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LjoB9HYZZFh95jO0MWPCQIGwoPSMDrx5pQKyaQbOkng=;
        b=M3IbtJaHQrZCx9NMz2oUNeIR+CcvBwXhAyfjpv9qeTa7oCkHgg8jN190f1Ku3dDU42
         S7mV2VujhjDsqUQbBhM8d+KGPGn+nxEmXA9QfNY2f9ojff4e/fYoVEUWIiqE05JDJUFZ
         X/V4VlCCqicdJqALEAKYSFrtsYgNRMPwjPDFBEVSr1djSSv26gqEE8YJac4vVYoD8c4n
         tXkJpQt4FK+MpKCxkLGlzWgbpagk5iCGAucNGaH5P1Jd9MOn1ZBf5+RhqyMCByymiFif
         LJXMB2FCw0f/djlSNitcb5Rj+O+VfpDOJfTCAhryfdwEWhwZ9RZpqQALr1+7KiaYdWHT
         dFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LjoB9HYZZFh95jO0MWPCQIGwoPSMDrx5pQKyaQbOkng=;
        b=rV1zwUO2plmHuTkjnKjDsRzsoc22UpeVqMOdp82qMZHRATJN0a7TVBHgq+U3iYJP7L
         PrnbCt6R7rno26HVlVZRlErsOlOODFz2oRX+kWuR9rNxwmkeEFNx3qYKBTdkL5/A9jZ2
         sLyUM9EWqjjSxcAGnl9swYAAZp3AP1ituaVolsmh3gbgn27xqcM729fxdTJjea2XqtTr
         SCt/fg2fzBQ5lTplfXUlMFf0tXaxTAjbLB0Gr328/NYRB8AkC5r8WpbXgsYbbCKAseYi
         zYNloi1BLNdz5p5TTcF4VIiieQxjFZ7BT2odpUGJhGctDp93fX4rRWAUj1RqgK+RCUtH
         gaXA==
X-Gm-Message-State: AOAM530DovLN5tH1stelU2RjehgYnG5nnbS8HFv/DugT4i+GoSolyu7t
	vYd3ZC4hthE8uasg2tma9VD8io1ZaDE=
X-Google-Smtp-Source: 
 ABdhPJxPl01JZiKba7tOpXaycmN8lJT8UWB8i3Wop7/UvQJGvLDbOolW6wfgQobdbBR54LCrAxo7Uw==
X-Received: by 2002:a7b:c4d9:0:b0:382:a5cb:ff2f with SMTP id
 g25-20020a7bc4d9000000b00382a5cbff2fmr1000255wmk.193.1647299847663;
        Mon, 14 Mar 2022 16:17:27 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm1122019wms.9.2022.03.14.16.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 16:17:27 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 06/11] gstreamer1.0-libav: upgrade 1.20.0 -> 1.20.1
Date: Mon, 14 Mar 2022 23:17:07 +0000
Message-Id: <20220314231712.296796-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314231712.296796-1-quaresma.jose@gmail.com>
References: <20220314231712.296796-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:17:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163210

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...streamer1.0-libav_1.20.0.bb => gstreamer1.0-libav_1.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.0.bb => gstreamer1.0-libav_1.20.1.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb
index 575e608d65..16a298ab14 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5eee5ed8d5082a31b500448e41535c722ee30cd5f8224f32982bbaba2eedef17"
+SRC_URI[sha256sum] = "91a71fb633b75e1bd52e22a457845cb0ba563a2972ba5954ec88448f443a9fc7"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.35.1


