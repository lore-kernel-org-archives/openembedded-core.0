Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.8486.1608383059317007263
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 05:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eqZilvr6;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id h22so3051580lfu.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 05:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cWD8krhP+2ERISbVbHZzIHPuVtOYKmcVJYvo6zAnppA=;
        b=eqZilvr6Va68ttCRaHg487EJdoQatA7JaP7L4vvmkGUrA8D9JAJ5V3wwoflTeIW8/R
         ELrqL+IYhVVA+z8+dZx5GMEzjdWVp+74kkI98x7sODQW5Jzpa3Ne/TwXn7LZ8mOC2vlN
         Md76tGlb6cY/kVa9ne2XM+rw3HQ+ofNxRNEWTqTjC8DVP1PD5kS8Nr3Al183vzJQuAUT
         WXEAz7Sq44O0QaOTpgSdmvaYvNDAQW3rBSKYmbDhrLJ2YcNmnQO5tHqMvwfuW24bVIKH
         eg7zlRAM3SrsAr0Mqy7Y/ZRmozUJRpbKuzR2dLSMvfeglFhTKmPxIRVfqJaxADeNW+3q
         ghqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cWD8krhP+2ERISbVbHZzIHPuVtOYKmcVJYvo6zAnppA=;
        b=pggVGWR+I7YWFmHWLlsGT8KT0ugnJppQ0rhFMiHMeQgUuquPgAjigiLwp5GprfF3TF
         Jt/QjeCwnUwu+0QkQbiR4unPwsgR0KQfAy5HiGX0K4HdQPqe2eMGwqebwmgwV8ZiryZs
         xKaHR/iP33YuF4KtdaQhmiDoaYjUWCkFdPcqXITlsZVK7GPN3BEQM9v1LTq7pnL0FlCD
         JrDa+2oUBAyurT+roYr3djPsK5b1D18Of/tF7Q2c5VPZTIr6ALDJQ0IXqNM1maRMG0gZ
         DlcURWg+g4Tg3m+FovA+tbh5me9JEiharBz/yJMshvpMLYuR/dSqQDEYlL2HtUpspxm3
         w8ow==
X-Gm-Message-State: AOAM533Oglj+gDQqn2g0fqZkHs69zL4FKO2K0kt7b6cwLG4ILtKlBBKF
	1d2iz/Ze+o5wUw3gcML/Xlbdl9mE7s+uJw==
X-Google-Smtp-Source: ABdhPJwObl2VUj5I8c0dXqfp5gtoJQpvdNEhs/gXL+R2doidmxfyqCwjS5i+el+5C6OEtzGn2GuW/Q==
X-Received: by 2002:ac2:5486:: with SMTP id t6mr3466332lfk.265.1608383056966;
        Sat, 19 Dec 2020 05:04:16 -0800 (PST)
Return-Path: <dbaryshkov@gmail.com>
Received: from umbar.lan ([94.25.228.250])
        by smtp.gmail.com with ESMTPSA id u30sm1284646lfc.238.2020.12.19.05.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 05:04:16 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 1/2] linux-firmware: upgrade 20201118 -> 20201218
Date: Sat, 19 Dec 2020 16:04:14 +0300
Message-Id: <20201219130415.99713-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

License-Update: firmware versions/filenames
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...{linux-firmware_20201118.bb => linux-firmware_20201218.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201118.bb => linux-firmware_20201218.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
index baac26c51053..bc9daa2d4e7e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
@@ -126,7 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=ef221e03fc58f4d34a132b801dfa1d68 \
+                    file://WHENCE;md5=03f0fad70b8b557b56084e3090198021 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -198,7 +198,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "863d5a31da725b856a917280d1e3014929b3bc3d4e6e5faecf530c13afb7e2b9"
+SRC_URI[sha256sum] = "a1cc1ff72c739f312b095df589e9fd639fc81c3f8f7966377ea35222dc94c04b"
 
 inherit allarch
 
-- 
2.29.2

