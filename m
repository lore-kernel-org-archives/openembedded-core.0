Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.6606.1589432608524666664
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 22:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iFBl/iBu;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id u22so707765plq.12
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 22:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O20/sXJ/j0OULZqHo+n4tpvSeKiqntnNUdzZVUAcwxg=;
        b=iFBl/iBu+naBhQ+qPyi2VfgiHEJMmUZyucygLPcUQkh9yPzJTfYnIaBFbGpSPu3oiw
         ahkY+mtQDJ2oH6jlGxxjXIobQBrRBSjEMWcbQN19y+V31Yf/8xFaZm5koJPowi4qDaaq
         LYU5roCtFLHJyfOyelppGct6F+KKba7aWNehAdbg+B+FA18I8dNjpaNdS8GWGQKO/NDP
         ynSUjszsVNrxg5OEfqbD5o/evdwOeIgb4IuW0OId9+6hMZNZOo1/Qy3o3OYHMu/tmx1G
         N2y8dio/Ntfofd03a5W8Abx6T40Fvzo3FCQmqmYHPfmZiLRDrAufY4+aV0D8/7K/cR1n
         BNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O20/sXJ/j0OULZqHo+n4tpvSeKiqntnNUdzZVUAcwxg=;
        b=tONdBRuih71Pc6BF3kQwYRU/zPdBxpokGSBFsZe9goM4MPagpgH/eHKTRBfXhoiYyW
         Ry1kv1O5OKEgm7T7U2HblqkrOigHSuwMCiQCzqWzOhMV8f/FJqxzgK6E1tTaZc2cXSF5
         WFl2OLUS6FgNyuh0R4TtGlFjkbzwU/+PKf/NiFw0/DPTY5W0SUm5Obg2PgJTxS96Ih2d
         IIb3k/2vAEHy2HKBvVXUMUERKY2HeYENKhxkdyD/zk0lzcrzgtPP4IBkkSSGIss670mC
         Gix68b1oKeQzMAFWWTw8SGnQHJgb/RgXkiAWFJHFFlDxHFQrhmtmb/TSM3sXBxHYr/7B
         w/kw==
X-Gm-Message-State: AOAM532Mf5gc5eeAgZWjN+ReWp4j5LZLnr1eQ9FGxSHwz3xeGIn4L8rW
	8LCxUoA5R5yAkkMoFl+hEQg9W7AAvDU=
X-Google-Smtp-Source: ABdhPJx4TdEDBt+cc+TRTe9BgStisJvEQpjeN79xbcwrRAIF8l1EQT2h3TudUUatfpsD6J/j14jfqQ==
X-Received: by 2002:a17:902:fe09:: with SMTP id g9mr2414347plj.301.1589432607695;
        Wed, 13 May 2020 22:03:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id z7sm1067649pff.47.2020.05.13.22.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 22:03:27 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/6] qemuarm64.conf: Use cortext-a57 as default tune
Date: Wed, 13 May 2020 22:03:18 -0700
Message-Id: <20200514050321.1292228-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514050321.1292228-1-raj.khem@gmail.com>
References: <20200514050321.1292228-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is more appropriate for the machine we are emulating

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemuarm64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 1e2d4f018d..92da16888a 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -2,7 +2,7 @@
 #@NAME: QEMU ARMv8 machine
 #@DESCRIPTION: Machine configuration for running an ARMv8 system on QEMU
 
-require conf/machine/include/arm/arch-armv8a.inc
+require conf/machine/include/tune-cortexa55.inc
 require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
-- 
2.26.2

