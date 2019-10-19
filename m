Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id AF58F6D4B6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Oct 2019 20:21:48 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 14so2467863wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Oct 2019 13:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HP7bhM33vuxcDolezn5jnOBjGycDTHTWq6ryrICkaUA=;
	b=nRBy25YAOM37uLmKGYbb22fGL7IJykYNyGYm/lvq9cXPfrF7qZk/zPpknx9+MNN9Ty
	raj0lWiJiNwN0ppc7xhtPwdwjOFzWUSKML7XUNvVIG0DzVLDCIcnQFxLhpsGS5fk/u4V
	OSihpSQ95wtLtw+XMYN9jZsMnOcjtYq/mCeiz0gNpZjnKf7A86wcQ42Jrq7Bfcq/Te80
	bT/dRdB2ZXx1K3aR5aA7oPmr5r76zRnSAeqaoH5YDUOfagJh9ByHsWQezDW+kUb8/g1M
	GDDP578mDkXeZtF8vgr8tcPEW51gHmzJzkWAav2UJu6YX0vFvcNPi1QFutIcwCf178wJ
	/S/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HP7bhM33vuxcDolezn5jnOBjGycDTHTWq6ryrICkaUA=;
	b=J+2QNZ8ves0HhhNj57nsDNHPkwhi3IO3T5Dr8cG79oZYD2OAK+oTScCr73BVzldNr+
	n1CVunF0ZN2gfy3mvbJIES0QAYEQgJB9cNpTaLmgHY6+2WjYrJnEdCWcoVNIOzJlXOfT
	0CNQSUJnZKIRn81N0Ac/h4CjdGo9mjZdv7Vth5dxSLq7zQAtBdGLjHKDP5BzH6VjACsn
	iM4hQDFoO6e07pspjr0iAxmdZmkxq/V49swLchu5p4y5SoaS+KEHljT5r7IqPxcLwO18
	QSGOUnt1KJ0sUh32pBhwcjAxAq1l+hfVjSsDvYNIfodkBNPD3dcDBeeSywN9nwAhLese
	5Olw==
X-Gm-Message-State: APjAAAVMgmXVB/TAnmK6na6x9lky4u7+qfGM3xYsOG2usvmQ0xQ2eRPg
	5hgfiWZZOplRAmPuCDrGAP1Os2di
X-Google-Smtp-Source: APXvYqyNqtmZMaBgcLfR0ppaIuwj72QiMb9E7KtXT1M4O+iB1M4aEv8jV6E2UnFfDnlueC9v2Ro1RQ==
X-Received: by 2002:a1c:a647:: with SMTP id p68mr12766099wme.139.1571516509017;
	Sat, 19 Oct 2019 13:21:49 -0700 (PDT)
Received: from superandy.speedport.ip ([2003:f0:7f0a:1d35:4c29:4c86:21b4:ea37])
	by smtp.gmail.com with ESMTPSA id w4sm8646636wrv.66.2019.10.19.13.21.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 19 Oct 2019 13:21:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Oct 2019 22:21:39 +0200
Message-Id: <20191019202140.9537-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2] gsettings-desktop-schemas: upgrade 3.32.0 -> 3.34.0
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
X-List-Received-Date: Sat, 19 Oct 2019 20:21:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Need it for gnome-settings-daemon 3.34:

| meson.build:91:0: ERROR: Invalid version of dependency, need 'gsettings-desktop-schemas' ['>= 3.33.0'] found '3.32.0'.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
v2: make x11 a required distro feature
 ..._3.32.0.bb => gsettings-desktop-schemas_3.34.0.bb} | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.32.0.bb => gsettings-desktop-schemas_3.34.0.bb} (58%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.34.0.bb
similarity index 58%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.34.0.bb
index 859f70466b..bf260fdb4b 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.34.0.bb
@@ -5,12 +5,15 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 gcr"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even
+inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even distro_features_check
 
-SRC_URI[archive.md5sum] = "0c2d468a482c12594757442c983aa8ea"
-SRC_URI[archive.sha256sum] = "2d59b4b3a548859dfae46314ee4666787a00d5c82db382e97df7aa9d0e310a35"
+# depends on gcr which requires x11 for gtk+3
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.md5sum] = "9759ef53fb2e53fc8d19190e58f2c332"
+SRC_URI[archive.sha256sum] = "288b04260f7040b0e004a8d59c773cfb4e32df4f1b4a0f9d705c51afccc95ead"
 SRC_URI += "file://0001-Do-not-skip-gir-installation-for-cross-compiling.patch"
-- 
2.21.0


