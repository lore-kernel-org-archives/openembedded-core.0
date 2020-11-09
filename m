Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.6323.1604890633015422076
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 18:57:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xeMhYwEm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id q10so6709769pfn.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 18:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0onr0cEs2Y7jWJyoxP3UCtMDQNQmjQUMqUz/QpsUWNQ=;
        b=xeMhYwEm4E5BpMXNUzeodRjdyu6a2h+0WRfVgqBedHOSvx1YW4bsLVKvwmkJyVsP9V
         hIczlvVhwwqnSRT09htDBTd/9r7uIsCRMiDh8W80/1J9ULYAR44eaWwQttmgIDKAx4Gj
         dBo0C/9oCyGvrO3/0brNU6gccVm+BVdNsNgkdXiQPW2LuL2BB4NkJ0AkRsD3B/H+hpnm
         hYnXbaA5hCsjbPX6P8YejhokWyNMVNuMkr/MvYu4XR+iyOZlO98NL4X49Vw+KTRTRBtX
         oDSlPQvKJSgcb/7PsUYqF6XnKjrwW4TfzzlLKEcBQluCZn11sKO8teElPb9KtwEjqBGn
         sJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0onr0cEs2Y7jWJyoxP3UCtMDQNQmjQUMqUz/QpsUWNQ=;
        b=RKEA+FcJZr62Jtj9XPJ9xYQzrjE4Lx9pybHGnU+77dqNrAoUC6UVMX9r7Srsfq2Jzo
         z/iHjEkFNj4zYMnhC4U9S0BpV/j3BDQDikgZBIdEYW2q7WDtzWk1ZZHM86lyyQXkbB/g
         o3aoXnZrFW0tVR589c2GOdhi+AR0cU+5M5yWL2rObFgwvb5nduAhYG3JxdEsLUo0HxIe
         wDuzx+wrjx+GfNseORiR3DDYrDCm9YqBVLhmwwv8EI7x87P4LCp2P8P30YbRNN71Zdh0
         FeYKAZ4v9z+XacGFrrCibVUXrsqDVgS9CJWyH0JLqTpKOphNC931rG3JpBKm1f2GFYD5
         XIYQ==
X-Gm-Message-State: AOAM531VFEvIBOh3VKVQDAK4kgLOLsGtyBNKU+TCuFRcO9oObPfRppHR
	ll1Tc2fQ+V6wW5FuTCz2GiFkItK9NlObRmMO
X-Google-Smtp-Source: ABdhPJx0MsbvWo+WlT8m10ORRJG98PjqOUjp/ZGZs8KM2wsZLe938+fAJIm0tfwtYl1vxoIQ7Rnn6w==
X-Received: by 2002:aa7:9501:0:b029:155:3b11:d5c4 with SMTP id b1-20020aa795010000b02901553b11d5c4mr12293935pfp.76.1604890632139;
        Sun, 08 Nov 2020 18:57:12 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s4sm9107037pjp.17.2020.11.08.18.57.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:57:11 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/12] netbase: update SRC_URI to reflect new file name
Date: Sun,  8 Nov 2020 16:56:15 -1000
Message-Id: <ba9a77477a3f278afd8ac8615fb19d187a799dd0.1604890441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604890441.git.steve@sakoman.com>
References: <cover.1604890441.git.steve@sakoman.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8a09c2fcf2f8c91b7e3fea16f5c484e56187bbf)
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

