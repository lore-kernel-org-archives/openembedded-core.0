Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8E4C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 13:59:41 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.12687.1654610380097575733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lJbxc680;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id o68so13237917qkf.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JeNyduzHmq6B91ZxW/v5mZ02BIKuC73FtWM1UCqJTa8=;
        b=lJbxc680KMyhIiCJzELwloYbRk/+0q4OgHhBsw6oUNVRXGL86rqhPI0cKFYwsrfdJp
         9U8sncq3rj2xjbyucRAVJiHlZg0ZCBRS16A2i6giuJPxroLqWtyQwBFhCw4Go+D2CX1E
         ugXMjmUdp9vxy8GjNP1H7cGZX+5tEA1fxapzCXiHJQZdEs+eFQNIyM5ywa1AfEvNcmDx
         b2me3fP1RiZnte8lEUQTtE3LPnGrNv5/mkzEAaDPTcnFk4jI+iI/ALvsXsyFUV5sA0sU
         TtxrKZJcRuE8H3bODlkikvQiUImTkfTjv+j0sQ4lcVKnvQnQHyIcmKL4bxxnqXhpHr3L
         hUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JeNyduzHmq6B91ZxW/v5mZ02BIKuC73FtWM1UCqJTa8=;
        b=0VVxFawGj54wswUj64uxmBOgnqM5caBrmjEQI3WLlrzCKmYXJ6/+7izWMEwMymmozs
         1OIOZeqSpBu1bxcpRlA8rrVCgxDiDABW2P+mZ87OJA+qXAvv6v1AOvXCrskPeaJLoGQT
         lGAeUuHalHT/X6pVZFlhaiteevbD8V3G/F2oh2SostN4ItA7gKXHUgHoz0pS0Hgp+PNR
         Ffb7Ww8x5AwNJYoWiUWaJA+p8Q/mLOXQRY/kl85ECBGg8BdUxxml91wrM9MzKJvOjSqM
         ppp9U/y5puxDC6IC5BgISHz0HfDaleNxnqcDtXa8D+o80mkq5E2izewfnwsB1aSW0IAq
         lpCQ==
X-Gm-Message-State: AOAM532Ih4qO3bxE+d+toyZmMsD10nLL4HzXWSHllizJ/iRyTnwGHmzD
	Up80xu31xG5qX25fj/QnrUE=
X-Google-Smtp-Source: 
 ABdhPJzkaOPLas5xfr8sWQHMGJomyz6/FbTR42UkBEOXf/VlLuo7sQBtkfH7kyaDzj89qxx7je2+UQ==
X-Received: by 2002:a05:620a:4481:b0:6a3:6326:784 with SMTP id
 x1-20020a05620a448100b006a363260784mr19783218qkp.372.1654610379053;
        Tue, 07 Jun 2022 06:59:39 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a05620a284a00b006a6c552736asm4053134qkp.119.2022.06.07.06.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:59:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: consolidated pull request
Date: Tue,  7 Jun 2022 09:59:30 -0400
Message-Id: <cover.1654610229.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 13:59:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166661

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

I'm starting to watch v5.19 as the kernel for the fall release, but in
the meantime, here are the 5.10 and 5.15 -stable udpates, along with
some configuration tweaks.

The merges were a bit messy on -rt with some /dev/random changes being
backported that caused significant conflicts. Everything should be sorted
now, but I'm keeping my eyes open for fallout.

Bruce

The following changes since commit 0c855988153f2504f2e79b359cec53b982eb9d52:

  udev-extraconf: let automount base directory configurable (2022-06-07 11:56:13 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/5.15: bpf: explicitly disable unpriv eBPF by default
  linux-yocto/5.15: update to v5.15.43
  linux-yocto/5.10: update to v5.10.118
  linux-yocto/5.15: Enable MDIO bus config
  linux-yocto/5.15: cfg/xen: Move x86 configs to separate file
  linux-yocto/5.15: update to v5.15.44
  linux-yocto/5.10: update to v5.10.119

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 6 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.19.1


