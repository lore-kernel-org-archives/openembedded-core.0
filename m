Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF415C433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 23:14:45 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.4486.1645398884916299624
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 15:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IPN1XH3I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id o24so24090184wro.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 15:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ixa9pVcwuvEHCqd5lAhp641SGt1tiZScL0l+duAAYY=;
        b=IPN1XH3IMRrXBdVO4rKVcfXSt9KDBIBuoBSH2Zxg6JDWSmYyGtWKvVWl4J+Exi1Zrd
         Cqo1yHbkxrWSTHP8W6dM879oeOkGZG0qyd8cIGgLyHMbOgL5d39R4Sa7fk28JaQES37x
         M7ikxGkgqi9TduhwWtUU+IK409FoWp+Za2dj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ixa9pVcwuvEHCqd5lAhp641SGt1tiZScL0l+duAAYY=;
        b=XVMNaUa1yslcvlIREJoWHhp/EPF/HjGc2lVyGO5ZmFT3UQDGVk//ZzVkuYm3prEcSl
         JG8fd+0klbquwXWBQjc5TCh+VpToTfcIJgSYiKjw2PDW7xHKi+ZTCpIn+jnL/SdG6n4A
         cNT7wytNOgSVXfLIu4m0F3XlGbhN+UJtxgWcKk+MoPLJ7glCZA6xPPYPfBKLhJZyyKVj
         g591OhcaP0PxslDBKBxO9eZdaqPzTHBxMIQP5VZGnFlEyNCF4rf9oxWfaOGm4q7abKq4
         FiTMWaGQBjYAwk5WkiA+2FdR2sEpNqPp0Yx6lY2hwOuEOUxZ37X+eO7g5HU9h61YfSZc
         +QZA==
X-Gm-Message-State: AOAM533YenN4h31qwOhZijHas4wB/JuUUHp65LVeWAqOirsFt6PzDNI5
	rh/j3hBQrBoxFhKvu4rEhuHTZAR2WYgkNrqK
X-Google-Smtp-Source: 
 ABdhPJw3cp4VbJrin5rIjCMxy4e2093buzD80qLkhV3kIHVgl3SJwjDDS3T4BmR06qVM+Q32ZzAjfQ==
X-Received: by 2002:adf:f1cd:0:b0:1e7:5b47:52a2 with SMTP id
 z13-20020adff1cd000000b001e75b4752a2mr13313435wro.92.1645398883034;
        Sun, 20 Feb 2022 15:14:43 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ae50:3f11:233d:4303])
        by smtp.gmail.com with ESMTPSA id
 t16sm6206852wmq.43.2022.02.20.15.14.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 15:14:42 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: Upgrade 2.4.5 -> 2.4.6
Date: Sun, 20 Feb 2022 23:14:40 +0000
Message-Id: <20220220231440.3141329-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Feb 2022 23:14:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161991

This fixes a regression in libxml-parser-perl's ptests from 2.4.5.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/expat/{expat_2.4.5.bb => expat_2.4.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.5.bb => expat_2.4.6.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.5.bb b/meta/recipes-core/expat/expat_2.4.6.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.5.bb
rename to meta/recipes-core/expat/expat_2.4.6.bb
index 83ba3a23291..ef245242bc1 100644
--- a/meta/recipes-core/expat/expat_2.4.5.bb
+++ b/meta/recipes-core/expat/expat_2.4.6.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "fbb430f964c7a2db2626452b6769e6a8d5d23593a453ccbc21701b74deabedff"
+SRC_URI[sha256sum] = "ce317706b07cae150f90cddd4253f5b4fba929607488af5ac47bf2bc08e31f09"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.32.0


