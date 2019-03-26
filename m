Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 514017D08C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 14:21:50 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id v14so13150055wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 07:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=72awkooiyi/JMnZDsaHy3AyAEGSN0smYJWmGXPaWmBg=;
	b=d47yk9x4XbOiPWkc4d0/G9JSw42xR3WlWJTlj80qYOaqQ3ScAmhF2x/66+LDyz1Gcq
	PZJPm1GAxwbCPHIBGNO97KZQaKPiGmw1P3iZUVsPn7hZcUDobmdB9nXi7+UbE1oG+0Cl
	pKAanS00paIm7mcNQJK6zvlgm0rbIYO7/d83dRR7/VOx9ZYA78+26A11lMQG1W3qx/iS
	L+53F5Bpv+II40rtk8F9if1Nx6QemTT40/R9OOcB1lV1PYTe0pC+EpRa/psU1G1PfJ2B
	RMb8WEE57uUd414a9I6W+KduAyR88XyYucXJhPTf1THeRohEZjkOiouFMOGAXXCq7v6t
	zi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=72awkooiyi/JMnZDsaHy3AyAEGSN0smYJWmGXPaWmBg=;
	b=oai+VIOij3KNpD1hZ6TGy7vobW5GcSWiJuQZJAqmBOee+dX/la0UzxyOMtxv9hOpsX
	QFmHRjpLG77ZrhBmhsvmLyfZhXHnlspz5CB7tYHlYNJza0CGl0khjABDjNgu9Yl3wPaT
	a9KyM3ZVg1GilodlWTA7E2x9Xsowng1x0Y5XXDKo7IheIl7rGn+BYDo4RseQo8pw+/be
	dRodZ5b7z8ndcZvGnKFW7HGwnDRgsWGxEIPF0f4b+opQTkCEr/7iIDnkB1Iqn60bFUjx
	s3qeGdYFXMMYObexbd/h8PTtCOsuwvDBT4EZPxeAbqTKPlGSGVjs31z+Q4R011lNMtos
	X8HA==
X-Gm-Message-State: APjAAAXambQmteaKc3ohl+zk7IrvtlldgCBz4rBhRWuY13cZFWQAlTer
	que7pW51/eqWqxG7iTgT9XWGCndh
X-Google-Smtp-Source: APXvYqwnsVoKvRncrwqy5VE1F7k79L1WWtHPN0njB/pKsed/917XfnErsRd50ZND1vHT0EzusoGXGg==
X-Received: by 2002:a05:600c:210e:: with SMTP id
	u14mr1409112wml.50.1553610110659; 
	Tue, 26 Mar 2019 07:21:50 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	c193sm22337108wma.46.2019.03.26.07.21.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Mar 2019 07:21:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2019 15:21:34 +0100
Message-Id: <20190326142134.4488-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] adwaita-icon-theme: do not delete symbolic svg but pack them in ${PN}-symbolic
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
X-List-Received-Date: Tue, 26 Mar 2019 14:21:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes:
* gtk-icon-browser: for symbolic view almost all icons were missing
* xfce's thunar: 'home' and 'up' icons were missing. Had a long discussion with
  XFCE-people [1] and asked here [2].

How could I overlook the most obvious...

[1] https://bugzilla.xfce.org/show_bug.cgi?id=14443
[2] http://lists.openembedded.org/pipermail/openembedded-core/2018-November/275815.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
index 3e9420ed9a..451ef39f1a 100644
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
@@ -37,7 +30,8 @@ FILES_${PN}-symbolic-hires = "${prefix}/share/icons/Adwaita/96x96/*/*.symbolic.p
                               ${prefix}/share/icons/Adwaita/48x48/*/*.symbolic.png \
                               ${prefix}/share/icons/Adwaita/32x32/*/*.symbolic.png"
 FILES_${PN}-symbolic = "${prefix}/share/icons/Adwaita/16x16/*/*.symbolic.png \
-                        ${prefix}/share/icons/Adwaita/24x24/*/*.symbolic.png"
+                        ${prefix}/share/icons/Adwaita/24x24/*/*.symbolic.png \
+                        ${prefix}/share/icons/Adwaita/scalable/*/*-symbolic*.svg"
 FILES_${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/ \
                      ${prefix}/share/icons/Adwaita/512x512/"
 FILES_${PN} = "${prefix}/share/icons/Adwaita/ \
-- 
2.20.1


