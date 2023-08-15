Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D055C001DE
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:25:03 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.138701.1692116702891954276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rh2T4Q8s;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bc0d39b52cso34233995ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116702; x=1692721502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gE2ERzGA182S4gz9tpQ7y0YwWrwZaEndA06byxGHyc0=;
        b=rh2T4Q8sC/J8fvx5IdYUURpKoixY0QN2yPUPacmQ9tozHrIG085lARa38Wisj8JNmb
         H5blHGN5CDTtZiItlkj1LwqOxb4tS2AncyrsqODmboTsulPzsBWpEaSUptybXynG9HFw
         RlEf7UJIx5imcmk1QSTivxGnWNpMgyjWe3MggUMFC3GZ886F5Z4UDjGEXd7u4SIIgPmp
         cl9O7fty+DUX3CBsXV6lr1iKmrGANyWWJqrA4N9WdKtqyaxPNzgdfvjo8vbQxVWdJI4h
         zCg0faOeKCp4H4i/5rhBnN5ee86JewF5vwFGObr0Zcxhxd1Oh3oEATlX73Pg64qqrM+c
         Z9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116702; x=1692721502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gE2ERzGA182S4gz9tpQ7y0YwWrwZaEndA06byxGHyc0=;
        b=ayI/6O7UH8KhohgfWLqybrg3UjQySkSURHN73GNmvPMz7DOT2sV6n4ypEFWCIdfUpi
         Fi48UvJqVFYhTT2tTldklI/1BVaIiI+Z+BOmrUepSpNiIlwE6Cw+n97w6XqGGm7wCr6c
         P4YyI4yQB6oJ/XN96kWcRqZX2eA2khcqAw2QvTmGEBgAa20CWFv//aqMkq5Giz/iwAZe
         FIM6bVkzprM3TgBUCpsPxV/XuPp9LsRFJ58agyu9///wyoiEU1DEYm8JOVmwinIouGyo
         xlWb5gxeDGpMqR1qd3ZJpeeExyzFf4YQi9Pi466Gaf925mgfFIJuwjBJ8c/Lng1QRK/p
         tTDA==
X-Gm-Message-State: AOJu0Ywj1iqkGRi1HkMXWuxZF8g5fdw7eZa1CI63VDaQ77StWxYUH4X/
	8SI0TmonfIge7XONzwZQZLxaTZJlWKL1rWcBTCg=
X-Google-Smtp-Source: AGHT+IH5/Epx88fLvWGWK/CaHtcbeb8EUibz5Kt+6Bj7S6qopHTFqc+N8QxAoDY4atZROQJG1EA2Uw==
X-Received: by 2002:a17:902:d509:b0:1bb:d045:ae8 with SMTP id b9-20020a170902d50900b001bbd0450ae8mr13963056plg.7.1692116702019;
        Tue, 15 Aug 2023 09:25:02 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.25.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:25:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/18] maintainers.inc: Modify email address
Date: Tue, 15 Aug 2023 06:24:24 -1000
Message-Id: <d57207d285e05b22bacc3d019cb440018b18ab33.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186094

From: Andrej Valek <andrej.valek@siemens.com>

andrej.valek@siemens.com -> andrej.v@skyrain.eu

Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1af0edaa83934d67ff554be591968fc8cea42e4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d58ff99a03..784a4647e3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -83,7 +83,7 @@ RECIPE_MAINTAINER:pn-buildtools-extended-tarball = "Richard Purdie <richard.purd
 RECIPE_MAINTAINER:pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-buildtools-docs-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-buildtools-make-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-busybox = "Andrej Valek <andrej.valek@siemens.com>"
+RECIPE_MAINTAINER:pn-busybox = "Andrej Valek <andrej.v@skyrain.eu>"
 RECIPE_MAINTAINER:pn-busybox-inittab = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-bzip2 = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-ca-certificates = "Alexander Kanavin <alex.kanavin@gmail.com>"
-- 
2.34.1


