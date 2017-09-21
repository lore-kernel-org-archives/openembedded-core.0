Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 56503780A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:21:55 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id i189so13703755wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=swCnS0JmHH6zmoE90iYTjO8T174iUERDpuIiASifLeU=;
	b=XVnNJQCscCkIcryBA0U4Z0cIlyeiMUBXh4vU++MppMkaiQUpBFMO+4Vg2WokGfS6k8
	vJgzy8B5FoCAFmxP57Fn/5s0TXElXhAph3ZbDrai1BRVir+E0dBo98eEL/k2u9PbtSL8
	X7HLR2QNFJh2Fy911R6BU3Kjf4QZ+T44n/THk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=swCnS0JmHH6zmoE90iYTjO8T174iUERDpuIiASifLeU=;
	b=KmGVGC/yoHYt6mSHMheUMPjTjGcd2J076Vt5ZKOVrlub5kKALZuHSERlg8FlwQCAi8
	t4eXHyJl057IeMOj8bZn/3vZ2iH/RmzcIff8LX1rFE5bIcECXUdHogpe4gJNtI2290cd
	fYZu0LBTyU+R+vvLQf1BYZq+WAquxgAR9GGXBj6xaVRiwbuq+riV9TcKD6TcJBAk6X+4
	oBzZaZBk+tuJU5bneDiYHt5ELfeca7Nm71VbKabs1MUgw1YqEJK2XWqeTeusKifbNIyf
	zMgKGJN4PUVtbV6c+KpvP/PnLU+lnlYHIOZGH8YCWaMJ0OwxH840NOivP0Xi/P+w2CsY
	JSqw==
X-Gm-Message-State: AHPjjUh1dAW1/7Zx6cWE13w8Vivj0ujV/K9g/lfm0W3+CkWD5Ul4hJ4U
	tWl1E3hm0lOrow4bGDUSgG/7os/8+zw=
X-Google-Smtp-Source: AOwi7QApiYvWFPmUr4U4loWcSgG6oC2gTTtbsghW91sff87wSdBC2mq/h4MY0dm0WRooJbvUFatIPQ==
X-Received: by 10.28.45.14 with SMTP id t14mr393855wmt.50.1505985716854;
	Thu, 21 Sep 2017 02:21:56 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	g132sm1103466wmd.5.2017.09.21.02.21.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 02:21:55 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:21:28 +0200
Message-Id: <20170921092131.25537-8-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 07/10] gstreamer1.0-omx: upgrade to version 1.12.3
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
X-List-Received-Date: Thu, 21 Sep 2017 09:21:56 -0000

Bugfixes only release.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../{gstreamer1.0-omx_1.12.2.bb => gstreamer1.0-omx_1.12.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.12.2.bb => gstreamer1.0-omx_1.12.3.bb} (69%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.3.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.3.bb
index a1d4576402..15837d3dc5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.12.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "4a1404a20b72e4ab6e826500218ec308"
-SRC_URI[sha256sum] = "1b22398f45a027e977d2b5309625ec91cdcaf0da8751cbc7f596d639a45ba298"
+SRC_URI[md5sum] = "53d2ca9739f9189d9c1924d4af71e8a4"
+SRC_URI[sha256sum] = "eef5de8bab1bb495bfbc9d16af9837d7f55b47cb6b97819b3152c5899c85843c"
 
 S = "${WORKDIR}/gst-omx-${PV}"
-- 
2.11.0


