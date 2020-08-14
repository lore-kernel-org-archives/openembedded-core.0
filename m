Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.14546.1597397371041594217
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 02:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XqqWAM0b;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id i26so6336063edv.4
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 02:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xy/pOezbJmE+8K4HMSd4ROM/KfjvzM8kfFSlucFTfvk=;
        b=XqqWAM0bkTkFUcTfBrBbNMB308xwBkycysR/grreZ8EUbxQCqMfcuK/BtRHm6MmE6I
         /DBzIdvhEUEJJJXTUCodmzScCtMdAxztA0OJtj6OhnNpCThm0cINwdRtCn54cGqRPhEo
         lZJKZ6JU3gVrzhCjToG6+DSwGS9eQkc6SjHF2YfEV6MzeaIprdS4p7vaP+SpxCzrW7ZO
         5vrtC6iXCqpqNdyb2JAP0E8rcWlQ10j+NeC13dJhbWsWwr3nd1S+e6K2Ac+L9Rdc0Sbt
         PDOBm7rToT0DZLfO64BqTdXsZL+7DuiRqrzULCnoT73inzMiAUELx/4bqk2cgLv5ZXPY
         1U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xy/pOezbJmE+8K4HMSd4ROM/KfjvzM8kfFSlucFTfvk=;
        b=fQI9PFD/W1jYp7lnbfUfQsqJE6QqYLAAdSdPrfL1AATGFaq3w/rij66IYTOb7b9ywU
         2r2Gc14O1sp7Zb0O8S8XA/x+PvAbCIn6T5tLttVUZ9KpJ3J/E3vH3hcpNzu5IUtMbkZp
         kHAIauoNrD7vN6qs0ckbOsCacE+BUDRSC+TJL9ROs9L0ElHDPvOwkQDzhyVdQl6oDVev
         YbvzXGrgTFaL80wu2QZLxFuwX7jIR9vLPuXsYNHaF1mIOudxAwOUbEDIEziYRnqrW8nr
         kRYd5z4gLT7lqUhLiguMa6hA+jwG9UcpUfR6RW+0OhrWcacQdeQngqXjwvL7iK7fmmOr
         ZfsQ==
X-Gm-Message-State: AOAM530ltsmsOYcVB0cuVbYyqoJYMyCrjeY+nmw3OjCrqZKdJ3weD35l
	1Y8maFfT5v+o/SKeDBYIz8on1pz07QxgUA==
X-Google-Smtp-Source: ABdhPJwQl3DeJA/KpUG2EvECKJvSX3zKwnKto8HzVBdIL9WVkeLp3QB5JZqKvbKGUKGil2fpxpaauQ==
X-Received: by 2002:a05:6402:6cc:: with SMTP id n12mr1417959edy.258.1597397369270;
        Fri, 14 Aug 2020 02:29:29 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id b2sm6329962ejg.70.2020.08.14.02.29.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 02:29:28 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	bunk@stusta.de,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V3 2/2] libubootenv: uprev to v0.3
Date: Fri, 14 Aug 2020 11:29:14 +0200
Message-Id: <20200814092914.4160-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814092914.4160-1-liu.ming50@gmail.com>
References: <20200814092914.4160-1-liu.ming50@gmail.com>
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
/etc/u-boot-initial-env is being referred in libubootenv source.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb}        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb} (85%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
similarity index 85%
rename from meta/recipes-bsp/u-boot/libubootenv_0.2.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.bb
index 3820ba262e..55b2eb60f7 100644
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
 
@@ -24,4 +23,6 @@ DEPENDS = "zlib"
 PROVIDES += "u-boot-fw-utils"
 RPROVIDES_${PN}-bin += "u-boot-fw-utils"
 
+RRECOMMENDS_${PN}-bin_append_class-target = " u-boot-default-env"
+
 BBCLASSEXTEND = "native"
-- 
2.28.0

