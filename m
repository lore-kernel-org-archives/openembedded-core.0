Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.91.1614617607329901625
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 08:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XKqykFPK;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id 18so9857650qty.3
        for <Openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 08:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3U7Wu87kko9YzVNuzXhNOXxOAx3NZZaKI9wNMHgiTo4=;
        b=XKqykFPK7pkr0VN7Z3f088VKA/cqGMvLV74U2u9B2w4giMi6d5vbenJKc3Ucn/W2OL
         0TQSI1SPHcEAtnQZJSjHiwTs6OB+rYM4zsiBw/srKJ5yzNK9QhNIsRO5s0n01GA095u9
         eBlKHCiIChC+6wHOc3MVklKSzu+fACYwVgNOnpfAS6CyCf+jOlp8yoi9VHWTe75fFYol
         SnoxeMaX34s8BSjgO63JsQBrdy+tidvGyFatzGKy6ShFAbllBUYpGHpmACONQpFJ0GBB
         gTzsOgwWcFt6GkFhA4pzgcraDV230W5d82Jj6uEmHIN00OEp4MVnyy5T8ecgd3GC7OVg
         +0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3U7Wu87kko9YzVNuzXhNOXxOAx3NZZaKI9wNMHgiTo4=;
        b=suGvSjgcjT1DXRuoLHdCdJP+UKEdJDC0pL3ISTAyG1xHtGftcmBJWf32a8aDYAe7Q6
         2aqp/sLERZlxvCSZVwY8hjR5FAzIbTSkOCjEl+WUJL2GHxhFWm5deRhPi5diJ/MmpvRp
         +QbgE8bsNeP1NXg2MaEYl8fMcXpSPO/1cX/YFEjyLPQg1W4PDVngIfyJEAEnWwE8lJS+
         3M2mC9tzmtnS6l/1UWQn54NK1LfB237NBVKNbIl6h7JT44Ach2cy57gREyk1/QPmZeNA
         KnUUjv2Xa1rMHX5Z5QCYyhz9de03Yg+XLcsjxnkXN8l24nVumMp/sv/g7nJbq4F9AQe9
         7ePA==
X-Gm-Message-State: AOAM531wJTZSXVlfhf/hUQ1T62txot1B/mf+dQeECnajecMIHPrbPxJ7
	BfMz6RS8wGMWNBXTcWBPXsWBOz39WmM=
X-Google-Smtp-Source: ABdhPJyEvafE8GZ6mRx9NXMb5ahJHchkWuWixpIBG9USzvh96wuKlltXvo3kcnO8fxBTSGBodh0yiQ==
X-Received: by 2002:ac8:7602:: with SMTP id t2mr14079496qtq.165.1614617606028;
        Mon, 01 Mar 2021 08:53:26 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id j6sm6126822qkm.81.2021.03.01.08.53.25
        for <Openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 08:53:25 -0800 (PST)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: Openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] systemd-container: sort RRECOMMENDS alphabetically
Date: Mon,  1 Mar 2021 11:53:23 -0500
Message-Id: <20210301165325.3987311-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort packages in RRECOMMENDS_${PN}-container alphabetically to avoid
subjective sorting and ease future additions.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 meta/recipes-core/systemd/systemd_247.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_247.3.bb b/meta/recipes-core/systemd/systemd_247.3.bb
index c0073ad7b0..1aac754cfc 100644
--- a/meta/recipes-core/systemd/systemd_247.3.bb
+++ b/meta/recipes-core/systemd/systemd_247.3.bb
@@ -485,9 +485,9 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                         "
 
 RRECOMMENDS_${PN}-container += "\
-                         ${PN}-journal-upload \
-                         ${PN}-journal-remote \
                          ${PN}-journal-gatewayd \
+                         ${PN}-journal-remote \
+                         ${PN}-journal-upload \
                         "
 
 FILES_${PN}-extra-utils = "\
-- 
2.30.1

