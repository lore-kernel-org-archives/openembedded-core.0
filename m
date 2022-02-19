Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BC0C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 20:15:54 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.14142.1645301753169286728
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cci/COTa;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso7150756wmi.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hER58tLoj8PbztVoWo38Kbpqy8RkxHb9WKbe0VrdhgI=;
        b=Cci/COTak3rdqk2ottFzwqm7nu5AKWEy4QnbaQaUnBY2uuxvu7Uqo1jdmiKnaWrBSu
         27voX0MobwY4UtcKQ235QB3IXJfZISfnjz3UKKKRtDpINUqLL/JZEi5CHwsC6AX5D1WE
         XDblIbp682g5rHByK2TOEgMFl1cRfJcKkB7Kp4qLdinarYj3/vq4ogYc4qDY6IGSyCJd
         cy7M95lm0iH5UKEcoWTK2dDfZ0GVDr8DDQrBIiO3O+8LkFTFbJ/wtlaOK5ZgGfeORIqO
         lsXsHfrW3ZBnutb7isXG8GPvmLb6AwxlGXwupxLB8RGbuhOXdpj8r3Jjf6E99PxvJGCW
         G5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hER58tLoj8PbztVoWo38Kbpqy8RkxHb9WKbe0VrdhgI=;
        b=SlwvoqUCkeUgOYFBQHc8W00sZ++dVIui24N1Fwte6E8gn3+2vHa1Y+bGSMOWgUfOK8
         CDNsbDugzCaX8zsCIF6Qw66MqE+Cvqpb8jp2Vm/oCgaZr0a3g4FdjsRCWgOBRJ6Xi3UC
         PhojLR+TxyYkXeXwYprDrCI3bUAX7zxLWjkKXJwVQmkoditKMkweWdW4/BkiytHbYRk0
         yuQzeCUVwWsWtNDf4aTVW4dEeCIjh4Z0UGooTC+a4YOCZYZGbWiXy++a9gs6cv6oQbcg
         6Qdz+WeQQFW3hdMoLtxXZMZ4PyBPc+VOvmKJIWggmQS+OirhnUmuF3smcBPK2C/7pdkn
         6IZg==
X-Gm-Message-State: AOAM530M3E6ck9xQZ5hs51VxlhnuXWvUbxmTLzMKsSHwayRWQj86my4q
	GA05AN1D46olifZO0345NJS7KZRpbE0=
X-Google-Smtp-Source: 
 ABdhPJz7sLfRlqNofpkDr3V6XaJh0YteSlLdZc4b9Ji8Y3BqKWpiCGT1RYKKLCHqTtMxhwbhrbN4Ow==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr15919275wmq.139.1645301751434;
        Sat, 19 Feb 2022 12:15:51 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c410500b0037bc3e4b526sm3081065wmi.7.2022.02.19.12.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 12:15:51 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [OE-core][hardknott][PATCH 07/12] gstreamer1.0-libav: 1.18.5 ->
 1.18.6
Date: Sat, 19 Feb 2022 20:15:09 +0000
Message-Id: <20220219201514.1551306-7-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220219201514.1551306-1-quaresma.jose@gmail.com>
References: <20220219201514.1551306-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 20:15:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161971

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...streamer1.0-libav_1.18.5.bb => gstreamer1.0-libav_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.5.bb => gstreamer1.0-libav_1.18.6.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.6.bb
index a77ec62759..d46342285d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "822e008a910e9dd13aedbdd8dc63fedef4040c0ee2e927bab3112e9de693a548"
+SRC_URI[sha256sum] = "e4e50dcd5a29441ae34de60d2221057e8064ed824bb6ca4dc0fd9ee88fbe9b81"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.35.1


