Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220BDC4167E
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:06 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.3577.1652871540591041818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k4lIRn3W;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id n23so2553534edy.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ls/JRBtLzFCZnXBaVtxVs9y5EKGV9j3NkLNSd7HRkzA=;
        b=k4lIRn3WmkfYTsTe7tfw6cjodnkl2mqpV9aI4Tjx3SVJKYVQH5VjFotO6xd0vOSAVN
         H+9YUqG+gVCxSExuodF+thMFjat/VwuQzEhWtO/D2FboJP/Ro7HAIXKRBb0uEa3RTvKy
         ooka+HJ3NcqVqpkiqcUqav2+V1qXxdaNslyEdhz4FRFHgwDQm0oCTtJPvJR1eMeiHU7S
         Ip5UWi9oWHW7eVqNXd+qWeAZKNlmNn4qy32WPQK4yXtzTZ27l/w4SvaLa8j/oi7VOeF7
         6eRi6Q00GExb13yOVK78Dv5R45bduXXv9bTSa5Rum8P9p0CJSgg5og6WCoi/ccmAnvzT
         JqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ls/JRBtLzFCZnXBaVtxVs9y5EKGV9j3NkLNSd7HRkzA=;
        b=LxEeTu+oD/6tYyVR7lBbf03N6iEJ0Q8ltAuxH1a3DJzattyoTKFphnmKw0055GH6Oj
         fIZ9PCrowWvbWGITrPAWvcLCwZ6iT/T+zBgrdZyvsvfR4MHexgJRV4dV7T2XcJCjYg0v
         xm+d2CumzaXQngK1yZb4dgGO9w3XLSaj2Acu3Ih185BhQf6yqJGJiIvRASur1FC09+CN
         04B4VclUVTmHP1v8ajUwiQpmhY554ebvXgsYtKAYEqhDmuEhCU985SwL9eZytWEgvzfL
         dqdwjHGVlfKpXjSGPaUOU1bb+MiEl6HQXdmNHdteNYYgdMLDupO+1NiXZxnmx/6onvHM
         FJLg==
X-Gm-Message-State: AOAM532EuQSq0FB8Sis5o39mNBpEt9kkaPjzXG7enWx5YauuQHLWMpWv
	Ahl7Sv+A+cHWNcJyjU1jUr3S9Mfijm8=
X-Google-Smtp-Source: 
 ABdhPJw8ycvR/X4wcrwikw5MM0BsCht52M1I/PbYiXHAax6SUxUMH+O9DnzOigrz8ibPe0SBjAe29w==
X-Received: by 2002:a05:6402:268e:b0:427:c402:d6f3 with SMTP id
 w14-20020a056402268e00b00427c402d6f3mr23912559edd.358.1652871544583;
        Wed, 18 May 2022 03:59:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/49] gst-devtools: upgrade 1.20.1 -> 1.20.2
Date: Wed, 18 May 2022 12:58:11 +0200
Message-Id: <20220518105843.3299331-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165814

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{gst-devtools_1.20.1.bb => gst-devtools_1.20.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.1.bb => gst-devtools_1.20.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.2.bb
index ade7cb7dc3..4819a34b26 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "81f1c7ef105b8bdb63412638952f6320723b3161c96a80f113b020e2de554b2b"
+SRC_URI[sha256sum] = "b28dba953a92532208b30467ff91076295e266f65364b1b3482b4c4372d44b2a"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.30.2


