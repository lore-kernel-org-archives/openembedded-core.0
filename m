Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701CBC38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 22:33:53 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.696.1666996424212367311
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 15:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=HH4f27Rc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id t10-20020a17090a4e4a00b0020af4bcae10so5727311pjl.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 15:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MWjhgEzfH+sr8VmJ5uzn/wLWXq3ggfhSCRitdakZ6rQ=;
        b=HH4f27RcED8IK2TjPx3686ywKBOsuQFlsb/iC6tCUQfwv94IOeP6xrOqHHLcDy+rkS
         JO2BIWyP1eIQ1sT+IjjV3QYtfVwbr3skZqfhgc7JjMDjSJl9w+3JCy+BwPlIQxQq4kXE
         B1dE6RfaYkx726k+x9MLLqKQREkvrMuBHE0msMMNPp28TE9uoes5TIEGgz70LnvtGG1a
         znvk8VAGQ89Ak+8mIcB9b8fpW+UmdeC/SJap/i9B6kQN8JTa52MENsI8rY9Tcdjwco8j
         z09Qon5Gz1zMUefHAL3RBQ6hPNaorc6/bPuNtSNo6yAecJp8euXllGlDMPC0SvStbJqX
         NY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MWjhgEzfH+sr8VmJ5uzn/wLWXq3ggfhSCRitdakZ6rQ=;
        b=QOj3lh8F8rDrcX2cRJeRMWTX3mFB/e+ykW/QIUooKyw4gEv0eBQJ1dEM4uWCCbmxOV
         jLN7TTF/J9xxODWO9pm+/aBxYRcAxrnKrHlVrkYUnvqKWwidMIg1W3zg3oNq+bYpoB/k
         t1f1acRf2Y1ShqXpEvU3WbvcmQvYRi92qxhLxhBH3uoDChFsTUkx82IvLcXW00VKbzjX
         OK/LlgELiC+r1+yspboDT+GJ6TewE9ZGKQS3nxtdvwIVdPa0n0RBETjq7Vk/XTvtOmw8
         NTorz/ab9x/SY1JnQeuyDQ3Ndkq8H2xoacufswDHd4NSMDDWVtfdTighQ1b7MD1R4UV3
         /kWQ==
X-Gm-Message-State: ACrzQf3IfV8ERvOHbKDpQGSn1mnZDFW/++PelTVwbO0vSe1IN4Jd+U4m
	vFMFqEgmSQHOVKOo81fmEtFCu6JUamjvAl5m
X-Google-Smtp-Source: AMsMyM7LcWmLd+FF8J8TlV+4JJHGNovVGW2qucIV6UFxCMnRnzaivjBOoKj45fSEHXP+VvnyBw1SiA==
X-Received: by 2002:a17:90b:1c8d:b0:203:cc25:4eb5 with SMTP id oo13-20020a17090b1c8d00b00203cc254eb5mr1596044pjb.132.1666996422953;
        Fri, 28 Oct 2022 15:33:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p187-20020a625bc4000000b005628a30a500sm3313776pfb.41.2022.10.28.15.33.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 15:33:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Pull request (cover letter only)
Date: Fri, 28 Oct 2022 12:33:30 -1000
Message-Id: <cover.1666996333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 22:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172274

This the final patch set for the 4.0.5 release build on Monday.

The following changes since commit 4781fee6aea9512b7cb390b76e6f9f0a86a5bd11:

  lttng-modules: Fix crash on powerpc64 (2022-10-17 04:30:43 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Bruce Ashfield (2):
  linux-yocto/5.10: update to v5.10.147
  linux-yocto/5.10: update to v5.10.149

Steve Sakoman (1):
  Revert "lttng-tools: Upgrade 2.13.4 -> 2.13.8"

Tim Orling (1):
  git: upgrade 2.35.4 -> 2.35.5

Vyacheslav Yurkov (2):
  files: overlayfs-etc: refactor preinit template
  classes: files: Extend overlayfs-etc class

Yash Shinde (2):
  binutils: stable 2.38 branch updates
  glibc: stable 2.35 branch updates.

 meta/classes/overlayfs-etc.bbclass            |  5 +++-
 meta/files/overlayfs-etc-preinit.sh.in        | 23 ++++++++++++++----
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 .../binutils/binutils-2.38.inc                |  2 +-
 .../git/{git_2.35.4.bb => git_2.35.5.bb}      |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 ...-tools_2.13.8.bb => lttng-tools_2.13.4.bb} |  2 +-
 9 files changed, 45 insertions(+), 29 deletions(-)
 rename meta/recipes-devtools/git/{git_2.35.4.bb => git_2.35.5.bb} (98%)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.8.bb => lttng-tools_2.13.4.bb} (98%)

-- 
2.25.1


