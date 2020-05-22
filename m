Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.13880.1590157585331108139
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 07:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MJ8yYm2Z;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id ci21so5002770pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 07:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=SedP2y4TrLSmdRSBuF+eOoNj3gAK/VvhFGqvwqYNlN4=;
        b=MJ8yYm2ZGHwpM06fWYC5w+XlLIIMbSBzKhSGqCUZHRCD1BBUnTtmJPXrWGiBDepxt9
         E+xg/YduxTDJJmRrbUgoFLX25jQacwiLNEDKTOIYlapBowHgantcGMaY0P7FfZXyxos5
         PolFw9u8/5rZpvmVG2AzRjebf80IZv3KBZ+bhpv5GWLhRyaSOtKWfmaJZTUEMhQMMrqv
         Zs6Sxk3/Fe5MbxnlVHd9KxEPembiREcCjBCwrmyExrxk44RWBcVfS/B5ZZRuNRXfIE6g
         BYGiAkhYiLli02DkeO2eizAVbQNfE3U/6IKiOBR4Hf9uX5fXIOhwjhrn/sBsusKT2D4S
         jL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=SedP2y4TrLSmdRSBuF+eOoNj3gAK/VvhFGqvwqYNlN4=;
        b=AYmOi1iUy50ZhsO4XXHjPc40370oGjyAF2Prv/P1GgOOHHVXHEP+re48+VDDpm9NJF
         NLCqKA6+jzl5xyCyet1blD0VU6WnkpY14eL0Lfw1as9TeDm+m0L1c9yt0Lt4O662f03G
         lH2oFXPN5Gv83CFY6fyqKjh8npbJ/0+RiZJbuxjMJwYZG8tZ/HZijmwUtzTcdHqdddb0
         8kuDDd2Guuw+BGEbeEEH+kGJj3BTE1PuxBv8tCThOtOPWDG7sWzwO9LzL2hzD7r1pDtW
         8QL9ovzY+ncBmAAVSnf0kn22z4V1kAGw6Wpywj5JwOBNcIyREGC3qmHxthabBd87jYN0
         tSWQ==
X-Gm-Message-State: AOAM533ceox5Z5bgCG+Tben49Y9+wD39p25vK8GMeFEC69tio6wA/RFt
	VHdXR++T7FJWh6kmzWYCCteKRPAT
X-Google-Smtp-Source: ABdhPJzv6cOIE7PEtTFWJn/22mEDLdFa2ao99fyw0JkAFN/1PDvCxR3KnAQZ4qWovf1B1sJoUDe0GA==
X-Received: by 2002:a17:902:9695:: with SMTP id n21mr8970521plp.137.1590157584666;
        Fri, 22 May 2020 07:26:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:2019:1800:ef81:a76f])
        by smtp.gmail.com with ESMTPSA id v75sm7347763pjb.35.2020.05.22.07.26.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 07:26:23 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 2/8] python: Upgrade 2.7.17 -> 2.17.18
Date: Fri, 22 May 2020 07:26:11 -0700
Message-Id: <65ab890bbdd5b104867d80b721be117a9d269aff.1590157490.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590157490.git.akuster808@gmail.com>
References: <cover.1590157490.git.akuster808@gmail.com>

From: Adrian Bunk <bunk@stusta.de>

LICENSE checksum changed due to 2019 -> 2020 update.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python-native_2.7.17.bb => python-native_2.7.18.bb}    | 0
 meta/recipes-devtools/python/python.inc                     | 6 +++---
 .../python/{python_2.7.17.bb => python_2.7.18.bb}           | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-native_2.7.17.bb => python-native_2.7.18.bb} (100%)
 rename meta/recipes-devtools/python/{python_2.7.17.bb => python_2.7.18.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-native_2.7.17.bb b/meta/recipes-devtools/python/python-native_2.7.18.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-native_2.7.17.bb
rename to meta/recipes-devtools/python/python-native_2.7.18.bb
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index a2424a67bf..bd214e8f8b 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -5,13 +5,13 @@ SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
 INC_PR = "r1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e466242989bd33c1bd2b6a526a742498"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=203a6dbc802ee896020a47161e759642"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "b3b6d2c92f42a60667814358ab9f0cfd"
-SRC_URI[sha256sum] = "4d43f033cdbd0aa7b7023c81b0e986fd11e653b5248dac9144d508f11812ba41"
+SRC_URI[md5sum] = "fd6cc8ec0a78c44036f825e739f36e5a"
+SRC_URI[sha256sum] = "b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43"
 
 # python recipe is actually python 2.x
 # also, exclude pre-releases for both python 2.x and 3.x
diff --git a/meta/recipes-devtools/python/python_2.7.17.bb b/meta/recipes-devtools/python/python_2.7.18.bb
similarity index 100%
rename from meta/recipes-devtools/python/python_2.7.17.bb
rename to meta/recipes-devtools/python/python_2.7.18.bb
-- 
2.17.1

