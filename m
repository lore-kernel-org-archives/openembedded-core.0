Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B51EC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:33 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.2933.1643917892065042809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3jIxNSHb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id c9so3099320plg.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VWGO4Zn4K4sN0NvmXTRffvYVKojbdQEv/6lWkXzF6/w=;
        b=3jIxNSHbRNFRxOXf1wtVMYiWaHUFu5d4kN9KYRIQOwQj499jSlFN3JmMgp5kiXzVVE
         CkjEjN24h6Djo/xgIcGzAQFI7zqHcy2o4DrMyHvfYvzMF2DTZs9b3sbUQwxxIX3wsAwk
         h359BnHOYs4EcKkzY9iRK8SABN3qceZnJAOfwPViV1SXeIJd5/SgKJ1vbvKRXnCv9dcR
         lvIE/VyrF3LZYajngeJgvcxz7/tPjzbU2Nninx0vPtDfSndQ/0OCpp5mVirtbzR/9ynf
         DQgyRJQggxHNCDP+ixQYMxAol4qh7eC/MMGBvjvzlTY6LChEmG5E9pqC10vGhlVCfMKW
         BC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VWGO4Zn4K4sN0NvmXTRffvYVKojbdQEv/6lWkXzF6/w=;
        b=aXmbw2RP/gT0pzL3PNkQsXtbka/4e44KTlSNyXU0vnNeiz0PwAaRMCng0/bOhTCPjG
         Pw4X3ZRqeN7PVt8akPdLKxo44+QxeD+1wYA0PHAVzlE2/b8sBNr81OnveGC0Rvrffs7p
         enFG0KXqQ+k8KKl7ugvQ3Aq1PPQFO+HbeYSlkCObbJ/qPTg1faUL6hxbXBN5UEQK5gge
         d4pOX9qnyrbkaNQDpDiKQQSb0WV+OQol7NGuQL4ZgOfgz6zYtRpcIWOfjun0sxBJHNSc
         Q7HacT4S8aekCyqx+upHOT0jXeNTLdsxMBYdQKJ7nQQgX16qT9LULCHP0LJL64vsidLG
         m//g==
X-Gm-Message-State: AOAM532T+n32etz8pPcE9prvB49n03YbzBiw8/JZufTR1CjWaOPHVyvJ
	9fGNx+FDU5O4ATqxqCNspwPqUPqnCnVVHghT
X-Google-Smtp-Source: 
 ABdhPJyU32WiBs9l1DLjDi5TiLfudSyxgtcBAcNlRNTNJVtvNdVuHxuuGwUEDyC5SOFFOttgtazmdA==
X-Received: by 2002:a17:903:244d:: with SMTP id
 l13mr36400417pls.142.1643917891002;
        Thu, 03 Feb 2022 11:51:31 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/20] tzdata: Remove BSD License specifier
Date: Thu,  3 Feb 2022 09:50:37 -1000
Message-Id: 
 <1969b58049f95c351855e5ee7c04d7d28899880d.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161308

From: Joshua Watt <JPEWhacker@gmail.com>

The code in question is licensed under the BSD-3-Clause license, so
including the generic "BSD" license is unnecessary.

(From OE-Core rev: c39fc075ce3fd5b53c2a2fccb43500ee0a12f39d)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index e9eb249afe..43d14d7f12 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "The Time Zone Database contains code and data that represent \
 the history of local time for many representative locations around the globe."
 HOMEPAGE = "http://www.iana.org/time-zones"
 SECTION = "base"
-LICENSE = "PD & BSD & BSD-3-Clause"
+LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 PV = "2021e"
-- 
2.25.1


