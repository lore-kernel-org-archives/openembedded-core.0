Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AC6C43219
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:16 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.7509.1653489014096250220
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zkpvzO98;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id y1so3359177pfr.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=d6T0hJwqaPz8tCN6O9KcTs74BQx0UWIO1J+RTAXU4Fk=;
        b=zkpvzO98aDe2bUnQsIpaovXth0vD3QhnU0yyYzCcHHYRy25AujAeVv5nVhN0vOZzh4
         tVvPvcHwgSmL7TkBZ9olP8y8hqOaMNd4RZQjH+qbTNmNqdVBsBX2yb52Na8u5eF5xj5B
         TbVbPKOY/9HATON2Q0sr/OpEb76wRVcTdC5SEhW5pvuZYRtPnbbXmzGKbN5jUtBarhTl
         BpVIRvpn0NYtIPcyNq6P4x3p5JwPEPndEt6789+/cOt3dWgSRTBAbGBOdH5UszV6EPVr
         MnwmuKwyBwVJlZpT0pUa35VBwvCta0ckwonbKFcaIjPzUUdu+5iRjWxiPN1ckMGvKbtA
         Qwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d6T0hJwqaPz8tCN6O9KcTs74BQx0UWIO1J+RTAXU4Fk=;
        b=0UH7x9D+Q1vo3jIE6q+oH20HCZEIwOQXAEasVchtPCiDJ25nVXHwaypUHPcAfDrGD4
         K5NdDAyQwV+RoDU2P5ugc+6NCU/ag7ZoByfuP/PXqnLPW+IRnodjJkjqvtQ3ETdMFE+e
         oi2guCm69c2qHKLjWrx1Ue+DoGehURvtyWJRyxTyw4CWAS2q9NyQNoQ3gvy2Tg8wIOud
         VhXMMrIKvALDkF8cCcTuyjLvLDt50B1ksrA+H7fUS1ibZiE9voL4ljMMAJtlguggVCKX
         B91/arlT+aUvTpT4EkSLYGIO+xtWBY1x85U2ezkTx84U14DuA/jsCrLAw4My6fpBrTqd
         FaDQ==
X-Gm-Message-State: AOAM530+8PuOwjHZEjeiXh1hrQuhb8jaD5HiKpDMPLHhr7+6lvTy0zpo
	gec+CDLFj5jadXF/jf0nwUjhRoBCMZgLT7sP
X-Google-Smtp-Source: 
 ABdhPJz0l118zH8BaNeTGdi1vltvd/LNDdvYBnJFOHiIX6gs1zm4UD94Qi30//5wshHjXIZ4xiJP0w==
X-Received: by 2002:a63:5c02:0:b0:3f6:4b48:d5e7 with SMTP id
 q2-20020a635c02000000b003f64b48d5e7mr26172277pgb.229.1653489012628;
        Wed, 25 May 2022 07:30:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/19] gst-devtools: upgrade 1.20.1 -> 1.20.2
Date: Wed, 25 May 2022 04:29:32 -1000
Message-Id: 
 <a16fd1683d5518096c5b0aa651fcb4b2afe0f2ff.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166130

From: Alexander Kanavin <alex.kanavin@gmail.com>

The second 1.20 bug-fix release (1.20.2) was released on 2 May 2022.

This release only contains bugfixes and it should be safe to update from 1.20.x.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4c976ea07ff276ae705110769c8e9741827615b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


