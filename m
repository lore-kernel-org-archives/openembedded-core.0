Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49159C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 09:55:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.29284.1701165324430968928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 01:55:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hjo2fThd;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40b2fa4ec5eso39046405e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 01:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701165322; x=1701770122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cd22ZgXvgvggMbMCgVl8fofaXOuhadpJY7AbLp8ZXrU=;
        b=hjo2fThdOXgmU0uTwFZNh9D2bKHR8fiHQ3WSqk2ZeJMZ9J/XrkUTW21zWghSuLN1QL
         RNsmx/vNZFH+XaZtojGcjq1MzE/M3yzmLBTtTVfGXOXzM1Nxhiff9wwuef4ih0TsrVF0
         +39ebKnXM3RxECjFczZiXqhePAOfZffm7HFnjzLrNT11RH8gcuyoqBqdX5iswUnQIdUa
         JEhNQ3MMZxs4edI+MWm8by7E70yB6x3Gq+dB1hyyYR3eN+QecQRN1LSSJYiN5WRmhma9
         uWmrBcvh8az4ZnUIAdfN3W14VDcw6OgD2JinidsUAvGW2ddoHJdr21fjy5GjSXAZyGQB
         QMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165322; x=1701770122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cd22ZgXvgvggMbMCgVl8fofaXOuhadpJY7AbLp8ZXrU=;
        b=JMqx11VfhPqpnCWoSklV6ReHmZLK3wY+hRwa82Xpd9fD1OApFeGi/wdUrCazccNjjY
         ZI7YNm9ZK6LxcBLYPcu5uHbQKbFQfMI4ntqUhGASnEImlhAZ/r47EAJfNYaMj4mFCtKx
         ylS5eG13/lJ3sjVgQuilmWpLzPHnxua0cJ8S7G22RZLFFbJtyousdH2NdPW6TOcu0RC2
         ZMHpoVcUPCm0Kv+1HGqkM14oAQYeW+Rk5MEHBghxM7yNfk7CATpIr4KknYvHL2cTwwV9
         MixoGVavuH0fFEa9Eqpd8k/ar6Vw0Xig83E004Yw06eXt7bthVjJyi/nRPx7MxJLEQ4f
         ZoaQ==
X-Gm-Message-State: AOJu0YzlXYcwhVq7QC27LC1kq3FWi6k2/x/45huEDFEffU9PCe2uPpaB
	Iog4qOPVd8t+mVljcwpvgXsdCAc2pUXAtQ==
X-Google-Smtp-Source: AGHT+IFSfuGMrOssmNtHWOf0bdoMaXU23HnxRe/iGaDl+BDgQtWp/flUKqd3NqP7Dywmox6Ou3tjVg==
X-Received: by 2002:a05:600c:3c93:b0:409:6e0e:e948 with SMTP id bg19-20020a05600c3c9300b004096e0ee948mr9840199wmb.1.1701165322348;
        Tue, 28 Nov 2023 01:55:22 -0800 (PST)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d5107000000b00332c36b6563sm14370529wrt.101.2023.11.28.01.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 01:55:22 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] initramfs-module-install-efi: add GPL-3.0 licenses
Date: Tue, 28 Nov 2023 09:55:18 +0000
Message-ID: <20231128095518.2088391-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 09:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191350

Some of the tools used the script init-install-efi.sh are GPL-3.0:

parted: GPL-3.0-or-later
dosfstools: GPL-3.0-only

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../initrdscripts/initramfs-module-install-efi_1.0.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index b7499644f0..0f18ecaca0 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "initramfs-framework module for EFI installation option"
-LICENSE = "MIT"
+LICENSE = "MIT & GPL-3.0-only & GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS:${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
 RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
-- 
2.43.0


