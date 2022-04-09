Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50935C636FE
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web09.6637.1649513709755051826
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 07:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=d7ftgS14;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.178, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f178.google.com with SMTP id b43so14765833ljr.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4iL1szt3c59U41AfaiACNTZpt7UTtZsL4oLj9vig0Q=;
        b=d7ftgS14QXEJqNsLTZfQwhpsgG53tW14+42+PoKx9kQXfC3k074GyG23uM1qCx+lXw
         Th9pt80lUeRZo/iqV6ayLsI6W3rTnRqFzsoRS4CqjmUs/XdiJ3US5RC9dV9SjvzkOB9n
         CyhaAWYjrC4AF5mBuD0P4aZ9FEXMvn0J6N4FwXdJ3mSZERxRRS4uUXO5jZx4BKwUXYPh
         DRmkCftIcko1dfKSxpEK3UZe2LULegzRShqf2qs5Jr4sNBml4CC0EW1OX1DOjAqkzSC6
         AwSRISbrIRbFAhj1KXGF7fzpfeY7OynCU8/+mBxJv7KKUJpGdzyqTOC3B+zMzrD1Sdjn
         9W5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4iL1szt3c59U41AfaiACNTZpt7UTtZsL4oLj9vig0Q=;
        b=dLaMevDHq3OTwjcm1as0AVO6MHbaTcgnBDJriM2uCN9zHC8X6IGkeIV44SDkeuXh3g
         Y3lM1c/R8YusxyVRA+v8ofAP0s2f5hOR2PHwW7gwQz4G7n+VCfN+oKoqzHJKifL3Vba8
         v+yvqki63Xz4gln1QrvSsZCI4cyA+79E9MhAe0w/cLUNmvtfA+5dYTuU+IfmsUOX8Vg3
         ggJIbrSp95x/9Ttli1PQbTkLg8c7C1AoBGR93xTyJseBKDuARv1VEbapH9+GI1rtRzaZ
         G1ctJ1bneQpGyp+j8l4J66cA7kAkigIQv7+aPK1MqOf0XviJl4h6C3FLIEMZtsdYEQwp
         Eu1A==
X-Gm-Message-State: AOAM531hr7Cw5bsUwfhyRBbBLnEM629n0W8wul02DjVInkXaU/TrD4CJ
	rl23PAgM7JEGjpk2OlzbBbbdOZpIitW0ob0a
X-Google-Smtp-Source: 
 ABdhPJzfoeuq61KgshgDSjcPzWjnpi0DaXSiFha/JqPBNqlwdH8OAkR1pXcXAnJMd8sbr5upChJPOQ==
X-Received: by 2002:a2e:b8d6:0:b0:24a:c582:3a19 with SMTP id
 s22-20020a2eb8d6000000b0024ac5823a19mr14438388ljp.195.1649513707143;
        Sat, 09 Apr 2022 07:15:07 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 e28-20020ac25cbc000000b00464f918102dsm685654lfq.174.2022.04.09.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 07:15:06 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 1/2] python3-mako: update to 1.2.0
Date: Sat,  9 Apr 2022 16:14:59 +0200
Message-Id: <20220409141500.815506-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164187

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-mako_1.1.6.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.0.bb
index 71e5d96ba1..1acbda533d 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
+SRC_URI[sha256sum] = "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
-- 
2.25.1


