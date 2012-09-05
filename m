Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9D5I-00035O-7f
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 12:43:48 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 05 Sep 2012 03:31:23 -0700
Received: by wgbdr1 with SMTP id dr1so403021wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 03:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=731RZlDzOBZS5ClAj1WYfy87cN9mbL2Wn9/k1fjVUjQ=;
	b=lnkGI9YpJrxDHbWHaZV6BPgU8PF+yWkoLWKZEG+ZB2fq4jaun0cUEgH8Cbwa1VLzJX
	9f8tzAMfI1QhVrTZr+CKPY08EGMbIbRmNJM2OtztAJXpaSiY7lByb6JxXy52W/9vWRJ8
	YQkC2H2r6SNB6i5UXsjHDPlf3Kk+meahqMTeS29M1PrNLwqC4A3JFuVofHzN8VIBJ8Vc
	LTy9mGzIcHcE2NZ3WGvHteTKEzhD8aRovQs5YIn+iIwCLbCGwqFIFIkrCpFLRBnACK+f
	ULjHdeT5PPsVZtmvjKs0/3sZOh6JVz8EnKonmUj01z0AejoJbRIAzZz0XcYpbxFjn8Z6
	z70g==
Received: by 10.180.84.169 with SMTP id a9mr37249485wiz.8.1346841081875;
	Wed, 05 Sep 2012 03:31:21 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ef5sm3631183wib.3.2012.09.05.03.31.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 03:31:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 11:30:36 +0100
Message-Id: <1346841036-9897-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQl+2FxitYG9taD+Cn7jGoO6jBYFWvgodLXZiIJbW4xU3cj4TtjtRgrxZNnAb/sgvMQHxNpp
Subject: [PATCH] xserver-xorg-common: add RREPLACES on xserver-xorg to -module-exa
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
X-List-Received-Date: Wed, 05 Sep 2012 10:43:48 -0000

As the file moved from xserver-xorg to xserver-xorg-module-exa, the latter needs
to "replace" the former to ensure a smooth migration when upgrading the
packages.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc |    3 +--
 meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc |    1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index b588c11..b4a348c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -8,5 +8,4 @@ SRC_URI += "file://crosscompile.patch \
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r5"
-
+PR = "r6"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 404c488..6133344 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -66,6 +66,7 @@ PACKAGES =+ "${PN}-security-policy \
 
 RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
+RREPLACES_${PN}-module-exa = "${PN}"
 
 FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
 FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
-- 
1.7.10



