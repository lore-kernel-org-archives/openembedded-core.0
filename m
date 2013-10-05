Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0859F6CD4B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:15 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so2293384eak.15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=T0d8xKE7O7QBoASrKFCaksSiQ3HfcCcDDOUb2MCEkc0=;
	b=bx1hOBhMShLIMhtGDQrnA45kEmNa0ysnHLp1M+Z/lVodXqRqlcWmqY/Z6SV+EuLFFs
	9ctePWfDJPOJ3IQZzwGAzDYpYSwrVgffCIXFPTfsNrLZfxio1Sixeih18Oncq+EQ5GTW
	FVSaKF+SJJitOPxhdfs2d8jkBzzpVFp2apBZIxYFkc8q9JCfEyShUirhNFW3M/ivpoYG
	uOKkZgkSLSBk+u3I4wpctWwPkVE+p7bE9D5q3bDwXCgxH1jy0mHicwpRU0REjL4UVBKA
	Fms7PFQ96ZdHB1khUiMLViAjH+zbQdVQYpqLabjuOxILzxlqy4iIJHpv9HbQPH4xTTmS
	XDBw==
X-Received: by 10.14.194.131 with SMTP id m3mr4290684een.45.1380975797613;
	Sat, 05 Oct 2013 05:23:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm39203134eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:23:08 +0200
Message-Id: <3ffd6922ae815e39a18103b943fd4c5dfb3e173c.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 11/14] glib-networking: Add PACKAGECONFIG for p11-kit
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:16 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.36.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.36.2.bb b/meta/recipes-core/glib-networking/glib-networking_2.36.2.bb
index 863a4eb..5200b94 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.36.2.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.36.2.bb
@@ -13,6 +13,9 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/2.36/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "fb9121742ed36d1723f296eea19dbb3c"
 SRC_URI[sha256sum] = "2108d55b0af3eea56ce256830bcaf1519d6337e0054ef2eff80f2c0ef0eb23f9"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[pkcs11] = "--with-pkcs11,--without-pkcs11,p11-kit"
+
 EXTRA_OECONF = "--without-ca-certificates --without-gnome-proxy --without-libproxy"
 
 inherit autotools pkgconfig
-- 
1.8.3.2


