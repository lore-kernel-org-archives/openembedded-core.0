Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C4AC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:56 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.16550.1644196134929666573
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Imuz8Fg5;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id e3so8011378wra.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NR7CKWDHyDesxNuvHe8hV0ummOmyndaHnDz367Txjbc=;
        b=Imuz8Fg5QmVXkagd48AUwkvvu/Nhe+bSLhPeR2PWCkIT4Dk8qAxQ9Phqp9kWLlrAZ/
         6u463u3YfHWO6JZF38WLQB27BAh+oAqmZHIO/xYcKNJsGfOJ+v8BQT0W3J3i3mash+y4
         PJ2asjC76dm02P7qv4vAYpRBq2ChvkN7SkRwTocf6FPQGykpKeiP2j9qN+yafXyDXBDC
         PQR5k3DdmUKK6lGfOz4kGZUIhx6rhJjSOOvAT0tC+uL8nRR6DOwc8ekYSQdiZJ9vm3a3
         HswjxU9qZIBVwWs0CaqsnDbhLU2GqecV43vyyJlUGhZ2qWw6QmOmAUJoyj+aQaIVu2z5
         a/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NR7CKWDHyDesxNuvHe8hV0ummOmyndaHnDz367Txjbc=;
        b=gZxQXlnvbTlAQwKmr3+mnITHbp9N8hwkf01wQX3BiXU2g3eI38MvpiQmV8K77OmfR6
         qnEvIApE22QqQ/RlzgDW7SGlJPRY/wIq4IoaJvkj3M4/F8ozd7qac0YA93BGbN7nM0Gz
         Xg52vQ18xXA8LMIKzxSscYllpNEjmiP4tQlhXLuxTxo/8h7sxWA0WC5GxBHZP6NhFD5f
         E+TEuSwKRLkZlgfQ3ZLiEGK0fVCldUMXsqO+XvR1vQcTUdQZG+C0YiCOHsVYkFaE/pS/
         F6zI/e8IAKzf7IzS/j/iuLESKAHbU8ds24g7qGyNq4J8p/2FEbETFuQE/43SQVOe9FO0
         SgTg==
X-Gm-Message-State: AOAM530tg0r5cizgoUfjTowZXclm1NioHMTQrUeFNi9TZjbypNNU6x+P
	Rc4F8ct/kTwKdNM+9Z70QtfCeyN5uVg=
X-Google-Smtp-Source: 
 ABdhPJyRdb7DZxV5x9q85XpUQkCxFoqIFnO0OFKIR2su36X1rfqge/YvfXbeoULknKFLRmCE/w9oIg==
X-Received: by 2002:a05:6000:24a:: with SMTP id
 m10mr3070810wrz.367.1644196133344;
        Sun, 06 Feb 2022 17:08:53 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:52 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 15/17] gstreamer1.0-omx: upgrade 1.18.5 -> 1.20.0
Date: Mon,  7 Feb 2022 01:08:21 +0000
Message-Id: <20220207010823.143664-15-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161435

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gstreamer1.0-omx_1.18.5.bb => gstreamer1.0-omx_1.20.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.5.bb => gstreamer1.0-omx_1.20.0.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
index b2c1eb3ea0..15f19e349e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2cd457c1e8deb1a9b39608048fb36a44f6c9a864a6b6115b1453a32e7be93b42"
+SRC_URI[sha256sum] = "c1e46b70ac379ac7b3646506370c9e1007b56ae293f4d334bc0e724c76c345dd"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.35.1


