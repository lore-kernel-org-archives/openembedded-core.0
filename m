Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.9609.1629636682957724139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u8BzqtDE;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id n5so9434842wro.12
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BciYz4aLLxYHmLl6hkAQdvaYwh+iixqzHSx/bv3LkPU=;
        b=u8BzqtDEhB39GdnjyNRo/Ua5V4ZhZ0jhvRLtfkiNEkUd5otCNoo3rvHLezmtxUYBQs
         ldDB+syYB5zg+oKIzT5F8tjFjq5SXjwP+ZUtsfNAwXmr2qKP116U3WHq0SRP2MckTokv
         9NwlTSWm/hB5PhmCUBLdc2lsPpUK7ngR9722xhXz+AjeAHH2hv8J0LpjKMaEQ/VcDVsi
         WGv831ZJtsV9izGjJH3hCny1iYaYJ9ruvVqr2ikBDbHj5pAf8YmRAkfr7tpPk4YBq9n/
         5hZo40WXuKzjc5pA8v3CLGoXQIMJcj2DaN7JlivNyxXoGEIDpYejdDppEzDJ0MLcqmfi
         UhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BciYz4aLLxYHmLl6hkAQdvaYwh+iixqzHSx/bv3LkPU=;
        b=fBKoPkRuA7GZSKE6QE3XeJ+DXzfbVSpBVf0NAv76Ag75x20IKyQwyl0e6O+1cRwY0m
         wT64PPQk8ZBNMeyJKtaQRNqdHepIjghMxl4sbqcWsPEaU7GQo1JlMfQ1sV2AcZVVr9/q
         hpYoLnXpQZPsw4mpJWwz+LtwyvQLNdjjZkWc/UoqOqIea5fb+WfgcVyn/wGmdLQMW6zi
         Ev5PN6sa6DTTLj2RFKQARY9mJsSbt3MP9vYK8HpgF7gF+4K1kzbQOZnTRcZapJ04ocfS
         B6s7Zx0yIOc620jhnVF/bN3rAnXF1ra1/Sqvahw/te929IHwcRsLGP9rd2Xl0NNJeDuB
         G0Jg==
X-Gm-Message-State: AOAM533EzOnJQAg4mSljbWZ1F8y3geJitwgRolCmOBJ+sZvMW6jLroPY
	oVFXoT53wua4hhMiE/DAiY070N2ecybg/A==
X-Google-Smtp-Source: ABdhPJyKKLV6NHNrxZEr8uGUCvgFZPFNH1kkhZWF6UxzchyYtcVS8E1djXeJjV1358Qqbx7vC6Oa7Q==
X-Received: by 2002:adf:df08:: with SMTP id y8mr8716008wrl.124.1629636681644;
        Sun, 22 Aug 2021 05:51:21 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/55] usbutils: upgrade 013 -> 014
Date: Sun, 22 Aug 2021 14:50:24 +0200
Message-Id: <20210822125103.310416-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: SPDX ids corrected, license are same.
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../usbutils/{usbutils_013.bb => usbutils_014.bb}          | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/usbutils/{usbutils_013.bb => usbutils_014.bb} (79%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_013.bb b/meta/recipes-bsp/usbutils/usbutils_014.bb
similarity index 79%
rename from meta/recipes-bsp/usbutils/usbutils_013.bb
rename to meta/recipes-bsp/usbutils/usbutils_014.bb
index db64a48759..ef3fd749c0 100644
--- a/meta/recipes-bsp/usbutils/usbutils_013.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_014.bb
@@ -5,14 +5,15 @@ SECTION = "base"
 
 LICENSE = "GPLv2+ & (GPLv2 | GPLv3)"
 # License files went missing in 010, when 011 is released add LICENSES/* back
-LIC_FILES_CHKSUM = "file://lsusb.c;endline=1;md5=7d4861d978ff5ba7cb2b319ed1d4afe3 \
-                    file://lsusb.py.in;beginline=2;endline=2;md5=194d6a0226bf90f4f683e8968878b6cd"
+LIC_FILES_CHKSUM = "file://lsusb.c;endline=1;md5=7226e442a172bcf25807246d7ef1eba1 \
+                    file://lsusb.py.in;beginline=2;endline=2;md5=c443ada211d701156e42ea36d41625b3 \
+                    "
 
 DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "efdfd5403dbdd7412de6bb897d5fbaae65ef3eb4332032c0e1f216216618e9a9"
+SRC_URI[sha256sum] = "59398ab012888dfe0fd12e447b45f36801e9d7b71d9a865fc38e2f549afdb9d0"
 
 inherit autotools pkgconfig update-alternatives
 
-- 
2.31.1

