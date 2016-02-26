Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 662ED773CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 06:14:44 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id jq7so69655823obb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 22:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bSHXrDd3qzxFZfIP1XdTG5LHvtF0Ay+wHcNa6vTTjyY=;
	b=0GOj1DuCuWIWQSjtOn73DFGuwwRkqM2/KsceExRLBv9wzVlKQsaq/3a+sJGkuySVMl
	P3Fz3txZumNCFIHo8w1LjxSP1hdFJ9pn/sm1EQ9vZrCRmwkoe9qEL3CqUjZlSIyYTbqk
	mO2Ize+GV1PblGKYudpiWzLlmDWEvD4a2mP7aqO8j3Q3UGEblPOP7zDFq4o7S/jCYCzc
	eVXku238FX/U8AKLIT+WL1Jr3K7049uW+vYbiwj554LMZBPflX2mEJIFyZ0bVNIyOzW0
	M/iNvuNdi7X7ZoRI86Qy2EmjWQsv3wMqnaByzvVdowbIOz+RVvqWBDyKi7jK51p46kRo
	tqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bSHXrDd3qzxFZfIP1XdTG5LHvtF0Ay+wHcNa6vTTjyY=;
	b=EA6eqGPvOeBNQhBAlHtg1C0xhtc+HcIJPB2qFoHk/Dm8fy3tUCBmO41RiWJWY+sLkl
	ikHnonhFkH+gmyn2F/fLBGf+U0yi0QYi3L9qL14XT5hkGW0HZrcu1JVmccq90mMY7UlP
	AzVh018otnG7LFu8cl6Q+sV5Aw2HABFsZZ3h5y0u7M7twPmzjVYPgpi0ZxBO80k5cMCc
	F3+zUjQUr1Iu04ksr3SP+UMKzeT2MIVxK/IXHJZoN7FqucAteZDq80EGFvZWqhtc4Unx
	Re+pgGMN0Eje/QmjUwtzAQuByHi9lEpvMdTw81ywRPTH1+QoETRsz/SKFwlC1639nw+p
	Nhqg==
X-Gm-Message-State: AG10YORYCTlaD1fns+LscsRevuYilw6T6kd/P7xHhLSkg6Wc74SMpitpPgmrhul3qJpIhg==
X-Received: by 10.60.116.35 with SMTP id jt3mr42125255oeb.79.1456467285616;
	Thu, 25 Feb 2016 22:14:45 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	s73sm7816486oie.28.2016.02.25.22.14.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Feb 2016 22:14:44 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 22:14:33 -0800
Message-Id: <1456467273-10140-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gstreamer1.0-plugins-bad.inc: enable webp PACKAGECONFIG by default
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
X-List-Received-Date: Fri, 26 Feb 2016 06:14:45 -0000

The webp plugin depends on libwebp, which is now present in oe-core:

  http://git.openembedded.org/openembedded-core/commit/?id=1c00bf8bce7a197e83456bf5094299d8f33ee473

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 6a89fc9..7b0c396 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -18,7 +18,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
-    bz2 curl dash dtls hls neon rsvg sbc smoothstreaming sndfile uvch264 \
+    bz2 curl dash dtls hls neon rsvg sbc smoothstreaming sndfile uvch264 webp \
 "
 
 PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
-- 
1.9.1


