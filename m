Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939E8C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 19:48:44 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.2782.1636055309800976126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Li+iNbSX;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id h16so5283249qtk.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=35SgCnpjpHK0GCPc630ik3Z6APRHQHAwxe09rOiEAek=;
        b=Li+iNbSXLl4WMVZoBn+Iq/4NWJdtf5VtQqssLXTYBjAd/zm4nU3pMIGGjEPTAUmJXy
         6tOSyYmPyEgpYP+hEWKyu2uyOz9Gf0AlsCFbgRGq1zuhXNkxLnM4zrGETB6hONaolaXF
         GP7sNwmRHc19jk6rBCJ/2j05V/0SQzhuTAUk/sZcrXy6Jgx5KwhvhL9FIThRt6BS6cPY
         WI8SbcDhYtECwL0EjcoH91Ckc9wiXUtHrbKnsbApugwE0scBPRj1xBKXDpoWQgxVXCfF
         hUGnm6QhtQFlyh2q15niVz7rW3BQiPmYHPZMeAz+f0C7kDv9onCKrm3h4tT21gLA1seN
         ijvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=35SgCnpjpHK0GCPc630ik3Z6APRHQHAwxe09rOiEAek=;
        b=8JLCHnYm9mdHsUSRInulOUwLxk7cX21omY7VSE7k8M4vv3DuLe8/j6f102rzAhodck
         52gMcrUpDQUHn+KZCjx72W0Nay0wKOuO1COkHyLuUjn27ukAD1Wr+n3S9iDuQWFpJg78
         xVpS4z/0jC0V8q6h/judSSKKSatUzWTvaJHpFIVnBTftUfaQjZKY5aaopuTnBo/y+Z0P
         k7eozzC4FEuWN8WEgP+sNmiKXgsW/1soN2RxtqAJuf5sVAvFrOlo9O1WCwomsiieC8JU
         XCiBxhi75UKBZjnOB7XxTz+OeBKz2M8ClJiYhi1qsC1SSmK6e5T/1QQQ5uzAUK0dnLKx
         AKYg==
X-Gm-Message-State: AOAM531Wk/QGNGHdxnsvUusfrwakbiErp9rTXGgyRqfeP8mCvzTI3iGM
	L0je4vEQygiEKEjjMPHv1lE=
X-Google-Smtp-Source: 
 ABdhPJxFMCFVgGhzER0l3VL3S8SQfbip6zghcTqiGfpnLRbv2YkrPL6y8mMUvDDLr3APY1TZ+pzHag==
X-Received: by 2002:a05:622a:1aaa:: with SMTP id
 s42mr6045764qtc.226.1636055308868;
        Thu, 04 Nov 2021 12:48:28 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 br17sm4276771qkb.10.2021.11.04.12.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 12:48:28 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel: consolidated pull request
Date: Thu,  4 Nov 2021 15:48:20 -0400
Message-Id: <cover.1636054726.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 19:48:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157862

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's a broad set of kernel updates:

 - stable for 5.14
 - stable for 5.10

And then the bigger, a way earlier than normal:

 - libc-headers bump to 5.15
 - 5.15 reference kernel recipes

As everyone has probably heard, 5.15 is the next kernel LTS, so I
wanted to establish it for the next release earlier than normal. Due
to the -dev testing, things like lttng, perf and devsrc are already
ready to go, so this is a smaller pull request than normal.

I had to fixup strace, and the vboxguest drivers (patch sent to
meta-oe)

I've run it through the AB and everything came back green, as well
as my local testing.

This isn't the default for any of the machines yet (but I have
local patches for that as well). The h/w reference boards
stil use 5.14 and need to be updated, but the plan is to remove 5.14,
and eventually 5.10 from master, and we'll go with 5.15, and 5.16+
in the spring 2022 release.

Cheers,

Bruce

The following changes since commit 3e9c4801216111496acffdfdccf1deae3b3d6b96:

  insane.bbclass: Add a check for directories that are expected to be empty (2021-11-03 11:12:26 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/5.14: update to v5.14.15
  linux-yocto/5.10: update to v5.10.76
  linux-libc-headers: update to v5.15
  linux-yocto-rt/5.10: update to -rt54
  linux-yocto/5.15: introduce recipes
  strace: fix build against 5.15 kernel/kernel-headers

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...1-Avoid-relying-on-presence-of-ipx.h.patch | 151 ++++++++++++++++++
 meta/recipes-devtools/strace/strace_5.14.bb   |   1 +
 ...ers_5.14.bb => linux-libc-headers_5.15.bb} |   4 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.14.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |  45 ++++++
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.14.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  32 ++++
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_5.14.bb |  26 +--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  68 ++++++++
 13 files changed, 339 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} (81%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.15.bb

-- 
2.19.1


