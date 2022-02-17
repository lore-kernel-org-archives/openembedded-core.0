Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF604C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:06 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.1767.1645114205716311229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DGnaafZO;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id gb39so8487694ejc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KnzNYCpA2UtC0V4/dAkXFsgSfCNcxTHNeb3/widzmkc=;
        b=DGnaafZOxT4NaWw0DcVPDhShMlOJY7USYiVkeFLEpP6k7bpOJDyBIcps1OHiT+MjOp
         ThVCP5VUpci9+WmzoFtYEql2SlumcjGSLhWeXgpUD0NVfenLxzee2uly9hz7QPe/rJor
         Hd9dwnGgp95PsFgYFO9NJnPtDnqn0ax7DnQ6d3oOJ8X83erS9phsD4/rTftI1rNzVeHT
         glMUHScYfT15W0+kF2WzuSgCVCiOLvodIVmfDAnr35RJlFc8MdKDxY59EnU980yciSUz
         YsIQTHFEXJgiul6/fefD3fkbUQv+uFjcKKuPyvzDfUtNxgd6L1GbSHIrke8uMLf9o0ns
         qPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KnzNYCpA2UtC0V4/dAkXFsgSfCNcxTHNeb3/widzmkc=;
        b=GtmEDvxohJS/oxXPIJvhrcFSmXh6xCxYsaRVlvc5lIOtOT/w1XRrTN3Z1qfKKVAMXB
         1IbQuVnVCbZ4EERR4mAHcvbu+UCggt02kQumrfG5QeeMKR+6kUDKYOf8mmVyhxq2Qd3V
         NtMBKlJj/uHIxaVf1ioyyCsiydopSrRC8kYOh/jzCUUa5l//RVNqJZ5/S/Ik0jbCes0M
         hK8aaNUgDkmK/1rwcfUa3fF4sxbLnvJ7dU9gemyc94p4Swf63rD3ItBoMEn+ZE5HSR8O
         wcbKKJDQxZLC2WSunDb55TNiNCl9Ug13pV01mzgjGxJrme3M+ANKpBRTx1RCkvtMWQ6U
         4xlA==
X-Gm-Message-State: AOAM531VwaHK6wqRMZOngGbiZ/1Shzs9BvEQ7n1ylXf2npA3Jm8uP7fu
	nUuEUAg+20fpBRVK9ieXaF7JAVt7k04=
X-Google-Smtp-Source: 
 ABdhPJy95BwSqupaKZQbOhH6H3bwLaNrWoQa70PJc/1mklaRS7MZQWbAyhIbQtXNXF2CT0cy4FNAGQ==
X-Received: by 2002:a17:906:fc10:b0:6cd:84e:7248 with SMTP id
 ov16-20020a170906fc1000b006cd084e7248mr2891951ejb.281.1645114204261;
        Thu, 17 Feb 2022 08:10:04 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/28] help2man: upgrade 1.48.5 -> 1.49.1
Date: Thu, 17 Feb 2022 17:09:27 +0100
Message-Id: <20220217160939.1424397-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161833

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../help2man/{help2man_1.48.5.bb => help2man_1.49.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.48.5.bb => help2man_1.49.1.bb} (89%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.48.5.bb b/meta/recipes-devtools/help2man/help2man_1.49.1.bb
similarity index 89%
rename from meta/recipes-devtools/help2man/help2man_1.48.5.bb
rename to meta/recipes-devtools/help2man/help2man_1.49.1.bb
index 7fe59cbab7..a5467c0535 100644
--- a/meta/recipes-devtools/help2man/help2man_1.48.5.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.49.1.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6739e4caa42e6aed3399be4387ca79399640967334e91728863b8eaa922582be"
+SRC_URI[sha256sum] = "fd99a664ec4be9a86a0dd89719989f14f367a9c079d75d0e1d71e18a7bb51b03"
 
 inherit autotools
 
-- 
2.20.1


