Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web08.141.1616438697893495635
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 11:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fT8Xdcs4;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id x27so9181485qvd.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 11:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AjTX1qqfZCPIRksercjENQlSTSlUgE2z9eIWfOX14Ug=;
        b=fT8Xdcs4CIbwSptE1pw6JklsgQlMQaO1PtFq616PI3rszKpqjaWAHcx1EoVRHM7t//
         s4pXwvklYGtnnVNNUodV3pPlAlIHKcJyKjTUQdRWJmDxvaf7v3b+4Gri7KwpZBffEooR
         vljDed972RKzNCoAzSrZrzbZZdeQhcLr7z3vff9GUxAuSn7Lh/aEvdhxG1Q9/9yaqbSs
         o2wNu/XP9IHz6NsOhO6PuLRQVHFlkLDRPsi6pgFg+2+voSvTZEo8S20H0kqBVyRnPKBq
         Jz2yCeUE8WnlAKTamoyml1ITFW6q4phdPbSLDaHPxW245bwF6BeBZAQZ3MP882EePAbg
         XiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AjTX1qqfZCPIRksercjENQlSTSlUgE2z9eIWfOX14Ug=;
        b=ud0JouyO67degAlgUz4eORDSmuoFckSY8BWQRs0VLKVkMLMT1pdlPVY5B5vmg17y0+
         D9jhL7gO8Dz8E6Fi79qXUX7BpF9gzDUXKd7IpNOTA8tMWg9aeHhCCLxhkotE2+EkLS0f
         /vxxiwi8yQxmCXWplgldYWGPSBRywGR0gubsHa0ZAuMvgT0/o2oZnfFx8NEigYCOX008
         xw/Watq6YZ2DUgl36EORcItmgcRz1bKKHbjJx8G/bTLN6CGtv5RVfX61ma/CCyk425Ro
         Bv6AhoMpHDsP7JBViXiv/x3aIQrgcydfYOTON6eD5aAkt3U/XRK0xAVmaQBTBkhOOGm7
         oa1w==
X-Gm-Message-State: AOAM530WJzpa6AtlF2PVc0inOKCVL8K8BcmzESQTx44CSzmI2UhT8swh
	+uGMvv6yu77w2MT3Q/i38pg=
X-Google-Smtp-Source: ABdhPJyROQ3ebYGdcpHkzVb5wu90J4SyOEFLYblkEeVx2Fx3WAcrJHQVTWlFxuaShHawcIRDDBF2IQ==
X-Received: by 2002:a0c:8304:: with SMTP id j4mr1498165qva.18.1616438696980;
        Mon, 22 Mar 2021 11:44:56 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id s13sm11443593qkg.17.2021.03.22.11.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 11:44:56 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.10: update qemuriscv32 v5.10.23
Date: Mon, 22 Mar 2021 14:44:55 -0400
Message-Id: <20210322184455.35623-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The kernel SRCREV updates were missing riscv32, so stayed back on
5.10.21, which causes build issues as PV is out of sync with the
actual kernel version.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 9c122832f4..83e70d01d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuarm64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
 SRCREV_machine_qemumips ?= "68527a50a2f5b0992ba85255325d76a9f187c237"
 SRCREV_machine_qemuppc ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
 SRCREV_machine_qemuriscv64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
-SRCREV_machine_qemuriscv32 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
+SRCREV_machine_qemuriscv32 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
 SRCREV_machine_qemux86 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
 SRCREV_machine_qemux86-64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
 SRCREV_machine_qemumips64 ?= "c19b50af1e3680ff6050a0cce8dcd888accafd9b"
-- 
2.19.1

