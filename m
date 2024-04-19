Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956DDC4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:01 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.19149.1713529192250343484
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jyOurfnR;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a55692e09c9so110684466b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529190; x=1714133990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CxZJzGR350Q26Y46nawNxGLNswAlcKGjJH2CAMZzJs=;
        b=jyOurfnRAw25pBBctU7PLMmFtyfJxXurGmCj07O02XjnVthqgF63Sm1pNhk2GBT6tp
         5vyB3RAwGrtmMYqi1vfpZyXd3RPR5okOlFJsmx1luBxlW8HWTueL2PYkqFKAgDubbQqR
         rvENZPpRBhYFa/MkmCJJtvbYBN7z5HhIvrE1wB5Qor8HxEpJBZbHun4fs/u4COpgxEg5
         ODIQo7y7U4aKZG1OcPsKZl6wSyJg+vX55PGmtzt61YtSLpZS8MlM5jqIX7wNHQm0DwNm
         Z9pCOsHhLUX2GS3cLX+cAyib8eOLl/9WQoAmu47oNm/qt9cfjVOq3g4BNRCidQP+6kF2
         a7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529190; x=1714133990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CxZJzGR350Q26Y46nawNxGLNswAlcKGjJH2CAMZzJs=;
        b=ZpnLbz9irqI0zzLrwCd/2DgvXJjbxeCPX0i6pb/jN/ZxGW3M9nSl0DHsfMtEPzjvqZ
         DK6hsAePWz+PjUhawaHEFjmGO64StwJwTR7gHxFNKzlP5Toi0xCZg6COJUp5j98dm1Lh
         fyXLzOB7nx/YNO8f8/BuNB4JpizmwBDKY+iZqjewM+f4Qa0K5dMA+gq1Lwc6PXAeiE9U
         b0fJKJeZ2fUB0cIRVCLTpZCUDHFe4bMNXB3YJppFlSSJJFIdjahURqJC/j/f8Y8tnn2G
         wnpbZykwTpsVkihJdgfJzDz4xnDHjczFnOaSz2p6LXGieH4z281NeBc0mjhGoHZsusaz
         I3CQ==
X-Gm-Message-State: AOJu0YwqrcGY/kjsCfy/Yn/hOD7W75mopE2e0H8fVLke6Mq3DedWVBan
	bUJKxAVRV1ocdi4J7AD7mMM4uexfP2gAVvxFBaRDNllQSAFDnBN0i+vUvw==
X-Google-Smtp-Source: AGHT+IHkP5yOaQvw9dnUFfGJH+vAPQ1KQblQtNv9cT3GPNaCDbepaMkR4lc8hDRElMJlaNEBShrMZw==
X-Received: by 2002:a50:8d17:0:b0:56e:1010:cd7c with SMTP id s23-20020a508d17000000b0056e1010cd7cmr1518022eds.12.1713529190377;
        Fri, 19 Apr 2024 05:19:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/19] serf: mark patch as inappropriate for upstream submission
Date: Fri, 19 Apr 2024 14:19:29 +0200
Message-Id: <20240419121945.1920944-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198531

What the patch does is not suitable, as upstream would surely
want the issue with the code fixed, not removal of that code altogether.

I'd also note that serf is still semi-ummaintained, and the only consumer
of it is subversion, which is slowly but steadily fading away in favor of
git and artifact-specific solutions.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...op.creating.directories.without.sandbox-install.prefix.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
index 91640d60443..c8e6eddfeca 100644
--- a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
+++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
@@ -31,7 +31,7 @@ ERROR: scons install execution failed.
   and the installed paths (including the paths inside libserf*.pc)
   look correct
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [removes block of code rather than fixing the problem in that block]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
-- 
2.39.2


