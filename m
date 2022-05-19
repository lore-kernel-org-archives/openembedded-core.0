Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679E3C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 19:30:07 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.6.1652988603260414269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g/DPSSpT;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 z7-20020a17090abd8700b001df78c7c209so9625430pjr.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pJepCDDjH75/uWHDDivMzZDUOrrWvtTRC/L2uATjKKA=;
        b=g/DPSSpTCKdAVp4JCe7L/G0JTMdpSGMWP5f9yhas00TcYOWNfURHdDPb3qtVu3t4yw
         qLYtRdpaOdJe/hyEc+SwJI7TPT5Wlb4aPIbTVyDJS1nLx2ve+TwRkHgVlGDCa+DD2f+r
         SkOVIriryqI3/lB1KLkvhp0Dv7RXMEvagxoL14TSr0MrlzTFiK2/8hAY35El5FmF+emV
         0Zd1w5aSA934Y8Pblgxv4RJ0YdU1Pt9l90DE8U2THUF/LkBAxq/bvgSZKlKeUreJYMVS
         q4lIALaSiQPoJdVFesXGu9DrRtY/aAUgKRkXPZklv6Ozqc9gb3G7A5BVjTLQdLfEnXt8
         QncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pJepCDDjH75/uWHDDivMzZDUOrrWvtTRC/L2uATjKKA=;
        b=Z2KryQtI7H1ka0qf08DkSAps54wXtBL0lSsW13aCwXG4CYfXW9gGiQqjlytPVmNnKB
         t3ZWSeGjoKJ8Bup2TJl8kb0KBRxLJtW2BOMaSCxGT1SBQ3BaKQ4PEQjAWUrcYQsUqR9R
         k0/dGgUK718ZDrWbO7f1wb2zBb3B7PWm1X+fWCD2IVJslD3HKzWTNQOtaqY5TfNpsrvZ
         kowsZQZ6i7gKmD1/ZfOpP4+R2SWD/tem2JR+sXU0q/2TH09nlDDsAPpqR2VdF620EwGq
         zpip2Fmklp1biPnjNegYEULEq2RrxMyyvMddiiNzbpV3L80VKjxek+cbJBhCORX/MEqf
         6QoQ==
X-Gm-Message-State: AOAM5330iL39DZyMRUw5YChafC+1fkZt5BhIygYziSV84YHYuW/zfH6t
	i9zwGm8rKZtGKDb2tE5hba5O4mYNUnYVkQ==
X-Google-Smtp-Source: 
 ABdhPJzfj2UBvYPq5JHHR9uvTYVB8jwgaCW0lNkN9sQOF0Td8A+vvGNa791+gya2NwXeffC5k59dug==
X-Received: by 2002:a17:902:7890:b0:161:572a:2494 with SMTP id
 q16-20020a170902789000b00161572a2494mr5770175pll.123.1652988602423;
        Thu, 19 May 2022 12:30:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 f62-20020a17090a704400b001dcf49d92a1sm177894pjk.28.2022.05.19.12.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 12:30:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] systemd: Drop
 0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
Date: Thu, 19 May 2022 12:29:57 -0700
Message-Id: <20220519192957.1129486-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519192957.1129486-1-raj.khem@gmail.com>
References: <20220519192957.1129486-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 19:30:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165907

This patch was effectively needed when usng gold linker but it has been
fixed in binutils [1], it was seen in systemd as well [2]

This however, should not happen with latest binutils and systemd has
already reverted the fix since it was a tool error

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=18548
[2] https://github.com/systemd/systemd/issues/234

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch | 33 -------------------
 meta/recipes-core/systemd/systemd_250.5.bb    |  1 -
 2 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch

diff --git a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
deleted file mode 100644
index f4066d7e4fd..00000000000
--- a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d8bf23d7a698bd3253b0cfba24bd8afd0886d82d Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 15:18:00 +0800
-Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
-
-for currently unknown reasons they get exported to the shared libries
-even without being listed in the sym file
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Rebased for v241]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
----
- src/libsystemd/sd-bus/bus-error.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
-index 61928f4bf3..79b698b092 100644
---- a/src/libsystemd/sd-bus/bus-error.c
-+++ b/src/libsystemd/sd-bus/bus-error.c
-@@ -55,8 +55,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bus_standard_errors[] = {
- };
- 
- /* GCC maps this magically to the beginning and end of the BUS_ERROR_MAP section */
--extern const sd_bus_error_map __start_SYSTEMD_BUS_ERROR_MAP[];
--extern const sd_bus_error_map __stop_SYSTEMD_BUS_ERROR_MAP[];
-+extern const sd_bus_error_map __start_SYSTEMD_BUS_ERROR_MAP[] _hidden_;
-+extern const sd_bus_error_map __stop_SYSTEMD_BUS_ERROR_MAP[] _hidden_;
- 
- /* Additional maps registered with sd_bus_error_add_map() are in this
-  * NULL terminated array */
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 2f5b9d1367e..c121fb763e8 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -44,7 +44,6 @@ SRC_URI_MUSL = "\
                file://0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
                file://0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
                file://0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
-               file://0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
                file://0018-avoid-redefinition-of-prctl_mm_map-structure.patch \
                file://0021-test-json.c-define-M_PIl.patch \
                file://0022-do-not-disable-buffer-in-writing-files.patch \
-- 
2.36.1


