Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id B76E3612D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 11:49:18 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w61so2063066wes.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 04:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kO6MiowyhFUcfrbTc8MDXOhWR7IKJTUaUpbyOcjj2Ow=;
	b=SVFsJ3esAdBAkIpDjrt6I13FQS1DE5Pe1TwgvA5ZTdP/eLxtjMvDfUlfZLzK3e0M5E
	d2LBiMGhFXnuNxvh3c6ep/VkevQLz2JDYYfDroG/9E/u1bqhJwVCfmIg0nqPprt1NIvg
	nsX0dhTZj0pAh9IXCs9nUhuJhJgjqIHNEytK5p9m5mDT0FpNsYS4aIt4hBaq+RtSsMki
	SHNvgh32XAxR/zhmTjnXUjY17pTwgicVkTCWlkuPWHf2LvrcA8C/kXsCllV4VeZSB7tR
	h2n7kr/XcKgtDIHxru1e1QqU1DC1N3EGmeqTlycrQLFGeVdsqfFYMy9f69cAn31ErG6n
	6tYA==
X-Gm-Message-State: ALoCoQkWvKQ0L2hhquyxZqsB0N5hsZCNB1iWnmteXM5Q4Lr46JrlbORr0EWL4+HAQd5WoZNTMzr9
X-Received: by 10.180.12.243 with SMTP id b19mr18710776wic.18.1381146560309;
	Mon, 07 Oct 2013 04:49:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	mb7sm38608731wic.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 04:49:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2013 12:49:08 +0100
Message-Id: <1381146549-16693-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381146549-16693-1-git-send-email-ross.burton@intel.com>
References: <1381146549-16693-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] libxpm: upgrade to 3.5.11
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
X-List-Received-Date: Mon, 07 Oct 2013 11:49:19 -0000

License checksum changed as a typo was fixed upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb |   28 -----------------------
 meta/recipes-graphics/xorg-lib/libxpm_3.5.11.bb |   27 ++++++++++++++++++++++
 2 files changed, 27 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libxpm_3.5.11.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
deleted file mode 100644
index 17b1ef5..0000000
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-require xorg-lib-common.inc
-
-# libxpm requires xgettext to build
-inherit gettext
-
-SUMMARY = "Xpm: X Pixmap extension library"
-
-DESCRIPTION = "libXpm provides support and common operation for the XPM \
-pixmap format, which is commonly used in legacy X applications.  XPM is \
-an extension of the monochrome XBM bitmap specificied in the X \
-protocol."
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
-DEPENDS += "libxext libsm libxt"
-PR = "r0"
-PE = "1"
-
-XORG_PN = "libXpm"
-
-PACKAGES =+ "sxpm cxpm"
-FILES_cxpm = "${bindir}/cxpm"
-FILES_sxpm = "${bindir}/sxpm"
-
-SRC_URI[md5sum] = "7ae7eff7a14d411e84a67bd166bcec1a"
-SRC_URI[sha256sum] = "a6db7e234750e7d60330017972e31d8e1f29f0a8c1391e4ac82f6102d919a735"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.11.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.11.bb
new file mode 100644
index 0000000..545874c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.11.bb
@@ -0,0 +1,27 @@
+require xorg-lib-common.inc
+
+# libxpm requires xgettext to build
+inherit gettext
+
+SUMMARY = "Xpm: X Pixmap extension library"
+
+DESCRIPTION = "libXpm provides support and common operation for the XPM \
+pixmap format, which is commonly used in legacy X applications.  XPM is \
+an extension of the monochrome XBM bitmap specificied in the X \
+protocol."
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=51f4270b012ecd4ab1a164f5f4ed6cf7"
+DEPENDS += "libxext libsm libxt"
+PE = "1"
+
+XORG_PN = "libXpm"
+
+PACKAGES =+ "sxpm cxpm"
+FILES_cxpm = "${bindir}/cxpm"
+FILES_sxpm = "${bindir}/sxpm"
+
+SRC_URI[md5sum] = "769ee12a43611cdebd38094eaf83f3f0"
+SRC_URI[sha256sum] = "c5bdafa51d1ae30086fac01ab83be8d47fe117b238d3437f8e965434090e041c"
+
+BBCLASSEXTEND = "native"
-- 
1.7.10.4


