Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.155960.1598109740150473834
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2020 08:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lp4tDFA0;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id c15so4532614wrs.11
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2020 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YPODlchRd4mSO+i+93fUm5W4SlXchpjsSY5OXJaasfI=;
        b=Lp4tDFA0LglOtEXzbBEOaSe3FfcAuKY2wObBL5VL0CglR3pb9EioJaKQpMK837eGOQ
         qxYE6MIdjTjeJZdjpr096kSptvXGKu2tp8RWfjIYCOGcuHbLMN72OCMJii5l1n4HOcBr
         9gzvLFCI9uF7Ntk/DBgg0wOQJkGevr3CckeOhOHS/HD8Dg4Lw5jK6j5xXn//GX7tcJvK
         QD3hPy+HP7YTwfi6XhbRfOC9XH5JdLXwBZhJxJ1fD1xiEetWLlCCivscrnrqtPrBZpYl
         6RSq2pzV1kN5LHHTCoS0uul0LBxsq3OxQE8UUtGe943BZGvveoty8uAOtlhBpNJBKOcj
         lW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YPODlchRd4mSO+i+93fUm5W4SlXchpjsSY5OXJaasfI=;
        b=Y7kfKcufsAEKGSfka+sSVBFghGXycX1urh1dI0b2sX+/Zk44v1RYWvY567oJZDYtg4
         f1jFraWdkRmov3gmKJoahGrU+sSa+OFeI5Qud/eGMJF9C6nWx4jzKpvq4nobW1bjtMt5
         cB0kajLBqqSWt+Dlx2J0njgPB1AUfVYJA7woIJUkF5rtjaGIcb3rV47VX86rMx0aLl2g
         dj2QHLQEvLQqqLhysISYIN3/IhaHgtjEcO52a3ENxdKsc/Hze6YIQS6+oekGVn15Ltqj
         h03IUkfuLhpuLvcVsMaNAsEvxwUbIJqscDx/ayjAaxrQlv4WNrGMoBd1BNsPV7NsH5Ji
         ImLg==
X-Gm-Message-State: AOAM530eqUXkzYoBOHSsjm/lr0UjSY+eLjQ2SNk3kW6c/SAoK3e8AUu/
	2G+p/r6ttrQ/B8ZxDuohtLxGbKALWF+bug==
X-Google-Smtp-Source: ABdhPJwULcRMK6CQEmebfeYIQl46iKu/+33F1eH7GOtO+BKAMdMQMlZKSZrZoz8zIJzB+maa/iCb/g==
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr7265723wrm.367.1598109738495;
        Sat, 22 Aug 2020 08:22:18 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id c145sm12110018wmd.7.2020.08.22.08.22.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Aug 2020 08:22:18 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [PATCH] [dunfell 2/3] multilib.conf: add u-boot to NON_MULTILIB_RECIPES
Date: Sat, 22 Aug 2020 17:22:06 +0200
Message-Id: <20200822152207.32161-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200822152207.32161-1-liu.ming50@gmail.com>
References: <20200822152207.32161-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

u-boot should be a non multilib recipe, add it in NON_MULTILIB_RECIPES.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5e7dc0d68efb2d43bbd5b1be9e6d555fc4456fb6)
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 58f2ac5c86..d231107f8b 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -30,4 +30,4 @@ PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkg
 
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf"
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
-- 
2.28.0

