Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A798C52D70
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 18:56:03 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.15069.1722970560784439545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 11:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aMtKCYuI;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a1e1f6a924so56109685a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 11:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722970560; x=1723575360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXwJQbTThLVyhgGQqThQ99RHs8y7Z8CFrLGhaJZKYIk=;
        b=aMtKCYuIVvUw+ghuyPRn2SVFeyjY1QdmPkVMadF89ajVcuy+qrog9Php7xe1PpJxu8
         zYDpx+4lX2t08uAD9C5Wc4dpSjQOLP55zotWthg6CBohTzQi83xqxrBQyp/qN9/Ozl7l
         ygQi6SEURoaEvidKY5ifT+Lh8lFhbS6Bep+NlXvJnh/Rz47lIOzwCis+dxwZN2tN9CM6
         rJ3ozwInqpNp2IIbxAkeSKAwdXi6hr9VMFzzwhqv0rqWwZYohFqs0YObqNif7vp2v5Nw
         2pOJd6ZSSDAnJqhzOK6m2mwAYjKUSzGl34MHt1YC1V2CHaLal2ZmVwIq11Z0SEkX6jfx
         +29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722970560; x=1723575360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXwJQbTThLVyhgGQqThQ99RHs8y7Z8CFrLGhaJZKYIk=;
        b=bfZAOBHCr/+yqYscZ3CkIuJNs4KG38duxQzeACw8B9f6mxg3mEAv3u9z1OIKbxnvHg
         tByqFQtLqPJvQB32kgez4Oh/EtSEAgO0YL99tSl8b5PUwo4z8dnMNUQom/W2lnlAC3Ku
         kMUObZi9SD3FJoj4T13fm2DWNnZypNELt5KSTGa3nOtn2KW1uG1JYC5/neMj73rNIf3O
         eZAHRSyPFnH8/X42qCOBKFtzZIuUmO8Jf9EXnQOKybrZfKDxPBCU1yQdEcBrFA6G5MyE
         9n4sK4RDfbzmxkY0oVh5R7/Bhni3vGosRNtBC/cTrmO0CRhtc8O+0AOU6OhgrRM/T33a
         7esw==
X-Gm-Message-State: AOJu0YyG1aUfVjlTVkOqlArXSVyxfEsMzR8u/vhWGzM4+ZEOO9RyQ07t
	YBK1UmFZhrsXhcHdXA+ey1XUPFzbo5mxFtgXMXJC4/zxwCMHWoBy9yqP5LkV
X-Google-Smtp-Source: AGHT+IEhK+cRenketIKVaHZZp3i72YZvo1Q5iWRtHyzEz9T80LgoYJc9SYYRC+0XqS4NvziO/U0o8Q==
X-Received: by 2002:a05:620a:24c1:b0:7a1:e0ed:cade with SMTP id af79cd13be357-7a34efeb459mr2078973885a.61.1722970559654;
        Tue, 06 Aug 2024 11:55:59 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f6ebcd3sm481988185a.42.2024.08.06.11.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 11:55:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto/6.10: update to v6.10
Date: Tue,  6 Aug 2024 14:55:48 -0400
Message-Id: <4642a61a2a0131db168e8786ab1ab8ad9bce1ede.1722970092.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1722970092.git.bruce.ashfield@gmail.com>
References: <cover.1722970092.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 18:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203040

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
index 2bd31a7608..afaf94c16e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86.104 ?= "v6.10/standard/base"
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


