Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 80E1B72981
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 04:55:12 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id bj1so5148037pad.23
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 20:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mMJ3q/GZTnOtwZR8/9byaUdK+pWP4AdgHCIvAl6KTS4=;
	b=YpoRpfYNiXd2lOjinftJRE3UHjgEynEoSnEh9cfYVv76mrlKX4cJJa84Md2ZaBtrgk
	hSgJuh6kDNXaOE07c7+cq6XiBmpgkMhdkw7NkiTX18iBh/mDpSKjUk0Ga9/KF8FyiIHS
	dmTKdb9JxOreU2RZhE+vWu+Nm/jhUrWhQeHk2rpmEDyQPyUoDdlVIoZO44+z1rlPP6C9
	Rqrns+no1cXUNuBCizla2Pey72SIlH+zHOwCO5BpycUys9AnkdBb2xbJhIham+MH1dJe
	/dZwxYZ0aVrM17DeHhnIvLqeLwRHpHKXvyHNsIpucsFPUEuHU+/HCukGHiDtPFrprfmJ
	97sw==
X-Received: by 10.66.119.239 with SMTP id kx15mr21703359pab.11.1419224112410; 
	Sun, 21 Dec 2014 20:55:12 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	nx1sm15835688pdb.85.2014.12.21.20.55.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Dec 2014 20:55:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Dec 2014 20:54:58 -0800
Message-Id: <1419224101-24900-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
References: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
Subject: [[PATCH 2/5] twm: move from meta-oe to core.
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
X-List-Received-Date: Mon, 22 Dec 2014 04:55:14 -0000

core "xinit" package has a dependency to twm so
move it from meta-oe to core.

core image "core-image-x11" includes xinit.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-app/twm_1.0.8.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-app/twm_1.0.8.bb

diff --git a/meta/recipes-graphics/xorg-app/twm_1.0.8.bb b/meta/recipes-graphics/xorg-app/twm_1.0.8.bb
new file mode 100644
index 0000000..cc8808b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/twm_1.0.8.bb
@@ -0,0 +1,20 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+SUMMARY = "tiny window manager"
+DEPENDS += " libxext libxt libxmu bison-native"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4c6d42ef60e8166aa26606524c0b9586"
+
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[md5sum] = "4b28317d4a9f7ca61bef8462e132bd4c"
+SRC_URI[sha256sum] = "7660352353d632127ff50390991706aa660b28a4ada816c2582ac02720722e44"
+
+inherit distro_features_check
+
+FILES_${PN} += "${datadir}/X11/twm/system.twmrc"
+ALTERNATIVE_NAME = "x-window-manager"
+ALTERNATIVE_PATH = "${bindir}/twm"
+ALTERNATIVE_LINK = "${bindir}/x-window-manager"
+ALTERNATIVE_PRIORITY = "1"
-- 
1.9.1


