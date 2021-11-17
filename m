Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79823C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 12:32:28 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.6416.1637152347114282808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QtXxW95p;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id x15so10497421edv.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fwT3/TNMNT5syff5olxi0JDnqIHc3mXZiSoNUeojmcA=;
        b=QtXxW95pRKPsEFox8ngHk1TP1NcAxOw4LTB26Qft3k67KCQuwbQlMAsGHGKKqztqpC
         Mm6nPaqA68lqkAU0QuyiAY/B7c9BCaNy/F/nvxvVx37C1PM3BYyfiG22uu4O6n5uakTq
         xK9wULGxnl08qaqgL+8eLDuHrJySjsFbAehxbJledqlJ76LWa1d9SKxc6JFTU1yYhErQ
         q1XQmNG4PCxGfs3+Sps077H3Oo+d1PiQdhejmyPn7heKxU1x0Rg3MZFO7ZKhuGbxZzTY
         C3wLgSjmICrlfvi2AFz+IlWkgO9uwobx1MgRp8643QTPMnPLfO6YusuAnEgReltAKfCI
         UbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fwT3/TNMNT5syff5olxi0JDnqIHc3mXZiSoNUeojmcA=;
        b=E/SxnwSAvnD8YRiXDRjvir4690DxJbKVaZ8WT7PfbAJZz1WcGn5BmqGwYESvI8cmUN
         zRZ/xCxH37c2VwYB9MXh5YG34ROyFjJNhG06ybrHDIEm9+ocN82mEHzlJ2kwZLkBejV/
         P7f6rY1/ufxGYA2vcHwVudhH+bft9s94KtZZ7meQoy518ew/JZlf0npDwFiDQ5T5eIhs
         or8y2T0W12DHcldeLJRbmaaNk1Dwtle07q/tk/j3Im87tsNY++6GZvkXWpMgTbvXxc2W
         2m3glYo6YeAQQfy+pONdgn+S5Ks7qj70//Hn0i08hzU/mjVNWGgESYsujgxuzi2LJ1pH
         EwYQ==
X-Gm-Message-State: AOAM5338UjoGiicpTmDb9QVupJuaoxFp4dagH8NoWXLuzSyz6AmbtxmR
	5HRXxAC3RLsVk0E5aMxhERNRmilewI6QNA==
X-Google-Smtp-Source: 
 ABdhPJx7N97Eo/1pDwsHEINfjmExJItkEbowpHnnJE0ELmS0H9deDvAyePk+42tMJ7bo262I6QdjEg==
X-Received: by 2002:a05:6402:438a:: with SMTP id
 o10mr21586766edc.353.1637152345311;
        Wed, 17 Nov 2021 04:32:25 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 t5sm1096793edd.68.2021.11.17.04.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 04:32:24 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH 7/8] os-release: add nativesdk
Date: Wed, 17 Nov 2021 12:32:00 +0000
Message-Id: <20211117123201.111905-8-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117123201.111905-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 12:32:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158391

From: Luca Boccassi <luca.boccassi@microsoft.com>

Required to build systemd tools

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/os-release/os-release.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 8847fe30c3..2f2aa66c46 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -51,3 +51,5 @@ do_install () {
 }
 
 FILES:${PN} += "${nonarch_libdir}/os-release"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.30.2


