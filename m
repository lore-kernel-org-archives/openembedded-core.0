Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1A5EB64DD
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:54 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.3851.1688092185236359090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rkJXfkhu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-55b1238a013so958523a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092184; x=1690684184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=so3twpKxzHeCsOoCQ/BXU5vMOXWD+8VjLBgaFWu6250=;
        b=rkJXfkhuUQOEs0AduTdJvQi5SeZpemRhAh3FjMeK0KsX2sA6xmLQw0kHkVBnLMsl1C
         vaNapXIk8Kv582z1h/kglPKnJ9mCQWtc+7ZzuMCanWcxP0jQjqUbdIP/sHzigbQ37Ltm
         XareQoF0VXSpG5lGB73zEo9j5O9DgCx6d//0xD5AO7+duQteig5Teuo3MZfaFtdbKeZ2
         Gi1NhzpG9EVEZC10a10z4iltGsSKU+GL679iDDtanfaz23Pnn5Zan8PkWZmxBiKFnlAI
         Q679lH+W86Xm98SCMv/Bhc5O17Qm+HYTWG5aRqNFR/anqvCRlgm2R2pSKpYGLRKBtOVT
         ZaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092184; x=1690684184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=so3twpKxzHeCsOoCQ/BXU5vMOXWD+8VjLBgaFWu6250=;
        b=lMO699CSVTzmCqj3DI/8kTwHDqZcF7UWKZG3BAQi4ZZfWDzNUyb5mupCZ52Wze8Mgg
         yjFRuHhJ2F4esYCf6bt/RXd8YyN85LoWeY1qbkx+OyGilu2PS7ObTWvgpj9favK0FRNY
         872Z7fAxuTG06+MLhuecGVB+/ehCNbVXmjKnH2n/zQcZCJZo6VJ5W0UhugtF6dyW2fQf
         m50PmpNIu4ElT9+BERCKrsYTS6HqKmx2Bkq2FlmCizI8VSk79rqrcFUBEUsgqZB1R3h6
         uHP503T9voA4luEwgtj/WhYZO3IoKDoAaOmK6ZisJnyE5rfYXL2sXTl4eU9GihIIS7tQ
         gJEg==
X-Gm-Message-State: AC+VfDxPYwR7vApdxF4usAfOgnieFeNHC2+1HiPPWFWQpHLu/hQgk6by
	OWOs4ajGj44T6da/n3gaRWTj9RSpXvbdYz3n9hotDw==
X-Google-Smtp-Source: ACHHUZ6Y8MN0j2/a74tVWe23qi+RWY9LpfwqDzMPImTjZFcH06FISZPYu+rSe8JIXBwmlNlxUCtARg==
X-Received: by 2002:a05:6a20:c524:b0:12c:e180:e400 with SMTP id gm36-20020a056a20c52400b0012ce180e400mr1308249pzb.10.1688092184382;
        Thu, 29 Jun 2023 19:29:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/30] maintainers.inc: unassign Adrian Bunk from wireless-regdb
Date: Thu, 29 Jun 2023 16:28:56 -1000
Message-Id: <41fa071b1b32a795e5c5b671580d4f962dbabf20.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183660

From: Alexander Kanavin <alex.kanavin@gmail.com>

We were not able to get a response about availability over email, and so the recipe
has to be unassigned.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3beb88060be9484cfe75dfa60f041b0b32214978)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5e2206e11f..814741f324 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -838,7 +838,7 @@ RECIPE_MAINTAINER:pn-weston-init = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-which = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-wic-tools = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-wireless-regdb = "Adrian Bunk <bunk@kernel.org>"
+RECIPE_MAINTAINER:pn-wireless-regdb = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wpa-supplicant = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-wpebackend-fdo = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-x11perf = "Unassigned <unassigned@yoctoproject.org>"
-- 
2.34.1


