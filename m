Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DBCC6FA86
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 15:26:10 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.6181.1663082769179047070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 08:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snapchat.com header.s=google header.b=QxbLUQnE;
 spf=pass (domain: snapchat.com, ip: 209.85.216.47,
 mailfrom: ecordonnier@snapchat.com)
Received: by mail-pj1-f47.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so11713668pjl.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 08:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=JsgwaLy2UzgYqkG4q1BtDcZLJM0is0BXiX5g0cEJjCY=;
        b=QxbLUQnEZqcfEZYIc59pY1+z+9CHXpRx3apr6Z6vBY8CH2QSjTj9mMeVugf6AjUNve
         e9M9a7ptmudIYR/zapeqY4Ft+j/7PISd//NGylnnVjxdfn4R6N/vMHY2sseGFtSJERhr
         yZl0kaoN13HDA2bg5NLxO6kVmvce+E7GQAHa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=JsgwaLy2UzgYqkG4q1BtDcZLJM0is0BXiX5g0cEJjCY=;
        b=iSniqlO6ywXP7N3KxRYcrum52wVFCYrSSoj9HD5tczf5/nHTa8r7Qj2Y9C95yTuccj
         AIpdihcyJlGFfnQWRxsZhrPBirVGcmMYav8ewwyOs7bTuC7xuzv90TLRHdf3a2kmh0JH
         SoWmqm51pKIuPdhYHIIBZF/cX/RkVi1nz9jlRjEp08xy0E9+hPgeC0NIkcNxAOecoEQJ
         H5kWHhyyc7pcbDGs9Gl/MvwLMvSx/banBO75JZUXCiwhyz0RtRC9LbMIjD8yGpY2AQ5e
         xcKHO9ZsjRd+wJx++FZ39lqx20FA2JDY2IV+fUeJm4Ld0eUOOs59BsgWHHiAYAojAr8V
         0C4Q==
X-Gm-Message-State: ACgBeo3761wp0jF/iMsEL/Yzl7bzyD5DMrpbCuWmv21+XKF5amERWvVN
	bPY0fcLkMccsW78qQBuK86kHPdWpTyJ/VEbZ
X-Google-Smtp-Source: 
 AA6agR7UGd05UVdynEpImXhz4sZI9t9jNlsLuJwzwPSsNAjOGaZjpuJNsSUnQ6IT+nE9S4Ey2glUcg==
X-Received: by 2002:a17:903:32cf:b0:178:3d49:45b0 with SMTP id
 i15-20020a17090332cf00b001783d4945b0mr7164343plr.5.1663082768075;
        Tue, 13 Sep 2022 08:26:08 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.86.25.14])
        by smtp.gmail.com with ESMTPSA id
 ix10-20020a170902f80a00b00174e5fe9ce1sm8524649plb.159.2022.09.13.08.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 08:26:07 -0700 (PDT)
From: Etienne Cordonnier <ecordonnier@snapchat.com>
X-Google-Original-From: Etienne Cordonnier <ecordonnier@snap.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH v2] python3: add PACKAGECONFIG[editline]
Date: Tue, 13 Sep 2022 17:25:53 +0200
Message-Id: <20220913152553.107118-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 15:26:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170597

editline is a BSD alternative for readline which is GPLv3.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/python/python3_3.10.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb b/meta/recipes-devtools/python/python3_3.10.6.bb
index 1b28728732..1f8b60a7a5 100644
--- a/meta/recipes-devtools/python/python3_3.10.6.bb
+++ b/meta/recipes-devtools/python/python3_3.10.6.bb
@@ -105,6 +105,7 @@ PACKAGECONFIG:class-target ??= "readline gdbm ${@bb.utils.filter('DISTRO_FEATURE
 PACKAGECONFIG:class-native ??= "readline gdbm"
 PACKAGECONFIG:class-nativesdk ??= "readline gdbm"
 PACKAGECONFIG[readline] = ",,readline"
+PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
 PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
 PACKAGECONFIG[tk] = ",,tk"
-- 
2.36.1.vfs.0.0


