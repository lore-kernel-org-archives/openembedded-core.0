Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.1879.1603394413938523998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 12:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XHbGolG2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.195, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f195.google.com with SMTP id e10so1798332pfj.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 12:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=axLLp+De/qmVQ81zPGeCKgYDqDp5boplvEGAIkKIjtg=;
        b=XHbGolG2ixG3qde6cF7VDvW/xGw7y42w3sa3mPEv2KofTFh1XLFLCIB4HPUeXJdp1L
         faD25RMD7eSqgcFQX7WOm6301WhL+MiK1BtvnNjjdpMaLUYwzQM3YJY45Pex2dm09KYh
         JWtDBw0ffDTPZGfwPW6FuaY7CbibmmQKmmeCXvoqwDIU40vBK+5AgspvUINiuFI9e+mF
         TNgp+Kyf/EJgUmGNvcPVvO8w5/r/x36SSwnqorcecMqmRsUXCd738203CljWmej/ojaF
         9b8Ws90aL/l9zR/OIxTltUMTqt9/Cq+f+WxQr6B++I8SpVJINQOl9onEjjPKiNgmLAkc
         hJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=axLLp+De/qmVQ81zPGeCKgYDqDp5boplvEGAIkKIjtg=;
        b=bsVpQo3TVA8UqcfvMzuXdzUl/nJwHWUs/kVkNRysutQXLHJrk1PBxccRkw1kO0ShRN
         e/0J9Zs3UOOTAfyTQMaWar9lhLoBaOwlICVyWGeTO1reF1mCp1XhTpnKvvzFPGOF6HtB
         6v1VIUnH3+m/78gliTi1nwG8XjhJhGa5BmDqdpoZ7X+Lzbh6ADZGSv42p13JFqIc/iFx
         JYJv2N4oSH1bYD8ZsGi529WYlc2pn2JO6/Q70hdlBa8rSp8ZjSeOnZlDC9alnSFiG+Jr
         ajQ93RA6CLuvpqB8xPurYU73oQGJCTLPKotU3uo3GlLTAOQ0JtIA9ZqYgd0bFvCGXfll
         f7Fw==
X-Gm-Message-State: AOAM533LrFzVmB9A4Xvv92lygUZWJMw72VnapegCYkS96ryXfVCTzieV
	dR2SaiJSftRwluW3OM3v4yhZzFG2XupglJvW
X-Google-Smtp-Source: ABdhPJw4pcTQmBlOTbdSdEPN0OpSOZhS47kakTTSWhqrPK/DmFuq7Ehdkln73Mya25AY1Bm3VCDwKA==
X-Received: by 2002:aa7:908d:0:b029:15f:d774:584 with SMTP id i13-20020aa7908d0000b029015fd7740584mr3864534pfa.6.1603394412923;
        Thu, 22 Oct 2020 12:20:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 3sm3152793pfv.92.2020.10.22.12.20.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 12:20:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core] [PATCH] netbase: update SRC_URI to reflect new file name
Date: Thu, 22 Oct 2020 09:19:47 -1000
Message-Id: <20201022191947.29967-1-steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The netbase_6.1.tar.xz file was removed and replaced with
netbase_6.1_bpo10+1.tar.xz.  File contents are identical except
for the changelog:

$ diff -rup netbase-6.1 netbase-6.1~bpo10+1/
diff -rup netbase-6.1/debian/changelog netbase-6.1~bpo10+1/debian/changelog
--- netbase-6.1/debian/changelog	2020-02-16 13:22:04.000000000 -1000
+++ netbase-6.1~bpo10+1/debian/changelog	2020-08-26 23:10:59.000000000 -1000
@@ -1,3 +1,9 @@
+netbase (6.1~bpo10+1) buster-backports; urgency=medium
+
+  * Rebuild for buster-backports. (Closes: #969058)
+
+ -- Arturo Borrero Gonzalez <arturo@debian.org>  Thu, 27 Aug 2020 11:10:59 +0200
+
 netbase (6.1) unstable; urgency=medium

   * services: added isakmp (500/udp) which was removed by mistake in

[YOCTO #14084]

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/netbase/netbase_6.1.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/netbase/netbase_6.1.bb
index bc0049c020..0153746a90 100644
--- a/meta/recipes-core/netbase/netbase_6.1.bb
+++ b/meta/recipes-core/netbase/netbase_6.1.bb
@@ -6,10 +6,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PE = "1"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}~bpo10+1.tar.xz"
+S = "${WORKDIR}/${BPN}-${PV}~bpo10+1"
 
-SRC_URI[md5sum] = "e5871a3a5c8390557b8033cf19316a55"
-SRC_URI[sha256sum] = "084d743bd84d4d9380bac4c71c51e57406dce44f5a69289bb823c903e9b035d8"
+SRC_URI[md5sum] = "4fa7517285b4045ac0dc8dbf6730dd7a"
+SRC_URI[sha256sum] = "4e9c3082dff8896cb6b6bea9bb2200d82fb0d7c8d8c8fc9b18704fe553316237"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 do_install () {
-- 
2.17.1

