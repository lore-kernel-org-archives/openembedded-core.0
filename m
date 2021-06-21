Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.50186.1624294985943749042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 10:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MQNgIvKo;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id e20so14710477pgg.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 10:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=okAxZVBXXXIdn4BrTN0BGs9lmkjXX3e3gcRbvRuJoPg=;
        b=MQNgIvKo/nP15m2jGXsB6FhGloax5GvfDX77XWVPbtqRR1BRP2qNbAtr5SikisFiEQ
         A7SbmU43M8Lo8ziDAnwX0bHsCW31l2lRutXFtYdiEVh5qpRf4Y2YhI1+Tv2anc+SJroC
         eMYi3cJZU+cY/8WXM2dwtaM8X5JZ+41lwXlPOiWRWp0vn8XDyChxAYhlZMbkytiCpfCE
         e01W6aWM8sH4lUpnCgD94SUETNg1k2cuXNyn15kIMXeYu0TrOrzEMppo1VHa+RdoyQyt
         Hc8rotFAseUwYTyK8VmLVmwPIMEF9oBGwMfBdmPeiXDP3l514bu9cZepQb1orTLdNwi8
         4DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=okAxZVBXXXIdn4BrTN0BGs9lmkjXX3e3gcRbvRuJoPg=;
        b=lo/LRrg6t4Wq7/4evap2dsOnQQzuKNVYeDZktEZIH1dKj0/KPH+wQPeC1Rb7/ypTev
         ll9O0OsNMQAnmLu+JC6rRc7HJ/FW0E4mUSpHvup0oahVkOG6DtT3gIp5Y+u5UOlgWT6f
         OFgt23mgaOvhc3vWsoXxvOJUtqe088DGgvEgtbcllIN7QvCMZb+vDarzy/aq59ikIfMn
         Z/fveEKITwIFg3raxnWDr3irCm4TZlaD/sQPLwP1PiqtxipF9MvbSZgv1K2Fr//tSB6t
         Oo12F12DRhd4sNhGXkTp69+e2cVDzsKOrJ0slUpjF/LaN4PPeDhY1QdnKFNYTCKxt9aw
         xGkA==
X-Gm-Message-State: AOAM5322PFnojObvsGEwsZRCiKqB1DsTpewv+yTa505JhpUgQ48CHxdF
	HDGYObyMZH+qNkqZ71Zq3zB+djUnn6JWeQ==
X-Google-Smtp-Source: ABdhPJya5cEwIFYxVx60HwiRLIm2whJCUjvYYOBPeoimH6K2HFdip9LSOqQDsUfkmxJ8eBJYgCbXtA==
X-Received: by 2002:a62:9242:0:b029:300:6fb1:38b7 with SMTP id o63-20020a6292420000b02903006fb138b7mr17089125pfd.80.1624294985258;
        Mon, 21 Jun 2021 10:03:05 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:8a50:f0aa:6cd5:a7ef])
        by smtp.gmail.com with ESMTPSA id s125sm6002868pgc.63.2021.06.21.10.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:03:04 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [RFC PATCH 04/10][dunfell] python3: upgrade 3.8.5 -> 3.8.6
Date: Mon, 21 Jun 2021 10:02:51 -0700
Message-Id: <a6e09c98f2a0037297643b74229dc3eab90675db.1624294059.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1624294059.git.timothy.t.orling@intel.com>
References: <cover.1624294059.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release Date: Sept. 24, 2020

Note: The release you're looking at is Python 3.8.6, a bugfix release for the
legacy 3.8 series. Python 3.9 is now the latest feature release series of
Python 3.

References:
https://www.python.org/downloads/release/python-386/
https://docs.python.org/release/3.8.6/whatsnew/changelog.html#changelog

License-Update: PSFv2 -> PSF-2.0 and BSD-0-Clause

Starting with Python 3.8.6, examples, recipes, and other code in
the documentation are dual licensed under the PSF License Version 2
and the Zero-Clause BSD license.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../python/{python3_3.8.5.bb => python3_3.8.6.bb}         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.8.5.bb => python3_3.8.6.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3_3.8.5.bb b/meta/recipes-devtools/python/python3_3.8.6.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.5.bb
rename to meta/recipes-devtools/python/python3_3.8.6.bb
index 21b6be58f70..bf33fce891b 100644
--- a/meta/recipes-devtools/python/python3_3.8.5.bb
+++ b/meta/recipes-devtools/python/python3_3.8.6.bb
@@ -1,10 +1,10 @@
 SUMMARY = "The Python Programming Language"
 HOMEPAGE = "http://www.python.org"
 DESCRIPTION = "Python is a programming language that lets you work more quickly and integrate your systems more effectively."
-LICENSE = "PSFv2"
+LICENSE = "PSF-2.0 & BSD-0-Clause"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=203a6dbc802ee896020a47161e759642"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=33223c9ef60c31e3f0e866cb09b65e83"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -43,8 +43,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "35b5a3d0254c1c59be9736373d429db7"
-SRC_URI[sha256sum] = "e3003ed57db17e617acb382b0cade29a248c6026b1bd8aad1f976e9af66a83b0"
+SRC_URI[md5sum] = "69e73c49eeb1a853cefd26d18c9d069d"
+SRC_URI[sha256sum] = "a9e0b79d27aa056eb9cce8d63a427b5f9bab1465dee3f942dcfdb25a82f4ab8a"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2

