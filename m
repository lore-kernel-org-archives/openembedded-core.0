Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Udd11-0006S4-NY
	for openembedded-core@lists.openembedded.org;
	Sat, 18 May 2013 11:01:25 +0200
Received: by mail-ea0-f178.google.com with SMTP id q16so3004577ead.23
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2013 01:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=kvHXcs3EndV467INjLbLC8KY5zp6a290alfYa4WM8Kw=;
	b=SmRvO+goEt8fZblUU5tpIzLLqXmhqkK+opIc8nLcZPWZnQRwOEj0jknL7aGl1hamqU
	9Qe5pv/k1mnL0c5f3eQtDkGqwf6EbamOMVsrKRF9Ty9IIAs/oucYdykhG9FqnvhvxWb9
	0yreC/u+pHBZE5H2NGDn5ecJxukqg+69pQmR+U3PkDWQy5QPnDA6ZOEiyS+eM2rV3U0K
	AKc14cdrj820Nb/aCCAZcOfKI2+Z8PykbX4rjznHeUCD7UmenLAseCV9NzX8GWqXXd+E
	fcVAmYBn6zo+vumoK+KjiQlGv2wxRxEwElwdUJK+pF0BgMLlxeAtPfvZh6xg/rVqRFNu
	Echg==
X-Received: by 10.14.98.71 with SMTP id u47mr22870017eef.12.1368866587109;
	Sat, 18 May 2013 01:43:07 -0700 (PDT)
Received: from localhost.localdomain (p4FDF11F2.dip0.t-ipconnect.de.
	[79.223.17.242])
	by mx.google.com with ESMTPSA id t9sm24534586eeo.11.2013.05.18.01.43.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 18 May 2013 01:43:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2013 10:42:53 +0200
Message-Id: <1368866573-18112-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368866573-18112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368866573-18112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH/V2 2/2] glib-networking: update to 2.36.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 May 2013 09:01:35 -0000
X-List-Received-Date: Sat, 18 May 2013 09:01:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...working_2.36.0.bb => glib-networking_2.36.2.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.36.0.bb => glib-networking_2.36.2.bb} (85%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.36.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.36.2.bb
similarity index 85%
rename from meta/recipes-core/glib-networking/glib-networking_2.36.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.36.2.bb
index 2cc69ef..863a4eb 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.36.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.36.2.bb
@@ -10,8 +10,8 @@ DEPENDS = "glib-2.0 gnutls intltool-native"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/2.36/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "062dafdb939510e7b38eea3d3b367be0"
-SRC_URI[sha256sum] = "190d66fbaeb023ba4f43c315f23c5372c43be6cbe857596e00990211514650d9"
+SRC_URI[md5sum] = "fb9121742ed36d1723f296eea19dbb3c"
+SRC_URI[sha256sum] = "2108d55b0af3eea56ce256830bcaf1519d6337e0054ef2eff80f2c0ef0eb23f9"
 
 EXTRA_OECONF = "--without-ca-certificates --without-gnome-proxy --without-libproxy"
 
-- 
1.7.4.4



