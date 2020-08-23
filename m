Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.181005.1598214090578140483
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rxm/Skj+;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id dp2so3988214ejc.4
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=89A2mio1kvXmghW2DtogGcp3QdX7OdbZjJaQSvbBh+0=;
        b=rxm/Skj+EtWBki6MB2oSSLdfxrqr5mIC6eVaRPU7Bd+Sy4/iTzviigyQEz364ObQWB
         neYbd6VjF4hkfr41wM3cxj90Mh2o1/t2qhuDO1YeDKWp0HuPquxYiAzQTQZAbPxLpEZ4
         puxfaQTCuy4HJ1gkuEhVjb8vdiwUesj0l6CjCtdOvhiKr2JPSleLIJvxx8OZxX6Ld/y/
         h/YEAdfmSa3cMslvcmj7HOPecU5ZLja71srx1ONB9PLSu3i0Tqdk/BLHeEWcAguAoFpF
         ARHRxtZacmpMN8XV+074CareuJ3qaQ1rYhxDxQpg0VPoxWwsvMHTp/RdflNrWauBeGke
         wHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=89A2mio1kvXmghW2DtogGcp3QdX7OdbZjJaQSvbBh+0=;
        b=PRnvZbMWVGZFUiYfMDHdbG1pAzyn1Nsg+udSb4UmQ72g6jjF3zMZmSBi6u8LkpGhfI
         qadF054Ekf4zlKFpOBJxqFmftNauJaO+VI7HASAaM3PWwkYYY9hDouvD0BtOArLVWJt4
         vot9W+NT+LEzl42Lism3hpZR4x5eSy5OeRkbNGiVhbOAN2FYEVnPiiblN2qwqnPA5hiz
         RNc5F4xhxAyvZrvSxBYE+LeUg8obTYa6RwPvCKOSjOM1B/GK+sskxbmdKoJm/wj+UZdi
         jNqdk8dDhqEmCbe1JVAFnIp5putyy1wHjPhQh1qpaFzINJJaofAbFpPlIV2c7dQppWKu
         XTLA==
X-Gm-Message-State: AOAM532pZnBZBFRjZj8PMFme1kEoOvfJf4S3XxQTNDLdc3i5D3JGQl5L
	URpD5aK7Jgb9bUF/BDWXHPYElmfrTJM=
X-Google-Smtp-Source: ABdhPJyJttiRXGKKbKHYDOSpjE2gBv23WikEWl6Pon+3D1r8N2WYHR9as0+TcLIz3WA+sDnuoSEO+A==
X-Received: by 2002:a17:906:244b:: with SMTP id a11mr2651688ejb.5.1598214088818;
        Sun, 23 Aug 2020 13:21:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/37] vala: upgrade 0.48.7 -> 0.48.9
Date: Sun, 23 Aug 2020 22:20:19 +0200
Message-Id: <20200823202031.24686-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.48.7.bb => vala_0.48.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.48.7.bb => vala_0.48.9.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.48.7.bb b/meta/recipes-devtools/vala/vala_0.48.9.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.48.7.bb
rename to meta/recipes-devtools/vala/vala_0.48.9.bb
index 2e61db1052..09bfcd6474 100644
--- a/meta/recipes-devtools/vala/vala_0.48.7.bb
+++ b/meta/recipes-devtools/vala/vala_0.48.9.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "28de33e28da24500cc1675c3a6ced1301c9a6a5e6dd06193569001f9ce9a5c53"
+SRC_URI[sha256sum] = "9cea16d3bb3daddbfe0556b99fbfa08146230db7651e1e674cd08b4df5cefea9"
-- 
2.28.0

