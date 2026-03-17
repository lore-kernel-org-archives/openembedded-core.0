Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4363FB5E90
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:03:44 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65368.1773705818441054295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IeV/X6ae;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b93698bb57aso44995866b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773705817; x=1774310617; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0QkN+kDAUzr/VFD5dtGrIk3px9p/UfTRgfMV8mhfP8=;
        b=IeV/X6aeRNKMF1t+Zg1qLntFaVrpx73/CYBSQxseuRN02rlhKCX3gbxEas05Q4tLU6
         QymADUz5q3JFYkLqnySvOKN4OYRNzfvPL7HkXR5YqGMfPXuNReZWWONl34PQv5rMvBp6
         pUdKBycZF1iHaghP7EWbqJSs+s58xKc599x1HrF/FB3x2/zZqm7970NEmSRDiDdIBQgI
         E41tvpnL1N1LP+Rjdbiq2R0O367hWMcbGtUoGJw3Uh0cTLvVwWq0dBi42Zs0pxizBsIp
         PAlB5/0YaQ47ix/rTJ3c2Ml5QurPvsZcdJrZtvXQOOoH1TYK3DLKBQ6kOOsaZhdLyzGp
         vh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705817; x=1774310617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O0QkN+kDAUzr/VFD5dtGrIk3px9p/UfTRgfMV8mhfP8=;
        b=bk9znivUzzswJ8nOZaxLp2SWYeQFTgpG/yJmezbo9hRG+0c/RfN+ZwBckc0TqyGT0f
         yePEDYii7n/SWSllRfqan/mPNYMO6j9VmzWiU15HnVnKHre5wqFpyFEFQSMa1iDQHJjJ
         fl7aHA7owfw8wOQFqHw5gaqdokjGnTc3HdbsuyGwoUaXY/P2/c3xQFAuxAbRwiDmEA6b
         pDZ170eUEFYHG3AC+JGfgzXysPU8XBm4Man4gMMsSOHiOTprjTQ+2E3X2cm9CFbNtYZo
         WH/wxxLihYibhCzlGRiucLJ8ITtmv39t+ZzD/Xtoe0H3uXiJiaUyMNcxfeIa0niOL50i
         I3aA==
X-Gm-Message-State: AOJu0Yzbvd4Q67RipZ5xmIyJrX+5cC0KHIH1WYXf/SXycZluQRYtxBhu
	ptI9ayGm5KK7hCtkUTBax82gnk4ta75AIUeLc/XP2cr1yz5ttizN42D2/jkRIblE
X-Gm-Gg: ATEYQzweV1aUo0C2mWoLRZzRqsiDyqtGMlkInrdiw9YyXftexhJwLAfNMumaHP0t6ai
	wpAl0ReUOQtDCnigZ/ZP97f3ExN/s4HOYl0KkC9Cq2p9wEA0tHiHydcTeD4MXXUzyzqqpxcsy4J
	OIgqQysC2hfPSURCT0TYmZkfTNL/j5VQJXu+Ag8qAL7K+W5znC5AgYIyaR9/5/bP7d06rxB0fA0
	5RdWcX3Mjopf7LBFANnKXz8SWehgcOIszXrEuatL4YE01dgD1PQ+yO0LkurwCM4+I3W3CDUzZez
	poBvKFWWIwhD6hI4GWaUbNy1oZvrYOUHekJN8uXXHGhdYpOYDrGResyCG8sxLcn7DVAvxl8dd3e
	bTfICpAd3IJArLgxAR3egZhc7I/fQN4gZ4MHguxkqcFg+NxMOa6g5qsfaiddvdSvYMZ4oeuva5M
	XiRgChwA293WFLuTG0zwBdephMFvAB4Pp9B0itB9lmpV3pPy9HT9WxQBGmC0K6qs6mBg==
X-Received: by 2002:a17:907:9708:b0:b84:3fab:4251 with SMTP id a640c23a62f3a-b97d6cdeb18mr95293966b.15.1773705816471;
        Mon, 16 Mar 2026 17:03:36 -0700 (PDT)
Received: from [127.0.1.1] (93-159-20-97.cgnat.inetia.pl. [93.159.20.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm654584766b.58.2026.03.16.17.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:03:36 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 01:03:08 +0100
Subject: [PATCH v2 04/12] tune-power[567]: Remove confusing overrides
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v2-4-5c65ae5787d9@gmail.com>
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233277

The overrides for GLIBC_EXTRA_OECONF are confusing especially with
combination with `+=` style append. If there would be any value set
prior, it would be overriden as for conditional append override style
:append should be used.

As all other tune-power* configs append to GLIBC_EXTRA_OECONF without
any override, let's align those to them and drop the override.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/conf/machine/include/powerpc/tune-power5.inc | 3 +--
 meta/conf/machine/include/powerpc/tune-power6.inc | 3 +--
 meta/conf/machine/include/powerpc/tune-power7.inc | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/tune-power5.inc b/meta/conf/machine/include/powerpc/tune-power5.inc
index e70e401217..eb8e51ba3a 100644
--- a/meta/conf/machine/include/powerpc/tune-power5.inc
+++ b/meta/conf/machine/include/powerpc/tune-power5.inc
@@ -17,8 +17,7 @@ TUNE_PKGARCH:tune-ppc64p5 = "ppc64p5"
 PACKAGE_EXTRA_ARCHS:tune-ppc64p5 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc64p5"
 
 # glibc configure options to get power5 specific library
-GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=power5', '', d)}"
-GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=power5', '', d)}"
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'power5', ' --with-cpu=power5', '', d)}"
 
 # QEMU usermode fails with invalid instruction error
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'power5', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-power6.inc b/meta/conf/machine/include/powerpc/tune-power6.inc
index eaf89515ca..ef6d0f5a50 100644
--- a/meta/conf/machine/include/powerpc/tune-power6.inc
+++ b/meta/conf/machine/include/powerpc/tune-power6.inc
@@ -17,8 +17,7 @@ TUNE_PKGARCH:tune-ppc64p6 = "ppc64p6"
 PACKAGE_EXTRA_ARCHS:tune-ppc64p6 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc64p6"
 
 # glibc configure options to get power6 specific library
-GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=power6', '', d)}"
-GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=power6', '', d)}"
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'power6', ' --with-cpu=power6', '', d)}"
 
 # QEMU usermode fails with invalid instruction error
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'power6', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-power7.inc b/meta/conf/machine/include/powerpc/tune-power7.inc
index 4531ddd85f..0e4647ac11 100644
--- a/meta/conf/machine/include/powerpc/tune-power7.inc
+++ b/meta/conf/machine/include/powerpc/tune-power7.inc
@@ -17,8 +17,7 @@ TUNE_PKGARCH:tune-ppc64p7 = "ppc64p7"
 PACKAGE_EXTRA_ARCHS:tune-ppc64p7 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc64p7"
 
 # glibc configure options to get power7 specific library
-GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=power7', '', d)}"
-GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=power7', '', d)}"
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'power7', ' --with-cpu=power7', '', d)}"
 
 # QEMU usermode fails with invalid instruction error
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'power7', ' qemu-usermode', '', d)}"

-- 
2.53.0


