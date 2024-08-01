Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37D2C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:08:57 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.70691.1722524936046752479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 08:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XnXJosBp;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a20c529c77so138200385a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722524935; x=1723129735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpVDAqljuk/1Nc5+TKTIT12919SFd/Q/kC0w6jN6ggA=;
        b=XnXJosBpm7Ln9K+ZDJ3ul0YDcXWTCzYz1MB6qA1B2YlnkxSYQLrW6Nk54NBWRZSkKD
         rYb9P4MPIAbpKkrk3xYUfpfoMwuesPP5r+LccwnmruXJ3OP7lrX6MqtMm4CePgzY4onv
         9OAw2lI33rShGz93wmJgg+l2aLPj05l2oMkosqEL5Jzx0vA3VJmSzaSOruoTdVcL0hcy
         9EG+NNAOSHeE25p+ct4FcSGMEv4+JtU636A0MuQ3QbpFZ0Fhi5HRyhw1ycDOEpbpFT3/
         N0TSq6MORmKsqIefOsAoK1Sq1pOtiBsO4jTDW4VWcEp2L8TR0K3bEwb0lDdUW2zLn7Dp
         DiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722524935; x=1723129735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpVDAqljuk/1Nc5+TKTIT12919SFd/Q/kC0w6jN6ggA=;
        b=USi9jtHxVo2f6S6KXr+O5YYAC2UotxZ2/DSNPIeiTFc1fOqC5ecMz6aLzYeGBtq+Ao
         VojADKL1EgWVbdWbFeDrGnDGvH2zJauMsjXIoQM9K7yQ5eiBdxBElQk9qnVi3RVACrb0
         R1H4D6nP6Z6aamzfIL8VyURNhBjQXzSDb5JBUbpHfC3OZaM+CrFGfR4ncYmIqldKtR0F
         gUK8h8wqqcAhqLHN2g6AWIr6KX3umFkMWfHh3mKVvEyNYbiu6YlM7EJHkU6KJX0NhbcW
         eWiHB7LM9LkzePx6RTUc00trSxN3MzJHuIntR8OAqcgM31GUWdM/a36WWaPhEycTNz6/
         qRqw==
X-Gm-Message-State: AOJu0Yw7SspCkf1etRbqG73sj8faP3YgiK1SHLeeM8r3S6QBlgSf6l61
	Snfy6xH973N4TtuAK0j05ESd353hhg5SKVRbnLNI2VQc9uCjiLNv9Wmfl3jN
X-Google-Smtp-Source: AGHT+IHbgQ55FrvtXNxPGy2MTUU8NPn39nrIqz0+MwcdRCRAIbX1eezVE3a3d336hgFub93vTMnmaA==
X-Received: by 2002:a05:620a:4614:b0:79f:178f:99f1 with SMTP id af79cd13be357-7a34eed11b6mr35276185a.11.1722524934863;
        Thu, 01 Aug 2024 08:08:54 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73b5003sm859343985a.43.2024.08.01.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:08:53 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] linux-yocto/6.10: update to v6.10
Date: Thu,  1 Aug 2024 11:08:40 -0400
Message-Id: <96aab5cc7d89a9362ee19c62f0fd7ef80b464fdf.1722524523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1722524523.git.bruce.ashfield@gmail.com>
References: <cover.1722524523.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 15:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202748

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.10 to the latest korg -stable release that comprises
the following commits:

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.10.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index 725d9c936e..18d94236d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "aeaffbcd6ee7f15e32f70f792bc0174ffc0cea5b"
-SRCREV_meta ?= "077bff9eca6a824ca5c8d17a20013b03cda39c31"
+SRCREV_machine ?= "db6fc5b1c6a520a67c58d41cb5cc59e6cd288338"
+SRCREV_meta ?= "2aff1cc94d38776619582816b0bee7d1e6dbf0ab"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index 7c69b722ac..8e75c4ae93 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "915a386c7cffd746e2edfee03cfe8402571dd8fa"
-SRCREV_meta ?= "077bff9eca6a824ca5c8d17a20013b03cda39c31"
+SRCREV_machine ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
+SRCREV_meta ?= "2aff1cc94d38776619582816b0bee7d1e6dbf0ab"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index cd491cdac0..30f8766993 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -21,18 +21,18 @@ KBRANCH:qemux86.104 ?= "v6.10/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.10/standard/base"
 KBRANCH:qemumips64 ?= "v6.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "afec7a55b83d65ccabc38ce1105a29be2f8fe52f"
-SRCREV_machine:qemuarm64 ?= "915a386c7cffd746e2edfee03cfe8402571dd8fa"
-SRCREV_machine:qemuloongarch64 ?= "915a386c7cffd746e2edfee03cfe8402571dd8fa"
-SRCREV_machine:qemumips ?= "0bd7d4b7d9e0e027425fd68bd0d36151091b5a77"
-SRCREV_machine:qemuppc ?= "915a386c7cffd746e2edfee03cfe8402571dd8fa"
-SRCREV_machine:qemuriscv64 ?= "915a386c7cffd746e2edfee03cfe8402571dd8fa"
-SRCREV_machine:qemuriscv32 ?= "915a386c7cffd746e2edfee03cfe8402571dd8fa"
-SRCREV_machine:qemux86 ?= "915a386c7cffd746e2edfee03cfe8402571dd8fa"
-SRCREV_machine:qemux86-64 ?= "915a386c7cffd746e2edfee03cfe8402571dd8fa"
-SRCREV_machine:qemumips64 ?= "3350b87ceb51087570d4f20f903d3a88f8c0f337"
-SRCREV_machine ?= "915a386c7cffd746e2edfee03cfe8402571dd8fa"
-SRCREV_meta ?= "077bff9eca6a824ca5c8d17a20013b03cda39c31"
+SRCREV_machine:qemuarm ?= "0086d23d727698bb22186f2553daa54883534eab"
+SRCREV_machine:qemuarm64 ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
+SRCREV_machine:qemuloongarch64 ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
+SRCREV_machine:qemumips ?= "8b680076e2cbc0b93ee1f55c64e3d6be267b1e8b"
+SRCREV_machine:qemuppc ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
+SRCREV_machine:qemuriscv64 ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
+SRCREV_machine:qemuriscv32 ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
+SRCREV_machine:qemux86 ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
+SRCREV_machine:qemux86-64 ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
+SRCREV_machine:qemumips64 ?= "ebdf992764fc37d6c905dc5f8f0e927f06e95168"
+SRCREV_machine ?= "c4386c5293aa875217e4b735b1804ad7b60c5685"
+SRCREV_meta ?= "2aff1cc94d38776619582816b0bee7d1e6dbf0ab"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


