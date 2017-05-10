Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 61C7171ADE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 14:13:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 10 May 2017 07:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,319,1491289200"; d="scan'208";a="1167201699"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2017 07:13:32 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 17:13:28 +0300
Message-Id: <6071b9e076fa55253f2976ece707c9f47c7d5437.1494425038.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
Subject: [RFC PATCH 10/10] gstreamer-plugins-bad: replace openssl dependency with nettle for hls plugin
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
X-List-Received-Date: Wed, 10 May 2017 14:13:31 -0000

It has not been ported to openssl 1.1 (and there's nothing in upstream git),
but it's possible to use nettle or gcrypt intead.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 0ccfc89a2ea..e1a98b16a13 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -40,9 +40,7 @@ PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
 PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
 PACKAGECONFIG[gles2]           = "--enable-gles2,--disable-gles2,virtual/libgles2"
 PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
-# ensure OpenSSL is used for HLS AES description instead of nettle
-# (OpenSSL is a shared dependency with dtls)
-PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl"
+PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=nettle,--disable-hls,nettle"
 PACKAGECONFIG[kms]             = "--enable-kms,--disable-kms,libdrm"
 PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
 PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
-- 
2.11.0


