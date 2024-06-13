Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF47CC2BA18
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:03 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.9687.1718288458562069825
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gKAk/5eM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f6da06ba24so10345825ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288458; x=1718893258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKi0LCDz3Y+k9Y0J+husOpEDW4yF3NGtnUxOIoIx8kw=;
        b=gKAk/5eM/V7OXffPlNcddlQwHkkSksd8WuqELgmMMALEVODpCLPdbeXCKn90HtXv0d
         5oKS4a0e/G3GCkYQ3mRkDfC/qYvukweOdTQftXGCYNjQEqstf40o4CE9PJawOFPSx74e
         MYh2mk4HsRex05/tgOyTBuzu5Krb3pNXQjf+5PP91s+rdsfra0BDelZbB/QrXTP8w0pu
         pvvJm5kDSz/LtBDBBqYTUC3u95E3MKNGofmGMU+UcpB399bRbtJmlmImo9c1qk2wu5GU
         l50srX0iwDw9bBkfMZWLhcoXw2AoZTBExxWNtadMhLkVPNNuudUBM6mcMO15uh9QrrUt
         ivfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288458; x=1718893258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKi0LCDz3Y+k9Y0J+husOpEDW4yF3NGtnUxOIoIx8kw=;
        b=enCy+UVf+gw+VewV1XM/M/z9+TR43rRsLGRFhPnUnGw29nOg0GT9SHxNu8v9DfQQZV
         Ow967ql2YMuggr0I1rv4FaHPjZHULZSBsj6BqNEej5SaioabacOxJw1CD2mZdYDaQ9yH
         Gedfu7aKlMQUpKvlBuU81qwFaXIWG/ZYLEEaREWuUfyPSGjpY+lW+JhtjIVHHxYk/7rN
         x5EUKCsCO2rL+jLxaAySZIXY/ppHcJ9ymxpwWO60oUS9Y4mOtpMxJmL3sts9nVcejf4t
         l7A/5zC1vqZQHOeosRQlDMenN9SumaG19rnYxeW6iqZSOjN40XsKdUMdDsT90wDoLTZN
         NRvA==
X-Gm-Message-State: AOJu0YxlatBkl07N1MEausqJR/nGHpiRoUihq+MVjUfK0Aqp9iUqqxRp
	uJv3TTag380TpibKGHpaGz1gnQQw6+yeUQ8WktGpkjHa/rdJjqISNWgvULLRQPQjwptJb5Huzgs
	a
X-Google-Smtp-Source: AGHT+IGVKYOpUs/Rjym8o6LjoKUuSMEgwbiFGWCdifNgiq9ohuSqQEiKwAosSWpog31QkwGzLu8UIQ==
X-Received: by 2002:a17:903:2349:b0:1f8:3f13:1970 with SMTP id d9443c01a7336-1f83f131efbmr49975265ad.56.1718288457723;
        Thu, 13 Jun 2024 07:20:57 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/29] serf: mark patch as inappropriate for upstream submission
Date: Thu, 13 Jun 2024 07:20:18 -0700
Message-Id: <07e14e259e5354c6465953189854229a0ea42e66.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200616

From: Alexander Kanavin <alex.kanavin@gmail.com>

What the patch does is not suitable, as upstream would surely
want the issue with the code fixed, not removal of that code altogether.

I'd also note that serf is still semi-ummaintained, and the only consumer
of it is subversion, which is slowly but steadily fading away in favor of
git and artifact-specific solutions.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 634717817e94740ac8d4e8cc82cb68bfd15d8dbd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...op.creating.directories.without.sandbox-install.prefix.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
index 91640d6044..c8e6eddfec 100644
--- a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
+++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
@@ -31,7 +31,7 @@ ERROR: scons install execution failed.
   and the installed paths (including the paths inside libserf*.pc)
   look correct
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [removes block of code rather than fixing the problem in that block]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
-- 
2.34.1


