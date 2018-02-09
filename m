Return-Path: <carlos.rodriguez@ridgerun.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9B33B77EA6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 19:45:02 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id e125so5523651vkh.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Feb 2018 11:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ridgerun-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=/4hZRH450zJBFsd5Dtq6tdgKtcN9Zrgc7tMWMPJI5TM=;
	b=xvZIx1VEsaA/ybNR2Z/OcnrmmyALd6knIyTr3XsuwTarKlCXKt6cOkQYkGVJjNnz26
	218fqm8XsyXTrTH1RgmCKKEJaOIhsdcr3I4UZzrbRoPqTZ3ZOxbFlYGedu4iIpTnQ7wt
	U5+FKW3B7D4qOs72LuWejpcknPu8XRsMw8Q/+tN6l8+N6xtPrFL2Cn6qFf7BQ5LqbHXV
	FrWR+9XBb6XA4o7QFjFhYiibaVlUkiFdt24C410sDTtAoC7AQDcrjsI00p7TZDyVSIwF
	sbfMA+pQijMzPEbHclqY/LE1qiuCEZ+t5GsBLRjeEzkgYMVtnWe1htRIJDSjBNWNui0z
	eWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/4hZRH450zJBFsd5Dtq6tdgKtcN9Zrgc7tMWMPJI5TM=;
	b=kJp4Ow+g55uZJRxjyh2EwgOO7BrQ9depEwmhK8LR8N5kxou+Ic68MwkCGGlhEjJfLf
	nzjVT95TTmEHafgnfWWewxfC2Yx+uENd857eY3FGwpfGkSZ37Z8+mS1ekKGXe9g3VtsF
	GEV9eWZz0UoSrypnSpa49sy/wD+jNqH02MYZ3KtXAXElywsBuA+vdlZb5n8v825ekiXJ
	rNW+DRtdxahoJnBErzL1Rxzb1t9GosvrF4k1F7ukspt7LgNpS1GWP8F7ZdY0NXPI+zn+
	y+Ag1nyzc3/5DWLKSNky8ZmGLCOzO/gZioYfU2O6pOMOAHE8M0jDvLdnuqA7oE/2ZVEH
	ImdQ==
X-Gm-Message-State: APf1xPDfWrf6B9HEEW8ZUx3+gRqYytrN/8Td5Z7R5Ogts5E24fG8l+G9
	yfIe96ECsIRG/eVhZa3NriU/qgFX
X-Google-Smtp-Source: AH8x227KTyCTmtYBsqSc0EfYqQ+Ex6yuqNMlZXoHBCDJ0S/tulGLUx/LOugf1hNQZf9MJWmqRniyaw==
X-Received: by 10.31.103.68 with SMTP id m4mr3630161vki.73.1518205503415;
	Fri, 09 Feb 2018 11:45:03 -0800 (PST)
Received: from crodriguez.cr.ridgerun.com ([201.206.221.6])
	by smtp.gmail.com with ESMTPSA id m10sm356252uaa.12.2018.02.09.11.45.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Feb 2018 11:45:02 -0800 (PST)
From: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Feb 2018 13:44:25 -0600
Message-Id: <1518205465-32581-1-git-send-email-carlos.rodriguez@ridgerun.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2] gst-shark: Add Gst-Shark recipe
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
X-List-Received-Date: Fri, 09 Feb 2018 19:45:02 -0000

Gst-Shark is a set of tracers used as Benchmarks and
profiling tools for GStreamer. It includes tracers for
generating debug information plus some tools to analyze
the debug information. GstShark provides easy to use and
useful tracers, paired with analysis tools to enable
straightforward optimizations.

Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
---
 .../recipes-multimedia/gstreamer-1.0/gst-shark.inc | 36 ++++++++++++++++++++++
 .../gstreamer-1.0/gst-shark_0.2.1.bb               |  3 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark.inc
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark.inc b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark.inc
new file mode 100644
index 0000000..1841d30
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark.inc
@@ -0,0 +1,36 @@
+DESCRIPTION = "RidgeRun Gst-Shark Tracers" 
+SUMMARY = "Benchmarks and profiling tools for GStreamer"
+HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=GstShark"
+SECTION = "multimedia" 
+LICENSE = "GPLv2+" 
+
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad "
+
+SRCBRANCH ?= "master"
+
+SRCREV_base = "a60b3996fe3376d42334fc89014e9d6f6af62899"
+SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
+
+SRC_URI = " \
+    git://git@github.com/RidgeRun/gst-shark.git;protocol=https;branch=${SRCBRANCH};name=base \
+    git://anongit.freedesktop.org/git/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common; \
+    "
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG_CONFARGS = " \
+	--disable-graphviz \
+	--enable-gtk-doc=no \
+"
+
+FILES_${PN} += "\
+	${libdir}/gstreamer-1.0/libgstsharktracers.so  \
+	${libdir}/gstreamer-1.0/libgstsharktracers.la \
+"
+
+inherit autotools gettext 
+
+do_configure() {
+${S}/autogen.sh --noconfigure
+oe_runconf
+}
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
new file mode 100644
index 0000000..637bd0e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
@@ -0,0 +1,3 @@
+require gst-shark.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97"
\ No newline at end of file
-- 
1.9.1


