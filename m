Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com [209.85.161.68])
 by mx.groups.io with SMTP id smtpd.web11.3683.1587521885383862141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 19:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gShs2HQl;
 spf=pass (domain: gmail.com, ip: 209.85.161.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f68.google.com with SMTP id t3so205778oou.8
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 19:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=DPwDs6uvBf6NRrcwq5wZwNq3DwkupaezuLVv3KeXqjY=;
        b=gShs2HQlaMcRiP8ORXC61pFfa2qit3nsut9QlR/FajKnQQVkLeEwXsQw1uc2QJntJB
         alWWP4lp39HyvmORXxty1Dy8yQ4HZejyvsxx07EcaALRU/S+Ie0sila/iCrB4r1z1ZDa
         YUjgn3rNm+UYjBuPsF/860hk+jWQHGWUYYYHV8dTXKx6So22Zl+Xane8tKqB3mmLk118
         ErJewnCnOrEOvffNVBdQrm4N2ZR4KuloPC+piPnhg/VFmJMsEU/mKowXcBZsnjI1WO22
         mjv3a2/AiL78moJyMFUGhyeAFzdPH3la+9ixj5l3bEozF/Wfw8vhO9OLjK2Jm8hE1AAm
         p3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DPwDs6uvBf6NRrcwq5wZwNq3DwkupaezuLVv3KeXqjY=;
        b=goZF0IRsVSVRoD7LDwRxiqN7KsWppokaWeIXYBGzyAJjnKF9FFggNTRwlhiJAf/88J
         U40aTh+tgTe0NIOSCkmdKoZ1u+01oA2oZmcaQrNCv+Lo8dtA74T+dwNbb+ATmVInyv/K
         Alat6TDsRDXxMvrweZ+sQuwNKUUUzP9mAr0CzXlq04lNgOIoBMKCcwow6vpaXN6/7R2Q
         C2LWTtSqfepph4Xs6CsohfO8LCZ2DXCa7wPTAr1GRktUf9iI0Mj6l9fXU53DXGJcznGv
         pzSvvOltoXmSsW9o4rRO+CBbY3aLmhqyWKt/BieyJzBB5LVVdgDnbeHKwhyJY+5MSVNj
         wZ3Q==
X-Gm-Message-State: AGi0PuZcdIyFFVh7viwNdvESYqq8bHFFh/z3mbUoRFVYSdNjk+G1ifnW
	xIReTloQo37WJGC50K2SGzfgmAUU2aE=
X-Google-Smtp-Source: APiQypLo8BmT2EuqPJzdLmbgiZCKs/5JmmXPkIYK6mpLftE0oC021n4yjEHSNQdYc10l+/g9bnU5Ww==
X-Received: by 2002:a4a:be13:: with SMTP id l19mr10658208oop.78.1587521884450;
        Tue, 21 Apr 2020 19:18:04 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:3071:1f06:4ad8:19ff])
        by smtp.gmail.com with ESMTPSA id g30sm1112417oof.39.2020.04.21.19.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 19:18:03 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Upgrade Helper <auh@auh.yoctoproject.org>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] diffoscope: upgrade 136 -> 141
Date: Tue, 21 Apr 2020 21:18:02 -0500
Message-Id: <20200422021802.20564-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Upgrade Helper <auh@auh.yoctoproject.org>

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../diffoscope/{diffoscope_136.bb => diffoscope_141.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/diffoscope/{diffoscope_136.bb => diffoscope_141.bb} (75%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_136.bb b/meta/recipes-support/diffoscope/diffoscope_141.bb
similarity index 75%
rename from meta/recipes-support/diffoscope/diffoscope_136.bb
rename to meta/recipes-support/diffoscope/diffoscope_141.bb
index 3e3e1dfc00..d80e2982a8 100644
--- a/meta/recipes-support/diffoscope/diffoscope_136.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_141.bb
@@ -7,8 +7,8 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "c84d8d308a40176ba2f5dc4abdbf6f73"
-SRC_URI[sha256sum] = "0d6486d6eb6e0445ba21fee2e8bdd3a366ce786bfac98e00e5a95038b7815f15"
+SRC_URI[md5sum] = "35329bb68861ff0d8245584b7ad408d7"
+SRC_URI[sha256sum] = "66a8d066f8f5ac18d02aa5148ada7c6f4ab094cd64d29e72b319c5e7df151fc0"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.17.1

