Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.32551.1620657108038660922
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TD0hBDen;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id t4so24923586ejo.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6O89CibISkv3osip5GJprM9RIYlhhAndbsjUO7o0SkQ=;
        b=TD0hBDenybbvoIrnzsxB5Vv3yVwkOv2JC3rvLEWtdTpCcO+xyQPTdc7/UE4sRUk2bT
         Pgq9O/LhwwFVk7Bqg7szxPM8mPKBJKWfLd1bek0wf5Hu6gi5AcOS7g7Cbvr12DBtPvK/
         Isn62heCDrW5+ufjhgxeGwrDxcqaEslNRPSATdB1cUf5LdAQPHZ8mnFj080AATx2daXE
         Z6uHVAlHB5mNizAjl3WgYPKelzSsPIWbVzdxFv8YUk73IFftp/wOo39Xexk/fMYwcMvq
         NbffzVtqtSLLMp5TpWdYvtgQ7gfZ6TwelP3KuJhBZ9p27by1KaSHyLSbwb+CZ+Q32LUf
         9lGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6O89CibISkv3osip5GJprM9RIYlhhAndbsjUO7o0SkQ=;
        b=PfqWjKB8E7VhSHS4BedEmz3xXzeVW64t7x0d0inQk+zLDArNsHPgOSsLiIiSNncbyQ
         U7wECtevmtaRSAUYumFfCnNTX7UeCbYsROR3i04h9PYxGpmUqHGlkEC2pxz9w26/8KU/
         dIKajPePTdBGnXNuEATiFLb1LOAhPi1M2t2UU5NdtSvLew4OAqP/sFa33wqF3impjvc4
         HwDPuzQ8UEaTe68EXCZaxcpaJjwMOka3+sZ4rv3DjO5gd2h0LPsZaIT18y3ZlU7k+BWc
         X0Bc0C/cfuvQkWB2bsiEBqUhI+eWmfhheS/5dIJBOSD9T1ybZMJGR8AovVn/ynZLqT87
         wRBQ==
X-Gm-Message-State: AOAM532QWQiZInJdwwcCcSYPt77t/yz1hQiD3U47fHAvVVgjw1/Gnfzq
	kNkeRSmRfqBUOvKrXuVElkyhBXbCU7k=
X-Google-Smtp-Source: ABdhPJz6MfT2QNrUkujfVdmjhtcElzWU7RbYyB2zeUWXF7RIib76q+POI+UrUA16bgJNAZtyaQBgoQ==
X-Received: by 2002:a17:906:711a:: with SMTP id x26mr25928840ejj.125.1620657106532;
        Mon, 10 May 2021 07:31:46 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id cf19sm9519306ejb.24.2021.05.10.07.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:31:46 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] swig: fix upstream version check
Date: Mon, 10 May 2021 16:08:05 +0200
Message-Id: <20210510140806.942211-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/swig/swig.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
index e62718c508..292bca393d 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -13,6 +13,8 @@ SECTION = "devel"
 DEPENDS = "libpcre bison-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/swig/files/swig/"
+UPSTREAM_CHECK_REGEX = "swig-(?P<pver>\d+(\.\d+)+)"
 
 inherit autotools python3native pkgconfig
 
-- 
2.31.1

