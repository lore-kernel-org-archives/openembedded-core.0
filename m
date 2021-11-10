Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10338C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:52 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.336.1636573190688790166
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VfYowWG5;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id t30so5869155wra.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zrn5OKFue0s96O6YoFkfWE1U4yenxGx5ITwVqgRnStk=;
        b=VfYowWG5wjzay3bnvrhvo89PmarWs9RO1bZgCt2e6HwDmFXrms3B/94mhAAp6PJ25w
         QhKIzg5sFzInJ6pCaAP7V2Zr7YbwvVR6YlOfyTh2HGakkeVS0ieBWGEyL4yQSjh3i2fF
         0GoQAAiPpVLJPwtOjkOxjeV/Eh79UX5DxTpZrRKrTkB376VmY9iSmZ+ldKvdxVRhX5OL
         thhsghhq6mVkPbrbu2KNH2zG0vLZGZGGm1Yxn7Fi0dLf54VbvwqSjE6IWbCISEnd5sRc
         s9d9KmxdVsFoFYxgBG+r0xUcKmYfPnwqp6V//Ns/jMOchRQDQrpQ2lHCwfHEgjmcuPof
         cpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zrn5OKFue0s96O6YoFkfWE1U4yenxGx5ITwVqgRnStk=;
        b=Kd9nmusv5h02Jnvc5qJ8GN0Xfj1s6bq31CQPXuLbpKyJDyQKeH9V4xGDtq1Ib/dsK3
         YSc7HQTUrS5Q7gHnhmrhlShIYSeoI6shnBh8IuWnexUh8iKyxGjU4ZwehRqA59x8YvVP
         mMHG3R13BNDFnnZBluvBgSI7Cd76e0UDHiPc8uIxghDH3uOZ+rhIc/9ibNy//Hf5zv2Z
         ImEugbnFD9k3X3Z04FynT4cjEIifXWYp5a6vu+NFg+LYdmQt3QhSSXMd9T2kLUWgxLWP
         k+ZqkXNpy49insx7doprQotcYwchQUK2C18K4pUAIha/uE2UachITDN6yK+G9L9CqDOq
         yEyw==
X-Gm-Message-State: AOAM531m89JRz2YiTIvqcf4+xx+ZXLmkCmbOMIHs7JvjVZJt7xexgqpW
	Etz3d6BPyV0NjLE3Lz7aJ1aStVG9aBQ=
X-Google-Smtp-Source: 
 ABdhPJzByB1z7p7Fze/8SmSDa0HcpQOVh6yf+r1NjKMom55OmUs3qvhdKr9er8fekD8yx5+5rgjdXw==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr1783435wrr.314.1636573189254;
        Wed, 10 Nov 2021 11:39:49 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/24] python3-numpy: upgrade 1.21.3 -> 1.21.4
Date: Wed, 10 Nov 2021 20:39:24 +0100
Message-Id: <20211110193937.2606747-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158095

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-numpy_1.21.3.bb => python3-numpy_1.21.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.21.3.bb => python3-numpy_1.21.4.bb} (96%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.3.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
similarity index 96%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.21.3.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
index 4a289c2c7b..8988a5bc39 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.3.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "d0bba24083c01ae43457514d875f10d9ce4c1125d55b1e2573277b2410f2d068"
+SRC_URI[sha256sum] = "5d412381aa489b8be82ac5c6a9e99c3eb3f754245ad3f90ab5c339d92f25fb47"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.20.1


