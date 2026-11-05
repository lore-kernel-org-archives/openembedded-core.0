Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29817.1793868236536958761
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=oKVDQ6xZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4918c2d727fso183164f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868235; x=1794473035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9qoq6Pz6FKjCH0bnJF0a0ESq8wqKtRRiQzM2PuOBz4I=;
        b=oKVDQ6xZWG681q8HajIWRl5NWNiFXibBVKn7Fx/RbN/goy9HmkHwcXWo0xLCHCyiOS
         9vANE4+pJz1YS7Wl8ieanie1oIGJKbSB6bcIut5ijs8nCvBtJ0jeYhF5H/3DfG0Jo00X
         5NU/iW0tr9W/PDt01YVrMB+PcMNM7YQzIO+dZ6SHUy1gCOBslXVI3xzKBSoE5GEUq/os
         8wWvpsuZ2CNVeuNCQ5BqqxF8ROt1rC8jA23CPgTXwPRsPr/PU45IjwnP1P4cWomSl/8u
         M+4aGTIDOO7zkrkf8ltUT9NweM2Qc218w+y9145zTPYsIbLJbb88FxkGHacmuM7hg6ib
         o8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868235; x=1794473035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9qoq6Pz6FKjCH0bnJF0a0ESq8wqKtRRiQzM2PuOBz4I=;
        b=lPdHD8PN2/C9z+j7h/1ll7UnDPa5HEdapICLM7vvbJKLZTf1kn40PsVsvQLKsyzeO5
         J8XtaG09Rd35K+M3Kso0VocHotKw5p6QWM2USR2wb6m4GFrpd70tq/qP8h0m3+QosUBy
         J7vxTa1uyPdHnedWJAY3Bv6oPZjrst4PP3cM1+smpXdQwkCmdo8za4X4rXc8rMDgEZWK
         1zHv+EzcZeynBuinkVjCr7EELOVTBASRsDvtI0btx2o+NA8BSSI2vZwKC03C//JjLs1P
         mFvqes7FR71iRtXuEGGkpAmICxQLXNw+PP5rRFhe44uCDinl31nODGsj7xd4vgaDfrVL
         iHMA==
X-Gm-Message-State: APuU4Z9mO4mdcSJ/UYWqna81glcgF9wl7mTn5wnHXeM7SOeHPJsP4rlv
	QJ6rhhQguMxkmg4Lr1AH2l0qpxQnFY1jWFmu0Pi6LRH2aaFsP1LD2c9CNJR445O3ir2ME0Uj72h
	/3WaFqfQ=
X-Gm-Gg: AYBFou2RM6j52MvSE4mnPVu8Z4dm4ZFOYM7PFXzerLo1yzTb7DxjZASGqOnKLrwGPbQ
	Ifjm2IMAg4X6htTMPM0zQuCkL1tfhWR6XncHE/a9L4udE8Q9cgG8ek/snlGGUqnGM48OqQBem3i
	ZWsrdEwHEUT3ivdDHYujPfTletjZzHHrX6mpaO1V1Bv5iGdYsxCdTDRsIIqV9mfwdN6klUbFNQr
	FR9VPF0nL5G5a3klMhayoWBUwBHI2rr4y3f9Y5Nr5td90XbgwI4TkZqipbKQ+FIYEMByNVwM7ZJ
	6YQT2y/GTsZCh8DOCEQYjeOPD5wkBSalDVeIwTkV5S1NEYWAY/22RVUdKK39uzceezblmWPswS1
	hdfA0CNhPCSbyU4ZVmYcQhVPfTrHmjlQj3j32FS74iWyd69WsjyiULn5oz/sF5WdddwXZ12EUMs
	ZJ2Jd8gwGfNqfCuZ/IpnVAWiGCun4UNvrjdCD0mCQC3DmtNxIBRkAD3tKtUytwaFM2CRc6+jIBt
	3ojYBrtYzDUnUyLuf4sTMUOhJwGOfG7PMLxwMG3agz/3bWe4LiXxlur6nw9O/yHeagnyymO9rNp
	4ha64aOzK/9K+FErAWytUJ5sRV1SxaP7cKoVYxc5qn4+Sx33Ar3oByFW5K1lydffXIRSHDoR3pv
	AVC8a5SuSpp2F2MeJOrd7r/ny26Dr
X-Received: by 2002:a05:6000:2887:b0:490:7fb3:cb41 with SMTP id ffacd0b85a97d-4907fb3cd7cmr6715570f8f.24.1793868234707;
        Thu, 05 Nov 2026 00:43:54 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 30/60] packagegroup-core-tools-testapps: Ignore gst-examples for rv32
Date: Thu,  5 Nov 2026 09:42:49 +0100
Message-ID: <e6e556b04a1de847a9b9f2181f421e865c52f030.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249489
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

Not buildable yet

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d0337b87676dc02759fc4ae57f59fa7c01ea1b10)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../packagegroups/packagegroup-core-tools-testapps.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index d6bed8d32ca..b8a6b3f01df 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -30,6 +30,7 @@ GOTOOLS:riscv32 ?= ""
 
 GSTEXAMPLES ?= "gst-examples"
 GSTEXAMPLES:riscv64 = ""
+GSTEXAMPLES:riscv32 = ""
 
 X11GLTOOLS = "\
     mesa-demos \
