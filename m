Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.7338.1612972465053229547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 07:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=STQfdQX2;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id r23so3522859ljh.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 07:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Xs1ujw72KPwPmypTevAQ4Xk9Ya4+Y/gNohB5H2zuq8=;
        b=STQfdQX2vyveWSUSeWpo0U5Wz67Bo5Ovv9QVWVNVix1rRbFOkUeHHmxGRJLlqKZbej
         dJy1OqFyTGwMpahINwjveRahd3xe/+nuLazNyHSs3DRPqmlEJc0JBJJ4jdVjB/Y6ucVO
         EsuEVwUET/3XCb+50Gnst/rSEFzZfDvr1WzAz64fL9U2jl7U2mDTkXHLgFLcsdnZTpIL
         bqZPbY+UHKHU0uT7bHGAS6pKgcufzhoKdeKEiG2Ru+ZOCn6PaomlURyLgxvhoZsXTYhQ
         VqWaN7e4+VU0mXRaXjl1b4B8FKJSoYTY8wV08yx1l/kRCh/zypVRTHI3WownG2Ht3ooo
         wqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Xs1ujw72KPwPmypTevAQ4Xk9Ya4+Y/gNohB5H2zuq8=;
        b=JeteAorHO8ZNDke7Wg/nfLn/YRQ8CsGnIYbrUAIyU+hZWuUZ7bSXpimrY1TuVILn64
         yHugdmOs6I8+qy4TKhMZKP2AvtbgYiBzTm2jl2OZP1iWDHujkGODtN62N0z/zGi+Bgi0
         SlLlsK5kcWROCZrnHcZp0eb3hQiL4Axp/cuvjpKJzn8BXFC31/Mgs2EMdAuTEylTdX1R
         7sa8raF3BBTzY3FtvjhsQbZYuKoCzhMiZdIToT0pAY0G5su8bDOKWysyFas5rzZq/k8K
         YPDEGMg2cgLhW4BPbiNnNzBxW+IkJMGoZRSx8YIrymjqA5o2YKCjpt2ptxOP2LWuX0Md
         g11Q==
X-Gm-Message-State: AOAM532Brzjm4nPvz7lnH03IR41mC+6Bun2CFTMYg1q8WhyljslS2Bx0
	BXQ11V73lfrCT3BRr2xttkzfaHeugrrdqFZY
X-Google-Smtp-Source: ABdhPJxE3i/MTZBJ6ogBPaMMbit1UtFmj98ALuN92xAa5Nh0lIt3Sva13xekZzrNZgi7XPqMg1voDg==
X-Received: by 2002:a2e:8945:: with SMTP id b5mr2362450ljk.508.1612972462824;
        Wed, 10 Feb 2021 07:54:22 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id p19sm575536ljn.75.2021.02.10.07.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 07:54:21 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] connman: update to 1.39
Date: Wed, 10 Feb 2021 16:54:19 +0100
Message-Id: <20210210155419.1444596-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- Fix issue with scanning state synchronization and iwd.
- Fix issue with invalid key with 4-way handshake offloading.
- Fix issue with DNS proxy length checks to prevent buffer overflow.
- Fix issue with DHCP leaking stack data via uninitialized variable.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../connman/{connman_1.38.bb => connman_1.39.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.38.bb => connman_1.39.bb} (78%)

diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/recipes-connectivity/connman/connman_1.39.bb
similarity index 78%
rename from meta/recipes-connectivity/connman/connman_1.38.bb
rename to meta/recipes-connectivity/connman/connman_1.39.bb
index 027c41e9af..df42e9ffb8 100644
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

