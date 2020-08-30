Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.25159.1598756049574405987
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 19:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VyqyIhW3;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id t20so2498069qtr.8
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 19:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bLwc4ymxCLj7qtAL5i8DtAaMfctVSPMzlZq8tGyZtOs=;
        b=VyqyIhW3xoQSJQWejJzS1i/7FnW3jar83xKnqXvV6jExzJG2RXVFR8vXl1eD4EgPlr
         NKdEXc3WwBuXwsizJNMaRHLg8eICFOzfX8do3OYk4KnewmU76CGniaUjXttYXBDi/HJ+
         feWDGmpAkfn6vayQ83A0HUVERmtpOxtyi0FpPMA1Jcs34gEB5ijf5JwWIfp89rAMAQwJ
         SjrBxUTHpaQHTAJ3adtp2gz+Xrzmwo7yKgST2fTCvXJRGkY9nkDyTZC7qEXmz1Qzkscs
         rph4vsOM9BbqdTSI3FEnrfgtdQbN5gJRXZeXRjrfdo+NRznckH1vm0WzX+H/n1RDMm6R
         HmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bLwc4ymxCLj7qtAL5i8DtAaMfctVSPMzlZq8tGyZtOs=;
        b=cKeGswB4SwM6JlJyXjct0S9njZ07/fD16C48FFI4l2oSSgmOsqmjq5BPhC9KSfP4tO
         yiiZNAFGnVvOWlQuchzGN85ByJdtXl9UACKDNPO6G6e2hEX8FAgwFf7S23mroJPd6XhT
         BtjOqmJiBc2A8JecY2bvloxuxyaWRmUfMtfj5gd9JFau40TjO42bqtpv6BE2BXd3uZaJ
         owts6Nb/jBvS4XqqKSnwBDu8lnjjzdga8Gwruz3EDusCXfZFTXjJ0bAIUOIlpO4lft4q
         k0+bujVUVMGov0ooT8L3maD958g8EbcViGlKEYjUeC6oZitxZOi3Ac6vv8vqiVtDbM92
         329g==
X-Gm-Message-State: AOAM530cf1ynzfyJkgJcUebWi82By9T2gGJWXkN9Fve+ZOXzazw7yYaH
	MXRtVziVCJeHS2WqtkVjDbA=
X-Google-Smtp-Source: ABdhPJzC2FtpufaMgbSyHPDLjwQVr03X5HYlePEw7IZZ5r+UqepH3PwMgw/Q4fvVNwvVuzLpZviQLA==
X-Received: by 2002:ac8:7051:: with SMTP id y17mr7962429qtm.22.1598756048715;
        Sat, 29 Aug 2020 19:54:08 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 184sm549210qkl.104.2020.08.29.19.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2020 19:54:08 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-dev: bump to v5.9+
Date: Sat, 29 Aug 2020 22:54:06 -0400
Message-Id: <20200830025406.50386-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The dev branches have moved ahead, bump the version number to
match.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 175836ef94..c937173d0f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.8-rc+"
+LINUX_VERSION ?= "5.9-rc+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1

