Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.17496.1590940416739253459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bOTYQMYV;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id s19so5390514edt.12
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kjRKhb3cVCwxJ0HDCyAW8bjTZZ0KHAD0MsyBS3m+wEU=;
        b=bOTYQMYVQydiTeb/g4YsDIQVsXprmJ+BzdfpdTgZtGYTQQ8bkSYOouODM1pGKZ0V+h
         lBpCnLs+F36e4GHQ0/pU7hFKTQ4yrx1cXD/NM+4rNokJ30U25Ba3LhPidf0uoFqrRhOg
         mcTds7Yz2/uO76KQtrKXvNs5i3hLm0Pk7TfZXsBTFpgLfiTNDCrwkXdo80rQTvL9aSZm
         D9WQgNWhRnJGuHuDUiA2DilBsQXP/nnscN23jnCqwo8jdwVAusdQFI/dqYsYm1LUT9Ni
         TMdVkAegb4QlGhiIvmsOOkFiukjEKNGoENZUXuXMkYvQ+bl/TNhrRP5F/PM6ij2SWLHB
         HcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kjRKhb3cVCwxJ0HDCyAW8bjTZZ0KHAD0MsyBS3m+wEU=;
        b=k2SFEpiwtZk1Ipnx66lM6rWKT66lFsIvtoiQs33oGrw51itr9frw9rfPrzWTVxry/9
         Bn4bw+H/UVjIszhyr3+7Pd6VGy1Up+wr1WnpHLVRcihZQt9MESrc/vDHgbnWwZlBYh/D
         qWgb+6HM0bIuihXvLdVyagAWWC9raumnzUv+HNKXaEtEgAkLufsutH/gS3/Id4IaywKh
         T2Nw3/CZViI9JfVc5gm3LPcuuLO/qyTMP8tStTBX98JRBd945ahWNMB5onfSVKJkgQJh
         SABCI71zpZqwICKjcCueWnTW5cGSn8wI0J40NVzquUFsp9/5+w79FP08XmfpYFTCQPWS
         KmxQ==
X-Gm-Message-State: AOAM533efRBIFwue0ypQpRyL0ekp4w9dR8EXjPUMCm7cFHD7u7rJ0kZu
	2iyM1ZXTaD6RTV6PNbkCBb7QM0Vh
X-Google-Smtp-Source: ABdhPJyZQQRXEkp+nEf0Rev5CQwEagipTbM3JJWdnL3hXZ8UF/taQ/jhBAOjkTtqPCt0hNeN77alYQ==
X-Received: by 2002:a05:6402:3106:: with SMTP id dc6mr17353933edb.19.1590940415162;
        Sun, 31 May 2020 08:53:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/70] python3-gitdb: upgrade 4.0.4 -> 4.0.5
Date: Sun, 31 May 2020 17:51:53 +0200
Message-Id: <20200531155254.10283-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-gitdb.inc       | 2 +-
 meta/recipes-devtools/python/python3-gitdb_4.0.4.bb | 3 ---
 meta/recipes-devtools/python/python3-gitdb_4.0.5.bb | 4 ++++
 3 files changed, 5 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-gitdb_4.0.4.bb
 create mode 100644 meta/recipes-devtools/python/python3-gitdb_4.0.5.bb

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index a91bb32c3b..618d85ff8d 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -8,7 +8,7 @@ inherit pypi
 
 PYPI_PACKAGE = "gitdb"
 
-SRC_URI[sha256sum] = "6f0ecd46f99bb4874e5678d628c3a198e2b4ef38daea2756a2bfd8df7dd5c1a5"
+SRC_URI[sha256sum] = "c9e1f2d0db7ddb9a704c2a0217be31214e91a4fe1dea1efad19ae42ba0c285c9"
 
 DEPENDS = "${PYTHON_PN}-async ${PYTHON_PN}-setuptools-native ${PYTHON_PN}-smmap"
 
diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.4.bb b/meta/recipes-devtools/python/python3-gitdb_4.0.4.bb
deleted file mode 100644
index 2dcd9c8aff..0000000000
--- a/meta/recipes-devtools/python/python3-gitdb_4.0.4.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools3
-require python-gitdb.inc
-
diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.5.bb b/meta/recipes-devtools/python/python3-gitdb_4.0.5.bb
new file mode 100644
index 0000000000..fe56bf9640
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-gitdb_4.0.5.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-gitdb.inc
+
+SRC_URI[md5sum] = "0e2d3f34efece5deda7c55fede6507cc"
-- 
2.26.2

