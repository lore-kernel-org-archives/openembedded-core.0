Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web10.14780.1599548249561105121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 23:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=c0xckROt;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.65, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f65.google.com with SMTP id y2so8558062lfy.10
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 23:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qDaghKP4CzLy8Gy4a36Zcxbm1+vjQ/1io2b3+MPM0mE=;
        b=c0xckROt1WQA8lvJ8T1fmv6aug+MVFlOSPTKi3MuXsTvLxNvTXVCCQWPc6v+S7wb1i
         U6iSTxrADsU0zV+XjX6cw4mU/s7hHGT9Vg0wsxz5sVr0xhyJqfi2/3glh9DNYiDMSloX
         wFpWqEA9oSgmnXeE65OJYXGH1VTY+rWhUEafwP/ZWA9KRXN5E7vBcnlbF9x0PU4/lMwl
         B7OI3n4qyoMhTitf5Z4VZovx7eozg5d+OWwN68AqtTLHLuBLkkZRMdGNgfOT2lMqoSU/
         GKkN9exl3dXNbWGlO2tcxfmJEQWo6AdVvA00nrMBTMvX6hMdXoMQp+rmyE8r0lt3415x
         62NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qDaghKP4CzLy8Gy4a36Zcxbm1+vjQ/1io2b3+MPM0mE=;
        b=Wcs39ssKSdo1rDwkNeQ1qmxXCEGfFP5QgLC9KU7lyRDD6uB4a9AjTi4w+3MmooCbTR
         9kyN/jzoQNpkC6l+pV5pVyk03PDH4FfMEYTHiIeQRLntAFXWvDH8UpUkOWvF+HzQ6zPi
         JAwvuVfBsLcWTjeXV9YXf40MMFjEwC3axDraucG0icITW+MMB+BEj47O+Br9AdV98EYH
         OYO8IgT++mP9wQuyTBcSVAaTpdD8Bz0LMuvuNr+NmtMRoxqgRvzqs1o+01xZRbE/Nra7
         I9QRuhcXS8wEukej9fvdxXZBqtuD9acB26jymYSK02AMM5JJTA1es/aL8BsozHW0yIL+
         kFUg==
X-Gm-Message-State: AOAM5329wcropsbe+V5AJ8ex31ENmZma+1rNzmcCYfpF+h9e4tidRFaL
	zFEyNmw4i3GBBlf4MhjuEzH3h0saKD2/DSUt
X-Google-Smtp-Source: ABdhPJx7U6sxsPF8BuOh5qJ96nzeVTMu7/YzN9oJSMfxvNOwV8driRlVsLLGluiPrpp1kox2lNTATQ==
X-Received: by 2002:a19:f245:: with SMTP id d5mr11520057lfk.97.1599548246783;
        Mon, 07 Sep 2020 23:57:26 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id g19sm9351828ljk.125.2020.09.07.23.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 23:57:26 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: updte to 0.33
Date: Tue,  8 Sep 2020 08:57:23 +0200
Message-Id: <20200908065723.39858-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog
- Fix issue with uintset and number of bytes copied.
- Fix issue with overflow in DHCP lease T2 computation.
- Fix issue with side channel leak in l_ecc_scalar_new.
- Fix issue with missing MSG_MORE in l_cipher_set_iv.
- Add support for DHCP v6 client implementation.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/{ell_0.32.bb => ell_0.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.32.bb => ell_0.33.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.32.bb b/meta/recipes-core/ell/ell_0.33.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.32.bb
rename to meta/recipes-core/ell/ell_0.33.bb
index 07dc4d4cbb..2fa05104fb 100644
--- a/meta/recipes-core/ell/ell_0.32.bb
+++ b/meta/recipes-core/ell/ell_0.33.bb
@@ -14,7 +14,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "42fdb9e24ff561a101389d51445cab1ff7d55f5385dc22a05b0493088cf99e30"
+SRC_URI[sha256sum] = "d9e40e641164150394b74b719b9726fc734f24b2cde679cf5f3be6915c34eded"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1

