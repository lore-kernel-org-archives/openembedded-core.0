Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5DECA0EFA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 06:45:49 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.3239.1755758739855272254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 23:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VY79QFnh;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-24458263458so6240915ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 23:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755758739; x=1756363539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iQv02zNs012iJqYv8lpLKS3vZvlE+KdrjKKkXyVDGU=;
        b=VY79QFnhAAZEDGcnhKdi+TFeWKQkNrTYEDlV8NnFD0wGbGsc+cGtZacFfmT9dptvJE
         NcFluECTYl8YjsvhbtR6xDQ1KTpoJmgMyMGLFL+oyvD/w1g49eX3kbh0k5A72GFmD8Aq
         +FZ3X0s6xVX0gUIlJMLz5aBLt9LoXKLOeWcs5iRXohmEiHUCBPC0ofZoXI1nKfZkfSxu
         mkw6SqSvN2vZnaKzP7f4mHi95ztmCOAOe5lMxqU4LHPFXcYO29QfxRbLQjvNeHxOyuLE
         Gyf3N6SuV7pR6zRIvjWaGqKWowCOl2JgvfGHq7cgJc5JnUBwaH1IVrHpKi67aln5IVE6
         CLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755758739; x=1756363539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iQv02zNs012iJqYv8lpLKS3vZvlE+KdrjKKkXyVDGU=;
        b=lmiWA/smEvliRK3kDo/FHjpauxpiZX/av0jFW2spMuWNTbOPQZV16YOMm+o/jZ4qJU
         Jlrm/jM2MXO+ObJv6vBTLV7AdTLo4LJnOY7jN5fjrnZVjscS3sLpgZwKr2XLV98pZh0s
         77c9Fd2lGM+ZuF1scgjBH6v+wFyLoaWRYgz7uvGeIQy3PITgLW0WrDN11AwVOUWpaV1F
         rKMYvNAq1yBXy7LkIca7GPSXUlkkKc9yVBy7SSstqsnb2QOqck8YuHFXMHXxQ8s6gNvR
         qofi5Wl6WoCg4kV8jX2Yk3h4uE+kw77aIqRriXKaMT0mYsronY940X1/4ijwk6rW/Chp
         bhLQ==
X-Gm-Message-State: AOJu0YxmZvZndHrqYLdKJykSx+NPXSzZrlV1/BuZdjmkHFKJzb2diK1F
	tqcI6n37v1I/MMXHw61m2Yoot/UexiOHiNoXuvymSVAVMI5Q25ULsHOTl1HRD8I/
X-Gm-Gg: ASbGncu0tlH+iqZOX3UHNdVzROMOQ1E8g5he2k7HP9ZfJDcaelIR2Jkaoe5+xT/sCjg
	LWBHbOK20TBl/TmW9pdefuzLMU2FfpDPCpnh9CU6/WpxMj8eNf/rn2CcT0H4O+bfcNErnL1bs/C
	2oWArLA+HdhqkEN22h1+QOnCVtDB6Gxuzpxa1YiLadCB/DCMPHVyrBHyurcExt+SG3qJCtwzRDD
	CFWuqLPGCKJ5oQvjzMSsj0qpm8hnkY5y1uqS/8b1Xh8GzxmScE1QYKffY3Alv9tHDcqGuyUKnPa
	25D+QCEa0EnLjyASY09fcYa8YLAwU34xjHUy5AH3qXIR2edoEVcSN+GGIW4BDpRQ6zeMOD8hFOw
	9lSLUEyBkBs+2qTZ3EL0aP3wmMSj2Z6XO
X-Google-Smtp-Source: AGHT+IG8lIrWGrX4TCcEtaUthTVDUe6HLIj1/ckLv+SzZ5STv8Uxwmee+izvKYEeY6nE/8Rw1eSFqA==
X-Received: by 2002:a17:902:c408:b0:243:6d9:aa2e with SMTP id d9443c01a7336-245ff87bd23mr18085685ad.53.1755758738934;
        Wed, 20 Aug 2025 23:45:38 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35d778sm45876685ad.49.2025.08.20.23.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:45:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 8/9] python3: Pass PLATFORM_TRIPLET explicitly when cross compiling
Date: Wed, 20 Aug 2025 23:45:25 -0700
Message-ID: <20250821064528.754633-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821064528.754633-1-raj.khem@gmail.com>
References: <20250821064528.754633-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 06:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222216

Do not rely on how python detects the platform triplet

We have been lucky to get it cross-compiling since our build hosts
are also using glibc, so the headers and gcc install locations match
and the values it detects are mostly what we will need for glibc
based targets, but when we use musl e.g. the problems show up where
python3 is not able to automitically discover python modules so any
python package having compiled .so modules fail to load.

Example is ptest failures with TCLIBC = "musl"
and running core-image-ptest-python3-rpds-py

This is revamp of patch [1], currently its working for glibc
based cross-compiling because we build on linux systems which are also
glibc based, but python on musl shows the problem.
When python was upgraded to 3.12 [2], this patch was wrongly dropped
and sadly regression went unnoticed, without this patch
Python's automatic module discovery does not work when it is cross-compiled
this is because it tries host tools and compiler installation during configure
to detect it. .so modules e.g. modulename.cpython-*.so are not seen as a result.

This is seen when running python3-rpds-py ptests where it should load
rpds.cpython-313-x86_64-linux-musl.so rpds.so but it does not and the module test
fail.

root@qemux86-64:/usr/lib/python3-rpds-py/ptest# python3 -c "
 import sysconfig
 import importlib.machinery
 print('Extension suffixes:', importlib.machinery.EXTENSION_SUFFIXES)
 print('Soabi:', sysconfig.get_config_var('SOABI'))
 print('Ext suffix:', sysconfig.get_config_var('EXT_SUFFIX'))
 print('Module suffix:', sysconfig.get_config_var('SO'))
 "
Extension suffixes: ['.cpython-313.so', '.abi3.so', '.so']
Soabi: cpython-313
Ext suffix: .cpython-313.so
Module suffix: None

And after fix it is.

root@qemux86-64:~# python3 -c "
 import sysconfig
 import importlib.machinery
 print('Extension suffixes:', importlib.machinery.EXTENSION_SUFFIXES)
 print('Soabi:', sysconfig.get_config_var('SOABI'))
 print('Ext suffix:', sysconfig.get_config_var('EXT_SUFFIX'))
 print('Module suffix:', sysconfig.get_config_var('SO'))
 "
Extension suffixes: ['.cpython-313-x86_64-linux-musl.so', '.abi3.so', '.so']
Soabi: cpython-313-x86_64-linux-musl
Ext suffix: .cpython-313-x86_64-linux-musl.so
Module suffix: None

[1] https://git.openembedded.org/openembedded-core/commit/?id=407744b00d702e3133304e1b43064a5634ca02cf
[2] https://git.openembedded.org/openembedded-core/commit/?id=716d82352545d3667a658b69d65d6127678dd150

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3_3.13.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.7.bb b/meta/recipes-devtools/python/python3_3.13.7.bb
index e9eb6109490..81d034bec6b 100644
--- a/meta/recipes-devtools/python/python3_3.13.7.bb
+++ b/meta/recipes-devtools/python/python3_3.13.7.bb
@@ -86,7 +86,7 @@ DEPENDS:append:class-nativesdk = " python3-native"
 
 EXTRA_OECONF = " --without-ensurepip --enable-shared --with-platlibdir=${baselib} --with-system-expat"
 EXTRA_OECONF:append:class-native = " --bindir=${bindir}/${PN}"
-EXTRA_OECONF:append:class-target = " --with-build-python=nativepython3"
+EXTRA_OECONF:append:class-target = " --with-build-python=nativepython3 PLATFORM_TRIPLET=${HOST_ARCH}-${HOST_OS}"
 EXTRA_OECONF:append:class-nativesdk = " --with-build-python=nativepython3"
 
 export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"

