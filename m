Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69615C3F2D4
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:37:09 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.4072.1657773428231241480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Hz+tDBdp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id g126so827626pfb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LXayFFuISdT/lwme8fS1QKFrNiMrwe+3xJOsx145uRU=;
        b=Hz+tDBdpSLEoNJ6LEJCsAorXCgdmmNb8c9xiXaZmWW7zx4DkL/iLNMZM1q+6dcMAkd
         g4DjJu1HvGn7gkvLIGc4kXEz+c8yOZxH112OHXiGJE3IET+G4AHGJaEiAMnjX5YPi6q1
         HXslxvePTJojE75X0DKlOk9wNMQIy9Gq19B5RNK1EpiaGhvZjM+8D/kfPwQbyxmCJRFi
         hDMLd6kyBxJ2SNQIC9ABRFjDe5SdY0nxHTh+syrHBmTrDPBZyWEI4S0F2pPbwH6VPWmf
         gb76cCRZGKHH8lIbCS74sjHR5XqmwK61pKRbxL6RNSfP5hjKX890/0Q7K36v+gihhfFj
         9WsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LXayFFuISdT/lwme8fS1QKFrNiMrwe+3xJOsx145uRU=;
        b=VY5GnfCTLzukCf8oNQkBYAs+uYSlwVM37bUVNRfIA95QuzTynFMd82ySFuWAk38mBX
         ITZgpB9AmDLYLKAD3t9/Jbbc6+4tZ9uQJwStVNnAhfQjA1dW9GF/xoHoskfz12CIbHiu
         RdQ4ye1mDzmPiEc4AKMIwnM1kz7nng5uBaTaf4dKj+E70edVseMz1sbusIPxh5SkjdMW
         xY3e0O7uv2/8ci7yBNYD3RD6uyNP8WYW2N82VTg5sfruW2NH9S0hIaw9jUWHaq6fI2+E
         DhDbeC1WFdXNMosJ+wnaXaw+Y9vrPRnF0B9YdYAdb5nYGUZSIigLwGHfyO2vG4p6fAEy
         +zLg==
X-Gm-Message-State: AJIora9zxeDtraY4Zj09+NYG73ivG+gO2aV1z7XFZ10391OVfExcKDNV
	03Wpdkc9wnv2oLOTtdbP/c93lATHfGOVKWbw
X-Google-Smtp-Source: 
 AGRyM1uY74OLugSTnSh9GCwIW3oisxbsyBk4K9csmly+4e7EffWW+FH7oko51f7HyyMqGIgFmDAb5g==
X-Received: by 2002:a05:6a00:1693:b0:528:3c0:5825 with SMTP id
 k19-20020a056a00169300b0052803c05825mr6593548pfc.21.1657773427106;
        Wed, 13 Jul 2022 21:37:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.37.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:37:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/27] weston: update 10.0.0 -> 10.0.1
Date: Wed, 13 Jul 2022 18:35:44 -1000
Message-Id: 
 <3903a248e1b861d0a3826b35d61666c6a3bb7ad5.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:37:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168021

From: Alexander Kanavin <alex.kanavin@gmail.com>

The bug-fix release includes the following changes:

In some cases we couldn't assign outputs to clients in kiosk-shell. This would affect clients who perform an initial commit and afterwards set the window property.
Fixed a couple of issues with output assignment in multiple outputs setups on kiosk-shell.
Fixed sub-surfaces that were not updated on commit, by caching buffer damage for synced sub-surfaces.
Fixed an issue with sub-surfaces, which in some circumstances would show them of, even if unmapped.
Fixed build issue related to deprecated fbdev back-end.
Re-worked some previous fixes in desktop-shell to address closing/destroying of client's windows, which is particularly problematic when having close animation enabled.
Minor fixes to the simple-egl client to defer the creation of the EGL window after the initial wl_surface commit.
Multiple fixes to the simple-dmabuf-feedback client to support multi-tranche feedbacks: improved buffer status tracking, added a fallback print method for unknown formats, and resort to using a time slot instead of using a number of redraws.
Increased buffer limit to four for simple-dmabuf-* clients.
Improved debugging support when KMS import failed. - optimized surface feedback creation on demand.
Fix performance regression in fragment shader brought in by previous color management work.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 682594b7827d15813c3bc4980a561ad7e89ea8b4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wayland/{weston_10.0.0.bb => weston_10.0.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_10.0.0.bb => weston_10.0.1.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/weston_10.0.0.bb b/meta/recipes-graphics/wayland/weston_10.0.1.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/weston_10.0.0.bb
rename to meta/recipes-graphics/wayland/weston_10.0.1.bb
index 93f7b59659..e27dac164e 100644
--- a/meta/recipes-graphics/wayland/weston_10.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_10.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     file://libweston/compositor.c;endline=27;md5=eb6d5297798cabe2ddc65e2af519bcf0 \
                     "
 
-SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
@@ -15,7 +15,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 
 SRC_URI:append:libc-musl = " file://dont-use-plane-add-prop.patch "
 
-SRC_URI[sha256sum] = "5c23964112b90238bed39e5dd1e41cd71a79398813cdc3bbb15a9fdc94e547ae"
+SRC_URI[sha256sum] = "8a9e52506a865a7410981b04f8341b89b84106db8531ab1f9fdd37b5dc034115"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.25.1


