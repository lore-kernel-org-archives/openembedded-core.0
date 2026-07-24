Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5515AC53214
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:02:18 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15311.1784883737677542981
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YOeo8Ym2;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5218927884fso2150861cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883736; x=1785488536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X/xgf8Sm+URt/P+p6d+plDT5mBLAasEaTOJF6IDMfSs=;
        b=YOeo8Ym2XsXbgqxOI2x9LG4izDe6qFLz68ljVUHJY0ZKc05p5FS8rFitee5n3CFa+3
         huV0ay/V4FoP8DbVQ2Aj+07Uiel/OUG2SHTz2k9tTKj4+32KeecUAy3YDGjQ8LNStMRQ
         l+di0RTrTlfVwcOls3e/lqSijDAIkp182SJ+rxN2mAJpg6tnVkNBqiJZy/XrEuZOb8uK
         GU6J2bLIyghwCIo4VL9iora2R5LVg4ZDcRYx9PJku3Ca0Yu4ObUwwF0CDFXTPcpZZhcv
         AC3JrlyZeDQNeOyXrrA07pu4fddCH1vmxIRvCZfXWOFs8CxGQbsrqe/834eyH+MY70Hf
         UcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883737; x=1785488537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X/xgf8Sm+URt/P+p6d+plDT5mBLAasEaTOJF6IDMfSs=;
        b=ajJWrYsC66DuwTOQ+zCbqfvsHz4JLevpdlObSyvnNWgIOwQrMLCT7yGqnbD12p8oY/
         VWNjxuTqVYmN6GkUtNmPQ4HrFy4fZw03PHave3QrQ+VxOGjLfVwfkHkAtOkJi1XfqW/M
         2MHzh/S6jwsBKffN7Cn//oAluON9NyUbPCoTfFsfD77gXvU0zaSD36TATi2cMTP3UU1M
         WTcqYA9EKJ3TmQrjnBkkFz9IOK4OVr5OXVmRfAsjyxR1uamaI7YD74SRjGqfAwGqzPQM
         AU/0RSqFepS1tPhFYUnvEAsLvskYgf50VgDbRAF17d1rleKb7oxTr0hYiuIUIRNwNe2b
         QdRg==
X-Gm-Message-State: AOJu0YyDn63+QuJ4IHGvlsbfBgrS6jxnqXuiuto/HljAaJrtfWqDEm2f
	5nqXgqpt+SQxzer2+omEI+TMBlyNUoGAn/b2jkLEqfVOuF2NehEQcgdsRkh8Iw==
X-Gm-Gg: AR+sD10SF4KS1hvY1GncI6tmubLkXjbUKypPFqy5ETstfqYj6tAYK3QzdN5/7LMDXtd
	ZYVxD8fHtrk+pGWzIZ74yDYuh4H7ZHXl8M85jxBJiZpKv5o21/BJqY09LLlvhe+ba14ecbem3J+
	SDmLTRKKxiACgQsW9JstKjAO6N37K54UKzZL/DGFUCWuAZS7fCbLwXhoDHCyo80BIZobf6BzpiE
	xruE6xkSHtzKVzEHivDWBL5edBbNV8Xrr4TYuT9KSA+xbgwZxeAbuX5Rs4SBo5HmmxFzaI4UTsq
	LqYZb32yiGnalCsN/oZxpdRO0ZFw8I/6/33VO3/Y6AMq/TlJ/RXJjS9mMf2PWzE4JFx68IsZ3Jq
	1adjnb987ZNEdduTLsVxkBONJwbKU6YoTVTfxakS4mTGdfIU6DqKS9qI2kSAsxszr6DpzvLI7WV
	52RK3uMcT5+1I6yOG9+AgcdfTw5uu7VITi3v0vJhitvTVY
X-Received: by 2002:a05:622a:5d4:b0:517:7188:c47a with SMTP id d75a77b69052e-5283ddd1685mr64884561cf.2.1784883736553;
        Fri, 24 Jul 2026 02:02:16 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm63968326d6.46.2026.07.24.02.02.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:02:15 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 10/10] packagegroup-cross-canadian: gate gdb behind SDK_FEATURES
Date: Fri, 24 Jul 2026 05:01:46 -0400
Message-ID: <20260724090146.19924-11-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260724090146.19924-1-twoerner@gmail.com>
References: <20260724090146.19924-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241920

The cross-canadian gdb is added to every SDK's toolchain packagegroup
unconditionally. A host cross-debugger is part of what most people
expect from an SDK, but it is also large, and an SDK built only to
compile does not need it.

Move it behind the "gdb" SDK feature, which is enabled by default so an
unmodified configuration still gets the cross gdb exactly as before;
binutils and gcc remain unconditional, as a cross-compiler is intrinsic
to an SDK. A configuration that wants a compile-only SDK removes the
"gdb" feature from SDK_FEATURES.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v4:
- reordered after the opt-in features (wic, sbom, lldb); the default-on
  features (qemu, gdb) now come last

changes in v3:
- new in v3
---
 meta/conf/bitbake.conf                                         | 2 +-
 meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f96ede6d88df..5716b7176ebd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -898,7 +898,7 @@ OES_BITBAKE_CONF = "1"
 
 MACHINE_FEATURES:append = " ${@oe.utils.filter_default_features('MACHINE_FEATURES', d)}"
 SDK_MACHINE_FEATURES ?= ""
-SDK_FEATURES ?= "qemu"
+SDK_FEATURES ?= "gdb qemu"
 
 DISTRO_FEATURES:append = " ${@oe.utils.filter_default_features('DISTRO_FEATURES', d)}"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 49c075eb1166..9db3cfa28831 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -13,7 +13,7 @@ GDB = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 RDEPENDS:${PN} = "\
     ${@all_multilib_tune_values(d, 'BINUTILS')} \
     ${@all_multilib_tune_values(d, 'GCC')} \
-    ${@all_multilib_tune_values(d, 'GDB')} \
+    ${@all_multilib_tune_values(d, 'GDB') if bb.utils.contains('SDK_FEATURES', 'gdb', True, False, d) else ''} \
     meta-environment-${MACHINE} \
     "
 
-- 
2.50.0.173.g8b6f19ccfc3a


