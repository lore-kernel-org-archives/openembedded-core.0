Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B40FC433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:46 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.7523.1653489037776535097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TPEosnzA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id z25so6683549pfr.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+Jf7Q1pl1l596DmjnJw/8BJmqqKwukh5g8F+xVdareU=;
        b=TPEosnzAbBOAj3UDxCU0iWCemQ1gTWeXyyx061i/im6uQ6lTpEdpLYZXkKgYPx6N7B
         +7emt6WXDnG0C6pmC6eM6DT/YPoy9rzddXIMAooE0IL6TviqAvr8J9z2zggGe0An4dkH
         J/c1MzP7tF7f6KizjGyq5kBgHSq8w2zPxfc8Qo0NS1GtnAYZ9IQJJx45LNeye5GantZc
         ehO9CDCXoEsEOPYdEMNPZNtIO0jpKNWUyeDa1AThtH6hiCB70cUsnT1ZIcItWAT94GCm
         svnFCkGUocobQEPiWGQebOlgjOMR6Nk0iQt3bANAh4PHI5CfMxpi88VuwCIioN1lhu3s
         5rRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Jf7Q1pl1l596DmjnJw/8BJmqqKwukh5g8F+xVdareU=;
        b=Gdy7o7pky3qEArtzqDY3NBQ/PBGXrG/d+Ym/A5zjx7joWMm2jL9udVZKE0NboKDLIs
         MpBedWKhnQ0itDD5XpT4dAYyiqnbvXQsq9r1Hgfydl9EFyA+VKJQGmuA9pJSnp8Ok5zw
         O7RJqPLsqlDgUC0oJNphfdGPD9+B6EIoqhqEB3XCMBP6b9o28SYWgdBlY8a3+nygB9Gi
         w7qUN3CC1/lo/BOtjm6iPvN+9psUqav9YMKuNvGB2TL7ZxQWxSDw3XwcltgLwR4uZgfZ
         2u57a4RtUhUnyljDnOZJNOfWxvtGL25cwiALehFN5pK3To6/iPNuHxQS+czjrzgMPtwk
         kxYw==
X-Gm-Message-State: AOAM532QToiSM3ilWeUV+v2ech7B6ET81EVD+pOD/AY+07ebUaXABQPc
	lE7ddgAANWa9/kbKX2a7OV0ZasHEo2CoJOcW
X-Google-Smtp-Source: 
 ABdhPJzVbjpkmQluKJ00FzrTeY9rbJu8WcwquF7LnvY8RUnT64OadTEkMi2idAmKaj0CkmVTNpAjTw==
X-Received: by 2002:a63:904b:0:b0:3f8:4814:ecb4 with SMTP id
 a72-20020a63904b000000b003f84814ecb4mr22832641pge.257.1653489036664;
        Wed, 25 May 2022 07:30:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/19] gstreamer1.0-vaapi: upgrade 1.20.1 ->
 1.20.2
Date: Wed, 25 May 2022 04:29:42 -1000
Message-Id: 
 <5b2f2ff633fcb5742ebaf309d86bba70c3eab398.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166140

From: Alexander Kanavin <alex.kanavin@gmail.com>

No changes in vaapi between 1.20.1 -> 1.20.2

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 423d901d58e7f14d65b657d2cc61245ed9210daa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...streamer1.0-vaapi_1.20.1.bb => gstreamer1.0-vaapi_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.1.bb => gstreamer1.0-vaapi_1.20.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
index 48b571f563..40dc21cf45 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "87fbf6c537af9079c99a9aefe951da119e16e5bcc9cc8614f5035f062bf21137"
+SRC_URI[sha256sum] = "30126ab6e3105dab8da76bd9951a68886149bcd70c7fee0bac68de564de41d3d"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.25.1


