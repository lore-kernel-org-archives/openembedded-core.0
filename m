Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.4729.1613813294073789310
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 01:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MnQrZCfS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id v62so9829389wmg.4
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Feb 2021 01:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2NxgVKVNENCguHPtY/jw59+XDKvdjB4JrNYqPtotkgo=;
        b=MnQrZCfSu8UcL5rfg30sjpUgzZf7U0efJ0U1IWZU0P/dhk82MLW7XNL+ufYyEWtnHj
         Q/dvoaa12vwtdkgg1r62BYrxCvLHxZrco/L5FJLU39ZbAntfgTPgJuwsqM6ZnHQt5sAP
         oTMKXgPvn5BIrO7A1yB5lgTF3KUedj+LqlkB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2NxgVKVNENCguHPtY/jw59+XDKvdjB4JrNYqPtotkgo=;
        b=TNfBTL9Tm4mPCJ6PvGNzb7nPICHnDfb1D1DyRha6PaHp/ApfoRVxM1cYg4QnaW18Yv
         sfMOYhsjStl04i1UbKXHfPeO/a8iKVYjIH2z4z5qG5z6fseOoYytRyM/zjqipJizEODD
         4YWztROVo7Y/IHJycrWTajs+qcXB6IS75vd3hehnioGmTP6KCzw29Tm9a30veKaX/pDb
         RJGugiJi/A0h2P2A6RJNM3y1DMWUJ7VjxsswR5o4zgqp/w7yk5WUsKFsVLEl4szMrZpu
         zbmfpwOZRQODfMsCGB9OK3Yjs7n+khxOBRKt7N5Y2OybKqc3R4gLfk+zXjVztchFuHaU
         ak3Q==
X-Gm-Message-State: AOAM530pYIpEMfwYnm40uBmOY+Ae65+N/dy5Dr2Fo9/7iLCTqk5ddujo
	ShyUlDkBm+zsWzB5Dbs3T5eyxMomL6Rafg==
X-Google-Smtp-Source: ABdhPJytocnQz3bKy58X0gvM1p+CbT406swQnAsIdwJPKKY8SxadfNmhyDEF/Y9+NQLq8qD+/Zo0xA==
X-Received: by 2002:a1c:7705:: with SMTP id t5mr5062009wmi.148.1613813292562;
        Sat, 20 Feb 2021 01:28:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c81d:1d77:977a:6069])
        by smtp.gmail.com with ESMTPSA id 64sm20233113wrc.50.2021.02.20.01.28.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 01:28:12 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers: Update email address for Victor
Date: Sat, 20 Feb 2021 09:28:11 +0000
Message-Id: <20210220092811.2165175-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 09057bde8a3..3d8e3d5de07 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -691,9 +691,9 @@ RECIPE_MAINTAINER_pn-systemd-conf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-compat-units = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-systemtap = "Victor Kamensky <kamensky@cisco.com>"
-RECIPE_MAINTAINER_pn-systemtap-native = "Victor Kamensky <kamensky@cisco.com>"
-RECIPE_MAINTAINER_pn-systemtap-uprobes = "Victor Kamensky <kamensky@cisco.com>"
+RECIPE_MAINTAINER_pn-systemtap = "Victor Kamensky <victor.kamensky7@gmail.com>"
+RECIPE_MAINTAINER_pn-systemtap-native = "Victor Kamensky <victor.kamensky7@gmail.com>"
+RECIPE_MAINTAINER_pn-systemtap-uprobes = "Victor Kamensky <victor.kamensky7@gmail.com>"
 RECIPE_MAINTAINER_pn-sysvinit = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-sysvinit-inittab = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-taglib = "Anuj Mittal <anuj.mittal@intel.com>"
-- 
2.27.0

