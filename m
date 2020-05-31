Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.17512.1590940435131437889
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YmSnmSN9;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id k11so6852338ejr.9
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bsCyuy0OOTqyYvKBpX8kjFAVpgQO9gya8oJ7WRPLlA0=;
        b=YmSnmSN9MrkOPUBTGyoLt8mbqlyfOKrwL7RV2DC2+8abzIMG+4T+E6OOYYy5RP9CBK
         sAN4sy/uGhCjRnQGUkcekywhTVpZIR8TPt1BRxm+OfkRoQYfe/FghDPK8m/Y0ZnsD9x0
         L8ps7DqF6HBgZqvqQ4/lb81memvkgKMQ+oMis7Vbx+pnN+lf3lNpwDDaWqwFhpKNv/6k
         sI3ESgvTRZq5hJJV4SQZsJ6XnoNwFHffKsKG4GH2aNdnCNJ4syelk8vnTCmE8JjNUMW1
         BxD4euFzF5vZkSjTiKSymx1ryMnKGryHf7piHNjrsijKGBQV9TbUhxhmvke/IpcprV9T
         948g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bsCyuy0OOTqyYvKBpX8kjFAVpgQO9gya8oJ7WRPLlA0=;
        b=IlIM+XiGp1cVGZZBNKSVO6YNbjFjZmI44vJusaEt8kAIYssolLW7NTO9tfYRZSye7a
         /K9wMiMEe4G2j0yw4ulzg+rkuFlYF+ZJPn1mLToFd0TCatYEV9rwyWwPMjmYChJ5Itfu
         V85h1xmfGwq1amhsRxpb3pY5b+VrHCLDxZKME3OMxzxyj/H/Xe+a0yqwOYjgRtcKMy6f
         p5YJIq+ZJ/kVgUsoRSBm0AljAb2r5OTu6aPr9mZe77q4kf52xr8z26NZPvoW0zTp0kLY
         YxMW/dUQsDISvQ9NPmYAwqv072jLWwlh3vHUtIPBuIW/ns0oXVgRDwN+Z6LWMuJCxJdo
         FS1Q==
X-Gm-Message-State: AOAM531qvDcHcVb0FiFhLrCoqoBHCjbrFsTzT1Ds4Z/IQQd0xrMh7BJa
	d/u0VS1Pn6P2kR/c1Wb9jeXebMyb
X-Google-Smtp-Source: ABdhPJwscJsjqAFMmHNcXIgmgRd9eU2k7o7LqUb0oiN++yBdIZH+g8Qm4vNINjMUADVriJdPZ4OKFw==
X-Received: by 2002:a17:906:a458:: with SMTP id cb24mr1870568ejb.5.1590940433437;
        Sun, 31 May 2020 08:53:53 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:53 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 30/70] mesa: upgrade 20.0.2 -> 20.0.7
Date: Sun, 31 May 2020 17:52:14 +0200
Message-Id: <20200531155254.10283-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/{mesa_20.0.2.bb => mesa_20.0.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa_20.0.2.bb => mesa_20.0.7.bb} (88%)

diff --git a/meta/recipes-graphics/mesa/mesa_20.0.2.bb b/meta/recipes-graphics/mesa/mesa_20.0.7.bb
similarity index 88%
rename from meta/recipes-graphics/mesa/mesa_20.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_20.0.7.bb
index ee0260e073..420565808e 100644
--- a/meta/recipes-graphics/mesa/mesa_20.0.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_20.0.7.bb
@@ -9,8 +9,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[md5sum] = "31ca59cd92c38cb8e1a58b62b01c3e08"
-SRC_URI[sha256sum] = "aa54f1cb669550606aab8ceb475105d15aeb814fca5a778ce70d0fd10e98e86f"
+SRC_URI[md5sum] = "609cb7664204e031d4c65c602c652a28"
+SRC_URI[sha256sum] = "fe6e258fe772c3cd2ac01741bf7408058c3ac02d66acff9a6e669bd72e3ea178"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.26.2

