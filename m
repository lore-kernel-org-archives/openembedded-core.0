Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826CCC433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 08:09:07 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.8078.1651478941253235503
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 01:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ld5zZU37;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id z16so11739032pfh.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 01:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=le9h6KDwZI+MyZObUfpvNQrSIRe28v5Qk6xOExmlVLk=;
        b=Ld5zZU37fMLNhshEJPrADijlVECPzleNx80+g/P6CMTQT8LRinol/7ZIiA0cD0q/c6
         W0uRVrGaDmwvUnkC9VoYmh8B+TZOnljru6NdaG4EZ0wB9Ybqz/GtrhLeUo98+5bDvj+H
         /V+wXqiwzfUYHSstPFUU7FHg0tZa28rwOnNwtrf/2WnT6RtQ5MYnO8UPEhPDIcxKkQlc
         vYw7110IU/e4miOmcYEveiPRDKo56gu5ET5qGhszZzoPKoNu3nK18vz8LnMzSgl84eOd
         vp5/7Te8/jYBB77WyvwkZJsO/6UaWMtGSW8hkWo3BbLqTils0wr7Cm90uTKMfcFreFwx
         3rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=le9h6KDwZI+MyZObUfpvNQrSIRe28v5Qk6xOExmlVLk=;
        b=ps7Aw85Jk4XPqNcEK9K8zTvvyM5uGo50pVcNpwBeVk0ITRv+V/YQaaQSa3ChhvEeWM
         RO4xyNdfxYD7w8hi757WyQsviEFuYnuTvQjuThwxPZsfir+1mvPMZMYASm146HV8UC9y
         b32oPRD/8vH6dekehgR7lg8LKYuKliry51feBD71e4C4ZVEKtukxuPgQOa8OADLMJ8mm
         mMOhQYuMsMdGiIwq4Ds7Zc8OvD9gR9aQf9f3t363NjPg1V/8c45RCv9JpJIPm/bdFrlN
         qpu1Hma5Mbev0i+nqs7OfauFf/0pF27inaQFfz1LhIh2hV9eiHHntUclTopvEVzUSfNh
         1PWg==
X-Gm-Message-State: AOAM5309e7Vvcnq8Uk2Hy2ZotorDN0Il0wJwECil1+23jin2wEHCOk4q
	Mdp9nLvzClerg15D0ix3K8SmWPzbvnQ=
X-Google-Smtp-Source: 
 ABdhPJxbeRJhcUBwm5tDeI6xFbtMMFitkcD+pE1iFv978XnIf9MXF90iwTm+q0jEQ3F8iLE66A5vmQ==
X-Received: by 2002:aa7:9846:0:b0:50d:d690:4af4 with SMTP id
 n6-20020aa79846000000b0050dd6904af4mr7646665pfq.58.1651478940371;
        Mon, 02 May 2022 01:09:00 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b0015e8d4eb1c8sm4056143plg.18.2022.05.02.01.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 01:09:00 -0700 (PDT)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] glibc: ptest: Add lib32-glibc-tests PROVIDES
Date: Mon,  2 May 2022 01:08:51 -0700
Message-Id: <20220502080851.40753-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 08:09:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165161

While running lib32-glibc-tests, it fails with the following error
as the recipe is not PROVIDED. BBCLASSEXTEND is cleaned in glibc-tests
and is not able to recognize the multilibs.

ERROR: Nothing PROVIDES 'lib32-glibc-tests'

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-core/glibc/glibc-tests_2.35.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
index 414f8660de..2515e98bb3 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
@@ -18,7 +18,7 @@ python __anonymous() {
        d.setVar("PROVIDES", "${PN} ${PN}-ptest")
        d.setVar("RPROVIDES", "${PN} ${PN}-ptest")
 
-       d.setVar("BBCLASSEXTEND", "")
+#       d.setVar("BBCLASSEXTEND", "")
        d.setVar("RRECOMMENDS", "")
        d.setVar("SYSTEMD_SERVICE:nscd", "")
        d.setVar("SYSTEMD_PACKAGES", "")
-- 
2.35.1


