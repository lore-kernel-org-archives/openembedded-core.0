Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.38174.1628868027407260146
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 08:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QM4xkYlF;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id hv22-20020a17090ae416b0290178c579e424so16471166pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 08:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Uncj8nA01q1zkjRluiXgLvNcmhntnFbg6ARb0/1tFU=;
        b=QM4xkYlFQ/zzHIxzi5XsGV6cEOXAL27cdTUrFSIiZ3ulYAlSiqAIuNatuZwgLGFQN8
         ++UvZjsZJH3+1R58ccpg6ZBeeCMNguIb6Qo3h07DCAvtqV5xvK/iVLQr6wp3IFDb2u4/
         tJj2yLmsgjgPjIy5ge63b1/6/+apoA6sMBtHTAkOta8bwkvWuTmgmVzl7sxkXJcxBKeT
         sshBGKGwrhNK+of2gpCZUSDkJAUWtyECaVzQP/JPIjVqIbhNTgcbluhuy5u+NV/HaIRZ
         NUGX/13D9liTsn+LPi/bDVSnJ79ijINnxQ5If+XTJrGt6lO7HXaCzyeWfvsHlF3vzcGN
         oiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Uncj8nA01q1zkjRluiXgLvNcmhntnFbg6ARb0/1tFU=;
        b=hIGylaAQE/GdGRUtsjtEKgQxG0m7cQ34mzs3Bn1GiMLlLXNREBCSEQR6t+zFtcrlMa
         vJlK7+OLcHHtLTXUpX3z1cbqGU/DgBFXkPpaj4rMpKKcf+TsP3Kduk2EcQacRzClycO5
         zj7dpbL4PoPTXNkMi/S48cE/6S0aFnVuR6afIpfphZNXEiN2xQxzVEmcKf0dvDdUGAoF
         Tz89qz7LVQL4VAuFmfvt9cRBBiQ5OymM2i1uDToEg0Pz2jZ/nt03LnL6GyySDABtFK/Z
         o7WQ0sgkBkbXd8QYY0PrTU9JatIoeH2A/z+1Kr13ZGHvD9J1wKF1773qhES5+3FDywMR
         Al6g==
X-Gm-Message-State: AOAM531RZT0FNFl9bRMvee9uIWejxQQ4Nd/kSMrdXxQF3zrZwPQuDjXk
	zO0NrjzcscXkD5Z88JZWI74=
X-Google-Smtp-Source: ABdhPJz+IFPGBNw6EexlTp80YKmN4jZZd8sKem18An/BiWaWcL5Fmfo078ArLxprjhxDurkiZLFJMA==
X-Received: by 2002:a63:c0a:: with SMTP id b10mr2742923pgl.447.1628868026894;
        Fri, 13 Aug 2021 08:20:26 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id a21sm1178359pgl.51.2021.08.13.08.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 08:20:26 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: randy.macleod@windriver.com
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org,
	steven@stevenwalter.org,
	johan.anderholm@gmail.com,
	derek@asterius.io,
	cardoe@cardoe.com,
	dev@codyps.com,
	tylerwhall@gmail.com,
	raj.khem@gmail.com,
	vinay.kumar@blackfigtech.com,
	saul.wold@windriver.com,
	martin.jansa@gmail.com,
	paul@pbarker.dev,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [OE-core] [v4] [RFC] Merge meta-rust to oe-core
Date: Fri, 13 Aug 2021 08:19:47 -0700
Message-Id: <20210813151947.55142-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rust-common.inc: Fix build failure with qemuppc64.

The glibc build of "rust-hello-world" throws error in libstd-rs package.
error: unrecognized arch "powerpc64le" in target specification

The same got fixed by changing the arch to "powerpc64".

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust-common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 350517c723..f574152815 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -248,6 +248,8 @@ def arch_to_rust_target_arch(arch):
         return "mips64"
     elif arch == "armv7":
         return "arm"
+    elif arch == "powerpc64le":
+        return "powerpc64"
     else:
         return arch
 
-- 
2.31.1

