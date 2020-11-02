Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.1255.1604335822396340834
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HsbtgKlh;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id k3so19761582ejj.10
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P5GY38K4qpx6hwUzTUbXl5ZuZlXXn4SkRN7UKN/23WI=;
        b=HsbtgKlhx/cmEUXA22yqlgNs0LfWv/PA6zjaCrl6NDDUNL9gp+2cBNHsQFqM6QDuqB
         tcqU2D2oapgwUTiIoRIrQmwQEQqi6gPTTakM4/gT+3oz2lnwUF4tFfLJjF9duIo8Qtzl
         DC1sHkEaUDqv82Q1AAwW2XJENyFRZl/JcQmunJf87fHlSgu8We9pypsRgVU38SUPOEEr
         h0HmKEICVKbHqFA2bpqflQGoG6OfBLyuHdtpnYtGqvQddJE7O3hveJvM/OVSCsUKeb9e
         /OZZB1UlajHxNbL+HQXtzYM3LAy7mf/QuXoBYm3rdyrDcKAduTghf/+WqSIJqNGixFBW
         ypkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P5GY38K4qpx6hwUzTUbXl5ZuZlXXn4SkRN7UKN/23WI=;
        b=uXM4VeQ8iQbjn7yA4AVwqoSw7rjU2g/7FbKDQtYTPM6ui4fPhHwhKsYjyo66yFKg0a
         K/dl/5lvy1+ouyV2UgwFP8sjEwlgZ3mQgx2LYmf9v6WIPtj+3ilP5IBSvoAK7ktUzGiP
         vbzILEMcBE/Zg9x8aFRpmryCZgL92eoSE0wpkpkPNnMeuFWw3CDUvSyBdQrV6yLAQtPB
         8SJ7vO9VzuHFqO8hUXANYtpyJ+C9xJZZsXtnXORiAJ5P+M2BBp8c64bwmjJA7FuUZcn9
         rWAlB4lEWJaykk/qyEkrBzp7R+Yll9O8yRSsu0qNBx+9HIYE2m2PxV6POG1KF5O4y7aT
         XN5g==
X-Gm-Message-State: AOAM531LKS9I9zNH9BMdDckY9eBkQv0PVYTHB62r7uUbxDmnC9iopT1K
	mvlNN8iWdOYfPB+ufvrMH+rn1aYtBsSAkg==
X-Google-Smtp-Source: ABdhPJxzoQBbAStYoTKa1ojDTtF94y8aGDQsG0GmGB6CWz0nu8zVRihVVqU5ewsqv/xCe9GW4z0/6Q==
X-Received: by 2002:a17:906:e10e:: with SMTP id gj14mr17080610ejb.134.1604335820785;
        Mon, 02 Nov 2020 08:50:20 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:20 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 71/80] webkitgtk: upgrade 2.30.1 -> 2.30.2
Date: Mon,  2 Nov 2020 17:48:58 +0100
Message-Id: <20201102164907.27572-71-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webkit/{webkitgtk_2.30.1.bb => webkitgtk_2.30.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.30.1.bb => webkitgtk_2.30.2.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.30.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
index 7689266304..1acba6be1d 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
            "
-SRC_URI[sha256sum] = "17c59dfdadb7377192e9b59bc56c8a029c9fad4f38ed732b652bf33d0bd5d6b1"
+SRC_URI[sha256sum] = "c467e0bc2bc610c2570928e3fd63cedaadc4719cbf9b04aa99f79dd71ad5682a"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.29.0

