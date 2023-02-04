Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570FEC636CC
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 21:49:03 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.16755.1675547337935844187
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 13:48:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EKAeDwIi;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id v3so5896115pgh.4
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 13:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgmLL0CVRAiVwTWJVqBCbqqsTEJtVTZCFA0HFSUQ/ls=;
        b=EKAeDwIicyFXvRMhIEfc2QxB4CwOnKNYtUuRLG8UtuPqv0nl+auOV96Px+svwh3Qks
         fBARKVuZo2uMS4EpWIl9HptOh3rIC7AORN7+URGp+jFGyDaGbWEiTlw+4yRohGaY/RWn
         /4In5cTEICDy7bSvPTa9LGmeplHs44atTAAiFCeyZWVN5+5c2Qvg7vZI3SFTNN5DUwyT
         M47P09subjJrTMz6HdyQrKQroixmiiFFx+lNqleCAmCjk6ZJGD2/cR+aulMGNQKSoOSS
         qsQ0ipc0xCIFRW+EvZHWI0TfiXUbr2lkgsBpOjfDT495Goak+eQunKcuESYr5Y0YxCr8
         34Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LgmLL0CVRAiVwTWJVqBCbqqsTEJtVTZCFA0HFSUQ/ls=;
        b=YOY8YcdcUQmE14NHaLfKG0BQSmPmR84xhwTXk9mK1WFS49jwx9nnOoaTtGScNs6ggL
         U7z9/nwiL1wkaB1up8Y2S0BMQIAdIVMYo9HUeAnxsVTDchjOZlJwTwjWUYhCTgKNCEIl
         ZIPW80fLEPNMOk1ZliDOXbJxV23Uc3RxN1MRrEGl00eiHiNREq+2t0jDJIG12wmxAjPo
         f+9JCWY5PzzxEt5lgcXj2BYRqRrPmW9z/VFkRK1IbVQM22NYIY0E/I0+2QTw9cYJ2Bfj
         X2rCDHMfDrMZvhQZp4IG/d4//0QzDCbfhYaAmD9IDnXs04ItVqhZtG+w82gYPuv61bcY
         E/XA==
X-Gm-Message-State: AO0yUKXGt7e4HxsEv3EpzJyFgECr4aDvxBzjYf/dO++0KroLkn/VNZ9E
	aMcOb52s5qtmyi9riEaqwOS8u5WwmXdWarZgoos=
X-Google-Smtp-Source: AK7set9ArDI+SZIurgMga5Vzkad20sS3eTKyHePuuomvAKiEb21hxoyhvYdSxT22SYt4PhXisnv1Xw==
X-Received: by 2002:aa7:9536:0:b0:592:e66f:6c7a with SMTP id c22-20020aa79536000000b00592e66f6c7amr13849742pfp.20.1675547336936;
        Sat, 04 Feb 2023 13:48:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h4-20020a056a001a4400b00590774b9ea1sm4150960pfv.107.2023.02.04.13.48.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 13:48:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/12] lttng-modules: update 2.11.8 -> 2.11.9
Date: Sat,  4 Feb 2023 11:48:31 -1000
Message-Id: <146cc298e9dcb9ea7fe54669899accafee123e46.1675547139.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675547139.git.steve@sakoman.com>
References: <cover.1675547139.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 21:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176773

2021-05-14 (National Dance Like a Chicken Day) LTTng modules 2.11.9
	* fix: adjust ranges for RHEL 8.2 and 8.3
	* Sync `show_inode_state()` macro with upstream stable kernels
	* fix: block: remove disk_part_iter (v5.12)
	* Fix: Backport of "Fix: increment buffer offset when failing to copy from user-space"
	* Fix: increment buffer offset when failing to copy from user-space
	* Sync `show_inode_state()` macro with Ubuntu 4.15 kernel
	* fix: mm, tracing: kfree event name mismatching with provider kmem (v5.12)
	* Set 'stable-2.11' branch in git review config
	* fix backport: block: add a disk_uevent helper (v5.12)
	* fix: Adjust ranges for Ubuntu 5.4.0-67 kernel
	* fix: block: add a disk_uevent helper (v5.12)
	* Fix: properly compare type enumeration
	* compiler warning cleanup: is_signed_type: compare -1 to 1
	* Fix: bytecode linker: validate event and field array/sequence encoding
	* Fix: kretprobe: null ptr deref on session destroy
	* fix: mm, tracing: record slab name for kmem_cache_free() (v5.12)
	* Fix: filter interpreter early-exits on uninitialized value
	* Fix: memory leaks on event destroy

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{lttng-modules_2.11.8.bb => lttng-modules_2.11.9.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.11.8.bb => lttng-modules_2.11.9.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.8.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.9.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-modules_2.11.8.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.11.9.bb
index 84d8daf8d4..d30478c1a1 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.9.bb
@@ -17,8 +17,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0019-fix-random-tracepoints-removed-in-stable-kernels.patch \
            "
 
-SRC_URI[md5sum] = "0aba7e5ca53e756875605221f7e0dec9"
-SRC_URI[sha256sum] = "77d03546bbb7668b146f2261c646d503b7b601dc7072a5359d729d40f13598a1"
+SRC_URI[md5sum] = "cfb23ea6bdaf1ad40c7f9ac098b4016d"
+SRC_URI[sha256sum] = "0c5fe9f8d8dbd1411a3c1c643dcbd0a55577bd15845758b73948e00bc7c387a6"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.25.1


