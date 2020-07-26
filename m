Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.29066.1595770885446257162
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 06:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=w56ZW0GK;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id g6so1807809ljn.11
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2tE+xhCE3yth5joFY1OLmVuxMPrMCEgcgTRoQY9R9gg=;
        b=w56ZW0GKfkTgfoG1qNcdjBxx1Mxts3fWTpMhuFAc9VIBqo52Z6d1TNUOVAtmEHUxHh
         Q5SVOI8bOh/o+9x6+gC3PnLZag7S8reBicAoXFN645Qn4/az3Q63x0G4wPLh8y1Ll1RK
         tVexNkANIholsAtmB3T7TuePZ6ioKTxALIF4m8qcP+Cbjx+VbBvwEwqpCTYIyM699bWI
         h8qkVygFVLkY9k+GLAiOVuELzFvw2HUyBzyH5Pxbtgy2DzqHu1WZZO1Hb/vDjsjO3+2X
         zqX0BkJ0Yg1xFoesEkuEhjl+YAT2Xk3wer9U6wEAYXtLIediB155QuiwDSH1HmZriElZ
         D3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2tE+xhCE3yth5joFY1OLmVuxMPrMCEgcgTRoQY9R9gg=;
        b=uAXxRC9gcmstpVNtXu+S/m/HldIDUMgp6dOO28AftCj8sn0cIxuHkd23tfglRQTaGj
         FNRTNG/MBwlRqczvhCdZtxZoQQ2H1LDDozY1qUhVEHyD3/qfm2EbA4k3Ao38pOM73s+c
         PofxSTL0U2RMLaN/VKz4lfCxey1L8xwav9DE/ZRMqj2l3Ql9LwSezf6vzdgoa+6/wdTp
         YPN90Ify5/VqvARwVUTlMC3wyM4XJDeVeqF/g5E4M8DNM3uwfR3/sn+qTFuJIrzkO7yb
         4yo85PHC/ycJc2CrYAXcM9BgD6m5aJPsqXWUJKFO7bfdIMbZzNxmYS+OwtvhixPP8BKA
         rg0w==
X-Gm-Message-State: AOAM530E5m4JdB84yug+kAbTFDw17yR6YTB6X2Mi5KtxNyjYjLRaYsBi
	lBC50BIdKV63Km1+7+4kOhtn/RaGrGs=
X-Google-Smtp-Source: ABdhPJwwhSST3iFivXN2gKNjyCAfKt9aFQpksquJy0g3i7tChCZEwhw9Jb2hiho4EmQfIdMK8ZcORA==
X-Received: by 2002:a2e:8046:: with SMTP id p6mr8527713ljg.100.1595770883184;
        Sun, 26 Jul 2020 06:41:23 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id k23sm1795758ljh.55.2020.07.26.06.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 06:41:22 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] bash-completion: update to 2.11
Date: Sun, 26 Jul 2020 15:39:01 +0200
Message-Id: <20200726133901.205884-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{bash-completion_2.10.bb => bash-completion_2.11.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.10.bb => bash-completion_2.11.bb} (87%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.10.bb b/meta/recipes-support/bash-completion/bash-completion_2.11.bb
similarity index 87%
rename from meta/recipes-support/bash-completion/bash-completion_2.10.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.11.bb
index 041af7490e..da0baa7afc 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.10.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.11.bb
@@ -9,8 +9,8 @@ SECTION = "console/utils"
 
 SRC_URI = "https://github.com/scop/bash-completion/releases/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "f376ae3266cc70017aa833c39b76f984"
-SRC_URI[sha256sum] = "123c17998e34b937ce57bb1b111cd817bc369309e9a8047c0bcf06ead4a3ec92"
+SRC_URI[md5sum] = "2514c6772d0de6254758b98c53f91861"
+SRC_URI[sha256sum] = "73a8894bad94dee83ab468fa09f628daffd567e8bef1a24277f1e9a0daf911ac"
 UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
 UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
 
-- 
2.25.1

