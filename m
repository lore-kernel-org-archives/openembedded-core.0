Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.21126.1629923293877724926
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 13:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FsyxLt5y;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id q3so281385plx.4
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 13:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FyWD5QPRLRFv53eDRtG4IV4Zk5lHh2mLkdHo3SB0vGI=;
        b=FsyxLt5yJzMYAf58Wuvv8FN6pRcHedcpGmK7VI7LptJkYOZ2lcZzmMYUs61iP505dv
         /vOr/iXHsFqaBLssCHtVxWZ4f6FL1mJK8f4k7SJLRb5rrodhisXkUk9df4SRHr07qiok
         qU1l4ADdtXASr1dDuLOVsE0wdFzghC+esPGCo65mxoLx48nP426HpD5BnRFmW7ETiJmq
         ZgpGniyqI2KDSGEYZ76MYwEpvc11rYD2ONq71b3aBWgUf7IKul6IML6FCPsVdhLYNz3U
         3jUW3PdES+fMf/yt0ShnnC6RCPanTWVUbch1KwhnPgT8Io6NlVsemuRr57YLDyIRFrQs
         tNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FyWD5QPRLRFv53eDRtG4IV4Zk5lHh2mLkdHo3SB0vGI=;
        b=FAdeX/vc2+4lrTH/54DSMK2B2XvkQA+JFXLxR+owSR5Q18ZAdpYcpB0C1iU1osNeg8
         LRKWWoaUP3PunN1j8yYAydli9n3FRUvN5u3WswYFv4ABy+P/BXzOvigUz50eBcadl1qm
         QqwsjhW3gxxn3PAQTvpXb6CQilZNT6POR+8fpcNBI/s+T2RyV1C6kWwys33M6WLyBEko
         x0AmIOFeCnD2Kw/R9id0PaB+BegYHGkMV/p92YmgUOjWfGC/tpytQmaA5cM/xOmybFQd
         O6/7sF2Ij1WBr54qz1eibpz21IMz21nZDoo004trf8PdcLHI5CANEMIkZyO8t/jwuLRg
         BC4g==
X-Gm-Message-State: AOAM532elIo1/wNHUMMw0ci4peyZvkqzitR909AMEAJzAt/3XJ2l3SOR
	YOXDMmqZdZ4es4zuuPkfF7t5OA9NAUA=
X-Google-Smtp-Source: ABdhPJx5wPOVXECj+fnSHdjHevWC9T2dmISH0TqlbdNJ7Ovll07QxrLbLt1ibOoPeM20tPh2d7lQTA==
X-Received: by 2002:a17:90a:86cc:: with SMTP id y12mr12670674pjv.127.1629923293048;
        Wed, 25 Aug 2021 13:28:13 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::47f3])
        by smtp.gmail.com with ESMTPSA id g10sm535859pfh.120.2021.08.25.13.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 13:28:12 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH] python3-pluggy: upgrade 0.13.1 -> 1.0.0
Date: Wed, 25 Aug 2021 20:28:05 +0000
Message-Id: <20210825202805.714379-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* All ptests pass on qemux86-64

pluggy 1.0.0 (2021-08-25)

Deprecations and Removals

    #116: Remove deprecated implprefix support. Decorate hook
	  implementations using an instance of HookimplMarker instead.
The deprecation was announced in release 0.7.0.
    #120: Remove the deprecated proc argument to call_historic. Use
	  result_callback instead, which has the same behavior. The
deprecation was announced in release 0.7.0.
    #265: Remove the _Result.result property. Use _Result.get_result()
	  instead. Note that unlike result, get_result() raises the
exception if the hook raised. The deprecation was announced in release
0.6.0.
    #267: Remove official support for Python 3.4.
    #272: Dropped support for Python 2. Continue to use pluggy 0.13.x
	  for Python 2 support.
    #308: Remove official support for Python 3.5.
    #313: The internal pluggy.callers, pluggy.manager and pluggy.hooks
	  are now explicitly marked private by a _ prefix (e.g.
pluggy._callers). Only API exported by the top-level pluggy module is
considered public.
    #59: Remove legacy __multicall__ recursive hook calling system. The
	 deprecation was announced in release 0.5.0.

Features

    #282: When registering a hookimpl which is declared as
	  hookwrapper=True but whose function is not a generator
function, a PluggyValidationError exception is now raised.

    Previously this problem would cause an error only later, when
calling the hook.

    In the unlikely case that you have a hookwrapper that returns a
generator instead of yielding directly, for example:

    def my_hook_real_implementation(arg):
        print("before")
        yield
        print("after")

    @hookimpl(hookwrapper=True)
    def my_hook(arg):
        return my_hook_implementation(arg)

    change it to use yield from instead:

    @hookimpl(hookwrapper=True)
    def my_hook(arg):
        yield from my_hook_implementation(arg)

    #309: Add official support for Python 3.9.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../{python3-pluggy_0.13.1.bb => python3-pluggy_1.0.0.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pluggy_0.13.1.bb => python3-pluggy_1.0.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb b/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pluggy_0.13.1.bb
rename to meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
index 479c10fcdc..14a7ccb0b0 100644
--- a/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pluggy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
 
-SRC_URI[md5sum] = "7f610e28b8b34487336b585a3dfb803d"
-SRC_URI[sha256sum] = "15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0"
+SRC_URI[sha256sum] = "4224373bacce55f955a878bf9cfa763c1e360858e330072059e10bad68531159"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS:${PN} += "${PYTHON_PN}-importlib-metadata \
-- 
2.30.2

