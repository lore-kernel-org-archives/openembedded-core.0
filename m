Return-Path: <limon.anibal@gmail.com>
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id BD8367887D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:11:18 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id h9so18423296oti.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=buU0OdRDj3qMsipm+KQlUPptsTZJdwlbpAS+S1tk6J0=;
	b=Dlz5fR4vJWIc0AzD4Fh0+vF8f06/RyuOqgHGpxlzPXvOMkzphHzHDe5dlUJhNsKeeD
	iwjw9CYphO3ockzi+uoUySbu0y1Y5I3udphlu9UoOM+aJmpuviQf4qjjRMXP1kk/vv6m
	MIijibhE5PFw+G9zTDL2m22f6J9/Zxauxp4QyUgho7cy4FBl5/OIa3Xc+AGtzon6BqU0
	zwm0FyW+vwS6w62Xp0sepjbBuqSnMEJZpVo/YyR7Um41njYpaXc1HgS44ZW1oXjeQ1i8
	R2PGqofy0acUpFwV8cYcLWMwuAOM9WWsskdxxJ6CbYU9hKFBTKSrzmUTKxOL3z1/tLjs
	ArTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=buU0OdRDj3qMsipm+KQlUPptsTZJdwlbpAS+S1tk6J0=;
	b=qPRe0ZSAZIFmzkUbkWJd4Ol5yezVowJjibn6yt9xZuU0cmOmedTxw0hahvNQrXsPPR
	1iSHXsoni3uVypYtU1kvqoCZhdXvkQaRBDsWs5ErPDp3DVeBcF5oALSR5OSPahG+ogjv
	MmNvDHoWn0CFiIQIWSMJ6Fvfgpp1WMUpzkraSLqisUQoW7wlkdqjq1LgTZilowc8OhLA
	y6W2Jtv/feegCpnAOKvWBcRfoQdUlX8eYeIAjbU8gnH03yK0JHfNI2aIrtfCodaU1cCB
	2yQGdw15MMUbhaPSZeuK96I+EDN8ltR9VNYqU5bKMgwCXRs0xCEkobEv+LK964RLy7Q0
	qADw==
X-Gm-Message-State: AKGB3mKTwg1F4nGcpoHdKoKaDNxKnPKtEIFrR1mr02CcDvNYXTdI0yKD
	uR5zxS0ZFola4oD1yND3HohqY8Gn
X-Google-Smtp-Source: ACJfBovyj9rFXq1QTe5NErXcAglKI0rkzD39tmNjVkJ31g2P/dtbR7z9wK0/DsB4JGLIXCFY/KgqBg==
X-Received: by 10.157.82.153 with SMTP id f25mr3778257oth.97.1513098679320;
	Tue, 12 Dec 2017 09:11:19 -0800 (PST)
Received: from blackbox.Home (187-177-61-29.dynamic.axtel.net. [187.177.61.29])
	by smtp.gmail.com with ESMTPSA id
	u65sm7418674oia.46.2017.12.12.09.11.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 09:11:18 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 11:11:14 -0600
Message-Id: <20171212171114.15534-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: oss.burton@intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>,
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
X-List-Received-Date: Tue, 12 Dec 2017 17:11:18 -0000
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


