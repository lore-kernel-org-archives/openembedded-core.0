Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.26558.1590715767485447004
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 18:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HEhAGsmM;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id j7so365354qvp.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 18:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NiL3zmDU9BBcnK+5o3RD7RUY7y9rPEwOLry12sUpLp0=;
        b=HEhAGsmMCS0oESTAOW2mUKj0xg6i1nTBKX0Hyh/vcP7cAjC7XtteCJ18Et8L2g6u5o
         u7hel631iW7l49hP1c+YVG6W0pCkZdeseNDJmQhODvQEgZuucp4bK6frqfO33cm/47c1
         HXJO1ITaGWUwkHM1mAAEO1c+nz8rKX+1oV2sHUCefOW+gY7HTYAbvwASxNfaNPWen5/B
         vTpegkGZnhU3c7s83Y57eeanz1Gfr/ecEjRfrva4ouwDYtR+6q4CeGgOxS2u87K2DH7p
         nN40MGAEAFEbJJthcsQJtPWWE4vpEBv/K5uGKQn/56zgbPm/3AxU697oQwQufwN0QPRi
         kAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NiL3zmDU9BBcnK+5o3RD7RUY7y9rPEwOLry12sUpLp0=;
        b=YXJayniw+mbLkFodEut4t8TrS9SJBj1QrSTGeTcpG049FNa7BV24qmVZwNUZpV6sq5
         iaF8LzeIvnhS4c665UJRWfz201PScbcMxvjiaEv+rg3oguKkHkoDPuHWViUBJsiqNHVO
         yJ7jqqCZ++q6/Z/kESYaNCV2uiNlBqMgcbkU9LU/aKLHyGsC9MkUN80Fn/YFKSgJ0jUg
         bFWFv36fAKA9EybJL+eW2B+gGloYSsNXwRe31KQOEEM7f96lPaXTfgW29GyHl9qiQPQ2
         GiMJLXmMo0YOrh50N4kWKk+62+lcAcsSYY9ayk7MFHZYRPFk27fRQygJYgZ30YIBjnHp
         7xqA==
X-Gm-Message-State: AOAM532rLwoT/Iof9ZvLHKMylhWz6ihsbl1dB7YmorS0nlzyaR8op34g
	zJ5ZMTNrpMkbeVqzg48kxBs+AXj92q0=
X-Google-Smtp-Source: ABdhPJzJEg3nuY7WOosMi1zyJCo4uw4/7NLvExwEbP4OF8HBoa4VgJMoJGuu/sSKodAOUxtNC0IQjA==
X-Received: by 2002:a0c:8c4a:: with SMTP id o10mr6184812qvb.123.1590715766629;
        Thu, 28 May 2020 18:29:26 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id c16sm4101292qko.100.2020.05.28.18.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 18:29:26 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto: gather reproducibility configs into a fragment
Date: Thu, 28 May 2020 21:29:18 -0400
Message-Id: <f9fa290d7635a24d4ec4c337281936ecadf9f074.1590715483.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1590715483.git.bruce.ashfield@gmail.com>
References: <cover.1590715483.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the meta SRCREV to pickup the following fix:

    commit 9e68afb48b16a447dcd3996ffa350f3e79e44257 (HEAD -> master)
    Author: Bruce Ashfield <bruce.ashfield@gmail.com>
    Date:   Thu May 28 11:22:22 2020 -0400

        features: add reproducibility fragement

        Creating an initial feature fragment that can be included when a
        reproducible kernel build is desired. This is currently only one
        option, but will have more in the future.

        Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index e6366ee36d..a78d333e31 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3d70f110c590b38219843a3a0815a232fd542cec"
-SRCREV_meta ?= "6d128007a79cdbecb66c5d8d186c0bbc41496526"
+SRCREV_meta ?= "d62979d9e2d30640c777438bebb40d98e03c331a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 4a37c758b2..db2e82efe4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "80606f0432a35225e7bff188a890b836018bae61"
 SRCREV_machine ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_meta ?= "6d128007a79cdbecb66c5d8d186c0bbc41496526"
+SRCREV_meta ?= "d62979d9e2d30640c777438bebb40d98e03c331a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 2bba72df77..6c991558ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
 SRCREV_machine_qemux86-64 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
 SRCREV_machine_qemumips64 ?= "2da40cf3f065512eea3729172f8e3f0cf1857160"
 SRCREV_machine ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_meta ?= "6d128007a79cdbecb66c5d8d186c0bbc41496526"
+SRCREV_meta ?= "d62979d9e2d30640c777438bebb40d98e03c331a"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

