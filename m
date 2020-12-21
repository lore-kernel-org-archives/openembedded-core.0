Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web08.37509.1608547526245783946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 02:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TYFlAt4S;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id s26so22484911lfc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 02:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVad/dMHKGz5Jby0Bv+O1/QuCA6CZzJU5kI6ua9Z430=;
        b=TYFlAt4SEDxnSgzwYes9k8ToHhXEILk+Fep7PhXWrot5F7p1Exl7b958FT0h9CKnLk
         wzYHMqSjOMhZbPkExzuW/YQ6xbNWd9r8ZkPPjaSorjDRfWJHxJqjJDJViXjOAPoWzcWM
         JAZYhR960HKd3eXNub74zV7zqsQJaIkOCKtxPft9gVcUauSRjz0nOpjSHOqtCmzHHaMa
         YAadpw2+blwJ6CVbleKn62ZS7GQyd8tM1CgS2jcS5AAcuRL7KJipvxMgeZ/mT8+Dwj4T
         Za/0IWsR6pVtk3Zqnv/lfCpAtSF3mJgKnNjOMGJ8u6pSrOR+3KchxzwxMyjc39+mS93D
         eacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVad/dMHKGz5Jby0Bv+O1/QuCA6CZzJU5kI6ua9Z430=;
        b=eo5dl8Mih/npn3g/f4yVflA3mzJ/oIJ3vx0QAi0SN/GNLsjPzTlYPSGSoxl9Tc2SwW
         HMrJzLSKip7g0uZCfwvjSP2EjAF53Cvya4fJoTIZ+di//yiDm8I++ZJUTjrB0orlJOI/
         y5ueNNGxqlWhzDlk0h+pncv9BpdOqE22rAH7yymMqCMlBKNkuw/akkGkGn4q5U7I8dUd
         wvEsp5/FAZrOaA84hVPaPZ0LquT3UcN7Mga7UajB3kH3tNUuBqOJ/HqqOYa+OOz4MUo9
         3Dlgn3QFQf3yoKh0vmdTpXXTOOEG+kP5nrE0cYSSmh5eX+Y30Bf9oPWeWohzMVEJcaDU
         r4+w==
X-Gm-Message-State: AOAM531ZTuP/jgUUoZzYr4/V7yz4Aa0pZzUj0I1Rtyt/004Pna7WQ2G7
	YCAgqUW1aoj1MaM9A7hFzARvZqgdJFE/SA==
X-Google-Smtp-Source: ABdhPJzRuhyAFVL3VWMiEvOUDsSIiut4iUpislHLMNlIYuC+hFsHgXb7xxiGnzhipuXDZAf7skAxEw==
X-Received: by 2002:ac2:43d6:: with SMTP id u22mr5997727lfl.596.1608547523566;
        Mon, 21 Dec 2020 02:45:23 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([188.162.64.15])
        by smtp.gmail.com with ESMTPSA id y124sm1986793lff.104.2020.12.21.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 02:45:22 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/2] linux-firmware: upgrade 20201118 -> 20201218
Date: Mon, 21 Dec 2020 13:45:20 +0300
Message-Id: <20201221104521.3661081-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: firmware versions/filenames
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c88129ffef320c16722f40426b0d4560274dca4e)
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

