Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.157182.1598109743547255558
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2020 08:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KUe1aoS6;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id u18so4441927wmc.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2020 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=czcxKYlTUuWJiZ5fFAY4ZfRO5UvSPf2vIho6bYZSaQs=;
        b=KUe1aoS6xXe1HFY77qNmeajaAqxo/rKUa3HAOsIjis9RsuIcjkOYukrjMKc17+o2Zg
         NqkSZOsrEIWSn6zE7ulir5obtHZgjEwICBiDY8oKEzscSgp6jBSwnJMfBad6O1NH5wLM
         2RpLQlkerdcUeB3eLuUty0EFr5fQiQzicYH+hNG7I8cGMVRCzK1eaEkFiGhNo3VJPFwh
         1dEi6kZaM0Xmk2sTPbgIKlWsox++6c2g1Mn5uA2K9zKIBRAwwXaJsF5Axn6hIG2UHorM
         dlfSXocN+YmMvmDEpWpnMOPZinc+kKnpFJa7gpRwc8863N7h+wyCkFeDu0/YQd2IvpG6
         ZWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=czcxKYlTUuWJiZ5fFAY4ZfRO5UvSPf2vIho6bYZSaQs=;
        b=Mt2mORG3A7ccYrwjWTrJOOfIpKRqLlDdK/xpDqntSaEzbOmwJbPkZtlR4Og1gcmQPR
         MQJqmXZQamzFxozZHiyzYY8Mzpo8cLH5/jvxiLxgDknIJPbermrCFC4NtPwBeEKoviG7
         Vl1fP0ml6WVGVVv/+EKqNGAWQE44HaHM999x4tiEYvAzy7oMNVdDf04oXqLkkQfR6Q1r
         3S/OEhhGFL0Lp7kMhx78MTpCAcbv/9NRFH0PAnoaqjf4d+D8TxdFvtmcytPygK2Go7Te
         qTHt31OqwkJGaZ3YWZ7VSdLrDmXQmL3o1ZGhCUuShoRDnSUWZio65pDm5gjNzYjxoSwH
         ilmw==
X-Gm-Message-State: AOAM532gMQJ5NXMJOdzEMevPxjOmIaoPRsU5Vtyz+EO1Kw+RIpUlZw6c
	TfAt6GtcFcSqwfWfJ3Y4vlVFM2ZrzVh4Lg==
X-Google-Smtp-Source: ABdhPJwXYbRYwp4YEawfsm7xqnuBKZjlgsgXsVYtzmngtUPwijmtwDY++ruSupD7biqnjY3aplj8pQ==
X-Received: by 2002:a1c:7e02:: with SMTP id z2mr8081181wmc.138.1598109741834;
        Sat, 22 Aug 2020 08:22:21 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id c145sm12110018wmd.7.2020.08.22.08.22.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Aug 2020 08:22:21 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [PATCH] [dunfell 3/3] libubootenv: uprev to v0.3
Date: Sat, 22 Aug 2020 17:22:07 +0200
Message-Id: <20200822152207.32161-4-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200822152207.32161-1-liu.ming50@gmail.com>
References: <20200822152207.32161-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Update libubootenv to the latest 0.3 release, which comprises the
following commits:

```
1efed83 Increase max length for device name
6f4fc1c uboot_env: Use canonicalized pathname when reading device
23b3086 Fix bug introduced by commit 52a70114
ed1a53e Dont store to device if no value changes
4a0a466 Merge pull request #7 from TomzBench/cmake-fix
6117831 Added Coverity badge
49372a1 Fix coverity #293496
69a6819 Fix coverity #293503 and #293507
258bf52 Fix coverity #293501
aa52e61 Fix coverity #293505
52a7011 Fix coverity #293504 and #293506
e822218 Fix coverity #293495 and #293497
23b305f Fix coverity #293499
25ef1f6 Add coverity setup for Travis
41b5188 fixed install for static target, fixed BUILD_DOC acknowledgement
86bd30a Restore ability to feed script file via stdin, using `-s -`.
c91dcca ubi, write: fix invalid envsize ptr to UBI_IOCVOLUP
f4b9cde Allow negative offsets
45bf92a Detect sector size if not found in config
9f59db6 uboot_env: remove unused variables
65d243e README: libubootenv is now in oe-core
ba952d0 BUG: variable lists not released in close()
690f868 Variables are not removed when loading from file
9e3586a Make sure there's no file descriptor leakage in case of error
03647c4 Check config file defines a non-zero Sector size
3b2d4f1 Check environment size from fw_env.config
879c073 Do not hardcode path for install
d9c639b libubootenv: add pkg-config support
cc628ee libuboot: wrap libuboot in extern "C" for C++
```

Also add u-boot-default-env to RRECOMMENDS since
/etc/u-boot-initial-env is being referred in libubootenv source, and
turns libubootenv's PACKAGE_ARCH to be MACHINE_ARCH since
u-boot-default-env is a machine-arch package.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 02d55cd35aac15095fc44f0cf8f9e7a71638f485)
---
 .../u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb}      | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb} (82%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
similarity index 82%
rename from meta/recipes-bsp/u-boot/libubootenv_0.2.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.bb
index ea29b668e8..47e64f9114 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
@@ -10,9 +10,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 
-PV = "0.2+git${SRCPV}"
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
-SRCREV = "f4b9cde3815abe84a98079cedd515283ea08c16b"
+SRCREV = "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
 
 S = "${WORKDIR}/git"
 
@@ -24,4 +23,8 @@ DEPENDS = "zlib"
 PROVIDES += "u-boot-fw-utils"
 RPROVIDES_${PN}-bin += "u-boot-fw-utils"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RRECOMMENDS_${PN}-bin_append_class-target = " u-boot-default-env"
+
 BBCLASSEXTEND = "native"
-- 
2.28.0

