Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C839DEE8007
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:47:27 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.39147.1694180846125108406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 06:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EFa+v4VF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68e3083aa1dso1961849b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694180845; x=1694785645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/N/udGn6sNecScK3cObMOu0ZKZhmOhVngaykRJTIcY=;
        b=EFa+v4VFNtGljLflwbJ+0tTsj39hQoQUB4HgOtUullXjF+FAJgapZObQbGFVZ84r90
         IL0LHDNrOkbc0eH1wQcz1L93Ah3jMEjZIeiVWW6jXgJvVwBr/INqgZtZtOL2gwFUi+ro
         bQDXu2YDUDYRyLtAGTcwHnOuHg669lYomfO2VjMycwNhF37UQiQu0QiJQZ+hUnqjZojZ
         +1LMLosu6GnZ5ycvEIsOA9ntqkxtk4tfuEr9e0gl+OIq2zbIJwnmcfHPt9zThZQtqN6b
         2r6YJoEDfSvfhjkHsVOpAvwY4ySLkeRI8QLzcehi2ti3cDrjfbnoTDEF4bVdZD09djqe
         LSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694180845; x=1694785645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/N/udGn6sNecScK3cObMOu0ZKZhmOhVngaykRJTIcY=;
        b=BS00oSXlz7jV5K/Xr35DdmafX/8PIA+8kkUvO1o7JYWHrmnK7HoMAojqYfyUKvLSz1
         Z4QDyQ1u/lfffhM5maWUHwUH8XMTHR6v440snBtFOSmYgfE027Eyo3LaTDz6O4W1qe7Q
         Lx2SinlTH6Fg0MHfECiczrQbUrqGWsaQF7Ov40FU9h2/VaNZMbv+Ghnoma0wf1kXQ/Bu
         NP/3GxPA+xF8i+W6FQEcCzwn6JDjxuwPCDTHo37NzdHyKqA3SlmIH36XdtDK5qtUoWzv
         WOWzah34NYHCCxvmyPX82Y3KTkJ4tHjkYTiheCDBzR4wx0mEpDPUE3fxAGraCIN5+xwu
         D9Ow==
X-Gm-Message-State: AOJu0YywoDlAHpl7sF2p/lRkER/BKlpTnf2lGZDHm3vEkieTCW/msL35
	BHTbO8xzB9fwLUqJsz4WLdkP8p0P/xH4MvL/d28=
X-Google-Smtp-Source: AGHT+IFobXSNLuZL16W0XGrrLnZPf+BdG698fHSSlBFI0NBIBQqGAsyfmohCLtd5VBGsuCgJwf76Gg==
X-Received: by 2002:a05:6a00:15c9:b0:68e:3eab:9e17 with SMTP id o9-20020a056a0015c900b0068e3eab9e17mr2558025pfu.34.1694180845185;
        Fri, 08 Sep 2023 06:47:25 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id x18-20020a056a00271200b00653fe2d527esm1344828pfv.32.2023.09.08.06.47.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 06:47:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 9/9] yocto-uninative: Update to 4.3
Date: Fri,  8 Sep 2023 03:47:00 -1000
Message-Id: <055b7acd73a591cb529629a780558cc0f5b19456.1694179812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694179812.git.steve@sakoman.com>
References: <cover.1694179812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 13:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187431

From: Michael Halstead <mhalstead@linuxfoundation.org>

Add in stable updates to glibc 2.38 to fix malloc bugs

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 39f987fcb20ad7c0e45425b9f508d463c50ce0c1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 6596c0f4a2..eaa3e9b31c 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.38"
-UNINATIVE_VERSION = "4.2"
+UNINATIVE_VERSION = "4.3"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "cff40e7bdde50aeda06707af8c001796a71b4cf33c5ae1616e5c47943ff6b94e"
-UNINATIVE_CHECKSUM[i686] ?= "a70516447e9a9f1465ffaf1c7f89e79d1692d2356d86fd2a5a63acd908db1ff2"
-UNINATIVE_CHECKSUM[x86_64] ?= "6a86d71eeafba4fefec600c9bf8cf4a01324d1eb52788b6e398d3f23c10d19fb"
+UNINATIVE_CHECKSUM[aarch64] ?= "8df05f4a41455018b4303b2e0ea4eac5c960b5a13713f6dbb33dfdb3e32753ec"
+UNINATIVE_CHECKSUM[i686] ?= "bea76b4a97c9ba0077c0dd1295f519cd599dbf71f0ca1c964471c4cdb043addd"
+UNINATIVE_CHECKSUM[x86_64] ?= "1c35f09a75c4096749bbe1e009df4e3968cde151424062cf4aa3ed89db22b030"
-- 
2.34.1


