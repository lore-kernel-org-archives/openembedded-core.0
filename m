Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.13546.1591370977987489835
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 08:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=prnIxRmL;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a25so10561437ejg.5
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2020 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XaCIarl5TbWpzFMR925QdE6IPJhdQAOHG21p0r3nAGY=;
        b=prnIxRmLK8y3M6G+1vICSSi7eYx4Ch9PeuH/1JkBsyw/zfpZRjHDDsVJD4zDP691+u
         2eChwvKdv+oiUECm+A6HoEmD/1/IblpPxN4SBQH238BhLJPOGcfd8KWeSiGpHJM1LZcV
         xb51zYIhW8hxcBb0mc3TerQzMZC3e3gjOxQJY2O2tewL3jDoXzsgf1ajXSpwcrlQfcjq
         H2SDOq8WAk7OCrSP1YYth2fALTR08LliheS+Gprykv4fusKmCar3EqoPME6HMnW7nU4t
         56ObKsWcZtcsg/9QsZiVxuc0OKvB8hnSSQHVJjMu8clWAwCgyOup/MPSdyct4M+VaJW7
         518g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XaCIarl5TbWpzFMR925QdE6IPJhdQAOHG21p0r3nAGY=;
        b=PWw31y/Ec2kxNJ0VJPZO8lqla5XxSpSgCBhoPs37tpqaYDO+wWzK+1mJR7Ncyux2lK
         iL/mg3k7FVhLYFf+IHL2f35YehPbtPLnUhM8S5Mpbc2Utf/PJLUL1uEAZkeBjDaAiuSF
         qSU6MVAzBZJC4qLEIwvt7FmoTwKZHHOJpELkghVrc3rNxCdMH+9pc1CNkJBEuy36u1an
         lE4nsX6le5YhErzAsAARPxVxnuSRA7pn3pKEf0ip3EX7qT3rKdkJsJLh/HYiP+E9N47q
         MKcTpCJrXG+QZuSGZdhRFmSz3vdP8Yepb7YCVfJPt5hrLP5LBQbEw4zol+pNTH79vsyU
         Kf9A==
X-Gm-Message-State: AOAM530qVaYwZT8CbUBnmH3QhYMRMFufAJ9SAB9pVOTayTnzvebpV7Sg
	iihsoNLzTlbOfjnzp43PUj8aBXXPM7k=
X-Google-Smtp-Source: ABdhPJzOE6I1Up2u4lBaMrEpCbHulKmKSKJJy7UrKxg/T8LbzdlWaZozeps2mqK8eYPO86jThuSd+g==
X-Received: by 2002:a17:906:aad8:: with SMTP id kt24mr9087846ejb.527.1591370975976;
        Fri, 05 Jun 2020 08:29:35 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0816493dd1634773746530.dip0.t-ipconnect.de. [2003:f0:7f08:1649:3dd1:6347:7374:6530])
        by smtp.gmail.com with ESMTPSA id o12sm5189609edq.7.2020.06.05.08.29.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 08:29:35 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] vte: tiny cleanup / renumber patch
Date: Fri,  5 Jun 2020 17:29:24 +0200
Message-Id: <20200605152927.3428858-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ... => 0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch} | 0
 meta/recipes-support/vte/vte_0.60.2.bb                        | 4 +---
 2 files changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-support/vte/vte/{0002-Add-W_EXITCODE-macro-for-non-glibc-systems.patch => 0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch} (100%)

diff --git a/meta/recipes-support/vte/vte/0002-Add-W_EXITCODE-macro-for-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
similarity index 100%
rename from meta/recipes-support/vte/vte/0002-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
rename to meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
diff --git a/meta/recipes-support/vte/vte_0.60.2.bb b/meta/recipes-support/vte/vte_0.60.2.bb
index 8c7054913f..571fdeba9e 100644
--- a/meta/recipes-support/vte/vte_0.60.2.bb
+++ b/meta/recipes-support/vte/vte_0.60.2.bb
@@ -17,9 +17,7 @@ GIR_MESON_OPTION = 'gir'
 inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-introspection
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
-SRC_URI += " \
-            file://0002-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
-           "
+SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
 SRC_URI[archive.md5sum] = "1a0b5395915d2f3c88484511b38cc584"
 SRC_URI[archive.sha256sum] = "35a0280e3f12feeb3096da05699191373c47a4a20c55cb7081e828e6015f8ca5"
 
-- 
2.26.2

