Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7495E606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 09:09:59 +0000 (UTC)
Received: by wgso17 with SMTP id o17so1385123wgs.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 02:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=az8z55SDBw/fDmWCBMbuttaVfe7yKUEnjJlbLRuvLwg=;
	b=fYaH8PuY7bRR5afx3zXRLUoJ9N6XrExV5oNuA3HOSxxLQHZ5YAvSXhm3pTHGamUcD3
	7+zH4xg0MZdME+9bXmsTJRfcEck86EI7kRdrqKwkkrRcIZhjYiYa6E30zlzwOGLFpO8U
	LCyCxazE0hAYREVy/f5ZXIB608SzlrIUfsrtvoZFPvzSFx9kH0Mer8mKDKKUbraJ+Vry
	rraeaL2z9bGZt22/ewRU5SP0yAf0RQlYILlPdCaG6u0wsaLk2V2phbCRhYuy9R6JUyxl
	ngZB0JdIk/w/9aK7WGC+NLexgu52d3+5TTpC2/A1iN10XebNPAAVX2OcDP8HCWx0OmVy
	KTZA==
X-Gm-Message-State: ALoCoQkkt5eMLT+3OyEkkN9gr65MR8uFqvLcqHaOAU1gcGY/rigE5ZKDZdUAnSWFfnysJsCyWlBU
X-Received: by 10.180.92.65 with SMTP id ck1mr4323329wib.78.1428570600784;
	Thu, 09 Apr 2015 02:10:00 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id go4sm12988906wib.1.2015.04.09.02.09.59
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 09 Apr 2015 02:09:59 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 11:09:51 +0200
Message-Id: <1428570593-10940-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/3] gst-ffmpeg: fix libav-9.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Apr 2015 09:10:02 -0000

The patch has a stray '>' in an #incude directive leading to build
failures when used.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav-9.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav-9.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav-9.patch
index 9055b34..1860752 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav-9.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav-9.patch
@@ -111,7 +111,7 @@ diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcodecmap.c gst-ffmpeg-0.10
  #include <gst/gst.h>
  #ifdef HAVE_FFMPEG_UNINSTALLED
  #include <avcodec.h>
-+#include <channel_layout.h>>
++#include <channel_layout.h>
  #else
  #include <libavcodec/avcodec.h>
 +#include <libavutil/channel_layout.h>
-- 
1.9.0


