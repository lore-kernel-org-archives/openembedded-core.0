Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDAEC79F85
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 08:06:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9867.1788681967049283536
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 01:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bJzI/BHE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso27598445e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 01:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788681965; x=1789286765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j87L3SexifziFoxFieatwe3ilERIfxXfqA6i6R83HX4=;
        b=bJzI/BHEpuuzlFokXIkUoOwRz/vZ6aMY1JDhINLbZ3UxbhNi2vqjsuKDUh8zqLnGLb
         cnKf3uBxiLPjXldQoVehE7DCEPxNuyPc97eE8Uv33rP9z7UjgDxStaPhD4tX1YDNMvNf
         8ggvXcH+Ztm+btOO2ZGEokEzdIzKe8oiL16kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788681965; x=1789286765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j87L3SexifziFoxFieatwe3ilERIfxXfqA6i6R83HX4=;
        b=Tzkfe5HqLhLnipj+WQvynFDsfT2fsWf7u4q16DWdaXtR7gVIRoc1z6ATxt1QOCeJpC
         ohC85PIOS3Ep7ak2qxmA8vSqsMdweUiI3nfXxU9MBUV4gJI6jlcQMdjznc0k5k1YitVc
         Z6vR1orwTwns+eo95tiF1YC5MBoPiLdEggx8rsobQ69F3CzR40rcrNgPilJVegIz4upr
         86mmM7aHTaiQ2nj20wkwjTDjE69bc+uQwp2AtWrzCxpb0WapsHC2COkwt4Tm2YwNzrB9
         Cvab9W2Wp1vGhOkWsaWa/6UboFhjYUVIMcGWUVwsgWv0jShJCGVICtpjq6Ng1HrCSE+6
         NS6w==
X-Gm-Message-State: AFuF++kRhrisqHvUcLOQb6jMBGOOC89FY0tNxayPVR20AoZByCibpMOK
	bGAS0P5R5qNA5/3NUE+icxDTf07O5yV33IY8FHWcZXCtXh0de/YLVfn7zM4C11YkX+2Ia/Tr5rW
	iBN47S6o=
X-Gm-Gg: AYBFou0XORIaVPEI1WCMjUCpE4EiNtiI587wPEyDj+3+cDDquUFZCNCboS8lMBB7yzN
	n5+vA/e61rGhBN4209jKbD4N5Vl8ofsqw6lAHyvw5qBQkbZjSn3c3g/IwbUi0XD5YITD0Eb/lPL
	fUHW6QcsNWAhdb0XFw8Lpjsj+2meRT9Us3ZjJp6pw/wR28yxdnEVReBCXEIloT2x8Gm2cqXeriT
	eYwyJhg9eBJLElHEw4MrfQGzttKbFlAKMYIUSLtwLJCYt3XCGyrydg/yeeWICmwIjqFFA7p4L2t
	iiOa7zCPojamDIJcxJDmnWXB6VWo22Fce8SfX4XCHV4H6WGZTQObS/MHdH5KNX+SthGZoqXaKFu
	WhhDWpgjZeFJf4m+ezq1Z5iL/e1GhXswJguXmZHzsNf8FMjBfe+NNQsqc9GjlW4/pWyqL/1gqXL
	tNKIUAVo7uRsJxo8SV7eeYqUYEn5Wv4O1+69vXQojXfJo2pfcBWO7c4ilHY/TQZCD2BIsIFfDUi
	FmA9XHaIQ0c/PswyA==
X-Received: by 2002:a05:600c:a04:b0:499:db27:7b1 with SMTP id 5b1f17b1804b1-49cf82621acmr170785155e9.15.1788681965220;
        Sun, 06 Sep 2026 01:06:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a7e4:ecad:c000:9c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm183691545e9.11.2026.09.06.01.06.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:06:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] taglib: upgrade 2.3.1 -> 2.3.2
Date: Sun,  6 Sep 2026 09:05:53 +0100
Message-ID: <20260906080553.3151802-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906080553.3151802-1-richard.purdie@linuxfoundation.org>
References: <20260906080553.3151802-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 08:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245207

TagLib 2.3.2 (Sep 5, 2026)
==========================

 * MP3: Fix parsing of per-frame unsynchronized ID3v2 frames.
 * MP3: Accept iTunes ID3 frames with space padded ID3v2.2 ID.
 * MP4: More tolerant handling of `covr` atom with wrong flags.
 * MP4: Support additional codecs (AC3, DTS, EAC3, FLAC, Opus).
 * Ogg: Support Vorbis comments from a multiplexed stream.
 * WMA: Improve property interface for ASF files.
 * RIFF: Support RF64 and BW64 64-bit extensions.
 * Matroska: Fix file scanning with fast read style.
 * Matroska: Load attachment data lazily on demand.
 * Matroska: Read the segment title without audio properties.
 * Verify values parsed from files to prevent resource exhaustion, denial of
   service attacks and out of range conversions by crafted input for various
   file formats (AIFF, APE, DSDIFF, FLAC, MP3, MP4, MPC, Matroska, Ogg, SHN,
   WMA, XM).
 * Fix data races in lazily initialized shared caches, test thread safety.
 * Use `Requires.private` for zlib with `pkg-config`.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/taglib/{taglib_2.3.1.bb => taglib_2.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.3.1.bb => taglib_2.3.2.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.3.1.bb b/meta/recipes-support/taglib/taglib_2.3.2.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.3.1.bb
rename to meta/recipes-support/taglib/taglib_2.3.2.bb
index 0852295650d..1156e44e67f 100644
--- a/meta/recipes-support/taglib/taglib_2.3.1.bb
+++ b/meta/recipes-support/taglib/taglib_2.3.2.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "a19d90e6fd41d09a0281ec0fe762d51491d7a6ccffc923c4f7868c5e647ca230"
+SRC_URI[sha256sum] = "3ca2d8afaa7f1cf7f6ed10e511ebc368bfacd6dcaa3dbfa690b89e502e8963dc"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"

