Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5715AC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 07:28:53 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.45238.1643700532153243260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fJyUOpG3;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 m13-20020a05600c3b0d00b00353951c3f62so844045wms.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=L4uw8zE+UjVm2CDdjLwXiQPniZMcLAUv/yZCexnq0Bk=;
        b=fJyUOpG3pb/KNJbQ4hv/zv+1E51aYEEWy8Y9N/qMYRQ3sAE67oGq2HYqwr2V2uCCpB
         862nywVLCuYrFXET9JR/4yxquYaxMeZq+ScuIdtjqlX4zl13eQNrkOYqtUh4+Q8oz2Td
         aTL2TsyU5tuiztdAEiftvSgNKa8lXtZKR/XpAhmWkQSrKBlWtKsAmCPVHx8hdkb+o/D2
         AEM2mQll1w6S4No83eG/N2aaDkAOKkzxXBONqtFNjaEVvUDI8AJJt3k+6JfU6lO5aGu1
         c7Oa3lCHxeqhrPLxF2XyXgnt6N6j53jykBrYEfukAE2VxDCGiIIi1L7cFiP/zsOxSLij
         8zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=L4uw8zE+UjVm2CDdjLwXiQPniZMcLAUv/yZCexnq0Bk=;
        b=FJGZk9SHy73hEXfdj2y4LXhBsDyZ6G57HhOwR0jGdT/9VPxxTH0p6YBv/LVFzqg8uV
         7Mz5mbh1AuSQX/G0TnQDnFp04kItc+q5poaKg1oMQSGXOiU1xZWB+mlf0D2Mc4D/+OD7
         mgDkwwsADc3Icizr1z6qAhCc5zvSNUDL1SNHqlWoCFocMisqSP45DRRu2xrWtlg9Dw58
         s2zWXuB80yvpSbHPHvRpn3lg3Zt4DGzizpOe82+y92KxRmeCVosG1TcaVh6xSvBNZTuo
         zezagi8G4e5NoTwYt+l2BvedBmDK2uyZI1U1MRXtniz/8Wc/MaG7Zg9NwW6CBKYKuXPy
         OlFQ==
X-Gm-Message-State: AOAM533wBxrgyPaJYsAejMcqI7+B6EhnMcjWcfyN82VOJZmPXU5t3gKu
	1Hv1NNAP8yGnButZ+0AytH73IK5Tr6Q=
X-Google-Smtp-Source: 
 ABdhPJzT6Wj/4wGKHagYez4L0ygJqsM3fOef3UsDD5ULqZzUBwR01t0NeX9evYm4/JxZ14v0UZj/1g==
X-Received: by 2002:a1c:f610:: with SMTP id w16mr575729wmc.71.1643700530755;
        Mon, 31 Jan 2022 23:28:50 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 n18sm13667370wrm.47.2022.01.31.23.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 23:28:50 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nisha Parrakat <nisha.m.parrakat@bmw.de>
Subject: [poky][dunfell][PATCH 7/8] shadow-sysroot: sync license with shadow
Date: Tue,  1 Feb 2022 08:28:30 +0100
Message-Id: <20220201072831.34695-7-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220201072831.34695-1-nishaparrakat@gmail.com>
References: <20220201072831.34695-1-nishaparrakat@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 07:28:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161152

From: Ross Burton <ross@burtonini.com>

This recipe is just a single data file from shadow, but as we can't
easily tell what license that specific file is under just copy the full
license statement.

(From OE-Core rev: f0e2f3b1f855ea6e184bd1d8d796279fedcbfa33)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
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


