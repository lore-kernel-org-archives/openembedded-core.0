Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D57EC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 13:21:30 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.9326.1634217689314353320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=aZ5t4fmV;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.51, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f51.google.com with SMTP id y15so26949792lfk.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RfWJolhNd2qK7+tNcOlJ/RiBRnFrya1XD2cZAo2sMGs=;
        b=aZ5t4fmV+qG8HMfHHyDKbJpAI1SzbA8roCQYIgDlyXAW8+X1A1NMlEM8W4Aiw4TxtD
         xTQgGftuK4fkVnl+CN8v4AxqZSaIjA46ubfETNaxHm37XKqJV9fAgV+jdAikBiB68pEo
         UpdYwRd8MN6P9AfSI76G5uWr2RiFy4JuOHTClJlKbRTtUYclKAMmBvw8FGvtPm8cU/If
         BRQoAf/8rsmpTF0yjxLaZLrrfcNQ8ixZ6QiAXd2BfNmi7AbNicj8/mrWk7yVtLhOMCzF
         up5piBy46DR3fd6vjnp4hVvn27Zn5IDbYqRw8iSXVBu4mzQzDUrhN/4pAMS6TYeATZau
         cIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RfWJolhNd2qK7+tNcOlJ/RiBRnFrya1XD2cZAo2sMGs=;
        b=WXAMadanoFnFMrT2A1APPOoDwprR6NFvJml3bE31QN/zpZhpffswQSx+clcfjqX0aJ
         kZEWxZT7Wdi4XIIgnO9J5rZa+W40rkSobS9E6WkOiMhP9yZf8TLzgTY7abiHzgP4Pw3A
         BE7ZnOerkJL4TY8KFLUGkkIgjus2AHMpx8srV/c1ujXiXyhqam6mUm425eFjC1YXb77Y
         o4YTLjWmTwfv0j8m2dqwo/BA6PBOrT7eEQSxNZZoDieyfgf+CBa1WgO/aOYJs1b4/jMx
         C1t5/yDIYeWBZ3jMF4641XEXWhJoBP2aDj3aJAD6lkO7KjTQJssDtvG/0pHYTzR6bNa/
         6Ckw==
X-Gm-Message-State: AOAM530gsdFJK+nVEkSjskh+5nsrJpCAVbOD0Lq+KI1EzFh+eAfc5LYt
	eRDMZqZBTtSAyP4DgxDB255p4sz0fTmujOS6
X-Google-Smtp-Source: 
 ABdhPJwMiXqpkCjZM/HW15UyXEsicdaeNVOPHNx8tFi8DUklKTPhIBBS0TK0jY+deJ28lJA1kf4SIA==
X-Received: by 2002:a05:6512:16a7:: with SMTP id
 bu39mr5377914lfb.578.1634217686918;
        Thu, 14 Oct 2021 06:21:26 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 h23sm261547ljl.35.2021.10.14.06.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 06:21:26 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] xkeyboard-config: update to 2.34
Date: Thu, 14 Oct 2021 15:21:22 +0200
Message-Id: <20211014132122.2393369-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 13:21:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156953

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{xkeyboard-config_2.33.bb => xkeyboard-config_2.34.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.33.bb => xkeyboard-config_2.34.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.34.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.34.bb
index 138e451d07..5d431a4172 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.34.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "657fd790d6dcf781cd395de4cf726120a5b0f93ba91dfb2628bcc70ae8b1d3bc"
+SRC_URI[sha256sum] = "b321d27686ee7e6610ffe7b56e28d5bbf60625a1f595124cd320c0caa717b8ce"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.25.1


