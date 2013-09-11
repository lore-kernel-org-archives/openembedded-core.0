Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 300CF60F1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 20:30:32 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cb5so2664566wib.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 13:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4hsi+g8jl/vHcWLXQtkVcBjjhXty41NtJAeSIHnUHyY=;
	b=ciWMUlNi1Pp8ja7Lx/9kxS/9ULvEPtyWQBtBO9T10+7cj2gFNNHV6Xbl2xNiCpYrBI
	zQ8jRvamTTkK8m+B2Zjg48DOL/dTdHLoL+K0+RPW/dmYID5jNjFrIxkEt/qsN7syLCmV
	i4QdKyojRvlq6rwseXNNaDXHdEoba9kXRzdCoQHrHpb8QTjawoSPWjU1EWEIq/1jWEul
	yI5+Bw22WkocqNlVned06tTLOQR250Ut0XkNmETnRw+ue4WjaEC/DKSRE+VdcB4scXRg
	jysz5HZVD7BkwSv7ca2tQ2GDCKMUU8n2bnT8ih10zwo16DDG6oKcJUOYdlcLMPh4Q83s
	C7yw==
X-Gm-Message-State: ALoCoQmrboyVpR1UCR6YVBtzzCj6iozs44uIdhFv0o2ygRlbbdJIGTRAf5x98u0jcKYJ/pQJ8Jm6
X-Received: by 10.180.12.45 with SMTP id v13mr18631163wib.57.1378931433779;
	Wed, 11 Sep 2013 13:30:33 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm8305776wij.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 13:30:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 21:30:26 +0100
Message-Id: <1378931427-3479-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378931427-3479-1-git-send-email-ross.burton@intel.com>
References: <1378931427-3479-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] xf86-video-vesa: change depends to refect reality
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
X-List-Received-Date: Wed, 11 Sep 2013 20:30:32 -0000

This recipe appears to have been a copy-and-paste from -intel, because it has
dependencies and configure options that xf86-video-vesa just doesn't have, such
as virtual/libgl and XVMC.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
index fb285ea..4ec07a0 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
@@ -2,8 +2,6 @@ require xorg-driver-video.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a1f0610ebdc6f314a9fa5102a8c5c1b0"
 
-EXTRA_OECONF += "--disable-xvmc"
-
 SUMMARY = "X.Org X server -- Generic Vesa video driver"
 
 DESCRIPTION = "vesa is an Xorg driver for generic VESA video cards. It \
@@ -13,8 +11,7 @@ supports depths 8, 15 16 and 24."
 
 PR = "${INC_PR}.0"
 
-DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
-            virtual/libgl xineramaproto libpciaccess"
+DEPENDS += "virtual/libx11 randrproto libpciaccess"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-- 
1.7.10.4


