Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id F0BB66AC37
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Mar 2017 05:19:49 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id z70so1776152itb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 22:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=WCwKvqkm+IW7kQZSGAO2pUPfXoSE5SzzvFQKMkI7MEo=;
	b=ntz1tDAK+b8SqYLYiHlv0+DLoZnJepO/brgb6y42nA1mhaq8GYG/iNVMbC6GNGQTB+
	4XWMldCIGE964Z67yQvmEh8YqkLbCCcU0IeN8dQpJX/lwXHwGEBrqWalhasiTR3VeSn9
	8Qb0/g07tbjQ94Ac78Y3y+tNKdGP229vYyeJLOW7jRzmTfW+s5AMxuIA3ffE8QP3bEtM
	XTKWuU5wNEuvOssQt9FUjL6KU4XYf3hV+0V2ltxGhfluxaf36JXxcWGRoMa97cHn7Quy
	Tn/jADsR2s6gLFJtIJSFMxwIXwNiDY7Pmk4abem50VN0SdGOI8H9gh9mtgZRSSng+FaZ
	h2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WCwKvqkm+IW7kQZSGAO2pUPfXoSE5SzzvFQKMkI7MEo=;
	b=PP+lcwn/xZbZqHf5e6UV/BeMxXfn56alxC6GR8R/pvTguzAFCdKsj7uKz2McPfznjP
	0tOq/eNa+QGmV0Z8Orfraiu0cIb8RJumfOYmlTbZJR0d1fMtYKUPgrKkQumTdgdoc3KX
	fZEH5+awtk1rUPpHQDN8mOnsea4D+C+/fwjozqHMV7VYZMf/Z90287Z27hhjR8yfUpL7
	fykdkTeXdPsVewbEPpPR0qs9Rj36ltl6BamNoa/Z3XHwQhSlrZvuKPuzcmdufttMD1/8
	w8g80kjiPKhKdKfUaIBGsjAt0eu5qzp3H7DeuHHLrzB814psCxNTiMF/ep5hR00NvCY9
	V5Pw==
X-Gm-Message-State: AFeK/H1E5FNVevndklAxI1b4E3mOlX8n22WCE6BN/jqxiVPc0iC1MImyWAFgBiDY8OZkFA==
X-Received: by 10.36.245.196 with SMTP id k187mr549662ith.42.1490419190463;
	Fri, 24 Mar 2017 22:19:50 -0700 (PDT)
Received: from linux-uys3.suse (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	j102sm2297317ioo.40.2017.03.24.22.19.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 22:19:49 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Mar 2017 01:19:47 -0400
Message-Id: <20170325051947.21433-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.12.0.rc1.48.g076c053
Subject: [PATCH] xserver-nodm-init: option to remove cursor
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
X-List-Received-Date: Sat, 25 Mar 2017 05:19:53 -0000

Add a PACKAGECONFIG option to allow the user to disable the mouse
cursor/pointer in the X server. This might be useful where a
touchscreen is used.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in | 2 +-
 meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb              | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in
index 757c23d95a..4a9670d8d2 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in
@@ -2,6 +2,6 @@
 
 XSERVER=/usr/bin/Xorg
 DISPLAY=:0
-ARGS=" -br -pn @BLANK_ARGS@ "
+ARGS=" -br -pn @BLANK_ARGS@ @NO_CURSOR_ARG@ "
 HOME=@HOME@
 USER=@USER@
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 62da11800c..345b589696 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -24,6 +24,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 PACKAGECONFIG ??= "blank"
 # dpms and screen saver will be on only if 'blank' is in PACKAGECONFIG
 PACKAGECONFIG[blank] = ""
+PACKAGECONFIG[nocursor] = ""
 
 do_install() {
     install -d ${D}${sysconfdir}/default
@@ -35,6 +36,7 @@ do_install() {
     install X11/Xsession ${D}${sysconfdir}/X11/
 
     BLANK_ARGS="${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-s 0 -dpms', d)}"
+    NO_CURSOR_ARG="${@bb.utils.contains('PACKAGECONFIG', 'nocursor', '-nocursor', '', d)}"
     if [ "${ROOTLESS_X}" = "1" ] ; then
         XUSER_HOME="/home/xuser"
         XUSER="xuser"
@@ -44,6 +46,7 @@ do_install() {
     fi
     sed -i "s:@HOME@:${XUSER_HOME}:; s:@USER@:${XUSER}:; s:@BLANK_ARGS@:${BLANK_ARGS}:" \
         ${D}${sysconfdir}/default/xserver-nodm
+    sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:" ${D}${sysconfdir}/default/xserver-nodm
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
-- 
2.12.0.rc1.48.g076c053


