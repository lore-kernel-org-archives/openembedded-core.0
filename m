Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.10929.1625238834925284057
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 08:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=adi5ufL3;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id q101so541824qvq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 08:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jNjJ8BuoUmf6yajsIE/72c6nFDD/5CSyT+HYzrCpc6A=;
        b=adi5ufL3L0+sXfIthpeznow+ePUbVZv84Hp+33BoZwLkBmmkyrCNuykSgePDWXrWwI
         wa2WbBD5LRA4XsyG3KymswF/He3MaUzHBeyvDZL1r4+SAdeYEP2aIS/+RGyIJtJqAw/i
         KqIlJ67LRoADXkzMmkSZ6wMeWhD9bfLP6+SBUbrzApgxviM0xW697zEvo9d6XdMzVKG6
         3mqB83MopOZdtN8zbdLDZT2R7WGDxr5w/LNhVDzFrjmTgkOjLcB/md1WjTBYQZyNqSOs
         RgkemjpRkKmre+zdKv08Dm7NG6ycKB4TbsyWxMHnC6D+XYRGmfeKucxIzyubx8IjCj+p
         jmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jNjJ8BuoUmf6yajsIE/72c6nFDD/5CSyT+HYzrCpc6A=;
        b=mJjAuCYpITfLQ61BmbmZQJEVREQsxWJ4YL361RhN99moaKAtqixcVzVn/LlUmaiBrc
         Ps2aTwcq/QNFSgxxmUo4NMdjwAO1RCx9Tpts7GieFQIX5stM3TwSOATbmIlhVlXyk+uS
         OeNuL2QGRLj3KUlD8SfUBGjlXK6UZEXgw+yYXkW4sU1y1b8xwQdMqI0oX6ixSPtJTHxo
         lrgxnYm/mQUn4vWqScKFO+UXMV6KJmlBsPqHB9crdqpnB/Ko04uBvjHYXnELlkzl6Wpt
         A85mBC9SxpaP9P4/bR9ATCUHqYkTAllXU7/dmHQW/i7iv5TMXxR4Y5wcCg9PScyRqEnm
         E3Aw==
X-Gm-Message-State: AOAM530Q0loslaChlSVrvR/JaiB78JpvpCcJS0R6XHcWsWMzr4mZZGHl
	tCoONl0YjP+i+DLxwUGGNdk=
X-Google-Smtp-Source: ABdhPJxpCAsStEcTCwc5SIgVw8/Fv+P750aTwvahow8cZk1bE75FJPYqusKH29AGGzSJP9EtiNZGyg==
X-Received: by 2002:a05:6214:e6e:: with SMTP id jz14mr4262100qvb.55.1625238834140;
        Fri, 02 Jul 2021 08:13:54 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id o200sm1466800qke.105.2021.07.02.08.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 08:13:53 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/5.10: scsi-debug needs scsi-disk
Date: Fri,  2 Jul 2021 11:13:43 -0400
Message-Id: <c05f1b7df50e9c784b0cf64385af253d5c2de6c8.1625238537.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1625238537.git.bruce.ashfield@gmail.com>
References: <cover.1625238537.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

It was pointed out that the default scsi-debug feature didn't behave
the same as other distros, since it doesn't have disk supporrt enabled.
We already have a disk.cfg for scsi so we include it into the debug
fragment to get the support we want.

Integrating the following commit(s) to linux-yocto/.:

    66a4b5fc619 scsi: debug needs disk support

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 1c5bb9753c..e0d8280128 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "42032770803ba26765376967cef09945f48abe04"
-SRCREV_meta ?= "c96c799ca3e63c0ca17e05843d3f8e7e0d6dfb31"
+SRCREV_meta ?= "82899c6a7119b9668be9ae508159f5ac96554cc2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index bdc49fb9e2..6b71573a39 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "eaad1adbc817d996edf44fdd520da4810e57e66d"
 SRCREV_machine ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
-SRCREV_meta ?= "c96c799ca3e63c0ca17e05843d3f8e7e0d6dfb31"
+SRCREV_meta ?= "82899c6a7119b9668be9ae508159f5ac96554cc2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index abe837c2f4..0315808989 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
 SRCREV_machine_qemux86-64 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
 SRCREV_machine_qemumips64 ?= "1112c8f8594df02dd6f2bd1cf13848536ca3f536"
 SRCREV_machine ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
-SRCREV_meta ?= "c96c799ca3e63c0ca17e05843d3f8e7e0d6dfb31"
+SRCREV_meta ?= "82899c6a7119b9668be9ae508159f5ac96554cc2"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

