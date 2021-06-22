Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.7514.1624360899604785564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=au0sttKC;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id i5so5683455eds.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OOfwuKJdMTGdt7oociqpcnUvOMqmkT4T1bL2CIse+0o=;
        b=au0sttKCr8LzfK4xLB7oNbuNIc8dwo6ex74EhanwKe6YHTxaaqbiDcCVfFqkbY1oKl
         5nW0zdtVus1F9oeeq3U9GhvlTyyL+aisq4b8bs2CCgf05UqfN1WkojtBqbSKShRk5Ymx
         RwzoGSF02RCT0RtCLC4H4r7Xq1SEChPRgPLui5+kS45DIvvfW7CwGZNLLCETMjFB43uD
         ZjFwdQc5ayGgaxdSo8x0KUWKZ9AqQui3qvuB4altmiSTLz8JkYVhB3HN5tWIIzEQP7TU
         LKVYADbFJV1hdIvqI6tB0808x/ikCLG0JbOPotvXnxwlzfT8Asv7t9hWWsAl8SfTcm5k
         EOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OOfwuKJdMTGdt7oociqpcnUvOMqmkT4T1bL2CIse+0o=;
        b=KiGko2Ga/setQ7BXehYd8GCGoyZcB1sH5Z/u8KDcNynM3UzS1KxE/0+clzC74j2RVi
         eUdDHZ1kJC/4+uJZzu1CZiQMtPoQ32mSIRhaOQAVDDqhtEjs0jrACe1iFvL9KHPcJ2Qz
         Q5QpgPCRe6kUHVHzo/sBIkL8bIqVz+XY89GgVp8ZQPxoOc6rJ+wqMt36AV1RX7crP3wn
         8N5sbb2EgiSZnQaeGzUK/4EUGjzUbuLyLzKAmHBbnQdHfpIa1comfA7+j4qngeoU/OJ2
         rk/SyGfp5G2oiZu43P8wYTlZIFjrkgSHPR72gjKhVbVwrYkUAkgmn4cKwIR1NnvdIrQu
         QB+w==
X-Gm-Message-State: AOAM532G9q5qBgtbBzGrY17k8wrpInNsDRSV40DbEp1MG732wqLHKdsI
	bV/0NIBLNeF0brzbz2fpEXktssgCsk/RmA==
X-Google-Smtp-Source: ABdhPJwxjBl+8UZ0nsR32eyn7iuacpLYy1h6zaFFdAM0JntFIrTg4swXnoIkl3S8G0LnPpgBktvykg==
X-Received: by 2002:a05:6402:5143:: with SMTP id n3mr4292995edd.80.1624360898283;
        Tue, 22 Jun 2021 04:21:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/19] libpcre: upgrade 8.44 -> 8.45
Date: Tue, 22 Jun 2021 13:21:19 +0200
Message-Id: <20210622112126.2026646-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libpcre/{libpcre_8.44.bb => libpcre_8.45.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.44.bb => libpcre_8.45.bb} (92%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.44.bb b/meta/recipes-support/libpcre/libpcre_8.45.bb
similarity index 92%
rename from meta/recipes-support/libpcre/libpcre_8.44.bb
rename to meta/recipes-support/libpcre/libpcre_8.45.bb
index cd80dc7345..345c46e86e 100644
--- a/meta/recipes-support/libpcre/libpcre_8.44.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.45.bb
@@ -6,14 +6,13 @@ SUMMARY = "Perl Compatible Regular Expressions"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=3bb381a66a5385b246d4877922e7511e"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b5d5d1a69a24ea2718263f1ff85a1c58"
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
            file://run-ptest \
            file://Makefile \
            "
 
-SRC_URI[md5sum] = "cf7326204cc46c755b5b2608033d9d24"
-SRC_URI[sha256sum] = "19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec62b714c84399366d"
+SRC_URI[sha256sum] = "4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8"
 
 CVE_PRODUCT = "pcre"
 
-- 
2.31.1

