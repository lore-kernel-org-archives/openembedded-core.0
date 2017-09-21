Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8510778112
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:21:53 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id a43so4066790wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0F1iz+1dem0+HTaAJpI2JxFGRnNbyfwuzeslpW0anWw=;
	b=XKU3cIRKwiyNkz++eEYYbAiiEUdJwmroAuzzA8gs36l9G8CD9WQPVdQwgLgtd+Ce0t
	m6aVCuSAlZthhbBRDeKgXJeSVP+55LWaysGTTpmdzNLtrDUVdAReikYUlYiUli7WMQPo
	JdiVLNPKssazejLnWFXwH+amIy9tg+nM1imhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0F1iz+1dem0+HTaAJpI2JxFGRnNbyfwuzeslpW0anWw=;
	b=kSytnMW94ysmI+x8mCjjis8NnNAf58ntNPFGP4ijeIkXCRwJ2RqlxletE76KoONJ2q
	2lmJVJALn82LteEh2lq4u4cWqiOovoSCnBCbEdzng1hXVbzE2cN1IQpVt3a670OhhHU2
	AfyWyX6fMGzLEl67ZyPxEIwBbtA99ecwWwT3aaceYT6e2COPw/X/MLTEP9G+V7+g0GLC
	RRmU5qnKmOnPNOYM4qDGZXLDV6j2gdkf6vpxfVDHPz5L3/4ibnjYnfOwhbSR5MFwbT49
	DPSqa1L9yvpH5eOSXtcCgrTiAfg364cuS6zOl4KvIkjcL7WCtnR2W6Z7LJquwH/6mLR0
	UbnQ==
X-Gm-Message-State: AHPjjUji+EuFkslFLDvycQfXcRYbBQ7oT+ohXr4C2OFq4+6m0B8SeVBd
	LgzbH/2FbibnO5fKaQjuyY2mOJ0II3Y=
X-Google-Smtp-Source: AOwi7QCS87CODMbBDxhzFQCchfbz0FAmhb+zZR2Wwwi224FGXgCB0VYGLHHhhS6+mVvaYX77ZeBrVQ==
X-Received: by 10.223.173.98 with SMTP id p89mr1268015wrc.194.1505985713968;
	Thu, 21 Sep 2017 02:21:53 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	g132sm1103466wmd.5.2017.09.21.02.21.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 02:21:52 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:21:26 +0200
Message-Id: <20170921092131.25537-6-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 05/10] gstreamer1.0-plugins-ugly: upgrade to version 1.12.3
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
X-List-Received-Date: Thu, 21 Sep 2017 09:21:53 -0000

Bugfixes only release.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 ...1.0-plugins-ugly_1.12.2.bb => gstreamer1.0-plugins-ugly_1.12.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.12.2.bb => gstreamer1.0-plugins-ugly_1.12.3.bb} (76%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.3.bb
similarity index 76%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.3.bb
index 6956c85be6..5a5fccfb81 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.3.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "eb639021905a32cf3013ca5bac1b694d"
-SRC_URI[sha256sum] = "1cc3942bbf3ea87da3e35437d4e014e991b103db22a6174f62a98c89c3f5f466"
+SRC_URI[md5sum] = "8a0ba8141b1548ee094eb97e7cf5471f"
+SRC_URI[sha256sum] = "e88ca584c94ea78eeecbf3af00ef7f134b66bdee7408aa4aa6c547235e060052"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
-- 
2.11.0


