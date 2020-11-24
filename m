Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web09.51557.1606221891439442671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 04:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bh7k4H3B;
 spf=pass (domain: konsulko.com, ip: 209.85.221.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f65.google.com with SMTP id e7so4647085wrv.6
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 04:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ikjav/fuhNPXLKQPws7AtfY7YjRa6QktE7fAY4UD6K0=;
        b=bh7k4H3BSamjrLvqSnVLyQbJjSo7gtmG0ni5O6nL0KYa7L0yDwNmDz+ZCwdkFTK5j6
         DNPyN16w1oYY27Q7GholnaOphCl4QRwUBUE26E+vRr7QYQsR8KcM7qyw5muPLUCGf9Nc
         ULHWIKagzQiyYkSA3zMgVlYEAmY1W6cTYys7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ikjav/fuhNPXLKQPws7AtfY7YjRa6QktE7fAY4UD6K0=;
        b=ldgQlVTr33pt5yn1DISb+TuprCMYtLMBWoj0ivmaMQzNyAN1fie/1TJD61Z8W0GJZt
         FI5hsSDWs73xa9hvNr1zxV3MMZA7XCLC1WYXpnCGtXh/fkEeg/byYxDG4wi+X9FU6ti9
         6Chx0m6cKpHHT9dGvBOpkM/AlLEe8Ft3ah96fGonGz5vkYSW5w3Toe2SEo1OoLPphZpi
         QUMkYp6STDgtFxutW/cPMjCWvnONwNCvX1d7UaSAEnq80VROOubMpHtEn4nNMOlrLI3T
         Sbq7VWKpQFIDd0rfIkk6KZOMTBc0eYWJ1cKpsF2DyF6fFLUGuAloqDqcQ13aBtHF+Wza
         qHDg==
X-Gm-Message-State: AOAM533OTWJPAyZ3Lb4xsmKVtap/IYy/QzI2wYzzEP407TtRunZO93YY
	cgDzIeb/905trq/qGGjxhZnyexgh+EHAUg==
X-Google-Smtp-Source: ABdhPJzr3kQkS0f5wpAe4Opzf+g60NlMKtTW+3B9zLJbEx9MRAWTlIjja6N6mPAQtxkNu3OizFX9Lw==
X-Received: by 2002:adf:8143:: with SMTP id 61mr5008882wrm.318.1606221889507;
        Tue, 24 Nov 2020 04:44:49 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id a14sm5073323wmj.40.2020.11.24.04.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 04:44:49 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [master/gatesgarth/dunfell PATCH] local.conf.sample: Update list of qemu machines
Date: Tue, 24 Nov 2020 12:44:45 +0000
Message-Id: <20201124124445.25342-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `qemuarmv5` and `qemuriscv64` machines have been support since the
warrior and zeus releases respectively. Add them to the local.conf
sample so that they're easier for new users to discover.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/conf/local.conf.sample | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 22d43b20d4..742c3e3cb4 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -19,11 +19,13 @@
 #
 #MACHINE ?= "qemuarm"
 #MACHINE ?= "qemuarm64"
+#MACHINE ?= "qemuarmv5"
 #MACHINE ?= "qemumips"
 #MACHINE ?= "qemumips64"
 #MACHINE ?= "qemuppc"
 #MACHINE ?= "qemux86"
 #MACHINE ?= "qemux86-64"
+#MACHINE ?= "qemuriscv64"
 #
 # This sets the default machine to be qemux86-64 if no other machine is selected:
 MACHINE ??= "qemux86-64"
-- 
2.26.2

