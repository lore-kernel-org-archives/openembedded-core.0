Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA768C636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 21:54:44 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.3692.1675806882912667640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 13:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I0GVeC7H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id j25so11431093wrc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 13:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yDMt56XEqggz2P6BsN828/kDBbyNKa2tGOESqUymp8w=;
        b=I0GVeC7HoVoRrprj6dgf1v8eNppW3pEmjdC1nsOSR7FqfMZZ5+G2VmUS31LLY+hLRV
         qXJfLQEh7flA2K7qsbskV9A0CoFCVtGdi/vucWiYzJoFwoWtJ0H85NEVYTULPY4Viyyf
         SAIqh9njpt6OIJBO9NBJ44aE83cCCVu6qboWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDMt56XEqggz2P6BsN828/kDBbyNKa2tGOESqUymp8w=;
        b=nfAAcEkSiaui561qZp8uIW4HE5yKBsERQWV4YBbxIaCM47vJHIjBwdzr5NcwX4QDVw
         0/2+clfa+j/xh8nSpWByabtwMEWQUf4a922K6/F//TlxuO9DSD9uMAaUSGSG3A1FukNE
         TRa9jkbvBM4Ow/Vj+1bzU8LPi96MOwAuI2BvjZhfGeyqW1C0xu/NmiMrEyS3RbzLBI+x
         eCN1FnaOceVp3ClESxuREmGtHaPTshjAZECBXHbukTGA28QGsl0U88EBjz0m4h1UHWBk
         n2C0NrEASD09H9/Yd2+qhs3MsxD6L03sUMEuCN8vcNvyfcP8oGh9ZleaIffwOt+UcA+B
         5svg==
X-Gm-Message-State: AO0yUKV+b8b7KlJHiB58WJwPOFrAtErC/PeL50xx4V0duybYeDlkK3/o
	lefkOcEPbDOmOJNRYHf3jqRDE5zCdrh5tcNr
X-Google-Smtp-Source: AK7set9A8+Td3BOTHzeJ79A7rLnelyZUn7mi+D7HDtccrOZelOanbSWQtoC28Csu7SnScsqeyCqg1g==
X-Received: by 2002:adf:fd0f:0:b0:2c3:d808:e82f with SMTP id e15-20020adffd0f000000b002c3d808e82fmr5546680wrr.17.1675806880849;
        Tue, 07 Feb 2023 13:54:40 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:feff:276a:2891:6b6b])
        by smtp.gmail.com with ESMTPSA id b2-20020a5d4d82000000b002c3ef7e74bdsm4315681wru.73.2023.02.07.13.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 13:54:40 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] uninative: Upgrade to 3.9 to include glibc 2.37
Date: Tue,  7 Feb 2023 21:54:39 +0000
Message-Id: <20230207215439.1391583-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 21:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176832

From: Michael Halstead <mhalstead@linuxfoundation.org>

Update uninative to work with the new glibc 2.37.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 51c0cdee438..8a5cab5360d 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.36"
-UNINATIVE_VERSION = "3.8.1"
+UNINATIVE_MAXGLIBCVERSION = "2.37"
+UNINATIVE_VERSION = "3.9"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "3f15d420049b21854bd7a8843da0f42f17064559492c8b752d7a6f998ff5ea65"
-UNINATIVE_CHECKSUM[i686] ?= "a6dcf316d738ade2e5e463bd3b33a270b4bfc25bba41770ad5cbdc3b0e24044c"
-UNINATIVE_CHECKSUM[x86_64] ?= "5fab9a5c97fc73a21134e5a81f74498cbaecda75d56aab971c934e0b803bcc00"
+UNINATIVE_CHECKSUM[aarch64] ?= "de35708c95c34573af140da910132c3291ba4fd26ebf7b74b755ada432cdf07b"
+UNINATIVE_CHECKSUM[i686] ?= "adac07b08adb88eb26fc7fd87fee0cec9d5be167bf7c5ffd3a549a2a6699c29c"
+UNINATIVE_CHECKSUM[x86_64] ?= "3dd82c3fbdb59e87bf091c3eef555a05fae528eeda3083828f76cd4deaceca8b"
-- 
2.37.2


