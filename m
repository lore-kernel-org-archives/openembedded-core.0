Return-Path: <sumit.garg@linaro.org>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 43D737D084
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:26:39 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id c9so1028417plo.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 00:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=OPpFWsBBP5/Y19grrDj/oj4LaFzI3ApLlKLXFSlSMQQ=;
	b=b9jbqV6nSwxuyl8qNaXQOlmS7NQqc/n1WpRMgahignZ8DmBoeKGY33seJ5Mam672wz
	kOSuinRpHGqlwfXhVsG7Fl19G/dJxuT2Y4jLFGjMoKvuNkzfi0ZjbAnHEtOn4HcoykcL
	qMgH9HVptdWVylP6L0T22neXM6DnyKoXeAXdeb96wRYAQ+AMUeDmGtx7Wu5qSJLTUfMf
	ydTbf/31O0izqZVjZfeLVkotZTUExpb10h2rAiL+hue/JWBp2kcAeIYA5NcAD2sR+HuM
	I42/T+BZsUXDqbEBrQyvXlyxHRgQqNkFCL/KtsEJ1mBPhClqhDydXx071HKxZB8LZENB
	Kqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OPpFWsBBP5/Y19grrDj/oj4LaFzI3ApLlKLXFSlSMQQ=;
	b=CO9sDp+u0/LCv8KmomlbUJAtF8vL02Z30lA/xQiU0L/3VdVyuY3QIAZXTVzsB8KFs6
	LanwsASh6LW7xLHK8RBbv07LKDrc5TDFPxw3sIU1MAGa/TPi6prlkWgTvyiyeUi8rJCr
	EFWiKufYyp0Q+OHGXYO+QtNRMI8jje/D4t7NhZH1cUzqxITDpESWFGtBVM0Kq2Fc4x1q
	nt0vMQjgh/GvjM6aYJxCVn4p5K9BmiCabxlZqZurAF4bgiKKQV5WhjNuBdTKoXqNXeTM
	iy3qzWjC/4c7U5a2u4HW3AAoG7okM3yCgklsZwhQs1XCGhG3c3U6XRhaewIf4XMXTDDe
	q3ww==
X-Gm-Message-State: APjAAAUaZABccabYcybLydfxUaZlWnaWTvxJtu+tWt+U28d6aQ1kSFhk
	vBGOMnc0v6T48YdzHU4NmT7mTKuukN4=
X-Google-Smtp-Source: APXvYqyyhDj/O5IHjSelRntTkDzTOv7D4kER0VaCXzsUnHNUAnaygmFu399pNPBMoctADoUlBjon1A==
X-Received: by 2002:a17:90a:3487:: with SMTP id
	p7mr4123755pjb.115.1579595199909; 
	Tue, 21 Jan 2020 00:26:39 -0800 (PST)
Received: from localhost.localdomain ([117.252.69.227])
	by smtp.gmail.com with ESMTPSA id
	e1sm42444361pfl.98.2020.01.21.00.26.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jan 2020 00:26:39 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 13:56:13 +0530
Message-Id: <1579595173-23336-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus][PATCH] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Tue, 21 Jan 2020 08:26:39 -0000

Some native tools dependency issues were seen while building with
external GCC tool-set rather than source GCC tool-set. While building
with source tool-set these dependencies were implicitly met which is not
the case with external tool-set. So explicitly state these native tools
dependencies.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta/recipes-extended/man-db/man-db_2.8.7.bb       | 2 +-
 meta/recipes-extended/psmisc/psmisc.inc            | 2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.7.bb b/meta/recipes-extended/man-db/man-db_2.8.7.bb
index 083b237..0d73b03 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.7.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.7.bb
@@ -10,7 +10,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
 SRC_URI[md5sum] = "ec0b23c8314a1654c4d059b2c18ce43d"
 SRC_URI[sha256sum] = "b9cd5bb996305d08bfe9e1114edc30b4c97be807093b88af8033ed1cf9beb326"
 
-DEPENDS = "libpipeline gdbm groff-native base-passwd"
+DEPENDS = "libpipeline gdbm groff-native base-passwd flex-native"
 RDEPENDS_${PN} += "base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 594a10c..6de5acb 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -7,7 +7,7 @@ command sends a specified signal (SIGTERM if nothing is specified) to \
 processes identified by name.  The fuser command identifies the PIDs \
 of processes that are using specified files or filesystems."
 SECTION = "base"
-DEPENDS = "ncurses virtual/libintl gettext-native"
+DEPENDS = "ncurses virtual/libintl gettext-native xz-native"
 LICENSE = "GPLv2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 3529cb2..211e399 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -12,6 +12,6 @@ INC_PR = "r8"
 
 SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
 
-inherit autotools pkgconfig distro_features_check
+inherit autotools pkgconfig distro_features_check gettext
 
 FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"
-- 
2.7.4


