Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.524.1604348256722034146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 12:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pNVbcOHD;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id l16so15667442eds.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 12:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MezL3t5yUoNFuRdsVyF5r6h0EGc0AemIWd9K/P60g2E=;
        b=pNVbcOHDJEEBPIzpzJ0MTZoEFx9SN2g36kggWmFFPpatETHr1MsRuv1YjICAWOSNd+
         Ai/dPpecnmPb6vEBWHejDnkYzlU7krqb2MyfKByvgZc+GdSQwsXKoNCLVcF/v2oYzs+O
         ecFyGDTkzpquOB9wJ7NjJijg1B0RC9Du6RDvOLcfoMX5vuRXSQHp4MVxDpeUtkpOxX3+
         w1b64d6tIG6r0Gx+fUj01lnAKB9aYFKuPFH3k0wgYTjSojGwGI+ZSDkMkcg/o8FXqheJ
         Xw70IpEJBl1t//QSMk/LRNXiQ+mPjHzp22wYy6s6/vd8DvcedaOVSidgOk+wo1akFlpl
         uW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MezL3t5yUoNFuRdsVyF5r6h0EGc0AemIWd9K/P60g2E=;
        b=PRxvE8V5xWJ7WkDsCb9hy5qsGgTP1C/OA451Eh2Y5CE8f5I0hiVyK8N2vlmpvshpHJ
         usHRwtIKp2eeLQJ/zUyqWW2JqGw1jzlHA5jnQqWBnhD5AdxTLSidsQwLAGQBsMoXWz/R
         fsmGuKBI5+AeK18P9T+UjEENC7fB3sFhNJqeFTxl9oKwINV7zOKOSKk/12CbWpUzQaBa
         LIAz2/VbApLLkWQqxcJRrMP0Jg22tRTwEozcmBkiU8lZWJZ0zB0FNBaBn0L0uvPMOGFT
         QvHk7yJ7YvGL9ucVEM97mxCq8o+qSR+jBrL5LsPBJIVYlavtMgy/mLxHnGLU2ykMRVOh
         VRBQ==
X-Gm-Message-State: AOAM53278jgkqIYEyEE7bMwAP31QTRx499P7MOcwYhXt8qQs45de9Cs2
	ouSCdmj3u/9JVPlpyBGBtPBBbz4KjS0t1Q==
X-Google-Smtp-Source: ABdhPJzp2xRXmRPbWrWcL9ezXE+XIcIHuyaG6bwrVbz1t76s3YsIBNFD2GyolCRY1mYSoGU2H+0ezw==
X-Received: by 2002:a05:6402:1590:: with SMTP id c16mr18779010edv.359.1604348254961;
        Mon, 02 Nov 2020 12:17:34 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id j20sm10788117edt.4.2020.11.02.12.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 12:17:34 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] kea: use odd-even version scheme for updates
Date: Mon,  2 Nov 2020 21:17:27 +0100
Message-Id: <20201102201727.29963-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/kea/kea_1.7.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.7.10.bb
index c9a5819e47..1d011ace78 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
+++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
@@ -21,7 +21,7 @@ SRC_URI = "\
 "
 SRC_URI[sha256sum] = "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
 
-inherit autotools systemd update-rc.d
+inherit autotools systemd update-rc.d upstream-version-is-even
 
 INITSCRIPT_NAME = "kea-dhcp4-server"
 INITSCRIPT_PARAMS = "defaults 30"
-- 
2.29.0

