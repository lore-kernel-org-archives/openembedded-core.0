Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13576C6FA92
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:45 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.876.1663362516104232975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sy2E/utr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id z12so19623284wrp.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=jK+PF6eOeCCdgjfezmuatzdRJ+5wue3Lx+yGS+qLuMo=;
        b=Sy2E/utr/BCjwi2LPdwi+CVSZKMElfTnXdQqW1wJNP42+etBtWLOX6gg4yvgvWjihx
         GG9e726hMIgwnwxfWZ64fhb51kZ6Q3qtvrJTSBOyThif5b6reaP/lDHMut09PuZlt1xM
         NuYV4zPSo9RKeJ5j7R28Hebt0AhWEoPnF8fTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jK+PF6eOeCCdgjfezmuatzdRJ+5wue3Lx+yGS+qLuMo=;
        b=YNSTt0ETttVQm9ysCFc6MTg9oENsLHHMEEKFO4zW4KPKC+UMoh0BeHThGzXMgUZiVt
         u090jTJ0mJwEsWfZvwdr2JCOvSmk5t6NXZ5jZ4bGYAoFfGizHvl2jAOdhHMlxGFGLnnz
         coGHBTH+DYtyaFg0V+Wd5PTRqNAKdU1XXmHiXH7Y1+Yv4TZnSTC9ZcC9SVlWu4b4bKdp
         h3ROBWG4z5WheggkMbCy1C1k85BmdRG2Rmgf6ynqWAdsFWqEn8kv45LICSkyw5OVdvWd
         OqIwA/02QgoxdZoQddGgOmYA7GHBcdbiQNrFeBhfmZRg+wRDyl8f3emI+b74dLwCY1pj
         cx+w==
X-Gm-Message-State: ACrzQf0FPPfT3NjW+8VOYxBdzRvPR30vC+MWmtjgeTzyZgt/6mrFDJfk
	VOIbrowxMD+tAfBLJU0bvX18jucSm21VFA==
X-Google-Smtp-Source: 
 AMsMyM6IZM5O4egpJC/En9YgBlmDVsvagiaBv0lNNh1hElM08pSzfatyqJcH+w/Ve0YTQwF++6UcuQ==
X-Received: by 2002:a5d:5a1a:0:b0:22a:ad99:d6eb with SMTP id
 bq26-20020a5d5a1a000000b0022aad99d6ebmr4320028wrb.76.1663362514150;
        Fri, 16 Sep 2022 14:08:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/24] python3-idna: upgrade 3.3 -> 3.4
Date: Fri, 16 Sep 2022 22:08:07 +0100
Message-Id: <20220916210818.1228761-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170811

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-idna_3.3.bb => python3-idna_3.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-idna_3.3.bb => python3-idna_3.4.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.3.bb b/meta/recipes-devtools/python/python3-idna_3.4.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-idna_3.3.bb
rename to meta/recipes-devtools/python/python3-idna_3.4.bb
index ee92f44fd58..10c99ee0ea9 100644
--- a/meta/recipes-devtools/python/python3-idna_3.3.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
 
-SRC_URI[sha256sum] = "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
+SRC_URI[sha256sum] = "814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530b5526063d02cb4"
 
 inherit pypi setuptools3
 
-- 
2.34.1


