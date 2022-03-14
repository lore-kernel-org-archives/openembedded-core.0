Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEF2C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:17:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.3574.1647299848502577442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bmCZvF0o;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id t11so26376866wrm.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jiVGM6fXYlHOhNme0qXkJ3l2+C79apprsJGirj17QJY=;
        b=bmCZvF0oWlEk4ouqhaSjGmhFqNYIsf46RPghr12oNLHhkhJn4vb12ozfeCDr3ToOeJ
         tNOEGoQ2/wBwXr3gI4o1HyF0g4uONiL06up0XxDHfsKY0mSTxEWhkmk56n1bCVfR1dWd
         VbrY0CTlUIBnaH5u4Ho23J+67Q2Mfx/JnYmJdNGV0D0yEHjMTjztQu3V6jfbY1FfFb6x
         LYfFvpKh7hcxL4Fwd0nOYJRq4fCOQgJFU+n3UYITEC2mXn9ClnFDLn1JJvZXEWQEFaJK
         fcIE+zSlrVL32sV1xrxn1Eej1mLF84sDNM8G7nLHHrngD7SFRzCezjemc7tbnAXCJTji
         jAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jiVGM6fXYlHOhNme0qXkJ3l2+C79apprsJGirj17QJY=;
        b=pDyfjRiYTNcj090gGTdlGCflc9u+ZoXj+3+RWeWc4IKlh2/tipe7ESQLvOe1RHgofT
         /DcMiWp8I8J3F01pCVjqirFQjq20VxLkBbOGg2MPtmh9/MYNljCfAcRDeLC3BMN3FN/0
         2kE0gURJWvAWXA3e5q9VAZyPulEW6wIYt+yn6eW5meZCzZhuhkilsmbz8DqPgfXt2qfo
         o9ZBxacjsOkNpFfWoQXIAFgAuxxIKlJskxeS90HaWXaynMYAXboMOwQQr83AGwbUHc9p
         duzhNjnEj60GrhgfNHya0KtXNrqvDpfl9yieDGAwVbVNbnfDPjoUJeX0GjtyPOFIRkGw
         cLzw==
X-Gm-Message-State: AOAM530BoIlpypsoQ3XPPqvYZfmI926+wfzjXAvoaLGWeOD66MLvHYjT
	5+neIgqsID3SQL9f1FTrccpIP29/VKM=
X-Google-Smtp-Source: 
 ABdhPJxjRfhgrDj402qXlrpUKDw8Aqb2d4Go4lYbnEnhqmdojb/I7WJIFBpn7CK7v4CFgtSo3aBKMA==
X-Received: by 2002:adf:806e:0:b0:1e3:2a17:bd60 with SMTP id
 101-20020adf806e000000b001e32a17bd60mr17476278wrk.719.1647299846836;
        Mon, 14 Mar 2022 16:17:26 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm1122019wms.9.2022.03.14.16.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 16:17:26 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 05/11] gstreamer1.0-plugins-ugly: upgrade 1.20.0 -> 1.20.1
Date: Mon, 14 Mar 2022 23:17:06 +0000
Message-Id: <20220314231712.296796-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314231712.296796-1-quaresma.jose@gmail.com>
References: <20220314231712.296796-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:17:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163209

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ugins-ugly_1.20.0.bb => gstreamer1.0-plugins-ugly_1.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.0.bb => gstreamer1.0-plugins-ugly_1.20.1.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb
index 3dae3d5a11..b0746c087a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "4e8dcb5d26552f0a4937f6bc6279bd9070f55ca6ae0eaa32d72d264c44001c2e"
+SRC_URI[sha256sum] = "42035145e29983308d2828207bb4ef933ed0407bb587fb3a569738c6a57fdb19"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.35.1


