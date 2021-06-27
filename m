Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.411.1624812646088603766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 09:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QB8TTqJf;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id v10so1092713qto.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wWbYayBmGYm+hKZ+hSozJHt/UgsaK5VIW341OeG6krU=;
        b=QB8TTqJfri6F9xhm1TiN92wwcb4GpVXw907yUZ9349651TXsNqeio0P4oBE9fr3Njg
         mrwiLKHWg+5n0MzELkI6QbYoHO8LAG81uFL1SPgCblDZEIC7psfP8vfk9Djwh98vGoVl
         ji1DmT6hYCQ3ZE0ttHgThCt1jO+g5jZgsbumYaBdXIvOgNi7r13ACi33UkvTM/n9JM7I
         PlEPx8mO7WJ7jje0UCu5NTzWCOwms1tl6tNvASo4/sY0sz2NSA0TXQQoPI8b5bxydRti
         8rj08SV0hOd3WD7EWjVMpT3C0NADAwolrBNAd8EnMJe4siDKgYIGMz151jzbKzhwJHmc
         0bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wWbYayBmGYm+hKZ+hSozJHt/UgsaK5VIW341OeG6krU=;
        b=AJGoTk7V5ik/UOLW7WYO7mSiy1QDaBHfC7sW/KD7a08iQ5VVLIQ0ZtJ71TZAWJ7V3U
         huOh++L/TqznG8RnubqeJ8isMxKKPTNDuBL4vGA2NrF5SWV43hJsYqEUksy0KQnnWYs2
         QKzSQdLICVcdsYbs0z5KketNWmYAAoNfjyyQUVfN6o6URQMjt6kgMer9qFV89qHDoJNH
         A928XrDG4uJ9KlY2ov4cNDJb1ION23+RpEemZ+7keelpNuqwyGlr3BgvfQAQ6Hv7I4Ho
         vYhvelhgeklHYPUXq3fcVCVdS7rbVfP05qZEp5SJlYxr011jlgO4dK4vC5eG5onnbuNB
         DnCQ==
X-Gm-Message-State: AOAM5320MRh2uoKXvahJtHZ8BUisVkKGlQu2VgN/l9ccZi7qogCAPIlr
	79yHOQehAeZKzxXTHZFTKfc=
X-Google-Smtp-Source: ABdhPJwcpB7uOu1v0X56YjXxKJsa6JPjStJNCEzHNPv40sbGSgEtUX/ZvY/+uAdmNZFIAirrYumvLw==
X-Received: by 2002:a05:622a:64b:: with SMTP id a11mr18323185qtb.364.1624812645241;
        Sun, 27 Jun 2021 09:50:45 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id b8sm7150439qtr.77.2021.06.27.09.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 09:50:44 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/5.10: features/nft_tables: refresh config options
Date: Sun, 27 Jun 2021 12:50:39 -0400
Message-Id: <674e740354fdeb2f8719a068d37a9c3e74c6bc8d.1624811389.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1624811389.git.bruce.ashfield@gmail.com>
References: <cover.1624811389.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The nft tables feature had become out of sync with current config
options. Refreshing the support with the following commits:

Integrating the following commit(s) to linux-yocto/.:

    da478fab290 nft: add CONFIG_NFT_SOCKET
    54e2d36b291 nft: add CONFIG_NFT_TUNNEL
    6fefc38049a nft: add CONFIG_NFT_CONNLIMIT
    cb0b5fc7ed5 nft: enable NF_TABLES_NETDEV
    d36b304d614 nft: drop rbtree
    0a70fa87ee0 nft: merge chain nat types
    c226e82038a nft: merge route type to core
    79968ab78bb nft: masq options merged
    8a0bff8cc5f nft: _set is now built-ins
    5952a26c4f7 nft: consolidate _set options
    0941f794363 nf: META is now builtin
    2fcc2c1b552 nf: EXTHDR is part of core, drop config
    e909f08155d nf: ARP is bool, set to y
    3bc18ee0615 nf: make nf_tables =y
    b90241a5403 nf: set CONFIG_NF_TABLES_IPV6, since dependencies are =y
    32ae602ab4d nf: set CONFIG_NF_TABLES_IPV4, since dependencies are =y
    2a9be72daea nf: make inet_tables =y

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 30dbb5d832..ea2c854649 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "74f60bcd7323d243e0f3d3db34021ae624afb61a"
-SRCREV_meta ?= "4a59bc57b2be77da9394b10eb37067da7d63b7a4"
+SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 33339f5ca1..d73b1d0305 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "20eb193a68fbdaa56ed9a49b97aef6a0eb9fbdea"
 SRCREV_machine ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_meta ?= "2c3ec293dba693dc7a344d4e42cb7fa733ef4f2d"
+SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 9d7690dcd1..c3342da193 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
 SRCREV_machine_qemux86-64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
 SRCREV_machine_qemumips64 ?= "7bc9a08bf3b92db4fdb0225fdd23836c8f5c037f"
 SRCREV_machine ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
-SRCREV_meta ?= "2c3ec293dba693dc7a344d4e42cb7fa733ef4f2d"
+SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

