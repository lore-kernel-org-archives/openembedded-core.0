Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.37086.1598811532190751286
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NURBfpLV;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.68, mailfrom: steve@sakoman.com)
Received: by mail-io1-f68.google.com with SMTP id h4so3818739ioe.5
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=RtJs8vtsWYsyXvgFRItYO0nOLz/8uJ6PvDndUah8o2M=;
        b=NURBfpLVP6ra4OmgUSInox5TZwrrurbhy5IEM5R01+Y5IMubRQqfqShdHM2cUvQKDu
         vsEnx9mkVBpdTPPF7OUCDOd0uz3pu+QFFC96O5WEeoCRKI2XG2ZemuJqB0Tlls6pviSd
         +Nmlt7JY2DqScWlxKula9LH34HapuwrMLZ7b1rPo0PdbzsXeDqJvCE8cbu1NOLNdaV1S
         c7zbbqCI3Q70CKQBzfnnGLqAPCT/imTAd3vo0zijELkG/BbD89CvpaLoJRZYBoMG4ZjM
         RvscIIhlMr6HPpoz37zwqCOeoNqAARSXTDVPyNTFsEmzfLaiLoF4j78U01jxhu67IVac
         Rk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=RtJs8vtsWYsyXvgFRItYO0nOLz/8uJ6PvDndUah8o2M=;
        b=AhZzu+iA1HpFUswPNa9WsNgjJI/UmRuH/0jOsjKmKICDIVScg/hd1qnvfZMSOu57UF
         /YAvQj9j5joFPR0uQwNkYaf0qiivMCr9++haqVksP+Wifr3kzcvJ2o0M548P+II7enfi
         EYtUSIoKSQLH77ZAV2TdS5wn8KF+e1ekdFSr8Rr+qfe74lm9qVnwNwceTRVWVu7pnd2R
         u8zoYSdLKo9YucvVQIawFS6F7mpCihe3s9mr/3viBsD3jChr6mNhonYjOk3/YDROxmS8
         v2LW7fHxTvHd4AvPZlNcRdaB50h+BwlO9hr+huHfZEoFwH8b6/JnBIRh3U3NNGFzoFcF
         Ungg==
X-Gm-Message-State: AOAM531e65XreA08o4pDbxCAjG+INsgodarywv7vr/tQ3UFDPK5pTiYG
	8TjAd3a0A/g2WZgbb8EoQwx897kCLhIGLAA/ESo=
X-Google-Smtp-Source: ABdhPJxLFqmMbLu4sJZYgMy3/BVW3Ac0aGoXh6OGzBQprERFsKDpbKISOS9FF7NrpwWVPr8wLgTTWQ==
X-Received: by 2002:a02:ab85:: with SMTP id t5mr8782633jan.51.1598811531087;
        Sun, 30 Aug 2020 11:18:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/25] libubootenv: uprev to v0.3
Date: Sun, 30 Aug 2020 08:16:11 -1000
Message-Id: <0fa520f479d83cb35a5c9c1d0b468ab5e1928c98.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

