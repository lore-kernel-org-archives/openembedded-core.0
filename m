Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E24AD3A685
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.1946.1730228419483634192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vQaqz7SU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e5130832aso4137689b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228419; x=1730833219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2GTGmLsA/0rW30b51PRHUnB8EejP5A4sVq75A5yGtI=;
        b=vQaqz7SUjCsAUSABBSlouZMJ7Seifn3tz2RNg3KuKdVM5uZwDwQn8EadhOQr8t6ul6
         ToMEGDT01CSm+v/L4iPB2hiFj585AZCNG9IFiEJTzWFx4HPVTOfJsAJm6JgwKAwGtp9O
         G2zwtvNhSa8rnl69hAQ7VrF/gWiwC13qDqQg04KlmxT8mV9CvzL+gY5N6JQcV+Zxd+Pc
         +iQkpeJROOgJ/ALrBv3Vd868/inGsbXcIMWIpAPgba0olWbKtW9fKXWcloNJlm1Vr7lx
         HyHgLSeSg/xhLtXfKEI4RCpQCb+5/Vl3bt4izwgQp58zpuzQZcmHrYtdgxi0psiWntNk
         lg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228419; x=1730833219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2GTGmLsA/0rW30b51PRHUnB8EejP5A4sVq75A5yGtI=;
        b=ejN6NTgk0ozKTtjhIbp85RAIDEzKrwXOC3oXpqBfyQBZtlM1tbb5rYy/uG0inL+ej5
         RcjDmlwqdfu+AzL1dGHcezdJnUgb/DcZey/hVntLlVkm0WMzFw8uQfH8P9sdZXdLK7QP
         M8QsxU1aYAHflXN12+P9ah9973UOw925XUmhehgdnsGB6EmBLqfPEG/GAOzPIo2Ijrep
         XOHJk0wWcIxDRFv77JFbSvdVaolV0bW671imfUelxwYDhok1zbHZjrZTNdkXvS9FUL60
         P5lA38HfyPQb4B75ReajkuTRgu1t3fwzImW6UxXBttb8Dsn2xpfb7mVzY097q/rMb2tb
         7uQw==
X-Gm-Message-State: AOJu0YwBsApMZV1kqRS1nQcMzXLLXfat10dJbvLR4sHM10qNidJETqDJ
	3oSvj8VW31qOXzm75PU0rWIpTugONqrZXJhtDrldA/+grTNu4tA0rKyS6FtQeAhZYCNxJ/ahWv5
	s
X-Google-Smtp-Source: AGHT+IE8uGlE9TRf2EhTk4jpUQpeCFEzhAv2FeLUBfAHLqJKSRV/ZzobQ2amUoy0/TjBznJv0/qqug==
X-Received: by 2002:a05:6a21:394b:b0:1d8:abc6:71a4 with SMTP id adf61e73a8af0-1d9a83a65f7mr18400491637.6.1730228418705;
        Tue, 29 Oct 2024 12:00:18 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/19] bmap-tools: update HOMEPAGE and SRC_URI
Date: Tue, 29 Oct 2024 11:59:44 -0700
Message-Id: <7678ae7fc255621d91271599b5f4491520387279.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206521

The bmaptool (previously: bmap-tools, bmap-tool, bmaptool) has been moved
to be under the Yocto Project umbrella and is now hosted at:

	github.com/yoctoproject/bmaptool

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
index 89b7bf2b93..f8b382ca48 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
@@ -4,12 +4,12 @@ bmap. Bmaptool is a generic tool for creating the block map (bmap) for a file, \
 and copying files using the block map. The idea is that large file containing \
 unused blocks, like raw system image files, can be copied or flashed a lot \
 faster with bmaptool than with traditional tools like "dd" or "cp"."
-HOMEPAGE = "https://github.com/01org/bmap-tools"
+HOMEPAGE = "https://github.com/yoctoproject/bmaptool"
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/intel/${BPN};branch=main;protocol=https"
+SRC_URI = "git://github.com/yoctoproject/bmaptool.git;branch=main;protocol=https"
 
 SRCREV = "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
 S = "${WORKDIR}/git"
-- 
2.34.1


