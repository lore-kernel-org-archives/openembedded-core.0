Return-Path: <carlos.rodriguez@ridgerun.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id F057878430
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 21:30:30 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id f5so1539604ual.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Feb 2018 13:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ridgerun-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=dCMDKTSvWvhsK9rQI57ZyoZfrgBvdWkDQvIg5F2KT+8=;
	b=hSuA49OkOhLeT78Pwqm1SfVNzb3l+Pq8BWsPtf06luCck8x7DCjDUtJenjz5K8EEu7
	rOz/JqZ7Jqjm6mJ0fSDSJ1HTrUvHVr5fGunKwDwBRxaeYLSX7YE9mZTEETTEyF3nwU2J
	RPhxn7HukA3gzTTXHkFdAopkqt+bR4TJZS3hvdEDLrhmOel3vRbLjcWdPOrcKP1MiPyS
	ME+FiJHVxUDszQqvVE580/gXC+Ny0ZQQO6SKijtyaZOlws7QIUlkzKRWH2dg5ZfRiP1I
	868meJWiDD2wTuoCSlnkwMmgMkfF8G1CYxRN2R+Sxqe5WD1D84cdPKezCZ+vGjFTiMZe
	UElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dCMDKTSvWvhsK9rQI57ZyoZfrgBvdWkDQvIg5F2KT+8=;
	b=R3shpgVSnRxiPIKOSfcH+DYZgpJ6GBXoUPOkuOrzryZivFNf2ychPNXmYQz1l6yWk+
	JwzMVHk8ZxcAJHvJWUi7zjzZlymHE0ZwyyRYk1r8LWau+DO23kkQ9tpqMQp5qvfULuOG
	LCy5/Avyx0EalCdHsb4g0zVPeGhXe3+BI9BE/0oYPEnAKz1RwETodcmyuJHQGVJ0qlm+
	GiU4vDrzS7ffODS3Lq2/3isQ9ffRS90esuanHnsZzuOlXM8makpnSgL4K605FJi7j2Bn
	WUzOSAj8VxoOEECBqxv4wWW1OvaTeDxjrZkzu0hoPyKa6Ez53AQV30ZkLlhW58kdCEdA
	7oNg==
X-Gm-Message-State: APf1xPC5fi2i3oUanw6U/KARHlajvVW52A832P+w9Hc0nMPujcvgabMa
	6of3N3d2Af3BWJkuejps5S8pI5qZ
X-Google-Smtp-Source: AH8x225bV/kPrPAArJsOQbqRMf4fX9In4nacCP/pnqdF8J+FfspPO90GSvYI+zXbS3uZOQmIfSEqbw==
X-Received: by 10.159.52.73 with SMTP id s9mr6301289uab.198.1518039031885;
	Wed, 07 Feb 2018 13:30:31 -0800 (PST)
Received: from crodriguez.cr.ridgerun.com ([201.206.221.6])
	by smtp.gmail.com with ESMTPSA id d11sm797871vke.37.2018.02.07.13.30.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Feb 2018 13:30:31 -0800 (PST)
From: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Feb 2018 15:30:22 -0600
Message-Id: <1518039023-29531-1-git-send-email-carlos.rodriguez@ridgerun.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] gst-shark: Add Gst-Shark recipe
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
X-List-Received-Date: Wed, 07 Feb 2018 21:30:31 -0000

Gst-Shark is a set of tracers used as Benchmarks and
profiling tools for GStreamer. It includes tracers for
generating debug information plus some tools to analyze
the debug information. GstShark provides easy to use and
useful tracers, paired with analysis tools to enable
straightforward optimizations.

Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
---
 meta/recipes-multimedia/gstreamer/gst-shark.inc    | 36 ++++++++++++++++++++++
 .../gstreamer/gst-shark_0.2.1.bb                   |  3 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-shark.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-shark_0.2.1.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-shark.inc b/meta/recipes-multimedia/gstreamer/gst-shark.inc
new file mode 100644
index 0000000..1841d30
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-shark.inc
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
diff --git a/meta/recipes-multimedia/gstreamer/gst-shark_0.2.1.bb b/meta/recipes-multimedia/gstreamer/gst-shark_0.2.1.bb
new file mode 100644
index 0000000..637bd0e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-shark_0.2.1.bb
@@ -0,0 +1,3 @@
+require gst-shark.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97"
\ No newline at end of file
-- 
1.9.1


