Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9516EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:58 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.235.1686926271356255597
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=24jUGZyB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b3c578c602so5379205ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926270; x=1689518270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwOfe5WimSdx2jncJ58jqQUzieQ1kuQrni7bFdEYn4E=;
        b=24jUGZyB6duzQks0f5wcq0iVmLFXGRZX8fHlZpfUAJP8sQ532GPifA71H5DFqHkkr8
         Z8u4PUo2b/IJ0eK7s107lAGsFBXM+/pa2FnkNBzJBrkSS90RYy+Z9mPvORLxwdkYy5ld
         UKzbZgk8JynZDKL2P27aicTFDHE/g/jqei43YbC1nGjQGK2dYxlBp4xyXGp1wU/jE2ap
         ykLP1SopuMDKowQdi4MsK+JkZlXuSsAveQT9x0BmIBKcRC83Ih8cHSIZsYKPdsxj/igU
         gLN74ezfh7rVBxvHlvbnPW2ABRjWdKxup9/Sh34iXMnJeIl0sIBCr71aWNzuDf/6h2Fr
         ZaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926270; x=1689518270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwOfe5WimSdx2jncJ58jqQUzieQ1kuQrni7bFdEYn4E=;
        b=U6Tph3+C5x5DAOIew7hhZo3ZTvmwnBzQ06q/+B3dsMyHO9G5eIyGtvoavURn6oEtEJ
         RJE6PB+S0g3eC9HMNCx9McVeyABN6ahNNfiaY5w6uQKsd5BfillZ3PRuI3bl7jRn2Iy4
         Ws3gap4XbWg0EWev2XNBNnxF3967RHhDRLRVbWd2/sYFtwcuoK363JpW7WZbiRaQzm8X
         6iZSLqCqkuIE1EYrqQ1EPSST0jy3bF7eTEelff4EIBuJ2ccEv61kTLcUJqyIMBqsylNK
         eNin6GJFSTqGIMxlxUfs4TJTeX8N7NmjaoqNo34a4gsNg6LAAtRuhcU+g+6deqqeSbh+
         bVbA==
X-Gm-Message-State: AC+VfDxuAe6HkbSnPiu+z0HCLk8bgfER0zlaZxu/HegGSIjysxcVY88f
	LAhSoBihGBkPIcqjfWxAhrIVKbr/YwRWK72M8Js=
X-Google-Smtp-Source: ACHHUZ7Ss1uI0nycOC3jYXlwe7AE8K78SPjq7Ms2dPBT+wdWCdn7j0hE0xyuYu7/jhFA7aWS6ibPIw==
X-Received: by 2002:a17:902:da91:b0:1ae:6cf0:94eb with SMTP id j17-20020a170902da9100b001ae6cf094ebmr2132531plx.5.1686926270498;
        Fri, 16 Jun 2023 07:37:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/24] maintaines.inc: unassign Richard Weinberger from erofs-utils entry
Date: Fri, 16 Jun 2023 04:37:08 -1000
Message-Id: <4c345fbf7dd009eaffe09c9d218e697145ad8ee2.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183038

From: Alexander Kanavin <alex.kanavin@gmail.com>

This was confirmed via private email.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 834519933fcd6e4ff54f24d0cf671ea9ce24398a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b4ce618ca0..db0563810d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -165,7 +165,7 @@ RECIPE_MAINTAINER:pn-ell = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-enchant2 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-erofs-utils = "Richard Weinberger <richard@nod.at>"
+RECIPE_MAINTAINER:pn-erofs-utils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ethtool = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-eudev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-expat = "Yi Zhao <yi.zhao@windriver.com>"
-- 
2.34.1


