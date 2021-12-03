Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2ECCC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:22:22 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.15513.1638555741935595123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RJgEF7O3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id m15so3840897pgu.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xKdf1qKrUWWgVsU2dJkofvgJbv4exlQDD3n3Sh/BAEk=;
        b=RJgEF7O3wposuMB71jNJhJ1yh8poAnydD5eBFPuK6y2TbvPz9Q3QHSI2mXMNQatSsQ
         M6RqW56uST8PF1wNJ2vr9wirmajL/fgx4qdLJ0Q7brdAH8bzoztQO4PUqqydpjgVFzk1
         3opuYgmUFOJwDuFLZclm1REzPrd+wwEb9u6f4hOm9cXo/odXtRt7XpkQQlnSxjkHXzgd
         h2Ij/jaYfTodJOk3Q+NZG4Nw3SsNyqPYgjMxLVpT1zjM28hH4MPrYvhmjzFufef6gSXd
         Azi3mgdZRCaCUzxRISnQE7FTrlE/5WF2NP2jFj0bHF6tMX8PDwjmXJh+6U9u8rQqwnKS
         mOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xKdf1qKrUWWgVsU2dJkofvgJbv4exlQDD3n3Sh/BAEk=;
        b=yIf5HXB6dBBBmae5GLKQenUF4hid4Mt3ZnvusyG2wFDjmIZdpQ1xrvFv4K1D/7rnt4
         6pwvuMOVHySqBXt1LB0XpLq577vgJrvc6CTHEsOPmueSHudhpkVMGR1jRO6/rVZvCS90
         iWyjn9+3m5oPZ6LVB8seKOQA+NOrTgUVqIeVbDXPEvz1OeXYAHk60/F3nOmy4o5tldQj
         dzszHp6Ucf/l8zbT9quf/DMl3ca//NiB7gNuj03yayUa09dxJrX9VdQ+2rQe5boQEK4D
         HXuCVlco8a3zuFG8mnna6GQl23W1P/vwQ9qnFp1a7wQtrm9PubAicLofNXp1vHag/3oY
         Ysjg==
X-Gm-Message-State: AOAM531rKelD8PTR+C3D0NnlNp8NPXe6YlHgVzoDnDR1MhQJopliuQ3m
	UZR3qfaOXk2K0i6ok1Zp8lshPzw/ZLVDOkMpW3I=
X-Google-Smtp-Source: 
 ABdhPJzB25stM33wf7toN7cr7WefqPzaRWEQTt3/wuOpZa1wWDLlMTN5HXU9pDqiExNmsvHsreJ57g==
X-Received: by 2002:a62:7c4b:0:b0:494:66ab:ae0a with SMTP id
 x72-20020a627c4b000000b0049466abae0amr20575199pfc.18.1638555737752;
        Fri, 03 Dec 2021 10:22:17 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.22.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:22:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/18] scripts/checklayer/common.py: Fixed a minor
 grammatical error
Date: Fri,  3 Dec 2021 08:19:04 -1000
Message-Id: 
 <28ffff38a00b50f299154b4a5a42e7135ba91397.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:22:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159144

From: Dhruva Gole <goledhruva@gmail.com>

Signed-off-by: Dhruva Gole <goledhruva@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8ea17456ae5318ed7a3b4c8f75c8441456d8b979)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/checklayer/cases/common.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index b82304e361..4495f71b24 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -14,7 +14,7 @@ class CommonCheckLayer(OECheckLayerTestCase):
         # The top-level README file may have a suffix (like README.rst or README.txt).
         readme_files = glob.glob(os.path.join(self.tc.layer['path'], '[Rr][Ee][Aa][Dd][Mm][Ee]*'))
         self.assertTrue(len(readme_files) > 0,
-                        msg="Layer doesn't contains README file.")
+                        msg="Layer doesn't contain a README file.")
 
         # There might be more than one file matching the file pattern above
         # (for example, README.rst and README-COPYING.rst). The one with the shortest
-- 
2.25.1


