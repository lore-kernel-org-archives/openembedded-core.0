Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33329CA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 16:19:23 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.19800.1756311558970697331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 09:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ka9E3ZMq;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-327705d0a9bso47436a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 09:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756311558; x=1756916358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8thpuHB/2oPjNGfX2K8cgYSHHil3TLz3CXazFq86PU=;
        b=ka9E3ZMquIBZNKbSAtTRp/+OzA3VyEcRL1XVPGJ5jih7qEKeYy3c2C3g0e/ZbXRl/+
         4NI7fLysj7jpYA1d28jMNxtVlaa6TuEnMLGEffRvhZXDX38mYikywQrbVZKu6WwwHIJG
         CCJ+dhcQ7A5nR3TuYdmSx5IB7tZrk5Ce/TvayFUaFAT2+OxM6bwcEYYj2Jyjhg+i2lpd
         y/gizUGoGoEUmfRPjDqoYAIFxN3IXNtKwiqbDpKmNAE86VZ8AQW5i19J/qpTQudcQbGh
         lFxQxVYMN05LruR1lO8NUjQJOkIwUJ0UvrDxQvLIvNeznp4u/wpaaYXZNj3jOtu2HWXm
         ITHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756311558; x=1756916358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8thpuHB/2oPjNGfX2K8cgYSHHil3TLz3CXazFq86PU=;
        b=aBvTHoYAFiiTLiAJRfbryxrQnYk41rybE3Hvw3shJRu+VUA5HGhVQEqv5y8UjXowQj
         flbxzALkBRkkGcXDHkBKy9De+ous0od4njTiJuiYjKlr1KQqgCcqWOc6yeTWWJbFqGBo
         WRzZjHgZj98PwXhtsPooCJVNXrMMmrxCdDJ1nmUfuaz/AvSYU715CH58JyKpA1HeGeZz
         XLnzWx+52uxjUn9vSlHCVYViuw+YkQqbUiAoSe9DKce535QTJlvfvBR9pajMw841Ya7w
         9uBMb8uPoMUpDSzoIMCt4Z8NHUydFv6IeJI0J/DFcSU0ffzntXxCItZjSh2hi6PgTSeH
         HuAQ==
X-Gm-Message-State: AOJu0Yze3vHHd7fddOH3reuVcTcT2RQeAZZ07mAKDqKu8cMx0Fcx4nRA
	0PhVIiwqOrjNbe3jZw4kmql1gwkhVdVwxC0A7M96dHK63suQhvn/iZOitM2vIIW5
X-Gm-Gg: ASbGncuU8jURW6IOsGgupNHS9klWzqqPsBxRid+X8Kb0S4IIMM9/M4HvSb6jRmha+dt
	QGj6m2jD7rxQUHnqlK7dcRsE1/ELlFs3hR5hTdF1kYBFzc2SghjskMpUeip0nmKHA4i6phoEQld
	UIE6Zd9NXRjAsgJhjnYhTE4ivaGvodrMCPhgVRzEfNCWdX9VYr/DLFiW20aDrhmwRq8TPP8ju5W
	gs/lDEbz9K7zlXtdUTd63P424lS+lB0jqOn3Gji5CxoL/yeu+VZDg0dsxKp3/IP2c1rQKqZb2Rr
	rwTHTcVFB0sV8JtxkZUOLZ1CPtsfjAS+Aw4XIn71XnX0lnCRDCcTAPxmRBgH02oeJK2guqmkbi9
	qdhg7L/BnlhoqhiHe9jUY1GJA14oqeQuec0TKsXd0+T8o6ZDaNoLEI5jXUnThhFY7kYkKD6Nyh3
	vGWtj3fLy5Oed5El5tmvjYlH48ssm2z0JEljploenM
X-Google-Smtp-Source: AGHT+IGkI4rn8426tGJZ53iaz39bAXK+rXXFyTpYCJMjPty5Dr1AKlqZ01YH118/448c1BEhxsvt5A==
X-Received: by 2002:a17:90b:258c:b0:323:265e:d9d6 with SMTP id 98e67ed59e1d1-32515edd530mr27134637a91.6.1756311557990;
        Wed, 27 Aug 2025 09:19:17 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f8a452bsm2383729a91.17.2025.08.27.09.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 09:19:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] libnss-nis: Upgrade to 3.4 release
Date: Wed, 27 Aug 2025 09:19:15 -0700
Message-ID: <20250827161915.3187968-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 16:19:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222506

Fixes build errors ( seen with lld particularly )

| x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'NSS_NIS_PRIVATE_2.0' to symbol '_nss_nis_getsecretkey' failed: symbol not defined
| x86_64-yoesdk-linux-clang: error: linker command failed with exit code 1 (use -v to see invocation)
| make[3]: *** [Makefile:642: libnss_nis.la] Error 1
| make[3]: Leaving directory '/mnt/b/yoe/master/build/tmp/work/x86_64-nativesdk-yoesdk-linux/nativesdk-libnss-nis/3.2/build/src'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Move to 3.4 release which addresses the lld fix proposed in v1

 .../libnss-nis/{libnss-nis.bb => libnss-nis_3.4.bb}        | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/libnss-nis/{libnss-nis.bb => libnss-nis_3.4.bb} (89%)

diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis_3.4.bb
similarity index 89%
rename from meta/recipes-extended/libnss-nis/libnss-nis.bb
rename to meta/recipes-extended/libnss-nis/libnss-nis_3.4.bb
index 2198606de5e..59dcfe180a8 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis_3.4.bb
@@ -13,12 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS += "libtirpc libnsl2"
 
-PV = "3.2"
+SRCREV = "3c206b762ac8557dab3c40ff3a297c9d1bff0d83"
 
-SRCREV = "cd0d391af9535b56e612ed227c1b89be269f3d59"
-
-SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
-          "
+SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https;tag=v${PV}"
 
 inherit autotools pkgconfig
 

