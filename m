Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3EED271BB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 15:24:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a15so21851168wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 07:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GU2yiKby7g12o3XAvMCXG8mIOICXnaP0+kcDD/D7dLw=;
	b=0BKWpkyTc1wF54Tam90T/Ml/yMZsUdgN7keP2+R7EHl6cE/v/gH9V/+vWTGtvSHPYe
	AHVDUJ44j+E6Z2fBH3De5WKjCr+QbpVU1pbfR7G7AMzWqpwVHlrNz2Uj3/+uQ8Wrcj7A
	tbWAHSS54YV4wPlgrrhIFRoTi0msV0nBHaQmzAbA4XXTSo7ws7uqs2V0XiTjBXSUhAs1
	ez6tYtosuVjlsjUWTvlReeAY2LiKsAamz66Rw3DiqVtxQLzchYVMs2mob3uy4oaJwtcL
	YgTcNAyavlraxcAvKaDMyAhwOd3uM9MpwZ27dudf4lCo1yFmRF9/cZOjZ7aQKNQKz6BX
	SzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GU2yiKby7g12o3XAvMCXG8mIOICXnaP0+kcDD/D7dLw=;
	b=eX6qoP0X66u8YvNfy9wIAQFo4R0WOHgHHEcJFRWv71reGqxxx2VsYiggCRVXn3JO2v
	yu19aKnK9+G5edaIpDRRrD84TtEa+7kmzuuFmdamckOILi2EXL3EYRvmoGNPAaayfqP2
	WfoWE77k/JtnJDT2gB863Ul2yUlL4ZnRQZOWsrCxloqmlPf53cPpKUbKCu96z/nOzdfV
	Ia04+y+mmWc4q2KNscIytNnFkt/blXPBRh/ZzeTFx23yTBgklM+t6gKEOhxlOwxv0YLk
	PDRA/x5CaAE+LPpznPQ6W9MHBhrpvZVw03ctM0h/uF93NyZmjrL88vHGEuefACN2gi69
	jdcg==
X-Gm-Message-State: APjAAAX2+1HKaPLURtIxvmePUL6uvb76RmUQ9baSl1PKzEx6QSsZMFuK
	qnzUm7cLnhJHUkA3hWfstal2LKGPo4g=
X-Google-Smtp-Source: APXvYqyH2l8DN6FxWjuB6JodHL2mFjkav8jV/WFvMygp6z+yIPH8TVeORJPKN++Z/izles6UbGDFbw==
X-Received: by 2002:a05:6000:1008:: with SMTP id
	a8mr28438842wrx.60.1572967462797; 
	Tue, 05 Nov 2019 07:24:22 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z14sm9569627wrl.60.2019.11.05.07.24.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 07:24:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 15:24:18 +0000
Message-Id: <20191105152418.24717-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191105152418.24717-1-ross.burton@intel.com>
References: <20191105152418.24717-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libsoup-2.4: upgrade to 2.66.4
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
X-List-Received-Date: Tue, 05 Nov 2019 15:24:22 -0000
Content-Transfer-Encoding: 8bit

Fixes CVE-2019-17266.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../{libsoup-2.4_2.66.2.bb => libsoup-2.4_2.66.4.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.66.2.bb => libsoup-2.4_2.66.4.bb} (89%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.66.4.bb
similarity index 89%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.66.4.bb
index 3a735cf27a8..7f5f910d3d6 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.4.bb
@@ -12,8 +12,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://0001-Do-not-enforce-no-introspection-when-cross-building.patch \
            "
-SRC_URI[md5sum] = "66c2ae89d6031b01337d78a2c57c75d5"
-SRC_URI[sha256sum] = "bd2ea602eba642509672812f3c99b77cbec2f3de02ba1cc8cb7206bf7de0ae2a"
+SRC_URI[md5sum] = "42016d80ecae4cf8eb416631049a273a"
+SRC_URI[sha256sum] = "8308984f1eee1c4f8c113a9c1763b2b22d981bd811b0cc82a9f3f1aa63228779"
 
 CVE_PRODUCT = "libsoup"
 
@@ -28,7 +28,7 @@ PACKAGECONFIG[gssapi] = "-Dgssapi=true,-Dgssapi=false,krb5"
 
 EXTRA_OEMESON_append = " -Dvapi=false"
 
-GTKDOC_MESON_OPTION = "doc"
+GTKDOC_MESON_OPTION = "gtk_doc"
 
 # When built without gnome support, libsoup-2.4 will contain only one shared lib
 # and will therefore become subject to renaming by debian.bbclass. Prevent
-- 
2.20.1


