Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id E3B516BF13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:13 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so351612ead.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=T0d8xKE7O7QBoASrKFCaksSiQ3HfcCcDDOUb2MCEkc0=;
	b=h5SSHp78eNm9zWHmrSFSgA8b4PK2eYxBDj9gXkjiFESmVxQFhv5sgkd8V7mHh9Kxop
	fY1H4p6XuNi5kbFMvEWfFZ0LxFgRSgpiL++pkM2yaJ/b0V7oeumtIkdgDj0nd/4IaNGH
	m5q+Ugx0WDZuxWLFcY1nVId+9f4t/MDvFUAKLIaMFRm725DQpt7D0iAnshnt+kJeEY4a
	rqsDawuFKisEfVW2Zps1SIAbvrGE12uYAjzMZ0N/wuqexWwMDRW/BgVDAfKU4MiXOcIC
	wIIB3gGJacKz6VxtBd2Mk0tYo8Z+0o0dGJvX1MH0na+3OdLqSrUJIjim+mw92MUE0gom
	37fQ==
X-Received: by 10.14.89.72 with SMTP id b48mr5469107eef.43.1377792134352;
	Thu, 29 Aug 2013 09:02:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm47237681eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:03:02 +0200
Message-Id: <46c0812f15f18f051db23c67f255d2260897b17d.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 15/20] glib-networking: Add PACKAGECONFIG for p11-kit
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:14 -0000

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


