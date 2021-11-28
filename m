Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB12C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:38 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.53381.1638136778223670156
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BzZ9gM71;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id c29so2878596pgl.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Oiq0/imrYioPvqeHxmAee1ihraLS3ndZ3je3s+FsB+A=;
        b=BzZ9gM71uH+7dOxWFHy+a4BUe72/69PkVihyjB+YWXohhMHcj0XaCWVXsbtQuLNCDB
         sTtKJv21ddndQQ5yv6bWwL5iy8Qxiq09+i13IkBM2B59+RxG9MqPQIaojhe99qyk5qlD
         sR7o9QgY/AWqBzdL8XiOM4ROYno91LrE2LnZorLfSxI+8Uyb7hnYqcSgkNcJVVXEBBOB
         /8kL8VcmIACHPHZtslGA6kaTkYPoM3BZnscXq3Ez6YjhPS85TJUjJWIN5yinL2yy6LPI
         kuNsXg8RzqjkLbmChb9UeU3CouDQlJau0wmGh0gGJ1h1FSgTWr+EOVI7yP052bu/XuHT
         CKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oiq0/imrYioPvqeHxmAee1ihraLS3ndZ3je3s+FsB+A=;
        b=QOheOwaV1oSKnAytxN/4QdamGm2ej4UrbifWC7HfeBf3k1ZMB6t4ftzu0FW586+uab
         zlRRqM/Y8c00kk9ZxU3MUDxsadNC6PNiEx+MLEPp0p8k0mqzG4tL78Urw7mVGJhl0uJP
         JSBcw1j7Px+wkwVa4BV/whrkP27gxODF2WHxdw1UDwUBs+knfArgud/EkTjcxVd1HaAA
         RddjlhsLCiSWIL40Kz0JrLgW/vBA+tfWJPgp/RfrEFjsmLk4RCSdMS7XUcsEpywUdQVX
         h9oTAnmEhDGCVRfIfyC2icWbhNQ+kQph1FLB6U4rgxVVSRlklEJZIL54I3vlEp3dn3Rb
         w2ig==
X-Gm-Message-State: AOAM5302v6fRinDVC5QhbTXcqiHsII854t2lpclnPx2vkv1po3xh1qbm
	W/iH+2JaKCUpp8m4VABJ+6h7bFEkgY4RzZD0dMs=
X-Google-Smtp-Source: 
 ABdhPJyTsTs+STiaPoWtp21LJHRR5/G1/IH4EV+ktsM3tWKjNvYgMhOWvRB0zkAOVMTfGFNNy88o5w==
X-Received: by 2002:a05:6a00:1305:b0:4a2:75cd:883b with SMTP id
 j5-20020a056a00130500b004a275cd883bmr35485870pfu.44.1638136777139;
        Sun, 28 Nov 2021 13:59:37 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 31/42] weston: submit patch upstream
Date: Sun, 28 Nov 2021 11:57:43 -1000
Message-Id: 
 <a895f7b2e29f927634a8e0cbbe9c4ef1fefc8c65.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158913

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f265a550bc057f653aea6f3611f71525e669a9f3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-weston-launch-Provide-a-default-version-that-doesn-t.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index 62b864c134..591d7ce893 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -10,7 +10,7 @@ Since starting weston as root is a valid use case by itself, if
 PAM is not available, provide a default version of weston-launch
 without non-root-user support.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/725]
 
 Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-- 
2.25.1


