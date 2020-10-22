Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.742.1603381962819242520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gTE3no6o;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id 144so1395132pfb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0dfx8l0x23TrvDKw/jCagCqfaERrIOvYODW77PRZ9Uk=;
        b=gTE3no6ojFXODlIYzfQ2RebNK2rdMgLgkaZN78+4nwuzKn9L8l4DR0RMdqNLt7b8Iq
         zC52bw5558eNtBC5sBEOEXjJXXS7roSgeUVUZoOHYRq5TY/z/se3BhMckPZ2vD+KC/bY
         onjSjE7+wyl8Jt4aJYtMCG5Pv+QkLKum649Ek3V9qc3DjDuC8ARqVlmKmp+mV5yImbnM
         u3LBUzcMO0LnBJe0gemgEgdYcI5q7bSmBjTPRaZXJaXOM4IRpUqQ8KrYM3Wo33x6aHWo
         ck0DzCfi4ecABJcNDI9qsHsuLCCuVGt2DPNFy3ihMUgiklK21QCTKkTKWAVRSTs5OnA4
         CkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0dfx8l0x23TrvDKw/jCagCqfaERrIOvYODW77PRZ9Uk=;
        b=FCFXQvBiSV8CEwJr7T1M/JE3k93faTNihtwQqeXXViRHceHJeeKkN8IFohbWmh3DN0
         6FKHdgiL1AH8N2lGohPN+7cXRFO8nzT6z+JHCe63AlaGxDQ1LFjFThrpi2Lki5Ol36gT
         jHBGzY3ancxigcgLwnaeWmtFVO+Q4aRQ/rixv7U33HxtJLpUe/ta8TAEw3k5n/bK2FbX
         0YafIl2u+kNKuvbPc582LeZ4B7zDjKMMjNw6pH8g3hu/+LQUymvl3AZmR3FLdLdn4LN2
         6kv2lOR5EVs2J8R2eteq3nNS0zgrKEX0w5wfehE+7P+gHRgNh848RuSDi7Y3YQS0y5pZ
         FBmA==
X-Gm-Message-State: AOAM531OXZSK7ydbyi19G0l6lpNBUxyKK1QFwX2jf6EQ8MwSreUDahbs
	1KxZ4y1WuXeXtAL2pywuiu8S9QAKwMiynb4A
X-Google-Smtp-Source: ABdhPJwRffZZNyatJQLrVIa01oBRF2QFpSCPxdIpSswapoxDD2StgcAxNa/a5piEb7+PovaOp3QGQA==
X-Received: by 2002:a62:7cd4:0:b029:152:5198:3f19 with SMTP id x203-20020a627cd40000b029015251983f19mr3316756pfc.31.1603381961908;
        Thu, 22 Oct 2020 08:52:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.52.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:52:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/14] tune-riscv.inc: use nf suffix also for TUNE_PKGARCH
Date: Thu, 22 Oct 2020 05:51:38 -1000
Message-Id: <8d2702b7fe51474764c7392ef6386b8d199b88a6.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* broken since introduction:
  commit 5263b2ebc57fe289d64c74bfb10da39ed7c98828
  Author: Alistair Francis <alistair.francis@wdc.com>
  Date:   Thu Dec 19 13:24:10 2019 -0800

    tune-riscv: Add support for no float

* fixes:
  scripts/tune/log.fake-riscv.riscv32nf:    Error, the PACKAGE_ARCHS variable (all any noarch riscv32nf fake_riscv) for DEFAULTTUNE (riscv32nf) does not contain TUNE_PKGARCH (riscv32).
  scripts/tune/log.fake-riscv.riscv64nf:    Error, the PACKAGE_ARCHS variable (all any noarch riscv64nf fake_riscv) for DEFAULTTUNE (riscv64nf) does not contain TUNE_PKGARCH (riscv64).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 58088dce12775e325df8428b750e19616d264464)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 741eeb34db..028548bf56 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -24,10 +24,10 @@ PACKAGE_EXTRA_ARCHS_tune-riscv32 = "riscv32"
 # No float
 TUNE_FEATURES_tune-riscv64nf = "${TUNE_FEATURES_tune-riscv64} riscv64nf"
 TUNE_ARCH_tune-riscv64nf = "riscv64"
-TUNE_PKGARCH_tune-riscv64nf = "riscv64"
+TUNE_PKGARCH_tune-riscv64nf = "riscv64nf"
 PACKAGE_EXTRA_ARCHS_tune-riscv64nf = "riscv64nf"
 
 TUNE_FEATURES_tune-riscv32nf = "${TUNE_FEATURES_tune-riscv32} riscv32nf"
 TUNE_ARCH_tune-riscv32nf = "riscv32"
-TUNE_PKGARCH_tune-riscv32nf = "riscv32"
+TUNE_PKGARCH_tune-riscv32nf = "riscv32nf"
 PACKAGE_EXTRA_ARCHS_tune-riscv32nf = "riscv32nf"
-- 
2.17.1

