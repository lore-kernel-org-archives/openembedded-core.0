Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5259F70410
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 10:17:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s69AHLSp024543
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jul 2014 03:17:21 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 9 Jul 2014 03:17:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jul 2014 18:16:58 +0800
Message-ID: <51753b957ef2a0190f08afc6503bcc38f292b1f3.1404885647.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1404885647.git.hongxu.jia@windriver.com>
References: <cover.1404885647.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 5/8] alsa-utils: add PACKAGECONFIG for xmlto
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
X-List-Received-Date: Wed, 09 Jul 2014 10:17:20 -0000
Content-Type: text/plain

Support xmlto for documentation generation and disable it by default.

[YOCTO #2416]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
index 123926a..d7908cb 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
@@ -9,6 +9,7 @@ DEPENDS = "alsa-lib ncurses libsamplerate0 udev"
 
 PACKAGECONFIG ??= "udev"
 PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
+PACKAGECONFIG[xmlto] = "--enable-xmlto, --disable-xmlto, xmlto-native"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
@@ -21,7 +22,6 @@ SRC_URI[sha256sum] = "02bfac39092f3b68d743c23ad3d688d6c5aa8df69f2ccd692c5b8282ed
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
 # please close bug and remove this comment when properly fixed
 #
-EXTRA_OECONF = "--disable-xmlto"
 EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
 
 inherit autotools-brokensep gettext pkgconfig
-- 
1.8.1.2


