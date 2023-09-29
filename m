Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1825E728EF
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:05 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web11.27710.1696017904805731003
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EDoAoU6y;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7ab68ef45e7so4479768241.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696017904; x=1696622704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxY5qjPSux4sLM1ZEI/njKiHKLUuBc8iZtnE50Jwpuw=;
        b=EDoAoU6y0KdYgs6kCV5ISf5d/vH95xZHEXt3CZ0w/FklofAEUGXH8UYmv6ybwGOGhQ
         M5a35xRJPwJ4dXVrpCscKjQpwtYceTDow3D/J3l8jcm9CikFaEvGge5XB/mWxvKcREVY
         7ID7ufieMlkJz8inwEu4yvqPDndwjIlXLdW06p++t8Cg7Vgz2rBEZc7BVb7K/d59MSli
         LECy+fj5ksu7f8dLcUmC6pRkt8SfZ0mU3S1wBwog6HY8xmug7o5XWzr2wVTnEk9f7PYf
         /xxpF00GBE/YMHOIZeMrx0KU8pKHczhvROADe8ah8ZBYm2eG6cmYCzRnYR0vFctksKzd
         quxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017904; x=1696622704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxY5qjPSux4sLM1ZEI/njKiHKLUuBc8iZtnE50Jwpuw=;
        b=S6kKHKFbxOBd22UxFf/Kj8TWgOHr+aX7ni3ed5UvUDYp2nrWiNLyWdXVKURzw4NDVX
         pxIVC/T1oGzb0UGJDwTP+fLSMkGi4WmJ9Hp1U6ImtSioNEv+OdjPiHSJSVbM/rw4IKFN
         XjrwJVWg/vcd6Wd29IA5KCawr8vzUID2Dasts3DMeUUTq/JuO8xzM98qkyBxtE/XMVrQ
         AJDdgSUG93madHTlun84lGXtyEsYoXOx6Ig58UittJV5UBt2OazxQ61wOOybl7ywnkpN
         wodCG9P3lX6yc6/u7Ijq8gIYmbTlfe41980LWQkbU3TjesAVJYXN4MjqQTSNAUQB5Xbl
         R0qw==
X-Gm-Message-State: AOJu0YwmpkZhcAlhFpMnrb5bhdA7OPqRGBsPzhWsYXdlIJCltASadbmH
	enaNqpVtz0IbZFtNDixe8ok=
X-Google-Smtp-Source: AGHT+IGYsH4pUh/aAWFMZ+VnSkYMoYQeyUB9KVO3IpY1PKZu6eUxF1fs2wI2Zy8XMRrvur67cohG2A==
X-Received: by 2002:a67:cd01:0:b0:44e:9afe:c5b9 with SMTP id u1-20020a67cd01000000b0044e9afec5b9mr4429728vsl.23.1696017903699;
        Fri, 29 Sep 2023 13:05:03 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t28-20020a0cb39c000000b0065cffe12ae9sm2115848qve.36.2023.09.29.13.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:05:02 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] linux-yocto-dev: update to v6.6-rcX
Date: Fri, 29 Sep 2023 16:04:50 -0400
Message-Id: <3541ee443ff5b0c6d6bf16c0c287bd3c68e1f1eb.1696017123.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696017123.git.bruce.ashfield@gmail.com>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188425

From: Bruce Ashfield <bruce.ashfield@gmail.com>

v6.5 will be the next reference kernel, so we update -dev to
follow 6.6-rcX.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 95e3592731..b59442781c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.5/standard/base"
+KBRANCH = "v6.6/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.5"
+LINUX_VERSION ?= "6.6"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


