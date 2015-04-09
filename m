Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id C9F3D72D74
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 09:10:03 +0000 (UTC)
Received: by wiun10 with SMTP id n10so89750044wiu.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 02:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/w+ZwBqSQJmCDs0Z1tRbC6wkd8sw6uG96tcm6Ii87bA=;
	b=dM5953ZOA+JxOTfTYv83ann6laYNqHJVN7lvOImxvrSE5yKtY0X/V98uaLJ531TW8Y
	rV844+0wcdFOSqLxtPDx85jXPiFep0MW5mecMSSQu5QH45uuyiVPfiBZIL0Jxm3YBY7Z
	tdcg6+h7MnCXytgtUslbdYYIbh80f/lv6Y/A5Vxtyk4ksRYOYVF7WrgC4nbIJDASnY9B
	Dxj9MfeTdnFbPOeNi+Jav1p5zw36tVdVDdhVBi2xVEOkBRtsJVMk9Tl3CQuU3r/DhavM
	aqRQJGsHObUK/2gbgFWkTaKWZvacT0onKgwWnyTgaEZ+QITjPqV92LEBgMlXLLQBeKut
	LQKQ==
X-Gm-Message-State: ALoCoQmJfddLhmoWkIf2jblQ7EmgZ+peAkO1QLytvZ6CkgqsgTTxqvqzAJnnG1kzIJkEf/dq7vM7
X-Received: by 10.194.222.197 with SMTP id qo5mr57558537wjc.142.1428570604478; 
	Thu, 09 Apr 2015 02:10:04 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	fy2sm19239413wic.15.2015.04.09.02.10.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 09 Apr 2015 02:10:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 11:09:53 +0200
Message-Id: <1428570593-10940-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1428570593-10940-1-git-send-email-koen@dominion.thruhere.net>
References: <1428570593-10940-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 3/3] gst-ffmpeg: fix internal-libav builds with inherit autotools-brokensep
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
X-List-Received-Date: Thu, 09 Apr 2015 09:10:06 -0000

Building the internal copy of ffmpeg is broken when using S!=B, so
inherit autotools-brokensep

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index e1a13c4..b5c838f 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 HOMEPAGE = "http://www.gstreamer.net/"
 DEPENDS = "gstreamer gst-plugins-base zlib bzip2 yasm-native libpostproc"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://lower-rank.diff \
-- 
1.9.0


