Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.151.1616438683453583084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 11:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FgxtTnfP;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id i9so11652969qka.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+KMjfXRP0DysBp1FvOExjWlDdesZFbhprt5unSFAHUQ=;
        b=FgxtTnfPDRHV8dZamuD/S4+IzVXVUqd/3EobzWVrniw0t8IwKTIc15lfwVrfuftt/r
         6ldSw6dZWm2kTwv+2UYtrHTINVtrwZOb0xXg07XgFhultZftdsh59yXbJoinbsgEU2CG
         3QD1IBNN45wQ85yOOmMk446vB4b1JnhsQogrk/EQhppJUwvQwBp+IyLW9Uh4A4tMeT7A
         i+KIIFoRMDPwJTw/0Q8BklrKd85CILmp/MjU8BT0OYajpZGMhLaOzzU/YGkDo7ZEvpGf
         I+yl9YpJaSbUyPafAcrSu0b2Ell8SkbTqTNv56EqB2IGstU66fNgVJO3e3EeusThVsqi
         +RqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+KMjfXRP0DysBp1FvOExjWlDdesZFbhprt5unSFAHUQ=;
        b=kMbOGQIOo+S3+Mgat1eLF1YXZffisdyozSUaRIHJP/Z0Yj77n9EL8/wp285GdAXZSy
         UARKsVcEbjD0PZQvuIJlthooNicte0mvjGyUj4o3xCgpZCOGX09w3t5pWb3pEuCcqhkZ
         g4JAbkOcyG+OhpgMErxUH/GeRLxekj9ZhQ/UfZXcQ4MSjbmNp9DoBWKtZovboZowq9bV
         60s35VNonkfVWLFIJSUlZ87i7lEi8Oi10wLV2WZ2s/2b+HVXPyNs73RJ7LZrhjKSXWC9
         ehgps/uvZR7SIvEmsWF4tJNUG5lrRiH3jfP/ASbD2P4RajljdUlAAB4C001eswnbjp/9
         83tg==
X-Gm-Message-State: AOAM5332RKJ0waM5hWsyMpI6Kr3tEPfsL9jkR+84pgWoZOySHQwby6ic
	dxVY2Gt+poYUP6jNozSTbf4=
X-Google-Smtp-Source: ABdhPJwhxF/rYIe5ldhYnDwaopivMpXtHH9lTd8cmp5RApruTRWQu5rGoHsY/Jp59582h2AlIOjhMQ==
X-Received: by 2002:a05:620a:102c:: with SMTP id a12mr1462665qkk.450.1616438682482;
        Mon, 22 Mar 2021 11:44:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id g21sm11584823qkk.72.2021.03.22.11.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 11:44:42 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-dev: bump to v5.12-rc
Date: Mon, 22 Mar 2021 14:44:40 -0400
Message-Id: <20210322184440.35534-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The -dev kernel has moved to v5.12, as it will be the latest avialable
in the upcoming release. core-image-kernel-dev sanity has passed for
the supported arches.

So we bump the version to match the active branches.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 2ccc0ee875..8725473d1c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.11+"
+LINUX_VERSION ?= "5.12+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1

