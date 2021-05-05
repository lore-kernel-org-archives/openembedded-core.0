Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.9803.1620227989047627788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=anxpsgWf;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id w3so3463448ejc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8dLAFk+fjYt80yf5YoncVqmaquCE4hzoQvWPU8COzBQ=;
        b=anxpsgWfmRpno0TJbA1wCvvdsibvkNTBnifN4y/xcMay941lyxgS3sI4qqaHhzxCeh
         xPix7BL7Z5+PYx/GPOgFvz5AS+oY+1jA43bBbWJZ1XMRoHP7eMpzNhGhj/4VI30QO6ZS
         FdbgArV/SGFBt3yZRjLfd3ham7soOK8q0kDy6w2mUeh68LkYTnQJB5PAwAjzk/4SqCb7
         1xtqzw+cyf7R0hDkP6ETbioHrdY4KNJ66zQxkdI2r1xNTvePkbWOqcbSCL8A0yy1ZHdM
         PTiFKjTSg5AYUXioK1lQlAkTq5Zxdf5WlMh9634/rJmhZVC13gcRCoLlQqayKWBiz7kD
         bPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8dLAFk+fjYt80yf5YoncVqmaquCE4hzoQvWPU8COzBQ=;
        b=K9OzalTW7e3L5rC2tISVRxXbZ/ckkqoEFH2JOL7+Vbmeqk9dci5G2f4S7cXELEhPJ9
         iKO/BXc6MYYPs45Vb+YnyF7ZF1loGLwPWM6+/npJjKUaAlw11sWquRnJoMY1HsnqLOFe
         H+ZjBLIWhRbRvnnst0H9c+mtuu3x5f5YbsceU3U/BWEv10DKwYz37X18uV4kQQT1pZHs
         rQpMp/eaKBQ4oM11ety0rdUUguQe7tVxffeW9SQfO3FMVtpL3t11mdT0qcxcMpQUhota
         v3L079QGLmsmmfVP0QUDwpEGkkCFNLmS9NBTXOawtszyCwTjWrW990RRa3UMm1Vr5vAP
         yQMg==
X-Gm-Message-State: AOAM533Q40tD6ONsswQ68hajWkQA0ZswLUWNz554BqWRCw25pGxS9Z68
	Dh0oLEbW3kmkSeYISNzRQKc6W3mKpdTP5g==
X-Google-Smtp-Source: ABdhPJxuDziU12rI1hv8B5g3KuzwHbYt77h7A1WrMEtuTVj66wUfTgv7ZPq5pDLwZVCiUp1mVSqWTw==
X-Received: by 2002:a17:906:2e97:: with SMTP id o23mr28261799eji.315.1620227967693;
        Wed, 05 May 2021 08:19:27 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:27 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 40/61] libwpe: upgrade 1.8.0 -> 1.10.0
Date: Wed,  5 May 2021 17:18:29 +0200
Message-Id: <20210505151850.660512-40-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/webkit/{libwpe_1.8.0.bb => libwpe_1.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.8.0.bb => libwpe_1.10.0.bb} (90%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.8.0.bb b/meta/recipes-sato/webkit/libwpe_1.10.0.bb
similarity index 90%
rename from meta/recipes-sato/webkit/libwpe_1.8.0.bb
rename to meta/recipes-sato/webkit/libwpe_1.10.0.bb
index 164831be39..d90557e3af 100644
--- a/meta/recipes-sato/webkit/libwpe_1.8.0.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.10.0.bb
@@ -14,7 +14,7 @@ inherit cmake features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a6f00a7d091cbd4db57fe7ee3b4c12c6350921d654ed79812800a26c888481d2"
+SRC_URI[sha256sum] = "2415e270d45e3595ed4052bc105f733744dc2d3677e12ff4a831e5029841084d"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.31.1

