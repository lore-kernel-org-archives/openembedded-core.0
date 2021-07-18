Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.18101.1626635584092492004
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 12:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VLUDHk/c;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id c1so10498720pfc.13
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gnHiHdOzZy7Kxs1wk2lcp7aLwfEREKf40Qtq+U1scqY=;
        b=VLUDHk/c5twDi27uWHyVp0XqUkJOebOxhZY/zf7lKhSmGXD7QPm8cquEZiFwrhMwPB
         05cuzbTg6o9HIP1K7ymvqTca5aSCsCQ7kvvSvMDTlHd6z9dhg+YXOZ0M9QmlIPGGcb4+
         83s3x+tWESgtukj3ziMJdg9cbwaTcERJJ4Ovqj7gYlxapuKxK1VMAwskD0GnbPcDbk1z
         24qDB0QhMQoecmCL4SOStfK/errM+HUtNeN3tCPkdEPqJpYdEkEbJwp6+MmOAMdB+kL1
         /R8DE4akx56SLvPv6ETaONW2oc9GPdBdz/I8LK1/6skOBOIja5BtDX/D/8UB94iwEGVt
         NKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gnHiHdOzZy7Kxs1wk2lcp7aLwfEREKf40Qtq+U1scqY=;
        b=V0x3zUijXdGTwju6yF6qHvCCseKUxXUV1v8csAYY6DTvQu5npbqTOs/ITzBnOhPGNF
         201l67bHnAzYBY6XE++jQ/AocDeAyhM60r2A1afVmsYbn+oJ67R6o2Dv/6w/zYZ6kFMH
         q+cpCtOjNVvW3qLH61+Q6K4LGLp2qbccNI4wdt6//PeF4tZ1wjmUYkWQCQiXiT9/tYwe
         1YP6Fyp2lZVpd3Zdf3g0GKzDACsNIp78jLeHZa5NGDLkthsezy02FyAhGRUAQaT+MNhM
         ME+bx2r9w/TtroNn7zJpGBpBq7X5FM+Ujk11LKsedPDKSI/CJJYBB/5wvy+UiRlq3e09
         n18A==
X-Gm-Message-State: AOAM533TQ/8LeSoPZUI0E5oJ8+TKGBZF2DUL+DHWhzCSNmWu6ph0BsTV
	1unoUYr6LgWy+NctS3RThd+VJuFeIcsSfw==
X-Google-Smtp-Source: ABdhPJy1Yzg3KtXDEByd6TDGXVQGR+CF+w09M+UHhOhBsrKXiUwRL+RSyVPRCfhwTD2x99bbv2dJ2Q==
X-Received: by 2002:a65:6a4d:: with SMTP id o13mr21508765pgu.361.1626635583237;
        Sun, 18 Jul 2021 12:13:03 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830:3617:ebff:febd:134b])
        by smtp.gmail.com with ESMTPSA id j12sm16398051pfj.208.2021.07.18.12.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 12:13:02 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH] python3-hypothesis: upgrade 6.14.1 -> 6.14.3
Date: Sun, 18 Jul 2021 19:12:54 +0000
Message-Id: <20210718191254.3229158-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

6.14.3 - 2021-07-18
This patch updates our autoformatting tools, improving our code style
without any API changes.

6.14.2 - 2021-07-12
This patch ensures that we shorten tracebacks for tests which fail due
to inconsistent data generation between runs (i.e. raise Flaky).

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...ython3-hypothesis_6.14.1.bb => python3-hypothesis_6.14.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.14.1.bb => python3-hypothesis_6.14.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.14.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.14.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hypothesis_6.14.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.14.3.bb
index 61598c3a16..83c9917a04 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.14.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.14.3.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "88b0736a5691b68b8e16a4b7ee8e4c8596810c5a20989ea5b5f64870a7c25740"
+SRC_URI[sha256sum] = "1c8776d9fc8c598cf1b93b99bd87976f9d9b589fc58843d85a30090700f14a8a"
 
 RDEPENDS_${PN} += " \
     python3-attrs \
-- 
2.30.2

