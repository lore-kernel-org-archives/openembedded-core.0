Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D780CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:24:13 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45220.1762770246422887124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lpEFx390;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7af603c06easo2550603b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 02:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770246; x=1763375046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/pzM0rxTfKeztimDohHNAbEaPEv5b5bqd51A713Dr94=;
        b=lpEFx390igIb39s6cAKCoryCBzWTTuDC0bIn4nQ7RNmbBxeFMowca4e4EcuLGwB5s5
         IyNQPj8dymaAo9Ny7a7tQ21gyVWV/Xaq4wA8WT0UlMfTEcRaMFwpNHQWf6S4iZHgy/Lz
         t9JcTVSjGuWnFvrOJrZoT4LvGitFaoOpFV0UwMzw3OZpbuh4Ch2rRyxYV/BUCX4TTtGS
         LYaneHVcUkwrsNYNbNeuf9pNurc6nT+4E8Z+MVVwERzf7c4FEhI/Jx04tEB+vhXxaDdK
         fLSrU/8eFiC/U0wWTkJM+esi8GxiBi2q4mmvPb8U0SqV0dzU1HccKtmv9S3tVmUIFykN
         Tncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770246; x=1763375046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pzM0rxTfKeztimDohHNAbEaPEv5b5bqd51A713Dr94=;
        b=lNRcgDsujjej5mqapHMf4u0ix8xGPnoe2XS12VgSjcqwHAdOH13ZFzDK0cDpnNH7vR
         1ZMX2/C3lHTXDlqkWuM38n/wHrL8Xdj6hnic4cyTQyRxkOog71HDAjD2AQ3vaz5dHkyv
         eCozUsIih56UuZ8wpg6FrD1/sZ65dFSZ3RNbrxDPdhVQ9pcLHl4VDhpOsRH0SabDbIYC
         c3hbaSIls4qX1m0FAfi7g8m/8OVh0I7bxg12CdZUOuVVSAl/ILmvSC72nAp2PydxpwUL
         tap00XanVi4+9UucaQXJIXaNjXc1NuUvTesXyqK9I8M2pXtHd17ZZTIdI3qNic2bueii
         Kslg==
X-Gm-Message-State: AOJu0YyJyR5FimBKRe5BFeF+nG+/AG9BXxtwv6N8Fsk8KrU2tc7C1P//
	PUAa4NZgfNWj8R62FiV3cmeFWhIq2z4JEt1eY5iVmCDvYWYA/DIpLhN42YElzw==
X-Gm-Gg: ASbGncsUql/LnbC141nnYyLhiuc2Dwg2oLbgJevLM1gtHNP/HyU7VTMJX91DrJeATus
	6hiWykqkBwgdEPWlt7CcBm35LWocNB+lHGQJwfDgwQTDcYfBDc8TBvDYFkVd0Q8Y9s1swWZZ4W5
	0T2f1YdjgfBs5fKS2mEiSwEfVNoMpbMoeudia909ktxXPtc1ZtVfG5qNCUZCtzagQkGALB1K/Q2
	Adwxx+EhqedBJMQWUiBdf//91acCIeSfjR+QTQbIO7GlnDQgYmq5TQnCxXsbe/JDy0neAAGfjQY
	luz6TksU2cbG9HAaML8Ni+lSfHS6PPbu0IIO3ZdUvOhLTJPG6d/CJsnyHw2DF/WLL5uPzx7lIP8
	iyEEruYPc4rCEJ9DhDvstq2iTpsFN5x6z2MI430uNKjhK6ZlN0zo0zZ9Tw8WGEq4BawF1hdjv/7
	/lBuvDiicCRxzOkQ==
X-Google-Smtp-Source: AGHT+IGcr6ZDGYpX4xDaFuoPg5GSfdiL/qljEb17IqutkjMiTIzCpGbMo69mv9yv9pm/StN+tfQe+g==
X-Received: by 2002:a05:6a20:9c92:b0:263:616e:b61d with SMTP id adf61e73a8af0-352b8382a14mr12966183637.23.1762770245598;
        Mon, 10 Nov 2025 02:24:05 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed21desm12753677a12.11.2025.11.10.02.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:24:05 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][walnascar][PATCH 1/5] webkitgtk: upgrade 2.48.2 -> 2.48.7
Date: Mon, 10 Nov 2025 23:23:47 +1300
Message-ID: <20251110102359.2917153-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 10:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226113

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Bug fixes in the stable 2.48 series:
https://www.webkitgtk.org/2025/05/28/webkitgtk2.48.3-released.html
https://www.webkitgtk.org/2025/07/30/webkitgtk2.48.4-released.html
https://www.webkitgtk.org/2025/08/01/webkitgtk2.48.5-released.html
https://www.webkitgtk.org/2025/09/03/webkitgtk2.48.6-released.html
https://www.webkitgtk.org/2025/09/24/webkitgtk2.48.7-released.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../webkit/{webkitgtk_2.48.2.bb => webkitgtk_2.48.7.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.48.2.bb => webkitgtk_2.48.7.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.7.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.48.7.bb
index 75a39558db..179fb18693 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.7.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
            "
-SRC_URI[sha256sum] = "ec58f6dfc25d3b360388e192f865068d69aab09b4d7df021f90e314d2fa54f37"
+SRC_URI[sha256sum] = "2c62aebb608e09f930a539f3623a5cc8023b5068029f42a208f45f9124da6e30"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 

