Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755AFC43219
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:54 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.8710.1637163353766531716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j0VI0ypH;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso5136283wms.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jzhLs6genBvZl0iFXsizBo5HUSW9gKptwbZJvBpi5n4=;
        b=j0VI0ypHjbw60bZWn7dIaZAuhcsPn5ak5y92/ipMW8FfwKFYjWozYBP1djD60A9Bj0
         n2q/+r+WJCg28wYi0dz6ISO1mkS5e0chDYqOBtqcSDEdhBrN9FfZ4LbAxH2gUHzTud9f
         OBWtmLXVBMXWLNp5b45siP7LxK1T6iHWsgi9Ske4LD5AzNvY+uVKIagdB8O7F4Ivkjb2
         B6cHGFPP6q3DDLwms9XJJrfrQ1azyVBzAW0hy9C3XXOLdhR0DpKZ6v0alTfuTGKQPYoR
         hKW3+gkVPlb4MU8ex0IF3Ls1uXu610EgprE5GnKYaG78ppQHT8ZpZBW0bSlmXWDDF0B9
         9x9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jzhLs6genBvZl0iFXsizBo5HUSW9gKptwbZJvBpi5n4=;
        b=ZBmmKCbByG6dXmylYi2KOMqx0LWswhOPoL/FSySth6LqxSIlMYlW03DC2uj4ExrzMu
         TN30usi3npfcBxD/HtwNjfgnZ5wTI6bLL1GNjfm2rSaNKz2pw+FLZKJd/cWrmVr28Ng6
         cYRSEylyOTbNTFvxEvgqeeTOTxZ6oDhnSJJJTN5Pf6wLQbEJzlbbKR6op0EB39xO6GJr
         /8DffCaRzXSdYRzqHxHBmHbOevBhF1QQ3ZsIwIuh6mjqJVPzsV1COEHcTLbOima/Rp1M
         tKweWZOE1KGI44UXt5JZgBv/zyfO0UswdgjjHDGi1j/UfIBC5MEkk+inzxJl/FcsFzp1
         9AOQ==
X-Gm-Message-State: AOAM5336EMwiR+FC7doH4xBwRFsORenL5VexLVT0M1lkxHNIMdOCdqm3
	owEobmOaf4NbyU4XF+os/EMPK2ssnGU=
X-Google-Smtp-Source: 
 ABdhPJwV2SjEgfnburlG13CH2mC0YctQKmAcIF5mO69cf4rjeCHNxAlsj1w+YdcfOYfzbqaIznHbNA==
X-Received: by 2002:a05:600c:5101:: with SMTP id
 o1mr636907wms.81.1637163352371;
        Wed, 17 Nov 2021 07:35:52 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/36] librsvg: submit system-deps patch upstream
Date: Wed, 17 Nov 2021 16:35:25 +0100
Message-Id: <20211117153525.257146-36-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158431

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...endor-system-deps-sort-dependencies-before-using-th.patch | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-vendor-system-deps-sort-dependencies-before-using-th.patch b/meta/recipes-gnome/librsvg/librsvg/0001-vendor-system-deps-sort-dependencies-before-using-th.patch
index 9fe11930d3..21565c8faa 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-vendor-system-deps-sort-dependencies-before-using-th.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-vendor-system-deps-sort-dependencies-before-using-th.patch
@@ -6,10 +6,7 @@ Subject: [PATCH] vendor/system-deps: sort dependencies before using them
 Otherwise they come out in non-reproducible order, leaking into
 target binaries.
 
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
-
+Upstream-Status: Submitted [https://github.com/gdesmott/system-deps/pull/56]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  vendor/system-deps/.cargo-checksum.json | 3 ++-
-- 
2.20.1


