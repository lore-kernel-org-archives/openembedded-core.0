Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB00C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:09:07 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.103759.1679670538969013748
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pHhaNgdL;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id t13so1835845qvn.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679670538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8dTvMuA7tZZyYKZxDePRJyw94pgrI3MGhywWNwd2Qo=;
        b=pHhaNgdLw0O54COJTy4wON7GJs4U5fhehLLl9C29fS0hdEo2xNY7hxeIRI7RldHAD/
         hK58/Z08yTjoQ3vkMgKpxyr8pSLagQqFvGzEsgpbJuhavlzO4c8YeT8UPONVcmGwTBAi
         HNecO+8hcpd6tCcwXmgHYlT0m9OAETbmLjsmYFlocPbaOo9RJCAmq9j8L37rGP8oJFqz
         3zfBN6weuHhIN/MAhk3uE17LGzB15fFiLYY0H0Ah32k4yZBez+rl/1GMkrZxXr2c8cBV
         dyjQVqH9GC2fuxccQ1x0fibNXqFV2gnX+WfLA6aDvNi8IVCS5BreAVV/LNTbljDjfhc5
         0S6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8dTvMuA7tZZyYKZxDePRJyw94pgrI3MGhywWNwd2Qo=;
        b=4V+tlLYtQ6b/SFwk3RqSo2+gU3oSPCsjRloCSHHHzJC6btcqYqD3/1kzcE98mMvP/n
         AsSGLuhwIeSuHl/U+tEOw6NnkT800CWIXL6YJFcgmlHGnmXLQYVeYi7hel/Z1PrR996F
         XcK4kuYT3IPKVuMWLrr897a48HF47K1cWcTA6gJT8Q8bOHp/UsgEk0sqCBUDgKRXtHGu
         TZjTVm5kgQjyXs0HCVeW5ZTt5V8Ke7bqncSvAf3ITXAwx5hLKa7YfSAY03UCK6LGSOSp
         6gOloxQMW/O5yvvsMa+3bJZTlE68z94GD6qGwigDlgPNmRvzcvkWN9jbPHdIh+SATTFf
         2bfQ==
X-Gm-Message-State: AAQBX9eshG8QN/Iolb5y6hWOxiSBmesFVUiwCgJT74nmysajDQQlAq7w
	2aYB3eAQ9QviYSQdIXwddnU=
X-Google-Smtp-Source: AKy350Ybr89RaT+zvjjtLMs5CuGcfIVeCC4xUlT6aAnug1hJBfZZTugxB5ExrvUxu0UYBz3zti2hBw==
X-Received: by 2002:a05:6214:27c6:b0:56b:fb18:adcd with SMTP id ge6-20020a05621427c600b0056bfb18adcdmr4811013qvb.8.1679670537911;
        Fri, 24 Mar 2023 08:08:57 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id mf10-20020a0562145d8a00b005dd8b9345e8sm746219qvb.128.2023.03.24.08.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:08:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto-dev: bump to v6.3
Date: Fri, 24 Mar 2023 11:08:47 -0400
Message-Id: <e3239b5bac53c1190debd0e2ae84283ea7672822.1679670268.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679670268.git.bruce.ashfield@gmail.com>
References: <cover.1679670268.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179047

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 8039a52324..4f3d4a5c3c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.2/standard/base"
+KBRANCH = "v6.3/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.2"
+LINUX_VERSION ?= "6.3"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


