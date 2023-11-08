Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7FEC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:16:47 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web11.14753.1699453004773649410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 06:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ctz9RnQM;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-49d9ef118a5so2756759e0c.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 06:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699453004; x=1700057804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsMZkvievlSzfdLglpn70FgNNlgkIEf8aMu3J2Dd8X4=;
        b=ctz9RnQMFBFkIIK3evrqw9kBjR3VyuoNMSnKbnbb+Z+xED8IKZ336en5SlRdw3p3FB
         tdCCHyqeMg1KqFmYbxfvtRkQr39Ab0okhUsyQ8KJBnzCgFMwpGCVQG3U3ly19LFuwu0k
         sRddYNlocd6v0ydcWBkYumVhgL4DxhdP/4lcc2w35kP51p9eV0H9icDVBEr1G7PWJGqn
         20EscyDDz6eyCdzl+8DMQ0+e7dnNyEiaQGmCaIUPvJ+y2fz1a0UN4+FvCsxBMY3xsiaq
         Q6X2P4pqLae9wMwMV/gecXXLxqKq6ouVYeSbWwIotwAeKkkI7q9YO5ZeqalmBXOamEOx
         f3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699453004; x=1700057804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsMZkvievlSzfdLglpn70FgNNlgkIEf8aMu3J2Dd8X4=;
        b=rkVghLI16nJJXQY5Ly+dX/Xrc75bikoRIIJhaRMlDqlXt8glWVNVLcD1f7TgXZ1FV5
         MvV5HLE3NtbKGUJrW8ttfORxnOmdc/uKW1nEKP9wjQk6M9Ofa91HTLSHe/0nZvJCFIZq
         bvGY9ke+E4fvqgcBhOMPmM5Cm62AtIylWZrSS7XKzoHNbkrV8Qe9TOY93mSVVKAvKRHz
         Kgd8Pme4PvEDkAKABJV+vSnRZgDCNCXCBDE0yGtGVVr4/sVjCcnQMCONDvgrgEdhdjWu
         SOX/8JMsDGWUnU7v46kugv+HJHF2kvSCLoz4uxRQM9Zcm48Ajd+JZyTWTuvAKXQDEZWe
         Mxeg==
X-Gm-Message-State: AOJu0Yw0SM1nK2VJhwzLlOAE4LyXq5oRw4yAqiQZymJBO7cIYBPYHYiO
	xWLbtj9gA2Q7xuPb8N5i42o=
X-Google-Smtp-Source: AGHT+IFDtuT09L2XWHx4uSvPsdX54/flSN5dbepA7P7lucWPqHENBCNLgShywkKXfejwBMxDephJBA==
X-Received: by 2002:a1f:a248:0:b0:49b:289a:cc44 with SMTP id l69-20020a1fa248000000b0049b289acc44mr1585454vke.6.1699453003640;
        Wed, 08 Nov 2023 06:16:43 -0800 (PST)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id j14-20020ac85c4e000000b004181138e0c0sm921665qtj.31.2023.11.08.06.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:16:43 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/12] kern-tools: bump SRCREV for queue processing changes
Date: Wed,  8 Nov 2023 09:16:24 -0500
Message-Id: <295c4ed2c3566a7483bfc5c757e1c5d51db43cfc.1699452828.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699452828.git.bruce.ashfield@gmail.com>
References: <cover.1699452828.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190345

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the SRCREV to pickup a new option to the patch and
merge queue handling scripts.

The new option '--prev' allows us to change the behaviour
of a subsequent runs to retry a failed patch, versus skipping
it.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index e109cd7454..e4b5eea659 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "270f9ccc5e2998cd1f3ed1e32d02e356793e4680"
+SRCREV = "0ae81fdbb1ae1546371206aeb3f5fb530dff8ddc"
 PV = "0.3+git"
 
 inherit native
-- 
2.34.1


