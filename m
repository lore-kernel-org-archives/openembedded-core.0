Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 890C16FA94
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 10:30:47 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so4007788wes.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Aug 2014 03:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wlym23lNPazpcOA0BFds1/Ulz6NZchao9ePVnvxy7zY=;
	b=LoUBNIxEK8ffKVdIJihRnd8oFosdGSTDMb4uc4nLlRDJGhpdDwXhmjrhvwmtWGffyG
	q5ZjvPG6USZL1sqb5DTS4b71iY0v3y4WqxKj/bxtRe1hpYeclCo/rffGVNrdJC89unz7
	k3PtUszGq/shWRMve8ZzLmxk/Bj6x6/VhW05pI9h9/h0KPGUu/HJGurx2w4hwTQ/2fyI
	ycIULu4IJa9XJDoBZNIWZSoMtlC0G6v2v+2uL0dIXr+vd+sfzMIDwK0R4G3WC5y3wz1C
	CCVSQ01ylUlNgBAwugPKhce8O8swShXQ5mImM0dSsW7gLIHA+gdl+wiRdzMevuRPXZOW
	WJwg==
X-Received: by 10.194.22.194 with SMTP id g2mr23420773wjf.30.1407407448908;
	Thu, 07 Aug 2014 03:30:48 -0700 (PDT)
Received: from localhost.localdomain ([139.181.35.34])
	by mx.google.com with ESMTPSA id t6sm15398721wib.4.2014.08.07.03.30.46
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Aug 2014 03:30:48 -0700 (PDT)
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 16:02:14 +0530
Message-Id: <1407407534-677-1-git-send-email-bobadeshrikant@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: [PATCH] gdk-pixbuf-native: add setscene dep on jpeg-native
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
X-List-Received-Date: Thu, 07 Aug 2014 10:30:52 -0000

From: Shrikant Bobade <Shrikant_Bobade@mentor.com>

Without this, we can get setscene postinst failure due to libjpeg being
unavailable.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
index 3d08146..1248529 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
@@ -74,6 +74,7 @@ RDEPENDS_${PN}-ptest += "gnome-desktop-testing"
 
 PACKAGES_DYNAMIC += "^gdk-pixbuf-loader-.*"
 PACKAGES_DYNAMIC_class-native = ""
+PIXBUFCACHE_SYSROOT_DEPS_class-native += "jpeg-native:do_populate_sysroot_setscene"
 
 python populate_packages_prepend () {
     postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
-- 
1.7.9.5


