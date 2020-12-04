Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.20409.1607112476419709497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KIYt03P8;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id f23so10467003ejk.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=th0xRJS8agch+AZannnUCC1E2x2q/93sSn19G1K4nik=;
        b=KIYt03P8AngqSafUR9+xVW5uGfTbt9tzEfydeA4OUGf9sCVH5CtoNFg4lwZD7gFyCG
         G2mtU2DmGIzo7G6lgIOWSeM6DOiPTFBRGBkVW+jto/Q5a9spJZDOW6q4g8Y1D+tYarAL
         ktcnUg/loxEsSrBVRz1eMVKMfTYRDkbLydFQhKBqsDli1r03l1DJvojUx3izy2s9srAe
         oEh84UOIug5UmeLZhxavMHvEqFB1rVw9tPgRJQSJ6doKBWGtphe9MbvJHuG7RRg8KoIV
         fBDApPyU0csvHKwEiggpgOhYK7R2pt9+0hOgXFqKpAzE53HSwhovYVFQD4f2C55wlt0p
         zv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=th0xRJS8agch+AZannnUCC1E2x2q/93sSn19G1K4nik=;
        b=YDeK25Vl/6JtKNfgYEquZPiVJ1eLt7LeAXIfc7CjTZ8PSTZloSyLks0sos4bBmndQY
         NYxoF3ga94d+CZoVjOSbsrEwSkHgsAUwSBLwQasXn+dalKe03R1WJMXaMTmaUoPT7Mg3
         VzrsHbu3ZCtBSMWYYB2C+UZm0weMaX/pQmRslr0djfs37nfHBggNjzgG7u1PA3t2I47V
         rTQUjykuZcHerb7AN4ps8L3rkjQySlFUi2JLixMFDmearU29LhEPhp6oiKhiPR2anFbM
         zB6yGnqbCRJ1ui9FH8w9/u8jbWwdD0/EzYD1xgtjStYbIWLpLqIu+63Xv78p8ve/1Xzx
         /7Ng==
X-Gm-Message-State: AOAM532FpQj6Ff459a7LnlmZIdo1XXwkCsGcuecLAKJBQj5hxVRmd4tS
	DO4r6ILYzhso/s+tIerZTa7lnGDvcz+VEA==
X-Google-Smtp-Source: ABdhPJxJQbiAVh8m3gfMG5DE0NOtDNG33enAkCn+y6+TDtKMw10z943zBjlQZPcy6pR7172+CcYLyQ==
X-Received: by 2002:a17:906:f1cc:: with SMTP id gx12mr8402903ejb.164.1607112474725;
        Fri, 04 Dec 2020 12:07:54 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:54 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/23] createrepo-c: upgrade 0.16.1 -> 0.16.2
Date: Fri,  4 Dec 2020 21:07:24 +0100
Message-Id: <20201204200737.7072-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.16.1.bb => createrepo-c_0.16.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.16.1.bb => createrepo-c_0.16.2.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb
index 942741023f..2b552a4cdf 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "634141eaefe0cc87466dfb91b07b64facce4384b"
+SRCREV = "031f0524905c2a64a2faae555ca9d91281448d1b"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

