Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.181509.1598214085213359365
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iESiJ2K4;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id w14so5769865eds.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tlWnnDZoHBB/sSjK/8Z1vZyDQ+9xqi2YxdrPWZUsGNk=;
        b=iESiJ2K4rm67vwcEjW7mXAFnfEqSkfiG10FuZX8H3Hu5iCfOUb+hyXy2b66Apep8Kz
         oq4El52yFq4SewJvWPcLbLzKUwgJnofzbjQdg3HhCabhXcWf7nKActlGjv/XRSy6LRBM
         BBRnLg10zlijtYpj3jSHZ0crEQAQuvYEr9OgEjBrDPNBKu7e5BXrr9EKeUQlnqSMv4dJ
         Tjjm6dYp18qoLgJUiBw5DMp+2mZFHao93mZus8ecB6I4cSkMiXAJg8bIAM8hcmHzbfLy
         X8g3yinLHVWjN4KvWtZbUnl4xrK1u/2cspp2bRV1IxNbSgsIAqVY206moh1oBmLijwvQ
         ma3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tlWnnDZoHBB/sSjK/8Z1vZyDQ+9xqi2YxdrPWZUsGNk=;
        b=Xa6nEGfmsc27XRbPnrz+dqkcZZ22ffYQMh1cBjB0AE+jYRvP3X9NIJw1LWCUFatQzY
         Dj2IuuMQeaqC31cbXbLWHQ3zVg86qolmxlmD0C4wqNVNR9RhRoW6wV7tB7oszkoInwI2
         vEV3/VnbWMCj9CjK/rZixv/zF50CyBnN1jl6vPL6sj2GpFN8kiP7lFE3MdajMFoE2r86
         fYsDw41pEvRb9A94IEQVhpIDPvLXlYQiyzKsPxlckF/ukUw+sHZWy+OKRcuRQJQQWo9Q
         pjHZWruPr61GkcXjTbn5xRJapsPeetdNZQjyF05BVTp8uwihBe+5cw/W5tCyZznw4PMU
         McvQ==
X-Gm-Message-State: AOAM531/9p3Bw0Qj3vLOqJGvos5i5ZuCayX0iYd0lTlslwyyNnfj+uML
	zukVHQsxcH/hX/PQ8da3FKN7dJZaS/g=
X-Google-Smtp-Source: ABdhPJy3+pdLbPpTsAkSntngXvOGxrluDNlcby03qOltNJ5w9fJFuY2lkj356F6LQTfVMhIZUgvrFQ==
X-Received: by 2002:a50:ee02:: with SMTP id g2mr2575957eds.106.1598214083495;
        Sun, 23 Aug 2020 13:21:23 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:23 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/37] man-pages: upgrade 5.07 -> 5.08
Date: Sun, 23 Aug 2020 22:20:13 +0200
Message-Id: <20200823202031.24686-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../man-pages/{man-pages_5.07.bb => man-pages_5.08.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_5.07.bb => man-pages_5.08.bb} (87%)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.07.bb b/meta/recipes-extended/man-pages/man-pages_5.08.bb
similarity index 87%
rename from meta/recipes-extended/man-pages/man-pages_5.07.bb
rename to meta/recipes-extended/man-pages/man-pages_5.08.bb
index 04d0597b3d..caf9320a67 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.07.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.08.bb
@@ -7,8 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=207f70f56526417514ac46b6680e314f"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "193d9223e9c6dbe1d928eaaecc1f68db"
-SRC_URI[sha256sum] = "5ba58d7b2b9a8929903b1cf791ed4edf72ab225678d5ea0a6b80dc090080ac33"
+SRC_URI[sha256sum] = "6e0b8ae23ee9467cee701f23dea908257a93e5fffa9e261b19a23efbd27e84a2"
 
 inherit manpages
 
-- 
2.28.0

