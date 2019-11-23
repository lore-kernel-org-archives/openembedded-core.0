Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4D47FCDE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:11:30 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x28so5159830pfo.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3DLKwCIa7vgxFVVzRqmVfoggzB+OtUtBqH12sUxb5J4=;
	b=g18WpoQkV2k76rRulVAQggkoh2JFdUfdZeEKmD0zEwbOwr1xsDpGMzrVgsR7cPy+MW
	IBul9Az7imvrn/7baxC6LctXp8rO84XzJfrKFQL3sX+Tz0jLMgF3tOdkR9NlDPNBuBvO
	3cQHozYMPkqIFoulwlRpa/kd9qXlDjI0OBnKWi+V1zcpAFb1BTCk0PqcW1FvClXU82Ds
	/LHs/j+8RGkChgnZFn0MVrcY9xH727rf+4BCK3aXW2RqdJNLxAOdEBI6/FDak7WWTxU3
	PrqvPKjgUQUtYEkpyv11tHanG4QbwAyRCLBGFdIDJ0+wN1zDLZdhehdeeo1GR3WuzwFF
	jbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3DLKwCIa7vgxFVVzRqmVfoggzB+OtUtBqH12sUxb5J4=;
	b=PxJhGRHUUPHvwLxQwApW9zzpzvk+cwXxvlAkb0/TTA1TGQyVaG+za2jR//Akp5FpVw
	SX8k27iPO/UIhZrwgadRmxJoKYnyMJnPxcp9IFFk3MqpR6tt8qtZxDdmxVApXKoii1Ae
	7BoaHpB6NIzyw3Al+58MLQP3WGzYeKgriKd4tc9ly2xV7aI/boEyb0dl4bNYQ3FAx2VT
	7+E8TPM5cqPhKYQ/prci9H5/LvwtxDCcdND2chzOWE+Nef9xcNgF2qZ6uYsnpRQFMNi/
	teKK1+uwMvRB/7LMQHZjV4QUQF7vb262QahoLeHCX1FF9nexnF7h5XQ6cTrU/ADCwjt3
	vtLw==
X-Gm-Message-State: APjAAAX1J0llXzyBWgO0Lt6vuGBj2HhS/fpgQnBEITQyrZFCyxz6AK6a
	ni2scghXIEcoKVCEx3YpAq3OVgnj
X-Google-Smtp-Source: APXvYqxzPHWSs4U5GtSGEs4xj3ty+JBaoxwMhOpuof9M3uJVvIv78sqDcqiuB1+jaPFLeik3xJNhhg==
X-Received: by 2002:a62:8243:: with SMTP id w64mr24460630pfd.0.1574525491378; 
	Sat, 23 Nov 2019 08:11:31 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id
	199sm2091943pfz.186.2019.11.23.08.11.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:11:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:11:19 -0800
Message-Id: <1574525485-20450-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
References: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 05/11] gstreamer1.0-libav: upgrade to version 1.16.1
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
X-List-Received-Date: Sat, 23 Nov 2019 16:11:30 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Removed gtkdoc-no-tree.patch since its changes are now included in 1.16.1

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gstreamer1.0-libav/gtkdoc-no-tree.patch        | 35 ----------------------
 ...ibav_1.16.0.bb => gstreamer1.0-libav_1.16.1.bb} |  5 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.16.0.bb => gstreamer1.0-libav_1.16.1.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch
deleted file mode 100644
index a36fdc9..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 6f720cebe632d7dc187c6907857d67ce1f7313d6 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 9 Sep 2019 22:48:49 +0100
-Subject: [PATCH] docs: don't include the type hierarchy
-
-gtk-doc can't generate a type hierarchy when scanning gst-libav, and gtk-doc
-1.30 onwards doesn't write a file if there is no type hierarchy (unlike previous
-releases, which wrote an empty file).  This results in the build failing with
-gtk-doc 1.30 onwards, so remove the type hierarchy section from the
-documentation as it doesn't serve any purpose.
-
-Fixes https://gitlab.freedesktop.org/gstreamer/gst-libav/issues/57
----
- docs/plugins/gst-libav-plugins-docs.sgml | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/docs/plugins/gst-libav-plugins-docs.sgml b/docs/plugins/gst-libav-plugins-docs.sgml
-index 75c68f4..f68d554 100644
---- a/docs/plugins/gst-libav-plugins-docs.sgml
-+++ b/docs/plugins/gst-libav-plugins-docs.sgml
-@@ -32,9 +32,4 @@
-     <title>gst-libav Plugins</title>
-     <xi:include href="xml/plugin-libav.xml" />
-   </chapter>
--
--  <chapter>
--    <title>Object Hierarchy</title>
--    <xi:include href="xml/tree_index.sgml" />
--  </chapter>
- </book>
--- 
-2.22.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
index d2629b5..d3918cf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
@@ -18,10 +18,9 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://mips64_cpu_detection.patch \
            file://0001-configure-check-for-armv7ve-variant.patch \
            file://0001-fix-host-contamination.patch \
-           file://gtkdoc-no-tree.patch \
            "
-SRC_URI[md5sum] = "e3a201a45985ddc1327cd496046ca818"
-SRC_URI[sha256sum] = "dfac119043a9cfdcacd7acde77f674ab172cf2537b5812be52f49e9cddc53d9a"
+SRC_URI[md5sum] = "58023f4c71bbd711061e350fcd76c09d"
+SRC_URI[sha256sum] = "e8a5748ae9a4a7be9696512182ea9ffa6efe0be9b7976916548e9d4381ca61c4"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.7.4


