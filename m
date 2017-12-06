Return-Path: <limon.anibal@gmail.com>
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id A995478416
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 22:00:42 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id y10so4697741otg.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 14:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MUOoRRsl9OIynCjrZoNOq1jOGBVUYcAdvDxDtbJeqPE=;
	b=K9Nn47ZNSuuFUsAWM4dfBYLwjLFhb6oHf+HD5uSTMXKi3N8U3KShzIe3l004+mWkSG
	DyCV1WGIZ2uehnO9nXp4UpcRo/LHRWVUoPU594cFZFU5jry3T8WSkSjfjDGSk7ULcSX6
	JSalTfAzUwHZolSR/T+bbKk+BYfzBVX1atu9SgT+EbiShxBb1aUqH+00A98z7qGj4+91
	ckmXIZ5FfEy2yIBHdnqr4qBFZZpVRiNwWinrZpo7LSUN4oUY61og4DgxirccAyy8opW+
	HBkA7bqxLqemEc0hwkE2opntssB7MuRh3hhOOMfOOY6e+3A9Equ7E7rmlsqt8M6GCrdJ
	Vrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MUOoRRsl9OIynCjrZoNOq1jOGBVUYcAdvDxDtbJeqPE=;
	b=Fws8L25J/IbZtLGSCVGfD0aGbijfHNNCO+I8aSVEHjhvxAcp3C3CwiwfzGsI4LvQ8p
	96zTLWRREeA1/cmAP8mTOLh8fuGkWZ7jwGKIlLeCLZ9zO0VoppjNvV3Q5A2n9wpg8kW8
	QYu2ZttysX3aOlf0+CMugTT9tBfWUTP7O8tDhbaXwgDmLFqg/7zIG/SvoVpQAm5Wkxhg
	LBZ2o2BeLeFPD92c69SwADV2iNpPgFl6eOKAdx9fX/qDVKrKdiNkcOz4zGEomdXgl9oD
	HUrqkr5ix0bL2RkVmKWQwrgi20HZhYk7YoBH3rJxZh6sSKwUlDt1td0m3TGMBLrLfAnv
	esvA==
X-Gm-Message-State: AJaThX5mqXA7Q6R+IK4VQUk1LKbmgz2in8TE1gxa3UOLtWXIzp1HP/vO
	da3kDkVFDua71IkqiLC3poCrIL7p
X-Google-Smtp-Source: AGs4zMYaapklww42bpkqwGbleiiyPPLQmXrDbgvjofNgvUybupX0zYGgD8yQdCG84dIBkkzfaANfjQ==
X-Received: by 10.157.52.150 with SMTP id g22mr23681562otc.345.1512597642887; 
	Wed, 06 Dec 2017 14:00:42 -0800 (PST)
Received: from blackbox.Home (187-177-61-29.dynamic.axtel.net. [187.177.61.29])
	by smtp.gmail.com with ESMTPSA id c125sm14011oia.50.2017.12.06.14.00.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Dec 2017 14:00:41 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Dec 2017 16:00:37 -0600
Message-Id: <20171206220037.32335-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCHv2] recipes-multimedia/gstreamer: Add gst-validate recipe
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
X-List-Received-Date: Wed, 06 Dec 2017 22:00:42 -0000
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
 .../gstreamer/gst-validate_1.12.3.bb                 | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
new file mode 100644
index 0000000000..47f4a260f8
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Gstreamer validation tool"
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
+# to use non display mode in gst-validate-launcher
+RDEPENDS_${PN} = "xserver-xorg-xvfb" 
+
+FILES_${PN} += "${datadir}/gstreamer-1.0/* ${libdir}/gst-validate-launcher/* ${libdir}/gstreamer-1.0/*"
+
+inherit pkgconfig gettext autotools gobject-introspection gtk-doc
-- 
2.11.0


