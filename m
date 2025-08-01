Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72096CA0EC0
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 04:22:55 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.80417.1754022168589032273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 21:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b9uGqN1e;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7682560a2f2so1756009b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 21:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754022167; x=1754626967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hGkO/AheyuLFnBp3fUjRNlke079oEBwexo18EcMk34=;
        b=b9uGqN1e+uOz0WRv3GZ1Buqruua13XNKZtVZj2ji04QqgkOAU+TAe0ppwkoHvLzOp9
         23VFioZr+V56RC5MJqPydUGR0Ys4VUVz7/nGv/QHBaxKYk7/N3mlh/HWbv0Hwyj6aXmK
         Nu4+Zb3qf//4Nswtj/b4X7NAbIhAjC6tumVwsBQA/jue9gS73u+q04S5DExJID9AxAc4
         RG+4MrF2ot9dzuswIziM9f7J7wZnI8GXTE8ygCadre7HEBxVp9zA8M/msI00hnGtUP52
         07IUZhquyt2giog5q6WOap7s8maQiiwrWNu6xrSHMWEEye0mMqOspbl4GeDhlJlMlxIM
         yfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754022167; x=1754626967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hGkO/AheyuLFnBp3fUjRNlke079oEBwexo18EcMk34=;
        b=RDikHoyjEZ53Q6sXcCkHNAmuJnOdt8ruRrf57TWhUYu5Rl8YrZWO5lcjdYPQv/9BhP
         Pkd8SNwv17QcLMC37LSN/tR0a5GGfBpNbvRjVJEBOlc4xuCaZJ/lPPzPspRE43lM7WTR
         cR3jA8PTslV13CP7ohfIpY0diDQL0fpGQp0b7egRxYLcE9gh8zhjIT+W2fRVwrmLuL1H
         SXyGwizso4XVWlFqMgZIwGfuG28wXfOQew5YHmud54Fxnj9Oh9257HMNXD9TIZwrHk1H
         nFIIMffj/4ZjYHGXdgg3aPeWAtMHp26a6vIJrqUiVSUie21pZ1LR0mV8z4rQbOkv+Xa6
         ItyA==
X-Gm-Message-State: AOJu0YzrskTyYs3Uv7XlOfQ2AcXdTyavRk599RfoJIRqB83HPB3TZmO2
	esUqudFeq7Oq9jYWj4mH85yIKykV/E5p+NzW4Rh2GwQ3uKrPQtGcwrCE5BOmcizQNMI=
X-Gm-Gg: ASbGncuM7ri3KtZbPW0JHCKEai/JdHMZ2wsymibZlMuYOum9gNVWRvmZd832ONAl7l1
	L/umC/69pghp5q8d2jMRhHjGgZpInPrMwcVzQa4QLCY9KVCayd1P41vmUBbzpFfcWMUY+Z3HVqa
	G00v8+ZMaNc9sIyszWfhkbxD7k/zcvoTipWoXU03V7zGop1EkLEoPh1OPIM5942Cxe6jKcj2T0i
	UTwfshKQR3Oi2Tyt5MUhU4Oi0wY/0eSbDh9fuLbfmGNBnT232lUhLI6DHv8ine+9lqyeS2mwZWT
	B1l8NJD1W45VFdeFKyH5eQV5AfnRR2u3J6zfpfzcYNXQp75pgCx0gwtZPTfW2GM1Vix/0dCjYzd
	ze/QR6xsUaqZXQw==
X-Google-Smtp-Source: AGHT+IEFiyvUBCZsyLmW18TZhoG3KKLnjzX6Do6XmACPcWtTnGMEa5B6l1TOkNqsPoUZgLeB4i4Zsw==
X-Received: by 2002:aa7:888c:0:b0:74e:aaca:c32d with SMTP id d2e1a72fcca58-76bcd0b6789mr6868132b3a.10.1754022167381;
        Thu, 31 Jul 2025 21:22:47 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe9003sm2950780b3a.125.2025.07.31.21.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 21:22:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/7] libtirpc: Allow undefined symbols in version scripts with lld linker
Date: Thu, 31 Jul 2025 21:22:38 -0700
Message-ID: <20250801042242.3076232-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801042242.3076232-1-raj.khem@gmail.com>
References: <20250801042242.3076232-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 04:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221216

Fixes link errors with lld

aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol '_svcauth_gss' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'authgss_create' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'authgss_create_default' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'authgss_free_private_data' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'authgss_get_private_data' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'authgss_service' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'cbc_crypt' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'ecb_crypt' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'endrpcent' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'getrpcent' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'getrpcbynumber' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'getrpcbyname' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'gss_log_debug' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'gss_log_hexdump' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'gss_log_status' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'rpc_gss_get_error' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'rpc_gss_get_mech_info' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'rpc_gss_get_mechanisms' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'rpc_gss_get_principal_name' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'rpc_gss_get_versions' failed: symbol not defined

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
index 6ea9a725dbf..98bb1128c00 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
@@ -27,6 +27,8 @@ PACKAGECONFIG ??= "\
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
 PACKAGECONFIG[gssapi] = "--enable-gssapi,--disable-gssapi,krb5"
 
+LDFLAGS:append:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
+
 do_install:append() {
 	test -e ${D}${sysconfdir}/netconfig && chown root:root ${D}${sysconfdir}/netconfig
 }

