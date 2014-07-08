Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3BEC703E2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 09:48:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s689mLoY006209
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Jul 2014 02:48:21 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Jul 2014 02:48:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Jul 2014 17:47:57 +0800
Message-ID: <9210035a7a16019eeb876d9b79a9262c7c7b6746.1404812342.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1404812342.git.hongxu.jia@windriver.com>
References: <cover.1404812342.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 5/8] alsa-utils: enable xmlto
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
X-List-Received-Date: Tue, 08 Jul 2014 09:48:20 -0000
Content-Type: text/plain

[YOCTO #2416]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
index 123926a..86c6d0a 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
@@ -5,7 +5,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
-DEPENDS = "alsa-lib ncurses libsamplerate0 udev"
+DEPENDS = "alsa-lib ncurses libsamplerate0 udev xmlto-native"
 
 PACKAGECONFIG ??= "udev"
 PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "02bfac39092f3b68d743c23ad3d688d6c5aa8df69f2ccd692c5b8282ed
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
 # please close bug and remove this comment when properly fixed
 #
-EXTRA_OECONF = "--disable-xmlto"
+EXTRA_OECONF = "--enable-xmlto"
 EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
 
 inherit autotools-brokensep gettext pkgconfig
-- 
1.8.1.2


