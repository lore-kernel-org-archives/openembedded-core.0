Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7F7C4167B
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 14:16:54 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.25544.1700921805381508786
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Nov 2023 06:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LfwxGlN8;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: jan.vermaete@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50baa2a278bso544668e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 06:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700921803; x=1701526603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a22HjQHKaOuWoQFUiSWnX2YLpLF4xNMv52lYrA3YQAY=;
        b=LfwxGlN8Yj9gWVWfkbqZ0TWVOr9y3D/UiScx0Y/AK8AVFDZLEp7dv1cJlp1eGGJ5vi
         +HzvJO26TBodmuW7j7SEzrbU9YuI2ZFce6uM7AFqLHsSDROaVxctbGiflTjusc+fJbx/
         TtcH26WcKY+EMfSfoMNWCQ8UgJer9EqSsHUYo03KbNrZ9YwMzRQb8SlbofbwmItJkxhS
         QhbToCkf9oWMTKpFQ4RaHF7/WGOblkhe1eXAwJAsEkKl+F3LqTfReEzc6jB0Uac8IRb2
         Txr9niBrKbCTgHgycK/95xBLkc21e8YLjPqqRHfGNlcEOhO1CKSqBtaIaRWCKnG7aAHS
         mWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700921803; x=1701526603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a22HjQHKaOuWoQFUiSWnX2YLpLF4xNMv52lYrA3YQAY=;
        b=c3fPDPeSg2TxE4l/QEcQgeJn6D2PlHgHkp12aKzoR1DK3dhI+dc0ETnufogn7n3L3R
         LGaO1jC79Gk1+RAbFi2ycwvJ3/QLNqrEpdhkhSoOC0OJlrx0sVUQy0QP4Ss66x2DGyMo
         vO/2Eczn9RP4D5nra+ny7rMvbdZYcyzM9zE3CGaZYtaUk/JipeCXra96XdwWItOQVYo9
         t1z1YNRf5axcdfYIw2mVFLnpioU7wv7bQt4YpYYjS/NcYV63mSH6Z66Jss2ytop0kE4D
         h5fLkM/MtgDWB+otLnzEvB5Dj+cLq2cWchVi3oNFPCe69GhgCTwO/X/W0CCipxAP3SFB
         oKZA==
X-Gm-Message-State: AOJu0YzMIXypvzkWmDlz13BkPHqjTb4TPTRRXax8m0TcfbQS/aRsX7mQ
	ULHoxV/dVoyOuMmxva4GMvh8k8pIQXA=
X-Google-Smtp-Source: AGHT+IETQdniVpgo//1U3PvA6K8MfRDqxpWSi2oFTzaaXdEsDemkmelTqRJhryeEitGU4tb5zzH9NQ==
X-Received: by 2002:ac2:4904:0:b0:50b:a33f:548d with SMTP id n4-20020ac24904000000b0050ba33f548dmr1079045lfi.22.1700921802897;
        Sat, 25 Nov 2023 06:16:42 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qzyv84958jjcio.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:edac:2acf:5be9:6920])
        by smtp.gmail.com with ESMTPSA id c21-20020a056402101500b0053e5f67d637sm3064274edu.9.2023.11.25.06.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 06:16:42 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH 1/1] systemd: fixed typo
Date: Sat, 25 Nov 2023 15:16:38 +0100
Message-Id: <20231125141638.6254-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 14:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191232

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index ecf693ef92..4d68a3266a 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -206,7 +206,7 @@ PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysext] = "-Dsysext=true, -Dsysext=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
 PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= -Dsysvrcnd-path=,,systemd-compat-units update-rc.d"
-# When enabled use reproducble build timestamp if set as time epoch,
+# When enabled use reproducible build timestamp if set as time epoch,
 # or build time if not. When disabled, time epoch is unset.
 def build_epoch(d):
     epoch = d.getVar('SOURCE_DATE_EPOCH') or "-1"
-- 
2.34.1


