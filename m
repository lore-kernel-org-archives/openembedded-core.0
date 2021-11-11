Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C86C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 14:21:30 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.11291.1636640489353605247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 06:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Es0HXiAD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id z9so5385123qtj.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 06:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JqjfwYXxj923LVaapm+mXPGxBDqxAGLuar8Eo47/bPA=;
        b=Es0HXiADIbrsrrjVcoBmSTjspYXFZzuplWqs1SWgwIfB420ddmqOm78I0dI2G/jK0M
         rMS77XlgvwYc7MAhekWUnm/LmtxiH6Ny7hT2n7G9QGGAFsIthuS7KJOCzQc+C3a9gUmG
         QZX8wmznEhORmiVn3VFQVWJCLtEJkxEZOF18IlIjISWwl8J5npvPI9F6CnQEEjQICJoN
         Wbu+bYNzWwKbBkclsvmb5N4+XdcBGkioi/hYeFuD4MQofC8gl0joOnv/+lEeTV9sqNn3
         LYpyIKRkXsmHwFjy581ytggxmbAzHA122rS4YBltbYK/VrnQJGhrcLlGWT0dg0FK0Vvj
         zUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JqjfwYXxj923LVaapm+mXPGxBDqxAGLuar8Eo47/bPA=;
        b=XJiyeFwT5zL3Qtc3ve7uw9LLu+3hkP1ymJrOY9Jaj1rZC+qyulwo/XKTe8aXBz1Vuk
         xE+7ucv8JBNifczu1IDgTk7pxDSFptaf6DodRtvaf4K1J3aW5plJdQVA0PO9o2p0JvLG
         jSVyimjRdhMEzTd1K1Aj8YKZW1CN8cULWSVnoaosrwVaDvd0ei3a9gdIV926RV0fZIHW
         3rrCVhKlNwwiotI+vsIgt9nZSQFoJQd3M6JOkKuu8+JqNibz8wOyXHu3GHOEoTYDTUNM
         n+9IHDmM423XsGIPO8cKZeDZxXutNfvSqUQvVbv2bNNRp4I+gqEYUTvTT6viClpf98p0
         jRMg==
X-Gm-Message-State: AOAM532N6fRoxuUe4MejUCb08Q9/dbIyXD0UJoeIoQ/TzNQCKPzix9tv
	nkL9oZeAo/JX+aoa6IXe8ggQbfL/BuaR+A==
X-Google-Smtp-Source: 
 ABdhPJwZiyNiSU7EmkKFISpoTaIo4qFKV0HqMDWOK+RwKr8FjMIXC6RbYqcFOgxIe80HLfyaM7ScNw==
X-Received: by 2002:ac8:147:: with SMTP id f7mr7742944qtg.329.1636640488371;
        Thu, 11 Nov 2021 06:21:28 -0800 (PST)
Received: from localhost ([2605:a601:a618:1500:55ca:632:7b7d:1463])
        by smtp.gmail.com with ESMTPSA id
 b20sm1702457qtx.89.2021.11.11.06.21.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 06:21:27 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/lib/wic/help.py: Update Fedora Kickstart URLs
Date: Thu, 11 Nov 2021 09:21:27 -0500
Message-Id: <20211111142127.22170-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 14:21:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158184

The URLs describing Kickstart are no longer valid and do not redirect to
the correct location.  Update them with the correct location.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 scripts/lib/wic/help.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 991907d3f5c9..4ff7470a6a79 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -840,8 +840,8 @@ DESCRIPTION
     meanings. The commands are based on the Fedora kickstart
     documentation but with modifications to reflect wic capabilities.
 
-      http://fedoraproject.org/wiki/Anaconda/Kickstart#part_or_partition
-      http://fedoraproject.org/wiki/Anaconda/Kickstart#bootloader
+      https://pykickstart.readthedocs.io/en/latest/kickstart-docs.html#part-or-partition
+      https://pykickstart.readthedocs.io/en/latest/kickstart-docs.html#bootloader
 
   Commands
 
-- 
2.20.1


