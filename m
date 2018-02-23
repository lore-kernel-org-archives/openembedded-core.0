Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0D07E77F90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 15:35:41 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id a20so7412727wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 07:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+p6NsyoqGzXHqqqwg0NR/OUVwFL+49FKtmDLvIOFaAs=;
	b=mNhszUeLS5FQi4n6FkYa190s5d9ee7O1PTSBfgkSAnuvbEqZ2jCYp4gNaBhrGb3Pmo
	7h7cQueqiGnwR61Jc3IFCKxzvYCzT4NCK+ea5lk4vCpP3z7ZSdv4mJUdUlRtM9R9CAmQ
	kcxr5YZw7G3qoiPw6xxXWM92Y1TnJTngxmr3TDyG/WqVthWkoTBib4U+q9JkDfu6uQBv
	PbAfzB2WwNk/La/NKrvmb70exynBpM33Xk9cyIufBAO6kwNXK+th6iVwQcrMH54yKNxn
	nXyZiIabh0x0ZfwxbetxpY1QjMBpqhMJaMOk5+Dt08ygW9K6Mjr6oZ5r66vSzYD1EfA6
	WCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+p6NsyoqGzXHqqqwg0NR/OUVwFL+49FKtmDLvIOFaAs=;
	b=FVMUK0uKohlnOXtHRnExgnSEo2WM72gCVnNp3GMIi7RsXwBTT0p7cFbP+CKXbP8u/+
	cCinG7Spfnmd2z/IHZNjDTXl73twJKrJjmVpp9D3UNHpUf3Fn/nVXoaJFfMAdFgzC0IA
	KKJMozj5msu3XBwvw+4wUCfb24DfQpTLzxN06D1IPLIw/i9KPJF2dIK4RG2YGWO3F1wT
	mRxg5SF/kvZYhvLjXepJAt01eHQU3c0XWy6hXxFG79fuLn27mM+0ZgICH9xM/2PVGApN
	xg3Du+B932qggVmy86gOGh10c2EE36JdveCvfSZNh9fYxjWnY2uRv0Q87gvldMMKlISz
	68Ow==
X-Gm-Message-State: APf1xPAmWOK5c0VvAcfgclSpCxCJ9y0tOehNyDiv+gemDlmJ5qlMmjsY
	s9gmsrSTrFvaT2jTnqYmAg6EgL4B
X-Google-Smtp-Source: AG47ELuYB0LAREdF4jAT8Ol6x/oaDve0+cnD8NmtK63RB9BJ39lfkqmo9pMKRq5EKswl+lBeFRfxtw==
X-Received: by 10.28.35.77 with SMTP id j74mr1911570wmj.96.1519400142481;
	Fri, 23 Feb 2018 07:35:42 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id y23sm3372976wra.9.2018.02.23.07.35.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 07:35:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 15:35:40 +0000
Message-Id: <20180223153540.11126-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libpthread-stubs: clean up recipe
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
X-List-Received-Date: Fri, 23 Feb 2018 15:35:42 -0000

No need to inherit pkgconfig as configure doesn't use it, remove commented
DEPENDS which clearly came from another recipe, stop deploying an empty PN.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
index a6998412550..ffa1c859d6f 100644
--- a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
@@ -7,17 +7,11 @@ SECTION = "x11/libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6edc1fea03d959f0c2d743fe5ca746ad"
 
-#DEPENDS = "xcb-proto xproto libxau libxslt-native"
-# DEPENDS += "xsltproc-native gperf-native"
-
-ALLOW_EMPTY_${PN} = "1"
-
-SRC_URI = "http://xcb.freedesktop.org/dist/libpthread-stubs-${PV}.tar.bz2"
-
+SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.bz2"
 SRC_URI[md5sum] = "48c1544854a94db0e51499cc3afd797f"
 SRC_URI[sha256sum] = "e4d05911a3165d3b18321cc067fdd2f023f06436e391c6a28dff618a78d2e733"
 
-inherit autotools pkgconfig
+inherit autotools
 
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
2.11.0


