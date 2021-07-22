Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.1194.1626993918830573846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 15:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tl/mHJPQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 9-20020a05600c26c9b02901e44e9caa2aso516786wmv.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 15:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yKfdsH+sETKnk6sacZKh6Z+RzYpZy4uDpdVc4AUd+pM=;
        b=Tl/mHJPQg3oGkcq12iuIu1bfO/RP6FnfL+ZdeQin7leKuaWETqduc+/QUxXNhfYlku
         OwH63q0kHDVb+DsA3SV17GpnVIQU+tdVCdbU79FN2iisGaJc5Yi9FxNZopptjExr/UVI
         brRalOPGRFmj7j60ylq62eBh/SRBIWyjn2bQfq4BqDIrb3kl3W6a8xTHMdEwO0baJQT/
         lE1vPcxM2GJHzGi8DEdJGuoLDFx95PmVSeh/RGT4boDK6JIkeolcfRcKs6vbGhn4D5QK
         UBnwBwrx7h0HElJHjQ0rXphiKPb1QQBElPLLnNQiZSP1kGCon3KCEGQ/B9FPxBLRqVVq
         K8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yKfdsH+sETKnk6sacZKh6Z+RzYpZy4uDpdVc4AUd+pM=;
        b=Yy2Jd/lWlsnaGK1K2Nz7Edb9r5Szr7QS8TeouBPjHgPZDH3fcskyDwTZvmbfa3Q6e+
         fjrpYg/zXK1Hkn6VK0xKKAm2K9tWZ3d0cufDJX/OaxNge0XJrMOyFVfIdx5559a1EMYR
         jrdMVUDeS3JyBdv1uhTFyOrpRP87+KnnhJg78+fxN/ris/XbGEYgYIii+0kI0Rzt/tmE
         sl2sTLXqkxss/rxjnalTLmIJH0K8XLmpPgkbjFgOgRj/rzSNqMv/cL075N/3RjkdNT/b
         XmGTQ4cIFMyfs1c6ypTzqJIAdNsMLCaOryn/g9ZTu2ZCvbzSkSB8a4PoSG+lkoH2mSWK
         wUMw==
X-Gm-Message-State: AOAM5310Ef9W34KpO7D3Upgl1n2h/5aqdZASynfJkddKmlorWI9KQU1K
	Xny8vd46OkAgLL4d3Gm+SOVgzfhZsYJaOA==
X-Google-Smtp-Source: ABdhPJyAJmaHdzWJaPjfh5M3DMQvuGdEosOpZ0H9IM8uu7uE/SKzmk9TZaiS8bqyemfVMZxBqnb21Q==
X-Received: by 2002:a1c:62c4:: with SMTP id w187mr1652099wmb.27.1626993917416;
        Thu, 22 Jul 2021 15:45:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n5sm24337739wrp.80.2021.07.22.15.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 15:45:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 7/8] gnu-config: update to latest revision
Date: Fri, 23 Jul 2021 00:45:07 +0200
Message-Id: <20210722224508.51967-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722224508.51967-1-alex.kanavin@gmail.com>
References: <20210722224508.51967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust lines in license check; checksum is same.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 420363415c..6e4435be2c 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a direc
 HOMEPAGE = "https://git.savannah.gnu.org/cgit/config.git"
 SECTION = "devel"
 LICENSE = "GPL-3.0-with-autoconf-exception"
-LIC_FILES_CHKSUM = "file://config.guess;beginline=7;endline=27;md5=b75d42f59f706ea56d6a8e00216fca6a"
+LIC_FILES_CHKSUM = "file://config.guess;beginline=9;endline=29;md5=b75d42f59f706ea56d6a8e00216fca6a"
 
 DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "4550d2f15b3a7ce2451c1f29500b9339430c877f"
-PV = "20210620+git${SRCPV}"
+SRCREV = "805517123cbfe33d17c989a18e78c5789fab0437"
+PV = "20210722+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.31.1

