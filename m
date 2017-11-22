Return-Path: <limon.anibal@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 59F3778508
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 21:31:55 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id u10so14738714otc.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 13:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eAlsZ11CrcY0XpYMY81xZLI+xykonFdOV6VfUIKc7ok=;
	b=jlcPOVbi/fRcOa0HksrBcXQHt6cD2Jfnybw86Y9mAhSo6clvd4BtPxADaOmo/E5FUX
	vbrtI5Lcl3zrf9ByOh3qPx4I8tGOLdrBvXLTXc9qFvxwXUlude5G1RzDLR8PUkO+yDVJ
	Mfjg29EZ+59QORslseCoQeqp5AeDSnq9P/u2o9hm969uYmkVbkx389d4oK4xF+Yc8wwq
	fZTsFM3KgJZ9eQetHQ4At8JSbf4dyKH0v1MHbyyuOuEXNjz85mzmRKNgK8Es98zkhfpj
	O05WmA6AuDQl6Ur/g355XpNMi7cndxQCcW3UT85qC+CpweRdk1Jn/q07R7gU/tIJw8SG
	rdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eAlsZ11CrcY0XpYMY81xZLI+xykonFdOV6VfUIKc7ok=;
	b=L5XkfNZ982n5Hc/u5BGpobWo1wAz2SpeJD+XxwAcJWJVDFtWvpQIUUMxGiQ1KPV9pD
	hvEd1y+lXhIjXersvtN9Az2j/m8CM4fhpb5hTZLsXwIG+JgTeebf/P7npUyrlemq0vJM
	lRA0x9yBow30KW4OJR0UZDbpJdGQ2Z9a5Pon9Dduzv77OCtTlGvsGfSF2f8QeU2hz45R
	So/PqxyBNZQB23kHYHHU+1EWfury1j5y4eUXit3lvlsM7HbY0qv4B+a4NyGHxz+JPIR9
	LLinROREr2qCYWFxJjC9tIelKelhhdTfqCFRwlH7/+balVH1yrOV2TDuSLRMcRFjXNgt
	Fe0w==
X-Gm-Message-State: AJaThX6T9z9dFm8st+zvHyj/W04B++B6DofuWBeB1AmaVYA3kDyTahNM
	Aq8g1HfSf8JvFMqC+cGWRaJ94xKe
X-Google-Smtp-Source: AGs4zMYMGwVCaGaqr4yOY8mR+SZ5cCpS3IdAdkpTA5hRZO3NhHzxJK6rLgkq4DyxsYOrH+vvPOur/A==
X-Received: by 10.157.12.150 with SMTP id b22mr17469817otb.390.1511386316130; 
	Wed, 22 Nov 2017 13:31:56 -0800 (PST)
Received: from blackbox.Home (187-177-61-29.dynamic.axtel.net. [187.177.61.29])
	by smtp.gmail.com with ESMTPSA id 94sm7512135otq.16.2017.11.22.13.31.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Nov 2017 13:31:55 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 15:31:40 -0600
Message-Id: <20171122213140.4307-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] recipes-multimedia/gstreamer: Add gst-validate recipe
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
X-List-Received-Date: Wed, 22 Nov 2017 21:31:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

The gst-validate is a tool to run integration tests of Gstreamer
components [1].

[1]
https://blogs.gnome.org/tsaunier/2014/04/21/gst-validate-a-suite-of-tools-to-run-integration-tests-for-gstreamer-2/

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../recipes-multimedia/gstreamer/gst-validate_1.12.3.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
new file mode 100644
index 0000000000..7477bf7a4e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
@@ -0,0 +1,17 @@
+SUMARRY = "Gstreamer validation tool"
+DESCRIPTION = "A Tool to test GStreamer components"
+HOMEPAGE = "https://gstreamer.freedesktop.org/releases/gst-validate/1.12.3.html"
+SECTION = "multimedia"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "623edc479a1e5c1e76bd7e1cf8393253"
+SRC_URI[sha256sum] = "5139949d20274fdd702492438eeab2c9e55aa82f60aca17db27ebd3faf08489e"
+
+DEPENDS = "json-glib glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
+
+FILES_${PN} += "${datadir}/gstreamer-1.0/* ${libdir}/gst-validate-launcher/* ${libdir}/gstreamer-1.0/*"
+
+inherit pkgconfig gettext autotools gobject-introspection gtk-doc
-- 
2.11.0


