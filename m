Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178ACC77B7C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:55:41 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.8798.1685519735130607529
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 00:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jgbkQDL3;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-96f53c06babso928850966b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 00:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685519733; x=1688111733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrc6ZASHPjCXLNC1sTyzA+qvmytmaTFWuaCyxHIJD2w=;
        b=jgbkQDL3dMpisRA00mSw1oMxTMVJjy4tPY3bEVJj1w//pdYMmxbWZJXU3v9h8cWYDO
         uipC8AwcOdJaXgxVoxutDiDtFv4bEcz6cP3yOsaYdByQFxQ2t5UoED11eAI2qyDpAl2L
         ZGzXCGVjKjPNR2RohVlWcQNaQ6U1UlpuqJpnBZtqqKVffajm8k0IEEr5Siz6OjUaOpu5
         wDmoU/pf43o2fEnB+G4WgpR2p0KcXqVjWJHe05d9R9QcQi3AE6K/VW1FivUBfTvlLOHM
         iVBCGlydDKCjgwIHvdPs5AFqs2CxlanYD/HygrenC6vTL/PRdOm+OW4I7DVodd3/uics
         fA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685519733; x=1688111733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrc6ZASHPjCXLNC1sTyzA+qvmytmaTFWuaCyxHIJD2w=;
        b=CkSexMnuMBC499z7nrWgsFYFRhvaXFpr6Hv3NrhhfHnSbHr4QpMBxyQnXZFrjB32kr
         QW4XYuVEXUUQ7FVMFFCDdH5fdiRMmaKQk5US5eIsRdUFAQADC3mDiLGC7DIliQ4KdN0c
         3WGAtJ15qyKzxKhOf60iU5pNUZvGIGjKAM/ZJd4GrVmyFBG6Le5HiXKtpaTAGBs8xMi0
         4h95xp0hsEAxwKLo39kLRfaiIaXDBggw5djNlv0HAbgqAlUzAArOmJiY1DMTcoqgoxMs
         OPEIoalUSzlKDkH7kRnkIkenmSRruvzF/aeMGzQgalbExj3hmW0HMCDXSBpEbuN2bFRW
         9hpw==
X-Gm-Message-State: AC+VfDywjzkZdlTT5NHLfaYPMuffShS933kdoO6rFvfqFI6VbdCx4KTc
	VMHmChN6O8K55WP6h9rJx58zaH40xjZsYw==
X-Google-Smtp-Source: ACHHUZ5qTRUQo/Ks7F2YA3WWALGwCys/WgDqu2IsAnnk87Juqx6Xh5IPaXXN+yMO3lO8AF4bJ+V/EQ==
X-Received: by 2002:a17:906:5d10:b0:969:813c:9868 with SMTP id g16-20020a1709065d1000b00969813c9868mr4271752ejt.18.1685519733121;
        Wed, 31 May 2023 00:55:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906365400b0094e7d196aa4sm8489062ejb.160.2023.05.31.00.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 00:55:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] =?UTF-8?q?maintainers.inc:=20unassign=20Andreas=20M?= =?UTF-8?q?=C3=BCller=20from=20itstool=20entry?=
Date: Wed, 31 May 2023 09:55:26 +0200
Message-Id: <20230531075526.3894314-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230531075526.3894314-1-alex@linutronix.de>
References: <20230531075526.3894314-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 07:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182000

This was confirmed via private email.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3527c6333a0..a3b9cdbb12d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -286,7 +286,7 @@ RECIPE_MAINTAINER:pn-iproute2 = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-iptables = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-iputils = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-iso-codes = "Wang Mingyu <wangmy@cn.fujitsu.com>"
-RECIPE_MAINTAINER:pn-itstool = "Andreas Müller <schnitzeltony@gmail.com>"
+RECIPE_MAINTAINER:pn-itstool = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-iw = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-libjpeg-turbo = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
-- 
2.30.2


