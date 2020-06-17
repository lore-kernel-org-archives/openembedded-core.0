Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.7874.1592401319348938890
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=E/mM51sS;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id AD38F6003F;
	Wed, 17 Jun 2020 15:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1592401316;
	bh=3TfCWOKlDL3/3LGrqerELvnoLG4nVoClBgZq7mcVfcU=;
	h=From:To:Cc:Subject:Date:From;
	b=E/mM51sSlOvwQT8hJL8cX2cjn1zyYGtLxMakc2bO8a4Ri3ufrpSIYMcxKI+MEv2LB
	 wgEAF5VGhObcwyi1vglVOyjydeQoIVZX1EOsu+sQaxuNj6aUXXL3xxxm2cZUs0jDY9
	 GmXj5AAIC8hsvIwbb16ggWUcNA6efy9Yib3NdLgk1rU+QKYvyUWz5ZB+QyxeYv5ax/
	 pOkgfKysNbrDmrEpXdphAoegFB/ndmI6or47q0B8uTvt5opWhLLwKdp+zeFXnMFd1p
	 OMskmD5KThO+MHRrNh93Uhj+wtK2V5+syM+4bozeLUwedMJHALsoDG6n2cdyiIurZ0
	 LoWgXezW7Hgpw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] ell: upgrade 0.31 -> 0.32
Date: Wed, 17 Jun 2020 15:41:44 +0200
Message-Id: <1592401304-23077-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This is a bugfix release:

ver 0.32:
	Fix issue with handling D-Bus watch removal.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-core/ell/{ell_0.31.bb => ell_0.32.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.31.bb => ell_0.32.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.31.bb b/meta/recipes-core/ell/ell_0.32.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.31.bb
rename to meta/recipes-core/ell/ell_0.32.bb
index 1db7131..07dc4d4 100644
--- a/meta/recipes-core/ell/ell_0.31.bb
+++ b/meta/recipes-core/ell/ell_0.32.bb
@@ -14,8 +14,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "3f670230be4d89d621b0508c70b1d36b"
-SRC_URI[sha256sum] = "ae88617275452f9f5840b2365e33e6c7fb6fa3405d42cbf9367de642ee8b6701"
+SRC_URI[sha256sum] = "42fdb9e24ff561a101389d51445cab1ff7d55f5385dc22a05b0493088cf99e30"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.7.4

