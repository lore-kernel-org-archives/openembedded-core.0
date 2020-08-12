Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.13520.1597234646113296415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 05:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IpmzZLXh;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id t14so1722154wmi.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 05:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ur7922qb9hzIM+J3+1VwGrYUqjBZy3Svxd1F8avtkyI=;
        b=IpmzZLXhEMI0VDO/YMD/AodrPeImzTuM7TxD2SW43Wf0BExqsZXP2nXotgguRF0R0t
         pr6KW3P+n0Ty0sufJ+CKOQt5q8dMVWntFJ0wAoht7JpVnM1gyimy4Z5gbYC9c4LUx3um
         F+a6SKikrkwTgid8evZA5/VEgtXPYwnS1sZz/3m5YWFMcHP6zzCn9+vAbr07Lulnc+nj
         QYS5oGSn0eclG78fY1yqT4AwwFqjCWahXczUIj6dlZ+rvZOjqV4sS5jsCENE0hsJw+mp
         9CmoSBHsznTRireLEpJIMh7ySubGgB/CEMEMFSmycaLOpB4TyW/bySH0Pp3jb456QGe6
         uu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ur7922qb9hzIM+J3+1VwGrYUqjBZy3Svxd1F8avtkyI=;
        b=AMNMR12q2aEtQFD4gmXNLancxsRGaievxWGs6wh6Si67B0PN1hm3EnKlnu4OQaFXRl
         t/+7/7CBHZSPv/9+0+WVIPW1s5QT48Suj4pwpPRZ0oFiUIe1IG6aFZvfy/DhOdJvJeiY
         xHjMoYN9CHyrfm3WudzqnGmsGEK4EozYS030gtkoM2XlDLCv+CuMkh06SCSJ6RziccRw
         4ZKacxRSBCon9xXq8t/GTqulNfjHQXk/3BP5/KKwvBCkF5KaPp+URMIrhbL9e82Gm7Qh
         8fmrNaGtKgelIjWL73wZANAUyP4UyAPyM8z3luaYeHWS0lD/uSlXvIKjgMFt7sE9IGyJ
         7INA==
X-Gm-Message-State: AOAM531+Uox7/LVuJRudna6hTgEXWK9NEanyCtw+gRqIBqkstooscVaj
	NNm7l/cMYi61vvHsSFWQ79SF2puWdeQ=
X-Google-Smtp-Source: ABdhPJwrUHwqrK7UhpPUBBGxnKhUYcMHi/0QHzcrJeDkbqZxNMJccRoq1Hv8gOchUmArNuGt+9kBqA==
X-Received: by 2002:a1c:e10a:: with SMTP id y10mr8071676wmg.1.1597234644416;
        Wed, 12 Aug 2020 05:17:24 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id 69sm3808438wmb.8.2020.08.12.05.17.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Aug 2020 05:17:23 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] libubootenv: uprev to v0.3
Date: Wed, 12 Aug 2020 14:17:15 +0200
Message-Id: <20200812121715.10548-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
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

Also change it to be a git recipe, and add u-boot-default-env to
RRECOMMENDS since /etc/u-boot-initial-env is being referred in
libubootenv source.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../u-boot/{libubootenv_0.2.bb => libubootenv_git.bb}       | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb => libubootenv_git.bb} (84%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_git.bb
similarity index 84%
rename from meta/recipes-bsp/u-boot/libubootenv_0.2.bb
rename to meta/recipes-bsp/u-boot/libubootenv_git.bb
index 3820ba262e..59b9703d61 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_git.bb
@@ -10,9 +10,9 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 
-PV = "0.2+git${SRCPV}"
+PV = "0.3+git${SRCPV}"
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
-SRCREV = "86bd30a14e153a18f670b25708795253d8736f0f"
+SRCREV = "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
 
 S = "${WORKDIR}/git"
 
@@ -24,4 +24,6 @@ DEPENDS = "zlib"
 PROVIDES += "u-boot-fw-utils"
 RPROVIDES_${PN}-bin += "u-boot-fw-utils"
 
+RRECOMMENDS_${PN}-bin_class-target += "u-boot-default-env"
+
 BBCLASSEXTEND = "native"
-- 
2.28.0

