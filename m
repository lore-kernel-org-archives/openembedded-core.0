Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A5AC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 19:34:40 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.37656.1702582479460343536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 11:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dP/eAZSm;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d098b87eeeso76640205ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 11:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702582478; x=1703187278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0A94I7gXSObO2wz0+mN6nowwHnhFjXIhxb9ZpH0OCpg=;
        b=dP/eAZSmgNtauCNnz0Ra/PjHkZebOX/xjUwSu0ragX2gh2qEbYBF06a+sFLgnZOMk9
         ngA/iz4R78GlNWQO4eXXD7ub4NtMgHrccpPJXNCu7/RrF4MPt+lpeVe1GuhZ5QzLh4m/
         iVS6hNKaF5oQPtfqF0WLQoxAciJCfpqCJ+jBit3cwlkn7WfiOfKY6EYR8k7psgmYxaYt
         wvEV3DeXALy5bQAc5UoXFrQq77hBOWBNEjgxn1wSQCk10/hjkTrCEgIYRYPkNNFZkj6o
         3UabA+Px8T2XL/TbdbiHb6cxcLU3C9bo+oLLgNZ93CfQBWhPb87cICWvHQnCsB5Q26yv
         SQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702582478; x=1703187278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0A94I7gXSObO2wz0+mN6nowwHnhFjXIhxb9ZpH0OCpg=;
        b=kSx0DAP0Eph35QaUHYkz0xMMkmOpw9bA+9jO0d//KEAuSVC1Zpul/g4nDRPs6Wu9we
         TJWaGgSBkn6Mh8d0SU2x4yOvAhRpQpZz+TelvmRC2ettQRHJ6WY5BAW2IU9oy2BMpHJL
         QfVeLFcIa+Szi/sxgKVeKXIH/icohV/UY0z11tS3NftouYOqlU/WWh+Tnw0HbJOTEZhe
         wy1uPvGbdegC0jko7xrwWTK+nvYfjkyhCd+aTm1ixYASn2duDk5IiGmh0cshTgT5ab+p
         cyIRp5ydrMAVvVZ2+oqwqg4Pm3fBzCnzz0tKKqovsHPHrSifU76c3p8iC+zGtfjKdQfd
         63lg==
X-Gm-Message-State: AOJu0YxzpshWafQtRQn5PTyqm8G1cVYrqbXHWOkynK9AgW0AnWcN88ot
	aoM5dL9sSK4jWDgKL4ciDJkhlIp+hz0=
X-Google-Smtp-Source: AGHT+IEHZLNMaO5PuwVaJs1eIKJ2RJ/Qden7L6NtTItfUJAQjOu6EMSuPf9YGAJtkSQFtnVaISB7QQ==
X-Received: by 2002:a17:902:da89:b0:1d3:5a7b:7ced with SMTP id j9-20020a170902da8900b001d35a7b7cedmr3399613plx.63.1702582478553;
        Thu, 14 Dec 2023 11:34:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902e54600b001d1cd7e4ad2sm12719897plf.125.2023.12.14.11.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 11:34:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] util-linux: Delete md-raid tests
Date: Thu, 14 Dec 2023 11:34:36 -0800
Message-ID: <20231214193436.224539-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 19:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192402

These tests are marked as known failures upstream as well [1]
if we delete them then we can drop dependency on mdadm for ptests which
can further reduce the dependency chain for ptest enabled minimal images

[1] https://github.com/util-linux/util-linux/commit/7519c3edab120b14623931d5ddb16fdc6e7cad5d

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux_2.39.2.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.39.2.bb b/meta/recipes-core/util-linux/util-linux_2.39.2.bb
index 927037a3429..8c081674017 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.2.bb
@@ -137,7 +137,7 @@ RDEPENDS:${PN}-dev += " util-linux-libuuid-dev"
 RPROVIDES:${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev"
 
 RDEPENDS:${PN}-bash-completion += "${PN}-lsblk"
-RDEPENDS:${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs findutils grep iproute2 kmod mdadm procps sed socat which xz"
+RDEPENDS:${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs findutils grep iproute2 kmod procps sed socat which xz"
 RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-sd-mod kernel-module-loop kernel-module-algif-hash"
 RDEPENDS:${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY:${PN}-swaponoff = "1"
@@ -320,6 +320,12 @@ do_install_ptest() {
     if ! ${@bb.utils.contains('PACKAGECONFIG', 'pam', 'true', 'false', d)}; then
         rm -rf ${D}${PTEST_PATH}/tests/ts/chfn
     fi
+    # remove raid tests, known failures and avoid dependency on mdadm therefore
+    # See https://github.com/util-linux/util-linux/commit/7519c3edab120b14623931d5ddb16fdc6e7cad5d
+    rm -rf ${D}${PTEST_PATH}/tests/ts/blkid/md-raid0-whole
+    rm -rf ${D}${PTEST_PATH}/tests/ts/blkid/md-raid1-part
+    rm -rf ${D}${PTEST_PATH}/tests/ts/blkid/md-raid1-whole
+    rm -rf ${D}${PTEST_PATH}/tests/ts/fdisk/align-512-4K-md
 }
 
 # Delete tests not working on musl
-- 
2.43.0


