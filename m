Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05424CD13D3
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 19:45:19 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7109.1777578310068850897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 12:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fvCtHraC;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b7adb38d65so12056115ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 12:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777578309; x=1778183109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gn+iWEGoT97rtbIhgZj/wCiftKV/jpjN0UrCF65134M=;
        b=fvCtHraC8VUfLdfUMJFTfpp2cxToK1jjiRvXqqm8f1F1KeomiHbnJ5SC3Qsc2F7wJf
         OuKT2gSgO807zya82W07s7A5SobUCLQv4y1RjLxxi1bhOqPgQMIH+HT8UPn8iHDRWEPL
         cbycMwcpqIJp5OarW9KhQ4MEVvEDBBTcKTiMSdUUgRdO5Sd1kuunrE5dNrwb9bKo0SeA
         NkmEE9EtqUw/ChzIMhISiD0yYwiBJmxNAi62KN7+YbZVvNbxtagK4tEQ2tBi3WM27IlP
         sdgX7xqs8raA/OSU8/DgUnoa3KkQ1D0EC7XOpKDilqcTw68Ufvg3+wo1TCJvW4MaM6n1
         W5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777578309; x=1778183109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gn+iWEGoT97rtbIhgZj/wCiftKV/jpjN0UrCF65134M=;
        b=NX+yxGjvPyscA1rPT6az8FX0c0e8PdB90a/gyjfkD/22j3hWC5SGfUCTKBE+/guhBh
         bkPqRDLgHdCkzOUoGCiXDjBtQfRhwNAiIJ6Qipxp7Z2C8LrNzLx3fhcZnK4lubKqjldv
         0dpO+JoENQ9dco9pR72eDOaALNPzTQGerW9qKS7SR2JR2zldM4K5XaTwtzHDvhB0suRo
         vMlZgxSckgehlRCja0jqLQVvmLiVFuEJL4XW6/bCSRJRziOPTKgrdDCpKxPkvPepIks2
         zCsByPYHoW9gIQ9nQSQfeK/itrPh0pQ0+cqwM7CS4a63K/ZSfjL0mlh7IFHggvTNbLRT
         Owfg==
X-Gm-Message-State: AOJu0Yw/Y8uLOETe4QbjOcg3VYuC9bPDJ/iSeIEwwFoalkaLrV2Y3cx0
	8pWKMGae60qMPWzwKTCQPOr45cvxi/lIZW11QqplkKosOhwW0d2w0aYpQQzu3IDN
X-Gm-Gg: AeBDieseSBHw9qSgJUmss3SWkS5OSXXqiA9khI77nVSFz8MEhv1zAbQvBt580bU+0oT
	bWmM8tM2amBfkRWXRx5M97x3aWcfDLYZTEvua6AUivdd4XfOKPJyeRTLJF4i3JdIAC6q/Zth0b3
	mgagMHG2H1eyXg/0Bw3ZoYycK09XIp2C7tqWuUe/ut6osKBo9vRtS0rN4z8QBEbWjQf+Hmt0zum
	o/Vqbbx1nHsvQ2teFcLDVgB+qTOts91VH1QOSWN2E68oIzKz/tgo6cFSlbb5DNBypSlj/UfwPmX
	a4YGnqQpKDa02Vv7KRM1nHvB7FIkOmG+W6E+FnxqYkm8TlTjCwUhi9yOgDUrtwBUkrijkp8VM8T
	3q9tZifRFF2IQUZj3qrln5eu5Tuqi40DqAKKTw1QmVlVJWDftvcclbUEXoa5JU2VM/q/SbaOriR
	p7Z/8cvysyKg7QOwWem8ZkQv+lN1liKEbMxdgv6I5cefMckVM=
X-Received: by 2002:a17:903:3c2b:b0:2b2:4c58:5ba7 with SMTP id d9443c01a7336-2b9a24e9cb5mr46732305ad.30.1777578307266;
        Thu, 30 Apr 2026 12:45:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae59864sm3626325ad.75.2026.04.30.12.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:45:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 2/2] wireless-regdb: upgrade 2026.02.04 -> 2026.03.18
Date: Fri,  1 May 2026 07:44:53 +1200
Message-ID: <20260430194453.261162-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430194453.261162-1-ankur.tyagi85@gmail.com>
References: <20260430194453.261162-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 19:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236182

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
index 2f7c816043..a70e9dd0da 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
+SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
 
 inherit bin_package allarch
 

