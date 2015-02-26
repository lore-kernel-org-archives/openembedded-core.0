Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7478D73768
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 18:01:51 +0000 (UTC)
Received: by wggx12 with SMTP id x12so13342430wgg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 10:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bEtNk1h8nHXBCcFrllWO+Vtj9uk1VG1QMiIUStA6Fdk=;
	b=Cjb3m5M1lRcbLGyMt10lQwsUp+0RNAnmknU3hL9G7VQBUFqZHDXQE7zLVoxw3TuSHj
	UvktWOyDSXReEtXS6oyegXJluqFInkMRMD/z+ulO2EdLrzFyLDQi8s4TcdmS4DFqmv+b
	s4iO9R3ek+T6WMQEhFDumHhKFeKikpNQfDgHgho9mFBsZSMKl1nVMDZEiMaHgpwF2BJ+
	3FMZnxeBHCtYXj4w8Jx+Kl8W36bb6/LGMOa6t+tfQQ12rxvvIfMrj0Arlg0HGYhIzjUS
	t5jNpqXU7lkLCyfH/peJ2saUAcXG0ByXkoDlufRMygRxx2P/TCpTVXg8lP6VaJZabUTH
	lYVA==
X-Gm-Message-State: ALoCoQkE76aOSKbEEF0KpaqcFAJhBtVmkuliPVwDyRhRWLP5MnIerT7ZgFcyzljRKt8y6msXfxs7
X-Received: by 10.180.11.205 with SMTP id s13mr52203795wib.32.1424973712838;
	Thu, 26 Feb 2015 10:01:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id kj8sm2433359wjc.29.2015.02.26.10.01.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Feb 2015 10:01:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Feb 2015 17:59:02 +0000
Message-Id: <1424973542-30540-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1424973542-30540-1-git-send-email-ross.burton@intel.com>
References: <1424973542-30540-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] gaku: remove (replaced by gst-player)
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
X-List-Received-Date: Thu, 26 Feb 2015 18:01:54 -0000

Gaku was buggy and use GStreamer 0.10, gst-player is less buggy and uses
GStreamer 1.x.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/gaku/gaku_git.bb |   25 -------------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 meta/recipes-sato/gaku/gaku_git.bb

diff --git a/meta/recipes-sato/gaku/gaku_git.bb b/meta/recipes-sato/gaku/gaku_git.bb
deleted file mode 100644
index 5e1cba5..0000000
--- a/meta/recipes-sato/gaku/gaku_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Simple music player using GTK+ and GStreamer"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://main.c;beginline=1;endline=20;md5=0c02b4ef945956832b37a036b9cc103a"
-DEPENDS = "gtk+ gstreamer libowl-av"
-
-RDEPENDS_${PN} = "gst-plugins-base-audioconvert \
-            gst-plugins-base-audioresample \
-            gst-plugins-base-typefindfunctions \
-            gst-plugins-base-playbin"
-
-RRECOMMENDS_${PN} = "gst-plugins-good-id3demux \
-               gst-plugins-base-vorbis \
-               gst-plugins-base-alsa \
-               gst-plugins-base-ogg \
-               ${COMMERCIAL_AUDIO_PLUGINS}"
-
-SRCREV = "a0be2fe4b5f12b8b07f4e3bd624b3729657f0ac5"
-PV = "0.1+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-- 
1.7.10.4


