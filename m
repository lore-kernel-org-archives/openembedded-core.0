Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.8876.1614344470971403628
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T3i0vqWh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id f12so4699027wrx.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aTsCxd8DfuBRNcIoDz6LipV0Gb6WUmjy4vuRLPVjEm0=;
        b=T3i0vqWhCwhbeJjN+GIlCiG0icJRL1UTZ3VVmf7nu5y+At8Vu0zs37s2VaPH3U8YUj
         qu4pcv8iM6B601qAuvR65Qf7aQw7p4XYVyGn9iVZt6Q3qOArWVKcNd01/YL+m5M6kHlu
         AnlwA5k/jzFgAtQpGUncMK2eVAq4ChWvPsnJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aTsCxd8DfuBRNcIoDz6LipV0Gb6WUmjy4vuRLPVjEm0=;
        b=MRei1KPlMpKXBbe+utbmqA9qdn+ZJU1XcXgooGMP/YlfqRGBPyId6UDiJ+NCpWPHQG
         kWt2vDbeVh1BWHZCNKcd9GFJyVzta94B/6Vbnzrv5Jcca/Z/9JwZ/vNXcj0pTFTvNl8u
         9iqP156RoP5EabOpvbkbRxi1ERnrDNCzHaqd7h4R7GpXMD41HjW3krnBdrrsUy0bpFXK
         fkLWFl2TJ8w9cTYPSrDS06TmXjnkkB9bcd/BnZlIELgIiluKWWU2k8filDatuLi1l4jr
         kjoM9pAFM/Vah6uko1EDRw9BNJAnNK2X0EjWNwHx9tBeAzbNgaPtBI7FhmsUUwZDh3Mi
         mGLQ==
X-Gm-Message-State: AOAM533pr0IAhkBe8SDEfIgOvxK4ip0duTyECfxRH9hPtuPexwsOmbZj
	4m6lqM1CyOAOKtD/lm2VbBVQD1StZZz87w==
X-Google-Smtp-Source: ABdhPJyEw2BQ31UPu741z3RLAmxq2MwHde0vx9btjuZBeX/lKiaWD2pvhTcngwQ31cJaUf0fqV4PiA==
X-Received: by 2002:a5d:6786:: with SMTP id v6mr3157875wru.19.1614344467528;
        Fri, 26 Feb 2021 05:01:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id q25sm11637829wmq.15.2021.02.26.05.01.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:01:07 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/13] fonts: Bump HASHEQUIV_HASH_VERSION after rpmdeps change
Date: Fri, 26 Feb 2021 13:00:54 +0000
Message-Id: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the rpmdeps change, the output didn't change in the correct
case and hence hashes were cross-linked. We bump the hashequiv
version to avoid problems from this.

Also bump PR to force a rebuild.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cantarell-fonts/cantarell-fonts_0.301.bb                 | 4 ++++
 meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb   | 4 ++++
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb   | 5 ++++-
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb        | 4 +++-
 4 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb
index 890c08bf4a0..8dc4ceb399e 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb
@@ -13,6 +13,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb1ef92b6909969a472a6ea3c4e99cb7"
 inherit gnomebase meson allarch fontcache pkgconfig
 SRC_URI[archive.sha256sum] = "3d35db0ac03f9e6b0d5a53577591b714238985f4cfc31a0aa17f26cd74675e83"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".2"
+
 EXTRA_OEMESON += "-Duseprebuilt=true -Dbuildappstream=false"
 
 FILES_${PN} = "${datadir}/fonts ${datadir}/fontconfig"
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
index f5df9efa3b7..abc216f434e 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
@@ -10,6 +10,10 @@ LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f96db970a9a46c5369142b99f530366b"
 PE = "1"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".2"
+
 inherit allarch fontcache
 
 FONT_PACKAGES = "${PN}"
diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index 3e1ba196b58..50c79b3bf00 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -7,10 +7,13 @@ but is visibly different than normal and bold, and reasonably pleasing."
 SECTION = "x11/fonts"
 LICENSE = "BitstreamVera"
 LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
-PR = "r7"
+PR = "r8"
 
 inherit allarch fontcache
 
+# remove at next version upgrade or when output changes
+HASHEQUIV_HASH_VERSION .= ".1"
+
 FONT_PACKAGES = "${PN}"
 
 SRC_URI = "${GNOME_MIRROR}/ttf-bitstream-vera/1.10/ttf-bitstream-vera-${PV}.tar.bz2"
diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index 6a91582068d..f0c77f33bd2 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -13,7 +13,9 @@ SRC_URI = "file://misc"
 SOURCE_DATE_EPOCH = "1613559011"
 
 PE = "1"
-PR = "r3"
+PR = "r4"
+# remove at next version upgrade or when output changes
+HASHEQUIV_HASH_VERSION .= ".1"
 
 inherit allarch features_check
 
-- 
2.27.0

