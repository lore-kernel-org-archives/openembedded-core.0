Return-Path: <rosbrookn@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA407C68E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 15:09:03 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id u7so21530560qtg.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 07:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hlZ9+wzZaIX+4NG4xu/IV2yZhr4+WZhUN1F3EItSRY4=;
	b=qbfzbUJ5qmX7XkdP2syyv0cCu7QE4ei+1Yp4sLZxFEw/ecfQl0/GIvNlu0ek3i2Gco
	cqkwGvzmwFWN5gAptTChFFjgY9mTYxfXIY01f7opha60hSGqfULmoHV8w1trWAXDZpVX
	hZXMCIbPq+RHwjvo3cVeEaN83eok4yxxOoElhPhQb2luKpt8eL/aItzzg6t2Q8dVI/mZ
	in4R5esV0r7kYzQfNLsjr5+x53YNZPuKS3dkgFm4mt9gBo5iHejKzARjbArQAYkoDTCu
	7IsTLukmxBpDoqc7O+GofI6UQBuCGoHUwYugecHdMF9EY7/rwNyzLgX7F0WncOlqvXNp
	rV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hlZ9+wzZaIX+4NG4xu/IV2yZhr4+WZhUN1F3EItSRY4=;
	b=AEI0WwoUjvl8cBlJjVvx06z8tj0DzW+xcPb14gDKPGIvXvX+FyI1dX4JvYVMNdxNet
	JY0dJ1fCyAHQ1DCdW+qqNWoJkN6JIJ2Gbg8VBDATcjnqik/wb292OVb6GynnmnaWL5UH
	n5s7xhw1Uop8YnuxYWjTXyLuiRLRiJBzThCmFCJwJgNnGaXUTPeVpgoZYu8hhbGb6bfs
	8QTx87A0msfQlQUayAsDqiGvGj5umpj2XxLO2tripjQm/Z16BrUeQzx5WNdsXxrDhV9d
	uhj4nhla6QEhmK0KhdNfwlgHlOgwRdH6XDW1yilsH7iZM04pEkWq28MTWx0mCCfsJbV9
	xZyQ==
X-Gm-Message-State: APjAAAWgGTTMukIpf3UuvSu8I5X5xpMiZG6kEUa3GmqlVV9vHwgQm9Wy
	aZWlp7+FEoDcCqUE1uavAck1oQoh
X-Google-Smtp-Source: APXvYqwaMfoiq06pNQIiLN5DnFm2l+wbLNeiioPQZNzbvKH8MR2Ry7x6rpjV0PFtgpDQPi6udsGeAA==
X-Received: by 2002:a0c:eac9:: with SMTP id y9mr15352155qvp.82.1552057743860; 
	Fri, 08 Mar 2019 07:09:03 -0800 (PST)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	j17sm1739368qtj.61.2019.03.08.07.09.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 07:09:03 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2019 10:08:36 -0500
Message-Id: <bf73a8c2fb9284a731f78c26eb14e979b62cfac6.1551991645.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1551991645.git.rosbrookn@ainfosec.com>
References: <cover.1551991645.git.rosbrookn@ainfosec.com>
Subject: [PATCH 1/1] adwaita-icon-theme: use scalable symbolic icons
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
X-List-Received-Date: Fri, 08 Mar 2019 15:09:03 -0000

GNOME is moving away from PNG icons in favor of scalable SVG
icons: https://gitlab.gnome.org/GNOME/Initiatives/issues/2

Many icons (e.g. network-wireless-signal-*.symbolic.png) are no longer
generated, and the SVG versions should be used instead.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 .../gnome/adwaita-icon-theme_3.30.1.bb            | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
index 3e9420ed9a..04748476e8 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
@@ -18,13 +18,6 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "db3fd812821d72fdd9a3c7d622a95b35"
 SRC_URI[sha256sum] = "6d752a2b1bc668483956d4485c39cad1642d9358e133ff689526e43674a4e1ce"
 
-do_install_append() {
-	# Build uses gtk-encode-symbolic-svg to create png versions:
-        # no need to store the svgs anymore.
-	rm -f ${D}${prefix}/share/icons/Adwaita/scalable/*/*-symbolic.svg \
-	      ${D}${prefix}/share/icons/Adwaita/scalable/*/*-symbolic-rtl.svg
-}
-
 PACKAGES = "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires ${PN}"
 
 RREPLACES_${PN} = "gnome-icon-theme"
@@ -32,12 +25,8 @@ RCONFLICTS_${PN} = "gnome-icon-theme"
 RPROVIDES_${PN} = "gnome-icon-theme"
 
 FILES_${PN}-cursors = "${prefix}/share/icons/Adwaita/cursors/"
-FILES_${PN}-symbolic-hires = "${prefix}/share/icons/Adwaita/96x96/*/*.symbolic.png \
-                              ${prefix}/share/icons/Adwaita/64x64/*/*.symbolic.png \
-                              ${prefix}/share/icons/Adwaita/48x48/*/*.symbolic.png \
-                              ${prefix}/share/icons/Adwaita/32x32/*/*.symbolic.png"
-FILES_${PN}-symbolic = "${prefix}/share/icons/Adwaita/16x16/*/*.symbolic.png \
-                        ${prefix}/share/icons/Adwaita/24x24/*/*.symbolic.png"
+FILES_${PN}-symbolic = "${prefix}/share/icons/Adwaita/scalable/*/*-symbolic.svg \
+                        ${prefix}/share/icons/Adwaita/scalable/*/*-symbolic-rtl.svg"
 FILES_${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/ \
                      ${prefix}/share/icons/Adwaita/512x512/"
 FILES_${PN} = "${prefix}/share/icons/Adwaita/ \
-- 
2.17.1


