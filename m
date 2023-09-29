Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA89E728F1
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:15 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.27826.1696017909502010899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AB3H3RNZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-65b05a45046so58131506d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696017908; x=1696622708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNwPgKhZXJrKBctuMO2Lu4Z9c/LSIMMNcXTFhp7JAGc=;
        b=AB3H3RNZZ7LJtXhZvu4rF1bWRhOqtWLIVKFzJvo4RrgcX0yBNjTjyHBH6JnTFBepYO
         qtz1fFTLbVaJMUey6epPQua2BBiRcpHK0GYzxCUONzu6PWx4JYG53Xw/CwDPz+zUUECg
         UDk8tJ+6bpXlHz7NsH/bwUjBAOTuGHxQ3HbXZNgkz+9wgOE2fqvbgslal2Gvb6rTc2bS
         xfF0ZwkrvtmLTOfxOGYCzOKlYGOT5RHgFyK048eBhy+mI2t6/L2NZPoFXVdWyy32bGKb
         dw//wRqbCHvq2ZuIampKdyYbeSQ68bBSD9muByzS703do1pTa68OmnQgVL15QzGIot0A
         1vqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017908; x=1696622708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNwPgKhZXJrKBctuMO2Lu4Z9c/LSIMMNcXTFhp7JAGc=;
        b=FFLjf1qY3+6uWgBri8T1xed5c0MxzgCBByUWDZB4lw4XPMSoGWnH9rJbnvNT+Cy65X
         QXfMxF/TAmkpCuy5tdUGQ+2nXZNJ6ZS+rUdTCHuwIMIftQMejXG+WJBZ7/81MowyQulI
         Uc3iAmlF29axQ0YTP646tzpEHs9xFIaw8w1HSpH8R4MkWv6BnhInZr4d4nqO2aw4bAba
         j4V0wCTpBM0L/cSRHzUFdvfAqKHyAjVGZF61UqO0OGBom6ja1tn0CklpaZJVzEdZlBlN
         /yUh1HcqmVCS+yHBgWmhwzNAM+W2pSCVub6xhl0vU3Azz5X9LPlfPd2ftRw1xJ9rUAEg
         KI6g==
X-Gm-Message-State: AOJu0YzZQJ8gNtH9sxQXJV6TJKeUQ56CgcKTexr6mA0SPP1jzbF52biS
	LQ2RDT4zshHmtXZgCBW9LVJOq49zeX8wYg==
X-Google-Smtp-Source: AGHT+IFhuxXp3mQCVC8QV5ers9zh/csz5J/UslVp6D9mOwbcj/4OLXMXgZ4PVQzV45r5Oby7UKdl7Q==
X-Received: by 2002:a0c:f4cf:0:b0:64f:7fe6:bf1d with SMTP id o15-20020a0cf4cf000000b0064f7fe6bf1dmr5342875qvm.12.1696017908502;
        Fri, 29 Sep 2023 13:05:08 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t28-20020a0cb39c000000b0065cffe12ae9sm2115848qve.36.2023.09.29.13.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:05:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] btrfs-progs: update to version v6.5.1
Date: Fri, 29 Sep 2023 16:04:54 -0400
Message-Id: <f229766021cec2cc8b3cff6b10aa78cb928a9ff9.1696017123.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696017123.git.bruce.ashfield@gmail.com>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188429

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When building against 6.5+ kernel headers and musl the compiler
has the following error:

   | image/main.c: In function 'restore_worker':
   | image/main.c:1588:1: error: unrecognizable insn:
   |  1588 | }
   |       | ^
   | (insn 3361 2993 2990 45 (parallel [
   |             (set (reg:DI 4 x4)
   |                 (zero_extend:DI (mem/c:SI (plus:DI (reg/f:DI 29 x29)
   |                             (const_int -260 [0xfffffffffffffefc])) [98 %sfp+-260 S4 A32])))
   |             (set (reg:DI 22 x22)
   |                 (zero_extend:DI (mem/c:SI (plus:DI (reg/f:DI 29 x29)
   |                             (const_int -256 [0xffffffffffffff00])) [98 %sfp+-256 S4 A64])))
   |         ]) -1
   |      (nil))
   | during RTL pass: fma_steering
   | image/main.c:1588:1: internal compiler error: in extract_insn, at
recog.cc:2791

Bumping to v6.5.1 solves the issue.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_6.3.3.bb => btrfs-tools_6.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.3.3.bb => btrfs-tools_6.5.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb
index e7a64e8363..527e13d08e 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "bb0ca35245858f17a6ced97aade1dd8d70f9c9d7"
+SRCREV = "92d04d4780886a9850716e5529f1dace97779931"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1


