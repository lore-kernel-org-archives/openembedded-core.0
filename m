Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.9702.1613056150625880095
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 07:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CYktdk5m;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id fa16so3555471pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 07:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kqxFCoWmpeXn9omySp93Me8MgPBrig+1fv62ks9Sqgk=;
        b=CYktdk5mrw1BBUCMJANhjgSRAMpays0ER1er0v2uPuyEPhrdlHJrnSqL48FCT9QEw6
         mAGutN8YR5cNHQoKJfcA+yMkmVcMEHjpAi3BA/gDoBU0UzTpxrM5nXYyEk5AJsy1gSL6
         dS5Wc1Bw97cB6/ElHNYipylkf7hTb4kgG0Fr3inO61QwnPuMP/wRkrrtLpk+r56HejG0
         5wAppyNOUKNBBtCbMJ89ftQWMb2j9BLZrfVhGstxLwNtqo0VQdUn6xKRG5iMvIInJXTH
         4D4kFid4Cuj9bRUux9kq60gaicuDVYfT+etDPUjBpoBLq15euFpIv3w0sKifqx6YXuF0
         P0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kqxFCoWmpeXn9omySp93Me8MgPBrig+1fv62ks9Sqgk=;
        b=KZzZExJvfGmO1gGNfZ0cyvW/lpu7bmYUDhroJNYjJ3Btnu6n/G4tDZHIuEA8MBriQc
         6++26cWkxZq7UGmAJq/4bHgkUMNp7q3ClazXy1KgRsEJhojPU+/o+8H61QxJLp/ehOjU
         j/10Zmlgr1oB531nV8sMSG1d9he0NO1Kd0sfT7bl2lrFDnuKDq9zmqLNR1LZzkDwFIfG
         zb1rKlL84yjWEeUjtZJyxLfKtWQ9RZWTzYsPIP6sp7A61DJrVIRB5IvBjtoMJY00bWPN
         npkl041UhLYfVJUx1EoJwElZkGHRewRnmL/PwzO8OxxNXxsYUdyMYO0XIv1SVZ+xncxh
         zdOg==
X-Gm-Message-State: AOAM531hqY8tRVLLMJPBx+xnvduXbl7+Bs5zxjOboKbZAgowilpqQpDw
	g1OoG3tbGRVJI8XWW7XeGbutrzukqps=
X-Google-Smtp-Source: ABdhPJxEtk06z3+XXXiqfizSOSM9klEXLbfagZE+epVEFz9HD6r/6Tmc1ie//2V2+664ZXB4H/vlVQ==
X-Received: by 2002:a17:90a:a781:: with SMTP id f1mr4313187pjq.111.1613056149397;
        Thu, 11 Feb 2021 07:09:09 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id r15sm6530082pgh.39.2021.02.11.07.09.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 07:09:07 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [v2][PATCH] connman: update to 1.39
Date: Thu, 11 Feb 2021 15:09:05 +0000
Message-Id: <20210211150905.3146985-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[Yocto #14231]

Bug fix only and includes two security fixes:

CVE-2021-26675
CVE-2021-26676

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../connman/{connman_1.38.bb => connman_1.39.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.38.bb => connman_1.39.bb} (78%)

diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/recipes-connectivity/connman/connman_1.39.bb
similarity index 78%
rename from meta/recipes-connectivity/connman/connman_1.38.bb
rename to meta/recipes-connectivity/connman/connman_1.39.bb
index 027c41e9afa..df42e9ffb8a 100644
--- a/meta/recipes-connectivity/connman/connman_1.38.bb
+++ b/meta/recipes-connectivity/connman/connman_1.39.bb
@@ -9,8 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
-SRC_URI[md5sum] = "1ed8745354c7254bdfd4def54833ee94"
-SRC_URI[sha256sum] = "cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b"
+SRC_URI[sha256sum] = "9f62a7169b7491c670a1ff2e335b0d966308fb2f62e285c781105eb90f181af3"
 
 RRECOMMENDS_${PN} = "connman-conf"
 RCONFLICTS_${PN} = "networkmanager"
-- 
2.25.1

