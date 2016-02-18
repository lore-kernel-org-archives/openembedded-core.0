Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3233D763F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 19:21:34 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id xk3so83743534obc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 11:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZB9oY2R7Xpn80MWlqabjGJ8ku/8TZQZzKTFlHmiqnlw=;
	b=rJ+HGNFcWESJcVu54lcO0K2UiW8jABJlsUky5JOjhIgUbxkU6Npx13Qwt0CJvYzmMx
	aP0eRP6Y98uYlA5pfyDArn44rzXVreQlwzA4UHiWtxDZlQXQaJmw262ST1HV/Y9wYvn/
	NCw6FewxcrW/xO+IxeBMIsyOTsoBM0QnojbgHQvjaxCdyDLAk9XfuYLiw2G387o44sxv
	X/MGv8CMy6nxCkZjkC8Xur5P+L/4FUR/sRgIHpQvBJYY5yU85ivhI1atS2kGP1ynrY2B
	IMlPpE2i/+u8aacggUfnW9l4PASkPV+SrWr6dh9k6ZHsWJr1f4Pc9xc+jlQsScIg31y4
	OpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZB9oY2R7Xpn80MWlqabjGJ8ku/8TZQZzKTFlHmiqnlw=;
	b=KGdiQancbElHFmTouNH5BzxLoJeCi6E2KMHRx+XJxGzY3AXOVoh8eko3MVknT+rpX3
	4GTFpE6bJfdZkhjq0pLMjHyrN+MH600nNFKEUpKQL3xLbBK71IMX8VINTeJdvgd27HMh
	3lPM1pM523xtPRj42VnIjy7QW+IpPYnvIDxsGzsAOxl49OIVpXxYy/nzhpqwisbCL9k4
	8xZzsQqFtd36grUOgGRlZmWwsko5T2mCOTKatmaCO/TK+b+i7N8oVu/5bzwAb4pQdxmH
	cGyNl+hSjIsP0PUXKpIO0nfbfT0UWJfmx6VD5wKgaCgdss0pd12wm0PA0QgXvRMCe4eU
	UNVg==
X-Gm-Message-State: AG10YOR0ilIDjnqM0/9/JXVZwu137gKTQiAWj2yPDrSz5Vh9Xf+rgRnJemenNGNyWioibg==
X-Received: by 10.182.153.10 with SMTP id vc10mr7870897obb.10.1455823295491;
	Thu, 18 Feb 2016 11:21:35 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w127sm4626409oiw.17.2016.02.18.11.21.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Feb 2016 11:21:34 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 11:21:24 -0800
Message-Id: <1455823285-32028-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
References: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2] libsoup-2.4: minor formatting improvements
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
X-List-Received-Date: Thu, 18 Feb 2016 19:21:35 -0000

Also update HOMEPAGE from generic Gnome to something libsoup specific.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
index 3215ff1..865c1d7 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
@@ -1,22 +1,14 @@
 SUMMARY = "An HTTP library implementation in C"
-HOMEPAGE = "http://www.gnome.org/"
+HOMEPAGE = "https://wiki.gnome.org/Projects/libsoup"
 BUGTRACKER = "https://bugzilla.gnome.org/"
-
+SECTION = "x11/gnome/libs"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-SECTION = "x11/gnome/libs"
-
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native"
 
-EXTRA_OECONF = "--disable-vala"
+SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split('.')[1]}"
 
-# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.  Enable
-# by default but let it be easily disabled.
-PACKAGECONFIG ??= "gnome"
-PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
-
-SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "e4757d09012ed93822b1ee41435fec24"
@@ -26,5 +18,12 @@ S = "${WORKDIR}/libsoup-${PV}"
 
 inherit autotools gettext pkgconfig upstream-version-is-even
 
+# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.  Enable
+# by default but let it be easily disabled.
+PACKAGECONFIG ??= "gnome"
+PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
+
+EXTRA_OECONF = "--disable-vala"
+
 # glib-networking is needed for SSL, proxies, etc.
 RRECOMMENDS_${PN} = "glib-networking"
-- 
1.9.1


