Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB227C6FA92
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:34 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.896.1663362508609705737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WHK92GA6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id n10so7348876wrw.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=k3ikHkq+zhcD6z3qOoLwlotK2XlEivA3N/IuRIaeipI=;
        b=WHK92GA6iedGC92XAJpJCZFLWA8oGpoBjV5j7lNOm09w8kV7Dwuwo0Kcvf0wEuI3mo
         Mdogk3WTm4lIo1uBgnH8lRTNWOr7NWWSWit8XcQ9Ey7S9Fhqic0BUP960oU6xhcSnfmE
         HS92mxm+YOzQ7NI3F+3lDhGvTqmP8Hufv/Kfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=k3ikHkq+zhcD6z3qOoLwlotK2XlEivA3N/IuRIaeipI=;
        b=Vhac4ott99jSUzO9xGS0Z/NmjvjU/JE35Clc6G3+4JGs1nXWd765XDkLHH2M97tAKb
         HODuXqxBPdzDMZdunzh3BVKALQQxpFNJWFBst+s29UndPYfCid3y4kGTH127dOvOhoXw
         3znrOCX2g845o1uhLLOcroHcieRsHJVrHHECcMDvKxyx+dCaUzr4MPxJ8ejh5VvGRBwc
         dpbD4G0qtzgUlOXt53GKyBlZ95BHrAbVsPI626ZejJxLwB9oF2C9bLXIIjVzfZiLEdoc
         I7kDmBAKxvjGi/kMzr6FHarwdGIQFWAsIMqFBDjr8g62aT9ICuar7P14xJDMJuNGZAC9
         FYaw==
X-Gm-Message-State: ACrzQf30LTc9/IS6Sp5yvwIeUw0NW68pffWHpaBeDo8cPhQaQUV+zO4H
	cIWuHnm007uVVQZ/3Y2zmDEEw8VyFXf3fw==
X-Google-Smtp-Source: 
 AMsMyM6PEaNXH3hyV+kISwHiOrWd/zO43XVygZiA4aB2mnwzObhsMEwHRTSydLthzJrKAov87y73Qg==
X-Received: by 2002:a05:6000:168e:b0:22a:4e45:7469 with SMTP id
 y14-20020a056000168e00b0022a4e457469mr3729766wrd.681.1663362506891;
        Fri, 16 Sep 2022 14:08:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/24] file: upgrade 5.42 -> 5.43
Date: Fri, 16 Sep 2022 22:08:02 +0100
Message-Id: <20220916210818.1228761-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170806

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/file/{file_5.42.bb => file_5.43.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.42.bb => file_5.43.bb} (97%)

diff --git a/meta/recipes-devtools/file/file_5.42.bb b/meta/recipes-devtools/file/file_5.43.bb
similarity index 97%
rename from meta/recipes-devtools/file/file_5.42.bb
rename to meta/recipes-devtools/file/file_5.43.bb
index 8efcf09c9c6..102d0fda26f 100644
--- a/meta/recipes-devtools/file/file_5.42.bb
+++ b/meta/recipes-devtools/file/file_5.43.bb
@@ -13,7 +13,7 @@ DEPENDS:class-native = "bzip2-replacement-native"
 
 SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
 
-SRCREV = "a42b38690579de23403e0aff9b7b2f9cdf55f534"
+SRCREV = "011778a2877f75597ed83c1a2716d917770920ee"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.34.1


