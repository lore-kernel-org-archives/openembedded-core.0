Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.7106.1597314105084377737
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 03:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bxOYVp/h;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id kq25so5579751ejb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 03:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J55Z1az9B2BfwnHtslJdStpjTa9VsZwd0ZPvytGHza8=;
        b=bxOYVp/hFPoo5xKPhvAmaX7I6+ng4v7z4AUR6AA9GnbfnRlqj2xYUKO1zAuXhmTF6y
         MB4MSHy3jbB+tKZ1As1lagebJs0TMRSVhXEd8hkYkz0JFeNHwx1inx0HkUYd9RQzBrXz
         LaQElR+dIWx/iZITPe/EGZQnv4cBUNXogadB6eDsycbAYFOXv9X3F/alYClUfFdmF0SB
         CV8R6KGrgr1t/QYnmsTcRuG492MworiEZYfla4OaAJbWcpamlM+i9L0veyB2S+CZAvWJ
         9FduxWVArsql7i4aa7b3F6F2O9p2DkWFJ0u7UXn0TQ59E3SxwdW0pJ8GbbOaQK3NqDis
         uqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J55Z1az9B2BfwnHtslJdStpjTa9VsZwd0ZPvytGHza8=;
        b=DYK/k6swua7LRUp0eJMrsLRE2BgkxlNlhQPw4GDiBalywtFL1s48GtqNX0gPNfapbh
         1b2JEqTtJOnH7mt7Du3SZsY7ZpY+HXWsO0e9kK5P70i69uf1c4TYxjoanGukbjpp+9sC
         DFjMcdk0+V67GPkASQV7OJt2BJLV4Kd/PoLlj5+xAOxeo21cQ0hM1TzCLMCL1f8GJ/ki
         cZZodHEcAdNfLqgord/lwfkIn3R4j8prQ0fYOxmXFUgQ5gvL055NFEHr4JP4KomlVoxC
         VFwNJ0ZcvsnE/RQAVEgMFUIZnDYK4nk4FZGqKALWAaJIkVupgrqt9TLT1lExc2jLHDyB
         ACOQ==
X-Gm-Message-State: AOAM533bWp8OgYozPmK1X3TOH7sJbBbgF6v8FrBLA53+nmTX6og3GDcO
	9JCvFZOlsE0faWGezpwj3HlH8yFSQLE=
X-Google-Smtp-Source: ABdhPJyLrFjOAEISWHwqkord0r+M1F6D0Ea05ztYxvKjLwIPtC9vtUmOmgix9T4zddPYRl8nq6xjTw==
X-Received: by 2002:a17:906:74d0:: with SMTP id z16mr3955702ejl.51.1597314103389;
        Thu, 13 Aug 2020 03:21:43 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id v5sm3288017ede.13.2020.08.13.03.21.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2020 03:21:42 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [PATCH V2 2/2] libubootenv: uprev to v0.3
Date: Thu, 13 Aug 2020 12:21:17 +0200
Message-Id: <20200813102117.8726-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813102117.8726-1-liu.ming50@gmail.com>
References: <20200813102117.8726-1-liu.ming50@gmail.com>
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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

