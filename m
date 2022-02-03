Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3C3C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:18 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.2876.1643917877279287383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jHWPHla+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id r59so3394294pjg.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RoE53m87U9F8W8nqGOhznBIeLqFIpFzLtRtIheYQJW4=;
        b=jHWPHla+tlmCJk2qx3MyKiesqBqZ01bbPBH0jN+uwjzGo++hitdTlnCuDDxqLkLY4Q
         Dy8DKmWfbD/L8tncMu630+qKY4MD00cInVUakc5Dgqh9ruOu6OO1vtYcRBXw9UJqX6uV
         mIICGvc0QXAv9h+dXFWf9HP/aaUSiP2NK8CleiC1aAdPDp5Rruft9Dde7nUsKz9sjj5L
         cp+ATLEZn6OvywAdE4m8nInRC9Va7RbxLZFvCviIG//zvI68FHK5GjAHWXeuBhsI0m3T
         CIwTELwsTknwMdiK+VJA09zC7+kh13JOgT3rYq8OcYaunigGEm70oo/vSe6OMTLo+mHo
         EiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RoE53m87U9F8W8nqGOhznBIeLqFIpFzLtRtIheYQJW4=;
        b=7ireR6Vej+xs6r2zRX9g988VM4ndt/ODsiFFf+u+X1evtWfw9JiPUw3yrVBabcRoAS
         Fexe1LkoS5E2qDv0qSPojyA1y1ITAE9EO8quKmK/NG1ao2BTTKWQwnJDMB/KetDnsFaa
         nGb/Wsl6irKstjuvIzBhy1yOk4k396FCw4kmNNKjG7xRLk4LVZNBAR5QMV0622kPacmY
         2o1Q0ss/tDh2Dv0UD8O//jY0FXfCH2Q8Kxw6xVMks6PVeHDEcQkCT9geGwqdBbvGnGzx
         uhU5dY0e/zh3PzDdung+p6Kq3hjPYWPp22gBt8KlrynF0mreaLxZY+1mX7EDmXUr326y
         ehfw==
X-Gm-Message-State: AOAM533DZXZBNFSKP8ZMAntFhmNjkEH2C+xQDTfTuYdKBAjTm1S8Xq+y
	KfvUIGm7Ax7ZDPtzJgp4wN2k/Mgqi2G6Q1+P
X-Google-Smtp-Source: 
 ABdhPJyXrr/skjdEY8nxsMdbFJfXo4sOODWxdOjxC07XV8R+clF7eDe75Y7zxnKAvzqT1+9cWUItCQ==
X-Received: by 2002:a17:902:c209:: with SMTP id
 9mr36807897pll.119.1643917876296;
        Thu, 03 Feb 2022 11:51:16 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/20] expat: add missing Upstream-status,
 CVE tag and sign-off to CVE-2021-46143.patch
Date: Thu,  3 Feb 2022 09:50:31 -1000
Message-Id: 
 <7e33aa25acc0c29b8f5e78757c6557e614eb1434.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161302

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/expat/expat/CVE-2021-46143.patch | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/expat/expat/CVE-2021-46143.patch b/meta/recipes-core/expat/expat/CVE-2021-46143.patch
index d6bafba0ff..b1a726d9a8 100644
--- a/meta/recipes-core/expat/expat/CVE-2021-46143.patch
+++ b/meta/recipes-core/expat/expat/CVE-2021-46143.patch
@@ -4,6 +4,12 @@ Date: Sat, 25 Dec 2021 20:52:08 +0100
 Subject: [PATCH] lib: Prevent integer overflow on m_groupSize in function
  doProlog (CVE-2021-46143)
 
+Upstream-Status: Backport:
+https://github.com/libexpat/libexpat/pull/538/commits/85ae9a2d7d0e9358f356b33977b842df8ebaec2b
+
+CVE: CVE-2021-46143
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
 ---
  expat/lib/xmlparse.c | 15 +++++++++++++++
  1 file changed, 15 insertions(+)
-- 
2.25.1


