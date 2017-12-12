Return-Path: <limon.anibal@gmail.com>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7905778883
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:11:58 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id d5so18395058oti.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=buU0OdRDj3qMsipm+KQlUPptsTZJdwlbpAS+S1tk6J0=;
	b=BZghXOAMO7q8vd9Z3loYZm6pIZzuzMW5ldLwatTlxOQHIXOHuoFDplPxSXg9AZ1T6f
	Eqtk3YEkp5VqbpnMR8OfoEioyF/0XfXiSKsVkkjS9RqR0gjhAvwdznS8Ez6YIrvmyqGy
	5buYMRpOCW4bqwHu4kWOEUxy46ZnZr/g1S/DOA2ULcdgvyUvjf18jOtJ3d0OyiF7tWbW
	bczwya4KMESPnLw/DNjIrIN6SHuB7I85eWYxlxP6Y2smSgAQQgVZL0tHY6dKb28wj+zr
	6df86kUwvLd9cLOWMQZrQGDKACPQ0LETzNexUNYJqmqfpoHjOFRG7qYkQSKb1t95YYKK
	Wdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=buU0OdRDj3qMsipm+KQlUPptsTZJdwlbpAS+S1tk6J0=;
	b=furVxp6WB0hWmg6FX2gmZoRRXcyigqMp70J0/Y+v4oyXfi7mizI7sdfg6dfpWKBxuO
	vNZ+0j5DRFSdcSMilovT3Ggc581BCqywtCGpOfL7006ckz9TXflN8gSqGEN9B+WTeXJJ
	DZnSto97okggJnRwbQ2IK3pYjLQ9FT1rRYY0CmVhRjT6GuOzneyxw3ZmIoH6BXJDyqu7
	sUVaCa1J4uzYCWgQOy0j4g/iM0Yt6zMqLTkbF1NI6z3sX3GNlFOflrkHO7QSyiQFgepP
	YuWl9Th7mwhircj3H0ACo/v7rD7872mPn0aiK7BJc2FsXa3CHbzeLE2Hmp2aJdAyFJLE
	KYaw==
X-Gm-Message-State: AKGB3mLIhSzxCSk0RFKoOZHicWgy7WqGaFJq0p6NKKQjqzK3IQTcSi5d
	flGbTW+v/Wdy36pHvGvB0KlKoW8Y
X-Google-Smtp-Source: ACJfBosXS2I5bdf1pBIGpHUTz/IiZwgX9NpJ45b3N4skl5tvXUtXkfQdETOT2EgytYaqwv4PTaa7mA==
X-Received: by 10.157.81.195 with SMTP id d3mr3811515oth.11.1513098719341;
	Tue, 12 Dec 2017 09:11:59 -0800 (PST)
Received: from blackbox.Home (187-177-61-29.dynamic.axtel.net. [187.177.61.29])
	by smtp.gmail.com with ESMTPSA id
	n130sm7543735oia.12.2017.12.12.09.11.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 09:11:58 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 11:11:55 -0600
Message-Id: <20171212171155.15603-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>,
	otavio.salvador@ossystems.com.br
Subject: [PATCHv3] recipes-multimedia/gstreamer: Add gst-validate recipe
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
X-List-Received-Date: Tue, 12 Dec 2017 17:11:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

The gst-validate is a tool to run integration tests of Gstreamer
components [1].

This tool can be used along with gst-integration-testsuites (scenarios
and media) [2] to test Gstreamer components on the target device.

An example of test using gst-integration-testsuites:

$ gst-validate-launcher --sync # get [2] uses git and git-annex
$ gst-validate-launcher

or

$ gst-validate-launcher -nd # needs xserver-xorg-xvfb to run wo DISPLAY

[1]
https://blogs.gnome.org/tsaunier/2014/04/21/gst-validate-a-suite-of-tools-to-run-integration-tests-for-gstreamer-2/
[2] https://cgit.freedesktop.org/gstreamer/gst-integration-testsuites

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../gstreamer/gst-validate_1.12.3.bb                   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
new file mode 100644
index 0000000000..8f5437641f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Gstreamer validation tool"
+DESCRIPTION = "A Tool to test GStreamer components"
+HOMEPAGE = "https://gstreamer.freedesktop.org/releases/gst-validate/1.12.3.html"
+SECTION = "multimedia"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz"
+SRC_URI[md5sum] = "623edc479a1e5c1e76bd7e1cf8393253"
+SRC_URI[sha256sum] = "5139949d20274fdd702492438eeab2c9e55aa82f60aca17db27ebd3faf08489e"
+
+DEPENDS = "json-glib glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
+RRECOMMENDS_${PN} = "git"
+
+FILES_${PN} += "${datadir}/gstreamer-1.0/* ${libdir}/gst-validate-launcher/* ${libdir}/gstreamer-1.0/*"
+
+inherit pkgconfig gettext autotools gobject-introspection gtk-doc
-- 
2.11.0


