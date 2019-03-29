Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id DEE9E7D244
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 14:29:09 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t17so2815461wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kXMeYPra8XOwVNdTqJLg8xP6abx9u95mtFiB7kyiONo=;
	b=X4Lvdm+dm5QJxGmCHA99rp+AH+/Y/DtjKZGf+udhoHgfd6fmAqW81B24J66jb5OpgL
	7mFNoOQhS8dXLiHrpNZuoG/qtEayFKl9R0gPHlmZo5aOXB2BlI8o+S1XFvQ2GJrCZwxa
	IPbsV0bW/LrHiEHzPTj4zW08new0hM2GChbU3jtWsmj9PDXUCqVGmRdsiJeWFfIwq4CB
	VTgkn4VXIPbc+vM6hTkff/S8rb1RuxR+uc/tumQU//ZUiNXTnvNLzSHWGA57VcTJMJUT
	KgoZxQIjib1ihF6yUUB6dDY/gKGyy6aq3kK04upAZAzZVww4+GURrGzhljkrc1Sza/J9
	ynFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kXMeYPra8XOwVNdTqJLg8xP6abx9u95mtFiB7kyiONo=;
	b=Tka+yome66laKOjPX1rPCVYeboOjimQcQHLQOAicHbX0iYS2rpOWFzQLExO8Dr7Dvm
	bdsxrt5YszyIxLGR2mZYH4wsj5FObq9hLe5xm9V1I/r7s35NtqLkeTWXC14QkklqlTdn
	x3lIP8zo+RZ4B1QGE37VyOhmM55fgmFrkxe2l5P2smoFrmeJE6MYhdGR1fObltlNplQH
	7RGhtS58QK/Dy+uUyQINvlkO+tgjwe7chFwJgJXpDzAOSySXlmye2O+C+/UsmQfsO7iC
	xnGsO6DeZrlWkV0YR6LG7ru7p2BSSMgjgDloekq0zIWZ1sFPG3hNqQMmeydP8kOKDgNg
	ZxOQ==
X-Gm-Message-State: APjAAAW2m5A+JPE4y7ChQNE29GvKUHGnXUUMfp4Xw4Tfkwrh4bskdl6E
	qDZhEnp3zF5VDCRAt3aOylROH436oMs=
X-Google-Smtp-Source: APXvYqw8JLHpk9yF4BCB9SlPj6/UIEwCTU4AnV9runvT0q1M7urEXIX3K6b2b5AOYBlvISS0YEoC0g==
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr6791651wrv.131.1553869750438; 
	Fri, 29 Mar 2019 07:29:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e193sm4358537wmg.18.2019.03.29.07.29.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Mar 2019 07:29:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2019 14:29:04 +0000
Message-Id: <20190329142905.20123-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190329142905.20123-1-ross.burton@intel.com>
References: <20190329142905.20123-1-ross.burton@intel.com>
Subject: [PATCH 2/3] adwaita-icon-theme: depend on librsvg
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
X-List-Received-Date: Fri, 29 Mar 2019 14:29:10 -0000

adwaita-icon-theme uses gtk-encode-symbolic-svg to generate icons, so DEPEND on
librsvg-native (and gtk+3-native, via gtk-icon-cache.bbclass) so that this tool
exists and can load SVG files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
index 451ef39f1ad..8eadbd2eef7 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c"
 
 inherit allarch autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even
 
-
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Don-t-use-AC_CANONICAL_HOST.patch \
@@ -18,6 +17,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "db3fd812821d72fdd9a3c7d622a95b35"
 SRC_URI[sha256sum] = "6d752a2b1bc668483956d4485c39cad1642d9358e133ff689526e43674a4e1ce"
 
+DEPENDS += "librsvg-native"
+
 PACKAGES = "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires ${PN}"
 
 RREPLACES_${PN} = "gnome-icon-theme"
-- 
2.11.0


