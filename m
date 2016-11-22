Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id A33EE71A62
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 17:55:37 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a197so37996398wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 09:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xRb+H1c35p/dSHTjF3jk08sJD/qAnUAhhibG8fxnFkc=;
	b=IAxrnuXT9hZ1BE8tGAa0zyEb5OgxNwmaulSexky70iHJN3aIE29ezmykmuQUhftJCu
	9MJMQnFGUVKZRgYV+cP8dbhyICyHzUUo+toAFkqrpuZehoHaBTzG86ts/jqwx0RfNNjy
	nw3Y1WuWDIky1Dcw7ysMju+EJRA7Xv9WqQxDOhldAfV1Pk0jn0KBKjmf6cDbYOFTC0Os
	q37mCZyPhlU94rk6TclnUXxZUC1f5kBh++ORAyd8pJ5J4hGdkNNf8roH9um2tua3GbNR
	v22IZ4UnAr91kZNyF2K02N0i5rGspL2Vfo//8+p2MoFSRFVKEiMqfifwAP5gunpr9iJL
	1AFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xRb+H1c35p/dSHTjF3jk08sJD/qAnUAhhibG8fxnFkc=;
	b=LPk8pvRQ328X5Erzg2dgWvQITVPyeNWTN2cUkB66sjS8L28UX/DN6rL6Nowo/W4Tn6
	1GHFAzUX+TzTUvmD7HYcuIZJrQENI0qD8AUOZC6Xo/xcafVbbkll/4CAU3juayQfPL0E
	hbM8tr0Fsx09xJnmsmZJqcWOynmyQLz3OaHuKilGOQgcmiglN07wubnK+OW+qrh6UrK+
	qVlzKqbl3OUrtuqT1tJ5b1kT52Lh6u+fl5SqI8jpX132qoniFsGN/JtXF0MSbhz4lddc
	owQcbKnj7/53VItsmV+woodLAvxwif9GABmRGGp6xymlKYGZqXnjnnS0yPqtTZIP+Lvt
	gfbw==
X-Gm-Message-State: AKaTC01cCE1mXFVCWuU7QQxfYnj2P/Lsok39UA+c3RozLj4Ja9vyaf9nXAG+UCLG3VSlCzHj
X-Received: by 10.28.16.65 with SMTP id 62mr3709557wmq.81.1479837337962;
	Tue, 22 Nov 2016 09:55:37 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f76sm4161887wmd.15.2016.11.22.09.55.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Nov 2016 09:55:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2016 17:55:33 +0000
Message-Id: <1479837333-18054-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1479837333-18054-1-git-send-email-ross.burton@intel.com>
References: <1479837333-18054-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][morty 2/2] Revert "epiphany: remove unnecessary libwnck3 dependency"
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
X-List-Received-Date: Tue, 22 Nov 2016 17:55:38 -0000

This version of epiphany still needs libwnck3.

This reverts commit fb5c4f181176710a4cfb3c875b5edb4e5aa5df73.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.20.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
index 9115892..eba480b 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
@@ -2,10 +2,11 @@ SUMMARY = "WebKit based web browser for GNOME"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr \
+DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr libwnck3 \
 	   gsettings-desktop-schemas gnome-desktop3 libxml2-native intltool-native"
 
 inherit gnomebase gsettings distro_features_check upstream-version-is-even
+# libwnck3 is x11 only
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
@@ -21,3 +22,4 @@ do_configure_prepend() {
 FILES_${PN} += "${datadir}/appdata ${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme"
 RRECOMMENDS_${PN} = "ca-certificates"
+
-- 
2.8.1


