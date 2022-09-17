Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2BAECAAD3
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 13:49:30 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.6070.1663422560416600850
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 06:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d24LZLAY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id bw15so491538wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=bsAs/2YRZtVTdWkmMvZYK39CDdjeFm9neKoZwaGqif0=;
        b=d24LZLAY9EMawDODu1K4Pf81jdV4JmhGhOMK2ypsfMphwPGcEBUkZGxEMSmHRWPr44
         bkajffLEGZDJMnXLTn20ukG+D0KnC3Jw13imNVW+ZKtGa41/rU/cy07xAbb/NkCXOem8
         tuApELmwxDke7KRhxeM6WECBftmbYX47CQdZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bsAs/2YRZtVTdWkmMvZYK39CDdjeFm9neKoZwaGqif0=;
        b=eHEVldLWQdAA2XeDG1eyurhx19Z8yqEQWD5unor9qsXasJ7bkU+ROKflOrHlFG/h3x
         cNrzC7/nrp5FySkAWVJrD3znP6lGojkE2INr+IYQGx+VEcYAb0X0S7XZpVM9s0Bo2uIu
         Rkf0RR9yt0KJzpstJUAB2b5c8kVrr27QGTWb3ZTzKxfEOEbGeGiJInZjybpQUzo58z6t
         EBZ6sCE6HbySAa5lhDE03sFORPKBqi9kdOHO8UMRD+4SRoL9WtI7mpKDlxYCwY8y/kUc
         iR2/zx7TGMuM7W6fiChLtFevA9WsF4ufadx2AUHFeGxXuxetjhWT10QloRCBvT6nSm38
         xDcQ==
X-Gm-Message-State: ACrzQf1YX+QZfuAk+pj6A9I19M1fdMk2pWSYzkc+b+2+AyGBLptmcRTC
	bbtkPGrHWQ62BVv7QowiVTDftnl9YOhLvg==
X-Google-Smtp-Source: 
 AMsMyM4AfT2S59rmJCHMRpGyBEQs2IAwS/+y2eoUJRvJNyaKJuwVgtC2EnyguFwQnQnnpWVb7OqSqg==
X-Received: by 2002:a5d:45cb:0:b0:22a:94df:f88c with SMTP id
 b11-20020a5d45cb000000b0022a94dff88cmr5627616wrs.229.1663422558534;
        Sat, 17 Sep 2022 06:49:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 k24-20020adfd238000000b0022ad393ba3csm7426679wrh.107.2022.09.17.06.49.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 06:49:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] numactl: upgrade 2.0.14 -> 2.0.15
Date: Sat, 17 Sep 2022 14:49:13 +0100
Message-Id: <20220917134914.1299532-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220917134914.1299532-1-richard.purdie@linuxfoundation.org>
References: <20220917134914.1299532-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 13:49:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170832

License checksum change from a typo fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/numactl/numactl_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 93547ea2396..712cf0203ff 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -8,10 +8,10 @@ SECTION = "apps"
 
 inherit autotools-brokensep ptest
 
-LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e481299f3f677b21bb"
+LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=9f34c3af4ed6f3f5df0da5f3c0835a43"
 
-SRCREV = "dd6de072c92c892a86e18c0fd0dfa1ba57a9a05d"
-PV = "2.0.14"
+SRCREV = "01a39cb4edc0dd0f4151b7ad11e0c56d2e612a02"
+PV = "2.0.15"
 
 SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
-- 
2.34.1


