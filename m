Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6B1C4332F
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 23:45:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.44426.1638747938230277558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 15:45:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PaZi6w7B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id i12so6829296wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 15:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BLBtOGsb3wEOwAf/maere2Vj7LTjmDfE0y0VK9uHw4M=;
        b=PaZi6w7BIP6ZklTf8hKHGBniWGy9W+TgyIJePBXyFCCN9UougrA6HxDe0ACUMVuUg+
         ujnLC5A+S+xU+xoNknYx+mnRGnTnReKLsmEU4MrMMl78N1S7Yg2xWCvDVbRbSOGIpGcH
         5g0mx29UDHYSeRjNgwgAoN5uZMehJY9RKLwB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BLBtOGsb3wEOwAf/maere2Vj7LTjmDfE0y0VK9uHw4M=;
        b=OAQGVLPLWzto8+pi6CRMGNaiFQ8fIuvhhjEpezQJUJhouvqjeWoMEyPRAbILoFrJOX
         RhA+c7j0ISYocsBZhIx09CBs8dear87RYS6G7v7UNK1SeXyafBFU27SI3j29JKlcFe90
         7JgacmS9vdcRYEY9aRr/ttzuMwmXNLXC7qNqZ+eGR9HLtrPIEVSpbMsGPZX+9I8z3F4M
         VoLHd9gStmxbFMVyvO5h5anaexfPDtR7uPUdp/7IAbBlO2dk0NU2SlU+ameDOIPnA06x
         Ibv1A2NSB5drnqBQcSbHZgSR1qCm/BSpBRZ2/D78YHW0HLJ7VHwA716qEgjawT049kJM
         28dw==
X-Gm-Message-State: AOAM533NrKGlJK1DcJB6iM6HSML0zmP/oqgKBYlHsgrvmhfqPFBtw71s
	fhRJODireo1RcoLxofuVwRjq9EkvIRmMIg==
X-Google-Smtp-Source: 
 ABdhPJzshgNFkR16bEyJFfLpBZzDRQb2YQMSpMIeIk9cg9/gBWRvgudUqn5fC/khMb6PRsfcrCzZ/w==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr35100024wmj.84.1638747936791;
        Sun, 05 Dec 2021 15:45:36 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:50e7:dab5:2141:24aa])
        by smtp.gmail.com with ESMTPSA id
 b15sm11984071wri.62.2021.12.05.15.45.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 15:45:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] gst-plugins-bad: Add missing libxkbcommon vulkan
 dependency
Date: Sun,  5 Dec 2021 23:45:34 +0000
Message-Id: <20211205234534.480206-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211205234534.480206-1-richard.purdie@linuxfoundation.org>
References: <20211205234534.480206-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 23:45:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159204

The vulkan module has a dependency on libxkbcommon which needs to be
listed so the dependency is correctly handled with debian renaming.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
index f3ea6f72938..b189eab63d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
@@ -87,7 +87,7 @@ PACKAGECONFIG[v4l2codecs]      = "-Dv4l2codecs=enabled,-Dv4l2codecs=disabled,lib
 PACKAGECONFIG[va]              = "-Dva=enabled,-Dva=disabled,libva"
 PACKAGECONFIG[voaacenc]        = "-Dvoaacenc=enabled,-Dvoaacenc=disabled,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "-Dvoamrwbenc=enabled,-Dvoamrwbenc=disabled,vo-amrwbenc"
-PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader shaderc-native"
+PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader shaderc-native libxkbcommon"
 PACKAGECONFIG[wayland]         = "-Dwayland=enabled,-Dwayland=disabled,wayland-native wayland wayland-protocols libdrm"
 PACKAGECONFIG[webp]            = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
 PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
-- 
2.32.0


