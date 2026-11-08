Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9275.1794123067322997106
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2026 23:31:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=F2SgDgxs;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36ff9c9da34so423348eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 23:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794123066; x=1794727866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lvAdzhxCFFUg8JMzxxN5g/7EtQuAxgBu0fXbLAq38U=;
        b=F2SgDgxsn/mRyeG/z2ErMZpzVH1YtcVMLZ+B62klBhKLH5bAlNNg1cuLAjhwwDoT7F
         5qDHHHlrXVgB1oYnGrI9TDNyRHPhg+uR93DKib2Lz7/V/J+8HdELONWPQdn74aOB1Oz/
         C97bOCYbjxQ25Acusy4yhyjK9s3EhzXZ/cFs/0NbdNx03ZnaTxL0jhHY1UHxipuk8Bxi
         mhQXs0sSQSGYuWkUj81fBN0eIi1UyIp/H6Qk9WpU2Ja3RcEwtI3a9as8m8zQbN17yQ0+
         y0gAVAkc3jGGG7sHPsaW8nEVKlHnpAXpV8m1PdB9bINi8tdV0mx7riNsEd933vaE7ujL
         dOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794123066; x=1794727866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lvAdzhxCFFUg8JMzxxN5g/7EtQuAxgBu0fXbLAq38U=;
        b=ROKdF228PA6OS/cOE1MfiQ8IJ3g3AS58JYBGtI05Vfku+BtU9OctIcdsqlR7VHfERj
         oYj4LhDslQzdr7Pnek0mgOcVlD/ciyImrgRvUWYAUa1KVKSex4qZqGI7nXVuKJFLLoYG
         Yzz6PSiOsrLGXb66sMSrue31PNnso/woEWVu8GBJJywV9flhEGVpyNoPX0tP/4LkMP4p
         uA4g5OxgoJn/S97zQnr4MNlObIY3LOmHPCieDwTxkGLNf1zrxW/Gr3SN68sCzRAEXlOm
         L2mgXdMZDc8lw0a3N2ceHkFeXVoPcsEgdnt47/XebTm500M7+c4vsR1Mzw9lKSY6aIf9
         1pCA==
X-Gm-Message-State: APuU4Z+viZ8ABRv64s8hKTgaEt2uMTbCYMsQTgKCuQVhbxv7wJURQqUX
	cXA0dNNjAjear/YCLQPPUl/mOEjlypz8IXuv94t0So1Djg4zUKFNYx5wJ6BBknc+1HM=
X-Gm-Gg: AYBFou3zcU8pZu8xL/+YGsWHpqqewkrWHr1UseQ+ayGNxMu3IncFzYXGELQXEvVbKRQ
	b/Aqez3z0i2lBKlUuBlw4aYGt0PCLuNOn2N8MIS8P6ZrAv3EpKY/sa+kLDmQU8QBPKTrUwZWoNS
	Xencr5v2rTkoEVb5Q8LEVqUf1Qy8XFrxZ9hrWWzXptAdIhXupJTyfpPK5kZn7H0GZ5kWTOYSeHW
	GzNcokzIWzVsGu+QOiOQzfFScA+Lye+uI/dRfyHelxp/ZGuJEzGrmZhoshH7on2XK2mFmacXTGL
	H7q3hm0BhocO2L36j1Zi0KqeixV1wC/scPqClxfk/9qxjyKEn1pklgiGXFjBuHnPl+DVge1hILc
	jkr6OOqYc3Awy/G7b3t9zvuVO70ljaU9VFN21+XW7oAvaC+GFyfJ4QdJ8x+Aw/BWb1tsQa+xWIA
	t+1lgv2XlLwIHXAvKdPLhGLHqvAoQL/ajYSNCWGEX7qnFqiimccD5aA3U+5D4T6KhLl3gbHoyP1
	+Sy4Ff0aIzwMREUOknaaToYW5dE0KgSpU4+TUmu8jl8UI5y8kBL1eZ/RrnCov5dZ9mGts/t+pOP
	S/ECAjzkofAuoZ7VYI1CXc3pO4JgE/TuAa6vEgjcVDIKFH1fCQ0hgAYdnt6Xd0btGnsQdMB7G8C
	85PBXYTf4t2KMxEZRGyUjTZ6ohlcH1HWGbyJQq15F/iHEEFh+efIksavwH96U+UdnZjElgLPRKp
	RKNw4zbMR94KsrCsHMZwd/mNkPPFZ1Xf/fdloQHEglb5mwm6DrIz7gyJlmn1QxCzKVoPaVeeXpR
	QUyxeCv6a5VCH2PlIl64PkNa8sjaE62KdZPfTL5kWuFesY1TZTgfnkCwi/pr2GUP8J5Y1LriCpd
	uIGY
X-Received: by 2002:a05:7301:dd92:b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-37256038e85mr1927203eec.8.1794123066473;
        Sat, 07 Nov 2026 23:31:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16f9csm3536291eec.12.2026.11.07.23.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:31:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] packagegroups: Add clang to the SDK
Date: Sat,  7 Nov 2026 23:31:03 -0800
Message-ID: <20261108073103.1232032-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249753
Content-Type: text/plain; charset="utf-8"

Now that clang is part of oe-core, ship it in the SDK the way meta-clang
did through its packagegroup bbappends:

- packagegroup-cross-canadian pulls in clang-cross-canadian for each
  multilib, next to gcc-cross-canadian.
- packagegroup-core-standalone-sdk-target adds the libcxx and
  compiler-rt dev/staticdev packages when TC_CXX_RUNTIME is llvm or
  android, so the SDK can link against the LLVM C++ runtime.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../packagegroups/packagegroup-core-standalone-sdk-target.bb | 5 +++++
 .../packagegroups/packagegroup-cross-canadian.bb             | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 06fdda90c7..dbe9cc0449 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -12,6 +12,11 @@ RDEPENDS:${PN} = "\
     libstdc++ \
     libstdc++-dev \
     ${LIBC_DEPENDENCIES} \
+    ${@bb.utils.contains_any('TC_CXX_RUNTIME', 'llvm android', 'libcxx-dev \
+    libcxx-staticdev \
+    compiler-rt-dev \
+    compiler-rt-staticdev \
+    ', '', d)} \
     "
 
 RRECOMMENDS:${PN}:mingw32 = "\
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index b87721a4bc..b9479b6bb5 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -9,11 +9,13 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 BINUTILS = "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 GCC = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 GDB = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+CLANG = "clang-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 RDEPENDS:${PN} = "\
     ${@oe.utils.all_multilib_tune_values(d, 'BINUTILS')} \
     ${@oe.utils.all_multilib_tune_values(d, 'GCC')} \
     ${@oe.utils.all_multilib_tune_values(d, 'GDB')} \
+    ${@oe.utils.all_multilib_tune_values(d, 'CLANG')}\
     meta-environment-${MACHINE} \
     "
 
