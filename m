Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F08CC7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 11:31:48 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.5495.1682508702569809624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 04:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QyLOFI3H;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: deepadeepthi98@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1a80d827179so55993965ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 04:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682508702; x=1685100702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G4jD+3gJGrPw0aF15PE5DRlUSCuPO4W0RPe1c3x90HQ=;
        b=QyLOFI3HapZdj7k8AQpGyxMHVMDUK6jIi3uzmJ3GW+m9xff7nl4iAE/jqh/jJX9Ows
         BOhRG1sRZpnnk6QFg+BB28ZmmrBDuRvkOkZZqX/5G0ahYbGRxiBeEWGZyIPSCapKpHwH
         /VNZQHDDyQPyO86qVb43PZgtki8maArECOGH9BZmGy4P+JcnxmYiztMh3nSF5ZRYzGPV
         qecWR4BtO4YFQvM+deLPikv4zA9ZSgrjGOd26b9FRwGAL6VttLTi+D+FGCNTchNYbPs8
         FdNqamd0TNJ9cX4E5TSK4XAgaAHM3VXWHMGYOoJOG2BeVeGsTLqqaiCdCNqNQqkL60rq
         2xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682508702; x=1685100702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4jD+3gJGrPw0aF15PE5DRlUSCuPO4W0RPe1c3x90HQ=;
        b=fZ9AxjB9IaLFMEXAnHSK8LWRt1aF4DPHhjMVY3mktm+IZKOARmhvxhwJDLCKOgL6Tx
         ztgBC9d/cWJBtcxCaw5A5wZn+SFDvhJjVx8b+okLdFlmz3lqMSNODKPFOT+/c2C/ZJuc
         4KntbXTNCWtui3mCXcgAD/iJW2hpEF64witGIT4RwhTNlR9WpkP5eS6nZECc+y4c5nPY
         CSjaBpsREbL/wqKvn41YU8Z5u6wc2aC6PZFl7sTRQfBWQq4t9Wwdmv2Xwuk7yFq8T/QU
         VtgRicZBBgY3vL3LZL0WNwrtxMrjY0zn/1hRpzx/TorVNGG5T4C7Y5vLN1gc+ERYd4+b
         6hKQ==
X-Gm-Message-State: AAQBX9fBJ5T63yFhp6kD6pr09MF9/ycuUCg6Yt5eEGyPHk40gIMncMkU
	IcYoX/jDHa6E4wPPu8wQWY6sZwJpk9hvBw==
X-Google-Smtp-Source: AKy350b/FAi1/ghtslDBI/8bOX97a04J77wQg4Xp/gJRD8+CA0adYpbG3GcQYyRK2TcKKqfAcSj0ag==
X-Received: by 2002:a17:902:d345:b0:1a6:a327:67e1 with SMTP id l5-20020a170902d34500b001a6a32767e1mr21945859plk.57.1682508701715;
        Wed, 26 Apr 2023 04:31:41 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id jc1-20020a17090325c100b0019682e27995sm9782125plb.223.2023.04.26.04.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 04:31:41 -0700 (PDT)
From: Deepthi Hemraj <deepadeepthi98@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	linux@blackfigtech.com
Subject: [mickledore][PATCH V2] glibc: stable 2.37 branch updates.
Date: Wed, 26 Apr 2023 17:01:35 +0530
Message-Id: <20230426113135.2740310-1-deepadeepthi98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 11:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180431

Below commits on glibc-2.37 stable branch are updated.
1d63573f81 stdio-common: tests: don't double-define _FORTIFY_SOURCE
590d0e089b elf: Restore ldconfig libc6 implicit soname logic [BZ #30125]
790e504a17 stdlib: Undo post review change to 16adc58e73f3 [BZ #27749]

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 1b8665a9d8..124e0646f8 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.37/master"
 PV = "2.37"
-SRCREV_glibc ?= "d8e1a7590d375159fb5aac07ad8111ab4699e994" 
+SRCREV_glibc ?= "1d63573f81945a489ea169636fa11850bc74716b" 
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.34.1


