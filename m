Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.8237.1598999553216124054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lDJBfsWt;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id h12so1470755pgm.7
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 15:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4DpvhXs8gdHon7Buxo+P9c1eQrgSCJ4kCbe6njsrrzA=;
        b=lDJBfsWt32l4xcZhPh+GsGo5uzbQRzA2imFT87hx3J2Yu05Ui8YfAagx9ScJM5+gEp
         DGhNH+4euOfYhAObdRH+X/Pq3YvcgRYUO6mb4L3rXHrXBVZwlAJuxsiiWfPJQ5bye0lx
         V7HUo6vn+RPdLIKCzK/Lz730tXdI567qOUqtSLE/AOhD6ZdDjycf8E74mllJogMKxUmE
         1HPqyhFfxWeKoWbBNHgQeVIoVSrQxs3LHfjhp2pL/dkhJ7+XX294lnkU736iib0AP6Ct
         Hqyw9kzeRBEbQckRbYlH3yVtz8Yc8Mj8Cut/pxd2VDOrXvK7Jdphu7s3nUAplL+LvT/B
         iqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4DpvhXs8gdHon7Buxo+P9c1eQrgSCJ4kCbe6njsrrzA=;
        b=iwTWJRmKETPTbbwvr/XPttZebvmLtkVbyGO9T+Hk7Hr4Co9YwBHJbJs5umxBHPELIs
         k/j+xd/ExY4CGGrAvwVTAKKW7LHUw76KJT+FJUe1QQta3KZclXRHRspfJ0oPZGnDFpdE
         H/Mrn6m2x7U6y+5xPlloourdUBeJRT/vuSpCt8NokzIIcOTyvswD0QBgS2x1P/yyGWhL
         afm6a6uwiPq4fYHSkp7PxjTARXUre9sEsj70CRlEDLqU4MXxDhVcwQbabZqjjszEmL2Y
         pldgdcmLo96sRWqgVYiVEDIoGphaxG5a0GKmDtgiMtRgSx/WuuWAPwawZulq2Wkquiw8
         cuNw==
X-Gm-Message-State: AOAM531Zp3cv3EFjb/0ZTazT4u5sPY3BEBabGots9x2EI6mO+RtWKt6b
	cRuMeiTB/mRPBSDm5Im6Z+a7moKdft4ddA==
X-Google-Smtp-Source: ABdhPJw/PO+bHQUz2BIBUsSOpsoGg/0+5jPY5+9jdTqdDqP9b4Dcrw3xROng2Rq7G1BwNhc/1tqyoA==
X-Received: by 2002:a63:d34e:: with SMTP id u14mr3274213pgi.122.1598999552423;
        Tue, 01 Sep 2020 15:32:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id l1sm3236198pgo.11.2020.09.01.15.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:32:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rpcbind: Use update-alternatives for rpcinfo
Date: Tue,  1 Sep 2020 15:32:27 -0700
Message-Id: <20200901223227.1385036-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpcinfo is also provided vy netkit in meta-networking

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
index aff00e56e6..ec8f9e48b2 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "ed46f09b9c0fa2d49015f6431bc5ea7b"
 SRC_URI[sha256sum] = "2ce360683963b35c19c43f0ee2c7f18aa5b81ef41c3fdbd15ffcb00b8bffda7a"
 
-inherit autotools update-rc.d systemd pkgconfig
+inherit autotools update-rc.d systemd pkgconfig update-alternatives
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
@@ -50,3 +50,6 @@ do_install_append () {
 		${WORKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
 	chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
 }
+
+ALTERNATIVE_${PN} = "rpcinfo"
+ALTERNATIVE_LINK_NAME[rpcinfo] = "${bindir}/rpcinfo"
-- 
2.28.0

