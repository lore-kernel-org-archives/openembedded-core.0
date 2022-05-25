Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCAEC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:26 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.7511.1653489023046279689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=T40gXDZ3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id f18so813385plg.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XGh7F4UG0fznfsOJsSQ4CjUqlmcpjoXp8UR3Ks2R6Fg=;
        b=T40gXDZ33H63AMBzUr57wtQOBfe9KDRDusZ7fgVNcSgctyG9TZSt9ZW2UyFkJBVTxv
         KqVw/Rn9TjX+u+ANMm3t7yE8z/09/jTNBVwXOopNIT1wcTVXkWwdXFfWSdfa0C8lLSEQ
         dPH3i0VEOXBLtlBqJCzRAcRu4LYhxgAFUJlf9hoXSTfBYUr9EIBLcfDnm9lhfrOuymk4
         bW9HGLUAPW6lzqPY74sggqy19gfzlqeEKpnFHBfW848f6mjWIwlcw8YbCdy3yKILLNv9
         DZHPQplXCe3CpOjCYdPB1RglcThWhWZTk9zbi24RvdM3/bLxxFFPYudpO7+N1vRR1lBR
         KETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XGh7F4UG0fznfsOJsSQ4CjUqlmcpjoXp8UR3Ks2R6Fg=;
        b=7sXSsxHN9NzsDs7r03ocZ6H1vJ9o1c7fLd2ZMFR+RgY2Fu1ShsawIMTpPeHmpOipJ5
         2fsXtKb+1+Yt5Dcq+c44tJT+DRGauvTlHerp2fePU/3Q15gCsT0v7SeT55fo0oc9YdqW
         oxxYDh/390R5gzLLJ1E91gHCa1cgxZ1mx8L/N2rkotwMTMyxrzgfyNWBnx/STmZkFdoz
         NGvW2zI4pEKP7/+w0HA1UzmdXv4O7asMWglLJJfm+mMdBaSGjxB0EESOwlZ8dCOmTO8z
         Whh7SeD51+FIJU0s7ljEJkIdqH8nQtEiBeICIah0B9D/Qu3S2F7wwrzjrnWnInognTcW
         Mm9Q==
X-Gm-Message-State: AOAM533xEILkgvjhmCMoQdPkqOH2DGS6nrTUiWLxBrVyZHOPa29nxM/L
	mwQ6NjlV7eppiNswpH9LPwyve6ecHYB+m6FO
X-Google-Smtp-Source: 
 ABdhPJyqCyPH/qDj1hjQGfBRdQQK0EmY7hGNBGMsCQ61CBKRlSa3jiwHqZzNj0fU5t8mUezo6u2kPA==
X-Received: by 2002:a17:902:bf0a:b0:162:201e:1f49 with SMTP id
 bi10-20020a170902bf0a00b00162201e1f49mr16076160plb.39.1653489021924;
        Wed, 25 May 2022 07:30:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/19] gstreamer1.0-plugins-base: upgrade 1.20.1
 -> 1.20.2
Date: Wed, 25 May 2022 04:29:36 -1000
Message-Id: 
 <19e9c0b2ac92f9ffc3bcea8ce4761c81326ea4a7.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166134

From: Alexander Kanavin <alex.kanavin@gmail.com>

Bug fix release:

appsrc: Clarify buffer ref semantics in signals documentation
appsrc: fix annotations for bindings
typefind: Skip extension parsing for data:// URIs, fixing regression with mp4 files serialised to data uris
playbin3: various fixes
playbin3: fix missing lock when unknown stream type in pad-removed cb
decodebin3: fix collection leaks
decodebin3: Don't duplicate stream selections
discoverer: chain up to parent finalize methods in all our types to fix memory leaks
glmixerbin: slightly better pad/element creation
gltransformation: let graphene alloc its structures memory aligned
ogg: fix possible buffer overrun
rtpbasepayload: Don't write header extensions if there's no corresponding...
rtpbasepayload: always store input buffer meta before negotiation
rtpbasepayload: fix transfer annotation for push and push_list
subparse: don't try to index string with -1
riff-media: fix memory leak after usage for g_strjoin()
playbin/playbin3: Allow setting a NULL URI
playsink: Complete reconfiguration on pad release.
parsebin: Expose streams of unknown type
pbutils: Fix wmv screen description detection
subparse: don't deref a potentially NULL variable
rawvideoparse: set format from caps in gst_raw_video_parse_set_config_from_caps
videodecoder: release stream lock after handling gap events
videorate: fix assertion when pushing last and only buffer without duration
videorate: Revert "don't reset on segment update" to fix segment handling regressions
gst-play-1.0, gst-launch-1.0: Enable win32 high-resolution timer also for MinGW build

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 905766e63a6159535b9da86c4f0af62956285199)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ugins-base_1.20.1.bb => gstreamer1.0-plugins-base_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.1.bb => gstreamer1.0-plugins-base_1.20.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb
index 0953261a98..e47851700a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "96d8a6413ba9394fbec1217aeef63741a729d476a505a797c1d5337d8fa7c204"
+SRC_URI[sha256sum] = "ab0656f2ad4d38292a803e0cb4ca090943a9b43c8063f650b4d3e3606c317f17"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.25.1


