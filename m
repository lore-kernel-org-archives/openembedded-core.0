Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.577.1598464150505717206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 10:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hxhDEkU3;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id d10so1790119wrw.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=czcxKYlTUuWJiZ5fFAY4ZfRO5UvSPf2vIho6bYZSaQs=;
        b=hxhDEkU3yOqmZPORw2CeGbfRMaHXqBSk7twXlPFouyeiGf9zdnArVKt81IEZ1j1rES
         6I/IxWwpSlQWjR45V7zvHEIe4pUyFGUgKjJGxmNk4ujttg+tyW8qvFIsQy8Napjlokm9
         1meCC2v0e9vDkM2xPU+ij2CfEIKIO2yG8rg4GivJUMrnt6bzP4l9TF5ip2k3O09TdNHo
         B8K70V6c29JKNB6roqbos9Ro4eL1aat95qSoWMJq+emG3weiFdpS1q1nKtUZBccMHRBw
         KZ8HgXsb7U66a2d9FOKG6pc+ttVPjG+/Q9aTpV8B6H/NzPXa4V5SmU1EUnFl+FDeGsv/
         ZbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=czcxKYlTUuWJiZ5fFAY4ZfRO5UvSPf2vIho6bYZSaQs=;
        b=Qh6Grh1XI3d1u0NZ35RttJlwUMSGJmkvPkihZvs+mYrK99Bcaf1Qkzs3Q+cWpp7csV
         VjeKbsZfCfHph7IhJc4ctH4QLK3aXrRCuOYROtFYV/eL1NY+jGpvuMQV2qegpOYT0bLr
         oONeoKB9hfp1/fgvvuAummyfFwiSPrNaeY9yiP4IbQmb6y6WECT68OSCT85C/YchkTX3
         ZNY0FOaoJBMfeS3irS36ZQTDoaBqCypLZFzHlBlkCF4JCDP944839m/9MCBeNcksHnX4
         WNvB+PJc3Db9y+nZXnIHDNuk5dcqCRxgtb8QtWxG+lcTKna1dPazZnkCUvDt9bTUfNz/
         gXIQ==
X-Gm-Message-State: AOAM531oLox1uqdnWGX5XdD9Pmx00jOGq++vsogp1RXLu6E7RIff+/nn
	o8oHf8VVewY9rGiw4xw1aittD0kYbXC3sQ==
X-Google-Smtp-Source: ABdhPJzX+5/DdPIZ94aatkTc/6q6W3cIaxqqDiFwdD59dmqN01PRAu66187UvgANbhKLqia2o4TY2w==
X-Received: by 2002:a5d:508e:: with SMTP id a14mr11625113wrt.10.1598464148840;
        Wed, 26 Aug 2020 10:49:08 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id u17sm9168529wrp.81.2020.08.26.10.49.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2020 10:49:08 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	anuj.mittal@intel.com,
	Ming Liu <liu.ming50@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [dunfell] [PATCH V2 3/4] libubootenv: uprev to v0.3
Date: Wed, 26 Aug 2020 19:48:52 +0200
Message-Id: <20200826174853.8838-4-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826174853.8838-1-liu.ming50@gmail.com>
References: <20200826174853.8838-1-liu.ming50@gmail.com>
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

