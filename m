Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.9789.1620227959191063925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XAziEHVx;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id l4so3427062ejc.10
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mId83l3qq7mkyl4VOS2pch/bG7qKvUiqnth9Wquw1I4=;
        b=XAziEHVxjSxuXuVyi/e05fNpsYpDmCTh8kRxGiukld8nDr7tqBnIzjfElBiVCUeJu0
         BQyaS9/Kx4yannbQx5crw5ctuP0JCa3qAU4MHJeY/FFA2rT3BEl6AWWwpj3vJEInSI/s
         OTAM6EUYzjQSagYvtOl1b3RBu4ucaEEvLRCjHKsKufssd8332K6SIUMRqU4DoxZKFQgK
         9t5WBdEBU5ECtoPmYPdFZc4zLtm6ivsSAbNwXLSh3WS26pzTXcl2xCDat9s1fLe2aj9Z
         Azv3akG+4dLWss67rILedeMWbp/13JaQSVh3Fbvy1zBuejolLQVEDKAhZFWyRlksnCE4
         58lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mId83l3qq7mkyl4VOS2pch/bG7qKvUiqnth9Wquw1I4=;
        b=XaJotm9ROLkwqRAsTqqyPJlOu2sGx6OFOWAGdjAkJ4PHW1PzZwgVRGpJNO8NOiGmYX
         BT7/fvSD8H4I3NV11BUjWQmKl0jDJI2sOrNMu/GCG/iRfvAL2fhGr7e8r2l29CBH+caj
         WdZ1l1Ghs5ceEbAxgcBlxRK0RRj6/d6WqKOyz16/1KuWT7vLYYKivJnn2nD5NH/VButH
         CDVcm1FQxPuTieWtXRKNKtgrix8OP0DoszYdEb7mUYJaLPU+4OiEMvOUGBSu1Z4RE+pH
         FaT3N9ch2wGjzcdgRz4iiBD4gZ5lunDUeZzd0zwJveVayTzzcZb3LkuuVmTqQlH7aOek
         BpdQ==
X-Gm-Message-State: AOAM530WWHk9/Uy4F7WY26lQn3WZSBfLptD7cWY76wjT12U3UPIErqmD
	U/gVHC1gWph8he3N1aM5FV1FBmejGjEKJw==
X-Google-Smtp-Source: ABdhPJzAs/QHz61sEvec04n4vH/GGuwMp3jF/V6NUQpd56OCPNjujY2cv/MpckBpXF1jhTvb51gJmA==
X-Received: by 2002:a17:906:9141:: with SMTP id y1mr22163523ejw.111.1620227957762;
        Wed, 05 May 2021 08:19:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 27/61] bison: upgrade 3.7.5 -> 3.7.6
Date: Wed,  5 May 2021 17:18:16 +0200
Message-Id: <20210505151850.660512-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: http links -> https

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-devtools/bison/{bison_3.7.5.bb => bison_3.7.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/bison/{bison_3.7.5.bb => bison_3.7.6.bb} (88%)

diff --git a/meta/recipes-devtools/bison/bison_3.7.5.bb b/meta/recipes-devtools/bison/bison_3.7.6.bb
similarity index 88%
rename from meta/recipes-devtools/bison/bison_3.7.5.bb
rename to meta/recipes-devtools/bison/bison_3.7.6.bb
index c8bbea4454..a7f01c3299 100644
--- a/meta/recipes-devtools/bison/bison_3.7.5.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.6.bb
@@ -5,7 +5,7 @@ grammars ought to work with Bison with no change. Anyone familiar with Yacc shou
 little trouble."
 HOMEPAGE = "http://www.gnu.org/software/bison/"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 SECTION = "devel"
 DEPENDS = "bison-native flex-native"
 
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            file://0001-Use-mapped-file-name-for-symbols.patch \
            "
-SRC_URI[sha256sum] = "e8c53bc5bc396d636622d0f25e31ca92fd53f00b09629f13ef540d564a6b31ab"
+SRC_URI[sha256sum] = "67d68ce1e22192050525643fc0a7a22297576682bef6a5c51446903f5aeef3cf"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.31.1

