Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB483C54EBD
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 06:41:05 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.48842.1673505664757133949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 22:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JdxTYT8Z;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id i15so25525237edf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 22:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FtTIH5T2vsmYM47e1f/61wstX4V504W0lqphT5K6atY=;
        b=JdxTYT8ZA0StaGAdY6aN7Kjcvw5/JLlHuwJ8PaepvZnEA0upluUykN37xYvuP4DMKK
         9u71iOQRREeqfTL6crJJ8CNvo0+p4OBqgX9SVkO4nD23OAR2P46FzInWqZHSo5lgzF8E
         WGKbT/IQRcshLR7E7FdC1jA9hXBccQFGkwv6NDzv28lrQVsdZlIlTAI0/BURLRk0or+T
         Nscjp88xRkEgDIrj6ufxVCS8pkgIGH4h9sAZs1VOfeBK4ZW6WXShKOqAeIA8X1iof5qB
         pSoiqPNtfF0+7TQBECxIhyUO241HClCWE51IlTgtxaRDDKbilN9W/yFZuF6Q/fe826Le
         VCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtTIH5T2vsmYM47e1f/61wstX4V504W0lqphT5K6atY=;
        b=ZaIu7HugD5LyZckG4gMznYOuyr6+9xpRj4afhalHaeY40DMPBEJw9d5VF9EhbfhaDM
         5O9fAQbRA5+XOoDhq+6PlM/tspYKKVuPJ2EhjxBh/pJFduNM1ys+hfkDFVkVo/i1Vtdm
         VSvlpmGJXZeurZNR8caumr4QWV3Q+fy23CnrHpe9dEmIF8GOJJtxJBI9+fEJlM/9YHB4
         QQrSfGlSkYJvmqeKCiKxXEVQsFw5kTYyerNWZyQ8JhDGWLAdtUaiAMmtpcTcwXVddAar
         qip9FweZviM4EJEkCwx6lCdrppcEZsnW3EsdzI9FQN+CIz6eorBHxICZc5oy0yQGyYaa
         5IDA==
X-Gm-Message-State: AFqh2koWurpm+3dN85wD1RLHbGD6lDJhJpKD5uq1Jfp0hkgJEIOhqmbV
	+eIHkofZDPp6AO0NOYQhBGugi8hGhhY=
X-Google-Smtp-Source: AMrXdXv99xhRRj9HOCUSnHPwxchAJZRM05Q3odVh5kOPGevbppkVjC8rEI2UalIXDJ9mFnnL5yibog==
X-Received: by 2002:a05:6402:4007:b0:49b:58ca:ebc0 with SMTP id d7-20020a056402400700b0049b58caebc0mr1446310eda.31.1673505662928;
        Wed, 11 Jan 2023 22:41:02 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id r18-20020a1709061bb200b0084cd08e5cb5sm6977139ejg.159.2023.01.11.22.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 22:41:02 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] rust: Upgrade 1.66.0 -> 1.66.1
Date: Thu, 12 Jan 2023 06:40:45 +0000
Message-Id: <20230112064045.7409-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 06:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175788

Changes:
  Added validation of SSH host keys for git URLs in Cargo (CVE-2022-46176)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/{cargo_1.66.0.bb => cargo_1.66.1.bb} | 0
 .../rust/{libstd-rs_1.66.0.bb => libstd-rs_1.66.1.bb}           | 0
 ...t-cross-canadian_1.66.0.bb => rust-cross-canadian_1.66.1.bb} | 0
 .../rust/{rust-llvm_1.66.0.bb => rust-llvm_1.66.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.66.0.bb => rust_1.66.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.66.0.bb => cargo_1.66.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.66.0.bb => libstd-rs_1.66.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.66.0.bb => rust-cross-canadian_1.66.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.66.0.bb => rust-llvm_1.66.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.66.0.bb => rust_1.66.1.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.66.0.bb b/meta/recipes-devtools/rust/cargo_1.66.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.66.0.bb
rename to meta/recipes-devtools/rust/cargo_1.66.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.66.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.66.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.66.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.66.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.66.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.66.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.66.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.66.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index bfb625fb363d..dcef50eeab60 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,6 +1,6 @@
 RUST_VERSION ?= "${@d.getVar('PV').split('-')[0]}"
 SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;name=rust"
-SRC_URI[rust.sha256sum] = "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c"
+SRC_URI[rust.sha256sum] = "07ac4e6c93e0d8ecfaf3b86c4c78bbbde3f5be675f0334e7fb343cb4a0b81ebe"
 
 SRC_URI:append:class-target:pn-libstd-rs = "\
     file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=../.. \
diff --git a/meta/recipes-devtools/rust/rust_1.66.0.bb b/meta/recipes-devtools/rust/rust_1.66.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.66.0.bb
rename to meta/recipes-devtools/rust/rust_1.66.1.bb
-- 
2.39.0


