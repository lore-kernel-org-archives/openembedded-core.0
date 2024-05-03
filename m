Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72A5C10F16
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 18:14:20 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.436.1714760055026100341
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 11:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PJOlX9i+;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78f03917484so641327485a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 11:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714760054; x=1715364854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ieP4i5dD7yfoJzlz1NMf+2OQWUM/BLfMeYAeg6o9vtw=;
        b=PJOlX9i+rPYHhRKzvlnoaysUfhGcRPdiE4HKLy4t64+xdna6UZ//xLqJiLtklGgmpN
         YOwzZn75n56YcIobWfwoBalA4qIWMf3DtFi1K07Aqi5lP6I98rg8NdP8F1/wVQ+G6BtK
         4QXMTcqT0iVqVuFHW5acjpFTv/xsb3TILtSZa363UhfIsKCxo0BOnuNJuJQ2qHdhwTPe
         5JGCfvhFNIcyKkzVQk99ZZy0nc+DGU0OqGxjX/0QtwxP3HdozBsUGFXNQmrHj+P94BS0
         fOJL7utqYiClMW6t4V2WpYPYCfx3TmJMHKc7eFQTKqhVK1Orz6NCD6QOV7mQWygBQIiY
         mkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760054; x=1715364854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieP4i5dD7yfoJzlz1NMf+2OQWUM/BLfMeYAeg6o9vtw=;
        b=p5Re55QtXM8KGbHTXvPqumRrngWSFzWuOuetuyZ7M+D2iCjaro5ZeO5RC72uplf2Ln
         u3hrTQManUvAANAjiJ3WVbIGJlV87HlPs2dhNCxjGUwdRhW01BlZ94EPpXagK+oa9JbZ
         jF5CtqtuPjMKkU8ewlhtj4tB0grLjv2Cj9rM1qXUEeJUjnwjpPCA9jwzFtmPuHUoaZba
         w8JveHLKf90GRu6c3kiudytSEkSRFcS67MTiriWahBEY6atwBX6b0ITumJfgM89TJwTC
         tpIbOHH6/FbT0KmRZ7jew5ECahwWhp4K7Ts7WmVodFJOTtDGVCaqcTAvVmB/lq2FAtwO
         aq7Q==
X-Gm-Message-State: AOJu0Yys6x1IeaOXsGt2leDnM+eKZMDih1URb6uju7igGEEcqIt81jeo
	fYJaDPprULC0+Ev2bjwSEjxVfLGdK5KnV1U4YufOSmLlgiab6O13dnFfWw==
X-Google-Smtp-Source: AGHT+IGCpiTPZxb9O6n7UZX12oNMNIjQFN6iKlV2zdG+IfvqKkwHHjrry3ou8w3hrgPapEfkK+9JuQ==
X-Received: by 2002:a05:620a:218c:b0:790:a92e:a033 with SMTP id g12-20020a05620a218c00b00790a92ea033mr3485405qka.45.1714760053743;
        Fri, 03 May 2024 11:14:13 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id s4-20020a05620a29c400b0078eebee6a49sm1430722qkp.85.2024.05.03.11.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:14:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/1] linux-yocto/5.15: cfg: remove obselete CONFIG_NFSD_V3 option
Date: Fri,  3 May 2024 14:14:11 -0400
Message-Id: <20240503181411.796100-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 18:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199012

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: nfsd: drop CONFIG_NFSD_V3
    Date: Tue, 2 Aug 2022 10:52:25 -0400

      commit 5f9a62ff7d2808c7b56c0ec90f3b7eae5872afe6
      Author: Chuck Lever <chuck.lever@oracle.com>
      Date:   Sun Feb 6 12:25:47 2022 -0500

        NFSD: Remove CONFIG_NFSD_V3

        Eventually support for NFSv2 in the Linux NFS server is to be
        deprecated and then removed.

        However, NFSv2 is the "always supported" version that is available
        as soon as CONFIG_NFSD is set.  Before NFSv2 support can be removed,
        we need to choose a different "always supported" version.

        This patch removes CONFIG_NFSD_V3 so that NFSv3 is always supported,
        as NFSv2 is today. When NFSv2 support is removed, NFSv3 will become
        the only "always supported" NFS version.

        The defconfigs still need to be updated to remove CONFIG_NFSD_V3=y.

        Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

I decided to just do the cherry-pick and get this off the list!

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 91bf0350d5..349aa9854d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "f8d4297d452f7c832d90bfb992d90db2e30ffc23"
-SRCREV_meta ?= "21fd5becb1ed083a28e57af46709578f83dd2910"
+SRCREV_meta ?= "7cdb56640a7854c921c292100445334745d5d534"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 722523ced9..054e17e871 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "7a8fce8cbd9a8a7d68a0c2537141c85d63f6eda3"
-SRCREV_meta ?= "21fd5becb1ed083a28e57af46709578f83dd2910"
+SRCREV_meta ?= "7cdb56640a7854c921c292100445334745d5d534"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 6784703ce2..c066797436 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -24,7 +24,7 @@ SRCREV_machine:qemux86 ?= "f0d16a142e32a7934da39a12bd983a00e629bb48"
 SRCREV_machine:qemux86-64 ?= "f0d16a142e32a7934da39a12bd983a00e629bb48"
 SRCREV_machine:qemumips64 ?= "d34e0789d8d5e0d7ab521889e80967edcac38dc6"
 SRCREV_machine ?= "f0d16a142e32a7934da39a12bd983a00e629bb48"
-SRCREV_meta ?= "21fd5becb1ed083a28e57af46709578f83dd2910"
+SRCREV_meta ?= "7cdb56640a7854c921c292100445334745d5d534"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


