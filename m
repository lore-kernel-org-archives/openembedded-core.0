Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E1EC25B0D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 17:02:05 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.6898.1660410123013901736
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 10:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Imm4+RQO;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id gp7so3590868pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 10:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=G7Bn66z+H1sW8mKhX8l7HFEk9R/0YTZCyUbbwgd/iGM=;
        b=Imm4+RQO0tKZSmwZacr+zmT8zTcy69vqCWuQG41ZmW0wdGdH20L3sH7HsSPb/F6mLM
         JqQ81mz2F7U7/04qyq5k7laXPcsmb9xKJGAVxBkCSrZ3FtKR7G1fb+WCEVpZ9epC8ooz
         UntwB3kVssdmitpoHZVE7sW7dsv5koJVxkIYUtG/p3wZ6v2k6z4iLDYz9bF2PA4LuX5f
         umiyEfvtIj0lFZzrr3MrwAriscyYj5NKGj3KeKAncFQZFWnUFEyJpwHMNjfaI2IDQ5IG
         aVgNeDrxn87H+qqmwQ5L+LA7I4nBubf7/C65nZl0ajIDtyuohlT+BVulg+kydX6PfkK0
         i3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=G7Bn66z+H1sW8mKhX8l7HFEk9R/0YTZCyUbbwgd/iGM=;
        b=niVNyTpAsBtOaHFNCGGe442Lw4lKxLGQUf1FVFtpsjkEuH5vDXh7NrL3DohYmLtu5c
         mZHAYZ1xoiUBDyUszPZ7FvVDB6JpCB4BGd0MeSiHsvtiFWGPLKpPXz0KhFZ6qAIQOKiM
         QUuS5p/xtlT+KNZ8bzoEjTKwuS+ItERXXsbeSZgYy25WBMWskC+EqK4b023io6eubXPm
         9dmeVxcZE4FiU41tAN5YEGL5cEUWdi1ljUkEGPEeN+zGzrY1qxk8SsWQ14UjGbyrXG3D
         r4FbdF0DXNBT1qHnH3lIThTJow8Ad7BtriZ/Bjf7TMJU/Cv6Ftpe/KH9ic4bDvdq3Sba
         NNrQ==
X-Gm-Message-State: ACgBeo0HGYRTKrbCFcLejZB/+ixEoGB90CGDTsDh2WHLovz8i982/9G/
	2TjQsvxyniTeSqlgx9tY4Vba/UwOFrqW1w==
X-Google-Smtp-Source: 
 AA6agR7Lz8HXX0RS0sm6fLq9/7Yt2LdQ+MecIyyLw63YSZDlC39FousXjsA9I4sB9N8ggeE9Dfmscg==
X-Received: by 2002:a17:902:b483:b0:170:a89f:32b3 with SMTP id
 y3-20020a170902b48300b00170a89f32b3mr9375936plr.149.1660410121896;
        Sat, 13 Aug 2022 10:02:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 n7-20020a170902e54700b0016c78aaae7fsm3975713plf.23.2022.08.13.10.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 10:02:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] musl: Upgrade to latest tip of trunk
Date: Sat, 13 Aug 2022 10:01:56 -0700
Message-Id: <20220813170156.4040589-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220813170156.4040589-1-raj.khem@gmail.com>
References: <20220813170156.4040589-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 17:02:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169312

Brings in following changes

* 46d1c780 fix strings.h feature test macro usage due to missing features.h
* baaf257f fix ESRCH error handling for clock_getcpuclockid
* 4f48da00 aarch64: add vfork
* 7d568410 fix mishandling of errno in getaddrinfo AI_ADDRCONFIG logic
* d16d7b10 early stage ldso: remove symbolic references via error handling function
* 63c67053 in early stage ldso before __dls2b, call mprotect with __syscall
* a23a3da2 avoid limited space of random temp file names if clock resolution is low
* 41002798 remove random filename obfuscation that leaks ASLR information
* 6c858d6f ensure distinct query id for parallel A and AAAA queries in resolver
* 8974ef21 mntent: fix potential mishandling of extremely long lines
* 751bee0e mntent: fix parsing lines with optional fields
* dcb31f6b fix constraint violation in qsort wrapper around qsort_r

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index fde5fc0ccec..510dd4eeeea 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "6e9d2370c7559af80b32a91f20898f41597e093b"
+SRCREV = "46d1c7801bb509e1097e8fadbaf359367fa4ef0b"
 
 BASEVER = "1.2.3"
 
-- 
2.37.2


