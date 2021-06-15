Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.6407.1623744779644519541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oJwBZjtR;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id dj8so49873414edb.6
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vDFLoLuov8JTtH0x+h/MsN7b9xN6AtfoEa4EO7Nbu54=;
        b=oJwBZjtRWzYMWmSVnE+nE1N1iBe1HMKQO0A2iVRG8b+rObmIC0oKyigfMvstEXn4cT
         OmqdppcpcZ/LOZpqpSsa7ZRPPk4qUYphN+oIPEpDGxwbJSm6hnKudJ/yKWrE3MXEZJSa
         xvpS120PP1W0Uss0bCETOCb5/41iIlM4J0PvhWbkQvhs2gxf5JGF8fD9RuR0yuqNaq0E
         EN1lBMijFUjgodE1igwY8Hv6Y4jZsFl5XWX+0ISHcW1lF9ZFT/EqaAmGroee/8qYb11I
         HAUvKpl1EbOLIt8s4VlksIkNiXplaXFQ+czRaL9HYMHXNhEOmLeZPp1Sb8D781K2v/fI
         Ul3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vDFLoLuov8JTtH0x+h/MsN7b9xN6AtfoEa4EO7Nbu54=;
        b=FBGVrJa0zx5yn7k/P6AkJenKlZV+S2vdxZJMEtduCMg80d03IxnUquro71u3MWJDZD
         kON0VHgeZ+d/pva3D5NvgUeNhTaftcggKAgNtwg5zGSOOQxu79u0UH18cLclL7z6qmtd
         ASMyl6LqY5a5QDmbztTrDHslEd8BGNCSB4z3qrxXQi+9XrSQs/TaIUMDOY9jwYhojJyE
         FskhotUxHUEBJiE6w+dTUIp2Xmpct3Es2vncN9Thayn3VL8pp/437fhDbYTRPpqZ0Q6L
         Noy1DFg7/9oyamXad7vwdHAkX2skXcpiNGVIFEqnOT7TiVKmMxDknxXfBRONgVnevrcc
         adow==
X-Gm-Message-State: AOAM530TEPBo/DdWAGa0KlBgNSZuNXwyc3/t2x1UQ7UtqN6fmOOuFgT4
	2mQKU1GhMn1AHb0uV4KxevkTb7XWjZ+1LQ==
X-Google-Smtp-Source: ABdhPJxErcF/eMcWcYdABFIajJKGItu2V4VcWZuT1t6PvdGP+EwqboIbbkqdLYoJTXJZ7cFoOl1PGA==
X-Received: by 2002:a05:6402:2317:: with SMTP id l23mr21938473eda.265.1623744778157;
        Tue, 15 Jun 2021 01:12:58 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:57 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/31] libnss-mdns: upgrade 0.15 -> 0.15.1
Date: Tue, 15 Jun 2021 10:12:28 +0200
Message-Id: <20210615081240.1734087-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libnss-mdns/{libnss-mdns_0.15.bb => libnss-mdns_0.15.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libnss-mdns/{libnss-mdns_0.15.bb => libnss-mdns_0.15.1.bb} (95%)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
similarity index 95%
rename from meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb
rename to meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
index 75e8ba06d9..f3b64174c4 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "avahi"
 SRC_URI = "git://github.com/lathiat/nss-mdns \
            "
 
-SRCREV = "65ad25563937682ab2770c36d56667a754837102"
+SRCREV = "4b3cfe818bf72d99a02b8ca8b8813cb2d6b40633"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

