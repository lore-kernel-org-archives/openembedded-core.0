Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.1780.1599498171937844034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PRjm2g/w;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id q3so2834262plr.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Yd1M69IOjF6xP4TvYUUdKEVMr6yyllE0neD+6lMP9yg=;
        b=PRjm2g/w5nm9YZ73yWiD6npz/sN1G5zf//g38DWSkkWEU0dMoRjveaIsEsSKOWf2H2
         n/qDsVMq7SyDI5769x4gjVLroWs5YSdo1y0ORZiugUKFWFfnefe7HUV7kmzHJlfVMw9G
         k/Sf0b97XZSSte0OntQ8YWHcuIBiIEHhru+FyWWw+9+8KYp5cp4mFCRDxePi1DHCaQ3l
         w7IDZ0SPMKYDimjwzcjl2hwz6hsLlrGeQx188l/n/dlpjz8UVkWOGTQ5ViNSu+RZy1vg
         LT6e7EM8VnsN7CpTx3Mg0i700yP47mD1VhkcPjSr2xjVcNg2EdhbY+RlS7cAi2OBrRFH
         vKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Yd1M69IOjF6xP4TvYUUdKEVMr6yyllE0neD+6lMP9yg=;
        b=ebbP50ulaVN3xpC3CpPKFR1XumgEKF+5P7GXirgAsQqVDGw+Ko8lO8r9E2xdfedjjy
         /6aNX465xhd+UPPm+ApRVkJMROgZLjxIxH3VHZc8v2DzH7/FDTmQCxOmONAGSjAzMX4x
         CH2Amp6COPiioDimT67q+orahJfZPrlmOTsTP/iUCRO3u8mH+egNpo+icNZ3pcuOFqCF
         7GR2eISYPV/WE9WoRa5b/Xb1T4A3ltLjaiVvVE/xSSph6MR++9vbP96H09fDslw4z0to
         g0Fyk+lZo+31UYgNHhpHVLYKoiZbwP3SLO1VGgXcBxUOXE2YEvsnymkFRlyZS6uf8FFn
         Cr2g==
X-Gm-Message-State: AOAM533KFNh31lxtWsutbtvV874QPBYrIWrr8tKnEKDWwsgj5/S3gALO
	A2i42yOc68bACBijjI19X+0gF1u/oV26JcXD
X-Google-Smtp-Source: ABdhPJx8H/JwAPhaRQT4yvQG9S/ZjGaG0vLAhFdy4r8Ju2L/0BxiuVl4zXoPmvMC5t5obsS8Fqwlhw==
X-Received: by 2002:a17:90a:e291:: with SMTP id d17mr218280pjz.156.1599498171034;
        Mon, 07 Sep 2020 10:02:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/18] util-linux: Allow update alternatives for additional apps
Date: Mon,  7 Sep 2020 07:02:09 -1000
Message-Id: <497d883c0f4b31790152bdc7f4f212b2fa1d8424.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

mcookie/prlimit/uuidgen are also provided by toybox

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b6135777799de531e2cb4017e91a8c41749d1fd5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 532cceb935..248dfc1b6e 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -247,12 +247,14 @@ ALTERNATIVE_LINK_NAME[logger] = "${bindir}/logger"
 ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
 ALTERNATIVE_LINK_NAME[mesg] = "${bindir}/mesg"
 ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
+ALTERNATIVE_LINK_NAME[mcookie] = "${bindir}/mcookie"
 ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
 ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
 ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 ALTERNATIVE_LINK_NAME[nsenter] = "${bindir}/nsenter"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
+ALTERNATIVE_LINK_NAME[prlimit] = "${bindir}/prlimit"
 ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 ALTERNATIVE_LINK_NAME[renice] = "${bindir}/renice"
 ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
@@ -269,6 +271,7 @@ ALTERNATIVE_LINK_NAME[taskset] = "${bindir}/taskset"
 ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
+ALTERNATIVE_LINK_NAME[uuidgen] = "${bindir}/uuidgen"
 ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
 
 ALTERNATIVE_${PN}-doc = "\
-- 
2.17.1

