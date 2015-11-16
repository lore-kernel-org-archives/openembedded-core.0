Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5B06E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 16:54:36 +0000 (UTC)
Received: by qkfo3 with SMTP id o3so118081395qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 08:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=r3QZgXBKuc7ktYVU+EicWuVSuTVQkVWWEMc5/phKVIA=;
	b=Ew1vFVx1zj5ZLg2wAkm+rAek+3i3Nadiceti1U0DvVb8Wvl/bKZ0b07lD6SFA6oByG
	+hOg2zeWoRT417LJh7mRbQuCFT3L8vjs3Ys6i6dNKpf4X5IRrTH1HYeY7x52RlTjBDH+
	mdvL7VAloxVVTj92iQZ7tgJmNPbyUD6IJCs9tgaYPHF4j+Q+jvVwGx1Eoub5mrZqPUMV
	Ay7jq63emlvxJQ15LdInYa7LuYsxQtjSluO64PNhnpx1sMC4vtIf5Kjegv21QqH/gFxS
	l5Nzjg9i0QvxuWphB3XD0v0SmVEPO0FfSBYZjod1np7LLLbmj4ppoXyPGg/g+P4M5eGo
	MDJg==
X-Received: by 10.55.214.83 with SMTP id t80mr36940720qki.98.1447692876854;
	Mon, 16 Nov 2015 08:54:36 -0800 (PST)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	187sm8900535qhd.40.2015.11.16.08.54.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 08:54:35 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 Nov 2015 14:54:30 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Nov 2015 14:54:30 -0200
Message-Id: <1447692870-16567-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] weston: Add PACKAGECONFIG option for colord CMS
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
X-List-Received-Date: Mon, 16 Nov 2015 16:54:37 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Remove XWayland option as it has been merged onto OE-Core

 meta/recipes-graphics/wayland/weston_1.8.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
index 40df6e1..aff9a12 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -75,6 +75,8 @@ PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[systemd] = "--enable-systemd-login,--disable-systemd-login,systemd dbus"
 # Weston with Xwayland support
 PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,libxcb libxcursor cairo"
+# colord CMS support
+PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.6.2


