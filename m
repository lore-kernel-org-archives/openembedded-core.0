Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACA8C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 23:42:21 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.2528.1633304540535737864
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=agfbBYZW;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so17659514wmi.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d+Bs1S4xRyz6oXF8mYOj78u0nFZt4BB6111c8jqCIRM=;
        b=agfbBYZWkrQciQO4i8IJVpy0JKhNb/xfYXOHn/TUycAHPMAkYQgh1F3v00GriJDDbk
         5l7h8+3y3yeUILxH4JJBS4QCOauceEdcaav6UhYDfkvqitpB5705y01YgjDjoVDmBwAI
         jrwfFbfiXolUtuWn4wFXIDh6ljcpmmo9YlzmAEZR8U78aqTAevEjaO0VefAzHupgJBH/
         h2O5e3YGmKL5d2iqA0CpmW3hbHbIZOjLtwH/wBKNpIPpZB98yWOv1rA4uGx/TtxTAGdg
         +DF6BIqQaFq3FY74UGQtLVL7tU9kTEi8n9ZKwTcXbep01UeBdRJc1r/YAGk3Jgru1m5Z
         cCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d+Bs1S4xRyz6oXF8mYOj78u0nFZt4BB6111c8jqCIRM=;
        b=1g9Zv9q/CwEKuuXRaI0/OcHN86guvPDRCc1BDLsQaUPc2ofTKGf1eNhgl97ZCeskZd
         9ahF7iEJeesitu9CDACad5PgsYSfAKC4W0rjcU6wRIVVOHQKHDWdHCtg4grIqJNzlgkZ
         gcpMMIazF61epmgucd+mI5O1jI+W4dPMKYR6ax26B0mDra5IcILYxyZdfz9gHXbyFW9e
         RSWzi9SpLVMD1GhsK0o5RN4OmqLdovV/6VVwqzw4Z+O8QiBwFc/4ylh4zVvj9SOXDEHe
         wb2IMeP46q0JO4AH8hhg3rD9PFVdEhafNCTIt7y5jVNHglx4NGpcal7UNWXZPpittwQ4
         j+eA==
X-Gm-Message-State: AOAM531Fw9yGpU+J6XjTtVOkJG2Z9CYba/ANz3DJuKWJfYnDiwvTVV28
	x1sbOFr8cm28vLt9m6icotDoqvXyC9OppA==
X-Google-Smtp-Source: 
 ABdhPJwRziY4e6L6DRcsd8ifoI9O6yUWhJ+SwyKRoWDcVp7td6wi4aiMykQZWgXQPy269qJHmCsTdQ==
X-Received: by 2002:a05:600c:22c6:: with SMTP id
 6mr6353961wmg.190.1633304538926;
        Sun, 03 Oct 2021 16:42:18 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f3sm8831893wmb.12.2021.10.03.16.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 16:42:18 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 06/12] gstreamer1.0-rtsp-server: 1.18.4 -> 1.18.5
Date: Mon,  4 Oct 2021 00:42:00 +0100
Message-Id: <20211003234206.949967-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003234206.949967-1-quaresma.jose@gmail.com>
References: <20211003234206.949967-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 23:42:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156570

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...rtsp-server_1.18.4.bb => gstreamer1.0-rtsp-server_1.18.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.4.bb => gstreamer1.0-rtsp-server_1.18.5.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
index f7bfe98985..50426ad46d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a46bb8de40b971a048580279d2660e616796f871ad3ed00c8a95fe4d273a6c94"
+SRC_URI[sha256sum] = "04d63bf48816c6f41c73f6de0f912a7cef0aab39c44162a7bcece1923dfc9d1f"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.33.0


