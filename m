Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05F6CDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 06:09:29 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.5297.1697090963451822144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 23:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=M8RmutX1;
 spf=pass (domain: mvista.com, ip: 209.85.215.180, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5892832f8daso1447205a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 23:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697090962; x=1697695762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnCr4lD+FwvpNWEpUZqP7ad/1RWuiszw6QrtP8+zJrM=;
        b=M8RmutX1LxWBEEF36pZMsdP5r8GEqyqN3IYbzgYho5O/oDOa5vY9EvGFeuVvyx0erY
         ynZPSiYWZ+TdhllbpHEmKr6IveUJvI632c36YAwvBMZuic/OqhdqazytjSTyep+zGFeH
         vjlGzfE46jI1ZhYRLWyJYYD2w+0+BcFLz1JpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697090962; x=1697695762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnCr4lD+FwvpNWEpUZqP7ad/1RWuiszw6QrtP8+zJrM=;
        b=xOT68Oey3OUwDP2xDYap9y07nUO/83Mmx7PRHI5jAUB8b2Zm0TX7TDT/v211+SFbrQ
         chOR/hwgHDdgLnsg87QoSb8cpzbyaYNcymHXzIkjGICOaElMPU0e7Yq+krL3SOngmhpa
         t98Rq1B38BVG2OU3J3BA0sRMjEgKRfyiWy0Q6o/H2TYrnkh0w+FSFxa4uKjA8pjxqM2p
         am7VlqKJTP/NjSi51PruRJ908nyiCAJB+E5/NUysgzRtXdaawcGSeFvQG7dD5hEQj8zj
         hBEa6tkeI1V9zss/fmJS0xQrntNtv+dCErkBc3TE/4ED+kqtdk9zTBjDsAXqR6ZPn7oE
         nlSA==
X-Gm-Message-State: AOJu0YxpaLVJAP2U+M0HYr60tZwp8aXS/CYWbgSbPdjRGpsU/Gq6/eg6
	EsBG5dXzO4Y2c7paw0dYh68HmY+AYpq/1PcYbKI=
X-Google-Smtp-Source: AGHT+IGtymt+hKThFeq6GNpC+2G5pOqoxJIZ1dzNC/e/O7AJKdPlTsaH7eqoP1W23gQnGyaLrdJ2ZQ==
X-Received: by 2002:a17:90b:4b84:b0:277:422d:3a0f with SMTP id lr4-20020a17090b4b8400b00277422d3a0fmr31653970pjb.17.1697090962526;
        Wed, 11 Oct 2023 23:09:22 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.58.87])
        by smtp.gmail.com with ESMTPSA id oj3-20020a17090b4d8300b0027d0d4d4128sm973826pjb.25.2023.10.11.23.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:09:22 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] vim: Upgrade 9.0.1894 -> 9.0.2009
Date: Thu, 12 Oct 2023 11:39:12 +0530
Message-Id: <20231012060912.17284-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 06:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188982

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE fix for CVE-2023-5441.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5f55f590e6..5e06866692 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1894"
-SRCREV = "e5f7cd0a60d0eeab84f7aeb35c13d3af7e50072e"
+PV .= ".2009"
+SRCREV = "54844857fd6933fa4f6678e47610c4b9c9f7a091"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


