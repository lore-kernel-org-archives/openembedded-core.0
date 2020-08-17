Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.39931.1597656792392347873
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 02:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W5dRtowD;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id y2so7684903ljc.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 02:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tyYoenlcVPztmc/u85djQ1QNIuRMKwYOLb4K2wr+kbk=;
        b=W5dRtowDAVBpZSG458m1P3BUzmCL7THkBkGcDBqPNKKdd4hMkWZoTO1gPkC6WCywSR
         eDkpJeowWc6sXMymupo4GGwV3PbLf+u11re4J3y1/OoLHstvU/eUP4gu2aRMnuWk0TOO
         HioqFxWW+i71jHaLHZp4FXCNpPBXeLRRd+fDP3LatlCxuoz8vv3uehZwZn/9Z0qz68Qm
         G5etAk3JYpKI64jlFP74US4hXV5OIDFYbeYFGuveFG9Eu2t6dBRgH+DR0o7WSxmO3Cqv
         5fjLd+I186JC+/dwnOGMSSYBC1r5PLGpqgt5sPHmzqjVA8jV9bL3yP3Yl+0VOd8tsLgg
         ow+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tyYoenlcVPztmc/u85djQ1QNIuRMKwYOLb4K2wr+kbk=;
        b=A/c/6mUMpEvMYQbIYAozhkOmhgSzqyzKp/pFx42qQEkI50/A45cO1+GhCbNiwE2kWH
         OLA3DjlAUeTVVyloSnAY+XJSyQFNhxgDuJVQFH+2pTfLWgnYCd9DlseIz4FZk1w1/r4j
         MAPrf6mvCt9BjJHPiouKP5r1dHB/0GrVXr1S/XuqHruUrOERyG3P/OiX7kjqVgdT3Sbo
         zkx1guJQi0PjJz8vLtedQfQA4Sf3BRwgeve+pBlM+5I73ycNzNxSGZ3bjYX7w2o3LViI
         tBEPO/pf/QJV8uskeCHRCnMhiJnT3pHLMyW1i285L4uMTTHpLEcaFFYmvVq19qLx+NTR
         MU8A==
X-Gm-Message-State: AOAM530drZcxFcopEICv+eI7UeIDcEXqFYp7H4U1OEa60P2dxXOJMuww
	nZt8h3+MFvhLAedmmGj73cKW2Dnsw4XzwA==
X-Google-Smtp-Source: ABdhPJyI6jC7gewS7pY4Gwmky+HHF7UTBjmROz4E97z9pG9fy9UmL0YieKr2QvhARWDY6xyiaw1oKg==
X-Received: by 2002:a2e:a549:: with SMTP id e9mr6495474ljn.94.1597656790497;
        Mon, 17 Aug 2020 02:33:10 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id u20sm4980097ljd.135.2020.08.17.02.33.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 02:33:10 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V4 3/3] libubootenv: uprev to v0.3
Date: Mon, 17 Aug 2020 11:32:56 +0200
Message-Id: <20200817093256.21644-4-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817093256.21644-1-liu.ming50@gmail.com>
References: <20200817093256.21644-1-liu.ming50@gmail.com>
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
---
 .../u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb}      | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb} (82%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
similarity index 82%
rename from meta/recipes-bsp/u-boot/libubootenv_0.2.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.bb
index 3820ba262e..47e64f9114 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
@@ -10,9 +10,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 
-PV = "0.2+git${SRCPV}"
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
-SRCREV = "86bd30a14e153a18f670b25708795253d8736f0f"
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

