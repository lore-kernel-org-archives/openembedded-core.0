Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.19126.1608974890473989725
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QjC6fi8t;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id lt17so8325446ejb.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rs825LlNxj7HB/UCFxdIKND/S5fsMSjrfujrY39B9uM=;
        b=QjC6fi8t9E/PiH6hTiDnKso/4DX98vUcdXnxL3Bj/lFkmHg+A0ZhdN4hqXlfrrcMtV
         ZJ8oudN0X3RPg7zLYd6svTL33IKOPLesucddvToESgukza6gzqrtmtAxaep2JQPEy4n1
         GgK2Qh/q5a0rbM0FZk1o0lN1UXIsd4ty+YHKS5bjCPju7xqCfuyglf5STgquM+Y4oOQu
         LkFBkXXkB0SW/LLY5nQc2DPJrrl+1hGckFEKiCe5ytVQDOhEUp1F3EGU4P4corNzC3al
         2u3ZhQw1EpVuhGa9olKJpcr9grQSpH8i3b8sZU2HDNj9BBRE8wmtbb4ztYbg8s0YSaww
         QpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rs825LlNxj7HB/UCFxdIKND/S5fsMSjrfujrY39B9uM=;
        b=goTIDyhULYGh4FTiIZh0Uis1Jrj3cTY4a9OJM7n2m6+StVVmopp16ZGrDfbmB3xTfr
         Ox/jTWCsebwwPLVKf1+3uQOqL0s+vd5wrDlDmCFbyyaFoDs5dBFGO0dc1734j8ihY6i1
         LPIcPl8ipiyeDnjt/sz2AsriSlR+ZUr0iD4ujxB4y9JGQcI5jsC234v/QENghdIDjNQR
         KwwhyVMHgRalAMJIaJI9fVTg4zOWVmwpAxGBFYH78h5JD1jdAHxjqI1ZkoeVKxUw3k5n
         Gq6CyDyLr5/wXi9ta1P73g+ViF0iKubCKKEkuT0QIt+iH8+zzxFOmQ3JeWhn8x/0IPLF
         j0JA==
X-Gm-Message-State: AOAM531pd/B/EELBBXVlMqB/uxoWIKbBsN2UtEmkwIQwU8/FwUHQb2JI
	Nj+2F1gbFioomPYCq7ckgDwavUAWiUw=
X-Google-Smtp-Source: ABdhPJwcFrWxZ1ehgleSlnnDgsSZOui+EmE6Qb1lboAcwOrknRtVJki1qEtFUxTTkpRMccPs+Eckrg==
X-Received: by 2002:a17:907:2123:: with SMTP id qo3mr34429822ejb.543.1608974889151;
        Sat, 26 Dec 2020 01:28:09 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:08 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 34/48] xserver-xorg: upgrade 1.20.9 -> 1.20.10
Date: Sat, 26 Dec 2020 10:27:18 +0100
Message-Id: <20201226092732.52323-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{xserver-xorg_1.20.9.bb => xserver-xorg_1.20.10.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.9.bb => xserver-xorg_1.20.10.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
index c83e43ed99..5c6dbac4d7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
@@ -8,7 +8,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
            "
-SRC_URI[sha256sum] = "e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094ae4f5c9ed9ccd3571"
+SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.29.2

