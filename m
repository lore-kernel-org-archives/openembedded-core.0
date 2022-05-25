Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C395C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.7394.1653489002211546535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=02JYEspb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id f21so7026109pfa.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L4tF96Tvn1/QFbnjeNoDT7OeOj083l2W33YdmSXUuc0=;
        b=02JYEspbrYlu3n4U5uQCH4Z3hQGuDGEmKGxkg1qC+nxsNaoMKtpNcmP9OdS1fvbKhC
         jFTtFj8yEfpGwm4L5VHGRLDmh1qgAzdbFWqKGr2g6c64Qie5gpK9a/DjhJulPTSuH8vJ
         nbL+uNhr7QoWqajwQb/ypmHcImQdbLf4OBYScxonK33DknRjAluqhOKivbM1rXs5xWLJ
         Bhp5uKF7T7+xJdwVokDGbhBgUTluXKH/BodTF9DnitsVLOrhR1IIZnBUlz8TfhAtiaMK
         lvaDMqY9UgpDqzGlckcnh8uDTGFtyA7BXjVilUg6R9h9Pqyh9gf+PLc6Yhc1ZTNygc8l
         8czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L4tF96Tvn1/QFbnjeNoDT7OeOj083l2W33YdmSXUuc0=;
        b=Jzdq+ga6WLwkgBCmF1GRbM06Ovkc/qTS6Qr6TfknpdgeaF6D56/TE2zxM0n76N4VnI
         LFBKrPIFKttRq52+rM+3XsUTz+iITSFphly6G7Y6LO0nqdXkSBXYaLYU76mtEupvya+o
         7Lg4cgMSHodKoBSRJh8u2y+pkhD1WlQMvkHG4XTZ92Do7iwEuGCLzSosCq/ITqdvEzg7
         AE/Yfo9CVXZtf3XBJRRkF/ZorR0GYAjed9amz4K3/NNtpf9h5paoYudnBNVfz1x4s6L4
         51lkPV54OiFAkXZWRtQqnGSxF2Ki89QKWSKrE3gNMtwU2/9dLCsTwZuy7zOMMMd7OqFH
         XMog==
X-Gm-Message-State: AOAM531zufJs6BTawCXCFbZDCqCRT8rR6cNJEe6efwBfbaNq+Ah51Meg
	zOgJ0jc6EVfUc8xolidVxQB5gqIy3if3dAuV
X-Google-Smtp-Source: 
 ABdhPJyi9/zgh47SCC1BTUC0qHM6/nIw35GU/oXz3vlt25ueOCMYP2b649sfyEvxc0ah2U5B9yIJAg==
X-Received: by 2002:aa7:83c2:0:b0:505:723f:6ace with SMTP id
 j2-20020aa783c2000000b00505723f6acemr33611144pfn.86.1653489031461;
        Wed, 25 May 2022 07:30:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/19] gstreamer1.0-rtsp-server: upgrade 1.20.1
 -> 1.20.2
Date: Wed, 25 May 2022 04:29:40 -1000
Message-Id: 
 <cdafe69411554e5cdc835fe7b83afb39dab28d11.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166138

From: Alexander Kanavin <alex.kanavin@gmail.com>

Bug fix release:

rtspclientsink: fix possible shutdown deadlock in collect_streams()
Minor spelling fixes

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6c2cb116bf41312673afbbd71076a2ca8f59cf0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...rtsp-server_1.20.1.bb => gstreamer1.0-rtsp-server_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.1.bb => gstreamer1.0-rtsp-server_1.20.2.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
index 90d788ab80..fd6e16c2bf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4745bc528ad7de711a41d576ddce7412266e66d05c4cfcc636c9ba4da5521509"
+SRC_URI[sha256sum] = "6a8e9d136bbee4fc03858a0680dd5cbf91e2e989c43da115858eb21fb1adbcab"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.25.1


