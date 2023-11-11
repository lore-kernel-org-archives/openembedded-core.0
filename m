Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85350C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 18:44:36 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.1497.1699728276017050605
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 10:44:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TbJvBPHs;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3580b94ac2eso12737145ab.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 10:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699728275; x=1700333075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HOBaj2IsaOnYWe9sKlgcdd/rI26LSO8lyOwGz23IHDU=;
        b=TbJvBPHsE7EJD7LSR4aA4DDylZZT6pXBanPVomv2SuF5XFXGDKKjBkqJ3mqilngDNT
         IHEbqvZr3V+BGQQlvKRK6dvEe+2AvSZXMGbeVI+7V9r+Gf4UyCDTsZ1m1Gy4Hwlv72EG
         abNrs2GL4ZabFHea2azyYS1FZIHINUX6TI0RibPFPQRkDXz5HTBN3wv+kgPbnAERSw7c
         9nHZaKFLjObUlmtvU9bKSXKOdFyMR2o8Ug7y2rz/+kEAwqn8QF2L7FkMPQbS5BQJOLuy
         tZJmlrL8uwei+nKyDKa68TB/EEgVhLRV+x4zDIs+zKN8Qx/TcA7JW+TSxWcoYJ0cE/p7
         313g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699728275; x=1700333075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOBaj2IsaOnYWe9sKlgcdd/rI26LSO8lyOwGz23IHDU=;
        b=UXJpPpQ1or3M0p7ZaCHN8F4+SOqb7p4F3+fiqg2gVclYHFrtWuasbIHDJoxM/ZrEWy
         mTV5ti/xZXJI0ofU75JEQSAf4kakMHdC/x3ITeKhfclTXIIdaJAKFnH+kiY9YIx5SDG2
         QKqaZkLek4jxldWExgjCSkXisGJuu1HTrsk3ogxsyTtPTCY1KYXXCMoCaemOmfS4cPkz
         fCwchlNgcZlnpt0JncdJ7ZipbH8BLK22ZKUPRZkZJo42m2VCSaweV5Aun3nyeHOye3+F
         BBfUl1EV6hZZCvchFz96k0Zkcfmx81BO1ZOYUc5i62ypZxhoS4SzKdZEtAHjaoQ1xwUD
         qrYA==
X-Gm-Message-State: AOJu0YzbXgg6i6oOggzjf+81BADKg0wUvTdDn0q8izDdUcG5HZl0YzHD
	qcr8PnopC+kmmCaqdzo3wTzKG/UrIsiV5g==
X-Google-Smtp-Source: AGHT+IGukv8Y4gTuinUgtlGLDHHFWkMBdqYZYpHfIaZQ0JxtwLw54xw12Q5CpQnnzLAGHmFokzpBQA==
X-Received: by 2002:a05:6e02:1749:b0:34f:c7f7:18b with SMTP id y9-20020a056e02174900b0034fc7f7018bmr4739913ill.2.1699728274466;
        Sat, 11 Nov 2023 10:44:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id e7-20020a17090301c700b001c727d3ea6bsm1581122plh.74.2023.11.11.10.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 10:44:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libsoup: Upgrade to 3.4.2 -> 3.4.4
Date: Sat, 11 Nov 2023 10:44:32 -0800
Message-ID: <20231111184432.752939-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 18:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190437

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libsoup/{libsoup_3.4.2.bb => libsoup_3.4.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.4.2.bb => libsoup_3.4.4.bb} (96%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.4.2.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
similarity index 96%
rename from meta/recipes-support/libsoup/libsoup_3.4.2.bb
rename to meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 3996ae68369..6d382a7852c 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.2.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "78c8fa37cb152d40ec8c4a148d6155e2f6947f3f1602a7cda3a31ad40f5ee2f3"
+SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.42.1


