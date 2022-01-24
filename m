Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948A5C4332F
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 17:16:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.79.1643044594397563836
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kg4vk91U;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id l25so14864096wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G6EvTLSJdvQeVD05TvFqecgpLx1q+JJg6+nqZ3CfLQQ=;
        b=Kg4vk91UuWOpkQjgAtsxqONg9lsbzA8a3OWTLU5r40j1IQ5NlUWzjZDx4juRIybBxU
         0rFR4tfw1vgB6JhCER3OL1cs4EqgO+8+itlSpB0NLZC/AvSn44roeEC1w++49GRlPQiN
         NUJiEQuDzgKZpnxMhE7hn8qN8JT6Fkme/JXUyf52fD9SgNq2LZuMRoa3ZRkyZL6mxbQL
         aR+lmD064BafbnhhIhdMmzwjHjaAwnF2owpM+aIS2FQMrwj7a6/X6+3SHrN/hSWx1U17
         ay+rgYSM+c136jTWIAEeBwUbcyilWLhn29XPDWp/GFWvU2uAcf0+eaHpgnieJEKA4gY3
         yJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G6EvTLSJdvQeVD05TvFqecgpLx1q+JJg6+nqZ3CfLQQ=;
        b=L5GIlfedCzR8JgKwUgActMDUMetvMgfOAzgLp+pp0CWvSo3fFr8yc63ynfudjAhAJw
         rs0Dzkn+C2Pst/M9ZjhylDV8tOOnLmlPCo7FQ3rDt61wXojHPS6rsItfBBJQtb5Z4Hnn
         1AXzwgN5e1OrrlrUEJ7W/pYq/zyYyFLmlruekMjIv2EJU7F01b8IqLCn8xRR6LRdiMN8
         dY8Xc/oaiOIVtEfdJBJzQbgWRo2712YI6m02mTa7GZI3mCcWwQkPMu4l3E6c17pB0+tr
         iVdCNEyRejktx3NYy91piYRgBVJaf1I3Q3Q4xRKqwn0zrdWkkL8WwVesfjVShOqjQUBq
         h/9Q==
X-Gm-Message-State: AOAM532Dr0nhNfwmqGm48T6PBr0KvSnFW1LgDz+BmRD1gxW+evel0cpi
	BCNxLLUoc77dWqpwnwVhl/0EIJEA+aI=
X-Google-Smtp-Source: 
 ABdhPJz+/bEalg30/hQstGxLMNFG+oOyn7yVHpzzXHBFvBJe6iKUiDx7mCj6hXsAukJ2aI1hTvzbbA==
X-Received: by 2002:a5d:4201:: with SMTP id n1mr14834209wrq.239.1643044593067;
        Mon, 24 Jan 2022 09:16:33 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 o14sm3085839wry.104.2022.01.24.09.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:16:32 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][dunfell][PATCH 6/6] shadow-sysroot: sync license with shadow
Date: Mon, 24 Jan 2022 18:16:09 +0100
Message-Id: <20220124171609.20282-6-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220124171609.20282-1-nishaparrakat@gmail.com>
References: <20220124171609.20282-1-nishaparrakat@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 17:16:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160888

From: Ross Burton <ross@burtonini.com>

This recipe is just a single data file from shadow, but as we can't
easily tell what license that specific file is under just copy the full
license statement.

(From OE-Core rev: f0e2f3b1f855ea6e184bd1d8d796279fedcbfa33)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index 5f7ea00bf1..4e68f826c6 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "Shadow utils requirements for useradd.bbclass"
 HOMEPAGE = "http://github.com/shadow-maint/shadow"
 BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base utils"
-LICENSE = "BSD | Artistic-1.0"
+LICENSE = "BSD-3-Clause | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;md5=25e2f2de4dfc8f966ac5cdfce45cd7d5"
 
 DEPENDS = "base-passwd"
-- 
2.17.1


