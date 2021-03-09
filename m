Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.12883.1615311143149918035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 09:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t6Gg73Xz;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so5579476pjg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 09:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9i8IdxnVcsdLy7WVPd3CnlGbd9p52wk5DScHFmTpWCA=;
        b=t6Gg73XzAYFXi2Gz1yj1AKdlnQ+2u/+Gc3uEK51mdopPENFZdIroCzptnJZQlw6Goo
         8wasAavSYEaWtk7VvhsuglX2FJNg4Uj5DG3E7QkIOlxAfNn60qf6cVS5DAdOR8h13XBZ
         YQ0V3O1E3f06ezua2G6PAqfoBSzCEUSWGY+rTRATBUEPvv9P/PEkTsCIvDLeetHiTknH
         txJwiBxW8+JAr9hAoEg2W2Q3rzUQPSwMkz+ONSDp596T8CxNWHVNd/ijevxGeylNL5D9
         23m56KwTFklBmZLMXfSrF75sDrQu2c4OfPZz8bzNfXwHxChnYzW6mLuGqx4wOHdE9UOg
         ZkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9i8IdxnVcsdLy7WVPd3CnlGbd9p52wk5DScHFmTpWCA=;
        b=ljM/2+Y8WSFuF9bKR6lZspLbgS7Du38RoqHoaBgDDdTWAtF0l44QsoWXTg7ab3sacg
         4Q+gOrebEs6mnBYoiuYPQnw5d4AlGgmhnAaEVZcgFumzSw19bLX44L5nWtdJTSTRgn2k
         Hpijh9/kGSt3ByYOLr70o/PUhO66IP3DDNBcjmlBM5Dqq7ZcDpG3yLrnKZr1wTJaYP1o
         c/8KmkAF11LlCn7eN4ZbUxEQ+Z4J+JVIaQQ6JTK5Lk0Zhq/UUNhxFmvQdCAPYUlft06E
         39RsiyCOAozFMkj6y28knFC4DCGh9Cwd3ggrZpgD4d7CXQbJ3j7/8HKG2/WsJqa9DV5a
         JLaw==
X-Gm-Message-State: AOAM532nrZDxXXPnjvP1QCbEVy1wMVc70huErJwl84y/o+On4GK24oZK
	zaShbdiaJLYUWzP4/Wip54RzmVbSJzp5FQ==
X-Google-Smtp-Source: ABdhPJx4/1gBiZJcXtEHigquuHPiX5p5UV/JDbgIxqbt/iXVttVojmUZdBHPjM3rCk/qJE7dAdBNMw==
X-Received: by 2002:a17:902:aa0a:b029:e4:c090:ad76 with SMTP id be10-20020a170902aa0ab02900e4c090ad76mr27391263plb.2.1615311142401;
        Tue, 09 Mar 2021 09:32:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id k128sm13541568pfd.137.2021.03.09.09.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 09:32:22 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/5] linux-yocto: Enable powerpc64le QEMU
Date: Tue,  9 Mar 2021 09:32:07 -0800
Message-Id: <20210309173210.295033-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309173210.295033-1-raj.khem@gmail.com>
References: <20210309173210.295033-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 5f77a42b04..0b3e749a3e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -45,7 +45,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32"
+COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.30.1

