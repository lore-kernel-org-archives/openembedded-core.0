Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 27871788B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 18:43:34 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id n7so3508649wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 10:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=imW7Sp+lpc8TnYYehnmn/LTgGCo2g62yeKuhKfR0HiE=;
	b=Wz7KDecynHUZ+Log2yA+bPLCFmBWgTumzS+vO2gJY+uTnJxmVQm+tYg+3rq81QlJR+
	oXu6fSEl0qypuCJgdn9gee8rqKzRV6ySABbFsfMEi9+ckZycXytsl0WX1qGfJrwafn45
	2br4Jb3LBJBCwrGBhrc/DFd5I0ao8TPX2/TBQ/o5ylJwL9SGC2dgge58IWGYuasAQhgt
	iwLt6sGtwPbbQr4agli+lQ/sPoLXz9yuxjCawuKXxZ8BTYQ6QI65OyWG8M8t+30NPaHy
	miTLGwIVoGr4ne0xRNQHpAIQa0pPmsQUIU6vul7Cs/CQygHbiMBxnb+I3yAq/L1VaVA+
	S1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=imW7Sp+lpc8TnYYehnmn/LTgGCo2g62yeKuhKfR0HiE=;
	b=lwiaw3x6bEBEl2R8QXv+wg9sn3TwgEbuYrHRH62fhwl3pPSq/bb6Hb/CEvkaNEApQl
	0AQR7xab2T6jknAWcYO6Mtufh9OsT2eRCOhMDRO47tiEI/A7WihHMDfBDMcWy9Jk/ERg
	FD4ZbLHb6oYmNGy4iddSP1v6xqvR9IiCbpzlGtdHhgk+gVgUgmsmRLBnPo1gMzFEXJdN
	aHyqbeTxp+a0ea+Pb9LITcStTNSgdroIpiqybH2pOGBNN+C0pdl0BuhF/HKIJsq2lrMx
	PI0ZK85FfEAsmAUdgnfTd5/RqNXRZ2YSw7OU/pM8xZEs1X7yAw9qtq5K1SlnPJC4w4CX
	bxzQ==
X-Gm-Message-State: APf1xPBmEhJgBSgKPeLu+er14RX21SFpuG3IzKU1+F5jYR+I4YXuN/1F
	8K9hlss4wUCxr1ttOEZFYMK5B5k4
X-Google-Smtp-Source: AH8x224QXH50zw/PbDbCv9eBRTUeNNo7vYAnI8Xf8mg91HUXjU6Mj20YKs1LLbYLbu4jP4HRbvK4MA==
X-Received: by 10.223.167.5 with SMTP id c5mr15875192wrd.188.1519843415510;
	Wed, 28 Feb 2018 10:43:35 -0800 (PST)
Received: from localhost.localdomain ([151.33.14.228])
	by smtp.gmail.com with ESMTPSA id
	j42sm3602590wre.55.2018.02.28.10.43.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 10:43:34 -0800 (PST)
From: Francesco Giancane <francescogiancane8@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 19:42:25 +0100
Message-Id: <20180228184225.10017-1-francescogiancane8@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [meta-oe][PATCH] libepoxy: New recipe updated to latest release
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
X-List-Received-Date: Wed, 28 Feb 2018 18:43:35 -0000

libepoxy 1.4.3 did not compile successfully because of
implicit symbol definitions and link-time errors.
A new recipe with latest libepoxy release (1.5.0) which
successfully compiles is provided.

Signed-off-by: Francesco Giancane <francescogiancane8@gmail.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
new file mode 100644
index 0000000000..d7702cfd64
--- /dev/null
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "OpenGL function pointer management library"
+HOMEPAGE = "https://github.com/anholt/libepoxy/"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
+
+SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           "
+SRC_URI[md5sum] = "63fe3847789258254dcd7e3fdb9e7f5e"
+SRC_URI[sha256sum] = "4c94995398a6ebf691600dda2e9685a0cac261414175c2adf4645cdfab42a5d5"
+UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
+
+inherit meson pkgconfig distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+DEPENDS = "util-macros"
+
+PACKAGECONFIG[egl] = "-Denable-egl=yes, -Denable-egl=no, virtual/egl"
+PACKAGECONFIG[x11] = "-Denable-glx=yes, -Denable-glx=no, virtual/libx11 virtual/libgl"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
+
+EXTRA_OEMESON_append_libc-musl = " -Dhas-dlvsym=false "
-- 
2.14.3


