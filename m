Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3A478302
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 11:51:57 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id c184so49826818wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 04:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KkjyFzNO5jnSU6AVwsRCWnvXK1vHY62EeH71oD47bHw=;
	b=swzQrVLMTCMk9Ef6JkY8S11Bu6arR0PEPrGJHoKhq/XIH2592CzytJQUDgRu9UXWzh
	D/4AVnxA/Xo5FmxkTwfHHokWY8oJfcmubWTLCrERTl8mqBZexLZzTdpel8gy8AXTnfRQ
	FIBkx4zkTSwlCvC4WzMdritN6gE4d0wITn1WyqTGj7jANOXAEQhIGKANKb0I+Zh4kVar
	E8QWVvxgMACCE7i438oNaW5k6Ne9syN8GS53VaaueUeUuSBfCN1j0bfUQMxf8iUamC5d
	+OFk9DJZBhiBbKubEGCxniJ4XcWKJDPYN0oeNUPeb5k1/MDCeZH/s04U16yBkyny6Yu3
	KgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KkjyFzNO5jnSU6AVwsRCWnvXK1vHY62EeH71oD47bHw=;
	b=An7eRfs0Kw4Y8Bpo8J7lipImVGF2apzx5M4wazwEcl/9zKrbEEuEtMWpkISvm8jYqe
	urliFVsYMRJNcYC3YfsL/AmlSS7rkzVOl8CQ6DkvzPmdTG/8kh6Fufgyj1bo+WVyZszL
	8vsq2AZuHW6ti2KcZDr1T8XsArwKjEAsmxTb0/3YMWf8drAeeX40o5bdE6Lkrv404t75
	jJgsREWeMDy3kMNbC/beOl77uWy6MKDBCorSFZOIhKQUsK/eePSOfiC7ICoGiLV+JjMR
	AJxajPfeH2jSTDCYtdd6ve5m+9DVw8ZpCZghnumngH3x3f4g1MtfFx9wi/MD4Oloq1Fs
	C2HA==
X-Gm-Message-State: AIVw1101oNAnr9Gf0ZGQd54s81tinC15oqyBpC6U+HsaIzMmcPS6vLk7
	wFTiMBEP5t1UEeEEwTM=
X-Received: by 10.28.134.199 with SMTP id i190mr7811439wmd.165.1500983518059; 
	Tue, 25 Jul 2017 04:51:58 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w64sm6398483wmw.1.2017.07.25.04.51.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 04:51:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 12:51:55 +0100
Message-Id: <20170725115155.32079-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] gnome-themes-standard: don't generate multiple -dev and -dbg packages
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
X-List-Received-Date: Tue, 25 Jul 2017 11:51:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb b/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
index f75f7c88ccf..e49ad5e9d1b 100644
--- a/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
+++ b/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
@@ -30,16 +30,11 @@ do_install_append() {
 # There could be gnome-theme-highcontrast as well but that requires
 # gtk+3 and includes lots of icons (is also broken with B != S).
 PACKAGES += "gnome-theme-adwaita \
-             gnome-theme-adwaita-dbg \
-             gnome-theme-adwaita-dev \
              gnome-theme-adwaita-dark \
              "
 
 FILES_gnome-theme-adwaita = "${prefix}/share/themes/Adwaita \
                               ${libdir}/gtk-2.0/2.10.0/engines/libadwaita.so"
-FILES_gnome-theme-adwaita-dev = "${libdir}/gtk-2.0/2.10.0/engines/libadwaita.la"
-FILES_gnome-theme-adwaita-dbg = "${libdir}/gtk-2.0/2.10.0/engines/.debug/libadwaita.so"
 
 FILES_gnome-theme-adwaita-dark = "${prefix}/share/themes/Adwaita-dark"
 RDEPENDS_gnome-theme-adwaita-dark = "gnome-theme-adwaita"
-
-- 
2.11.0


