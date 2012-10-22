Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQEZM-0003iH-SH
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 11:45:13 +0200
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 02:31:46 -0700
Received: by mail-ee0-f69.google.com with SMTP id l10so1971969eei.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=lbwHF7fBazKXBq8zEzjqTCJO6TxLf0YAz/f99LPfoIs=;
	b=hXM8ttq6dRqWvBgGn6WkUUuW6Hg78Il14ornqBNL/UWLYwtJhZdGfPplMFub5BMaTz
	ZbebVdzqZT492HTHQdzSIM/lTFrfqqCiMhliEAQ6bjJ22GUGWMJMYfsVtx+7/xMmtYeM
	maJecI+cOo0F1bS7+Ybx6ZlVfd76/v/20XubHm4dchDzQZhklOPux37FMPMTR4v6QwPI
	qgYTcrBqxmCj9d2PqqrRzegJWUORvVoL5swX0H9ieQnMwgTMiQcs3bkoxaPQJSjw7Wd6
	qNP7+OuaijxIp0ON6YdKzuZkaclw8/nerMooGI8y+S544ovBEzlGy34OeBV6RkulC8Dc
	Jbvw==
Received: by 10.180.83.234 with SMTP id t10mr19755807wiy.7.1350898304481;
	Mon, 22 Oct 2012 02:31:44 -0700 (PDT)
Received: by 10.180.83.234 with SMTP id t10mr19755792wiy.7.1350898304347;
	Mon, 22 Oct 2012 02:31:44 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id w8sm50203841wif.4.2012.10.22.02.31.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 02:31:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 10:30:27 +0100
Message-Id: <dc59bf999e1f8a6d5953c02d21c6e45c53c204a9.1350898066.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1350898066.git.ross.burton@intel.com>
References: <cover.1350898066.git.ross.burton@intel.com>
In-Reply-To: <cover.1350898066.git.ross.burton@intel.com>
References: <cover.1350898066.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnOCmY2ERHP/mMPiNzop66r7KeciAs412TrSq1dHjoMZ6g3XdVyRCkWjI5SwT8CJ/YuhliAT3Zicst7a6Sc1qwF2602KJEm2TJYCDXCv64U0wZfKrcRRUMxeYrcHL2ntUcisAr5/MHdDyAc4u1omUYw6sds71mlvvUz3MNsF80L4JuKMeHjRc4gIOIV0FzxYymQtvlk
Subject: [PATCH 1/3] libxkbcommon: New window system-independent xkb library
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 09:45:13 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

Needed for weston and wayland clients to compile key maps.

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb |   19 +++++++++++++++++++
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
new file mode 100644
index 0000000..b426115
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Generic XKB keymap library"
+
+DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
+processes a reduced subset of keymaps as defined by the XKB specification."
+
+LICENSE = "MIT & MIT-style"
+
+require xorg-lib-common.inc
+
+DEPENDS = "flex-native bison-native"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=9c0b824e72a22f9d2c40b9c93b1f0ddc"
+
+SRCREV = "1c880887666f84e08ea1752bb8a5ab2a7bf1d8a0"
+PV = "0.1.0+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://anongit.freedesktop.org/xorg/lib/libxkbcommon;protocol=git"
+S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index c911925..f3c08ab 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -17,7 +17,7 @@ EXTRA_OECONF = "--enable-malloc0returnsnull \
                 --disable-specs --with-groff=no --with-ps2pdf=no --with-fop=no --without-xmlto"
 
 python () {
-        whitelist = [ "pixman", "libpciaccess" ]
+        whitelist = [ "pixman", "libpciaccess", "libxkbcommon" ]
         if not d.getVar('BPN', True) in whitelist and not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
                 raise bb.parse.SkipPackage("'x11' not in DISTRO_FEATURES")
 }
-- 
1.7.10



