Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51774C25B06
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:57:55 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.687.1659653873456905081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eDooqLjj;
 spf=pass (domain: gmail.com, ip: 209.85.219.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id q3so691043qvp.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=bqyF8CEzflk9WNPxijL9h7BoGisWP0it20J3r6ECpAw=;
        b=eDooqLjjROAz1t0oCZzo2sP4frfaBCKOZn4Sqvtpk9PtTSMFz7zIcS/CV7v+nAv/mZ
         X/7cH2NocMPb2YfAglwt0hJ5s2dfgHQ97d9Wat53tSnXnxr9e1bRWnT1tDRYEy0jLVzV
         ruoxu+FgPLxmE07GAoKdKra/rJaaB2Y3n+QRgl9mEgKmc0Ooe+hbG+FIdsNAklZIrGRo
         MtSqXLl2/rxDDLvfYr1VXqVna/+FtqlYGd6QRoaS5NO6uHOUu7pSrm+J3f/Va5t19C0d
         hjuPmKiCCo5XR/hyRoXG7OBBM7ctGsW5A1Ct5D02aa1YO7kI5K4xdGhMupUJh3hQAMti
         Dt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=bqyF8CEzflk9WNPxijL9h7BoGisWP0it20J3r6ECpAw=;
        b=oEixI0vwXOkLjTgkDM0PU/MvAp2AAWfigChjyrlryxcwlnpz/F287I13twgH4OHM0p
         NEoLfxejKkHRa8LdPTfUOuzyTOMk5kpYtmtvD6/7WQ8lkjYvb95VpfE87+gFuo4C/K44
         kumsO5kMdbvx2boUne2b+4eym2kWWNd1LanID6Py5ui3TIMZRyUdEW5GZskonK1tSdln
         lYHDxMaX2y9/lrB8tgo+EozcwwALTM6BALhOwY1riEsMYX8sX7iIi0+j8sfVhqK9pJ+i
         2KvFUVvm22TcpxLWP7FQs3Uu3EJksV3X+JmslOzCWUHIyNGLdhTIxfbQ0wOs/UuSkUXM
         MxsA==
X-Gm-Message-State: ACgBeo2hZ2GH3ZkYLB51zdVa3oTy4OJN6RVux89Q+RWrYMMA/5aMK5Ue
	NaBgFkCXsiqDmVuEUaiJeUo=
X-Google-Smtp-Source: 
 AA6agR7v8guXZ8ktxmLhbBj5OVnsdfiJjGIk9MwWZT+VP7BDZfrXM+tlVkQHCBoywoH26QsTuUMs8g==
X-Received: by 2002:a05:6214:76a:b0:477:9b2:641e with SMTP id
 f10-20020a056214076a00b0047709b2641emr3664180qvz.74.1659653872304;
        Thu, 04 Aug 2022 15:57:52 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl38-20020a05620a1aa600b006b8df80471csm1500818qkb.119.2022.08.04.15.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:57:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/13] kernel-yocto: consolidated pull request
Date: Thu,  4 Aug 2022 18:57:37 -0400
Message-Id: <cover.1659653543.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 22:57:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168864

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

As I mentioned earlier today, I've built and booted the 5.19 kernel
on all architectures, have run core-iamge-kernel-dev, core-image-sato
and validated musl.

At this point, we need wider coverage to scare out the remaining
gremlins.

I'm also sending update to 5.10 and 5.15 in the pull request, since
these are the retbleed stable updates, and I didn't want to sit on
them any longer. These are of course independenct of the 5.19 work.

I found one issue with vboxguestdrivers in meta-oe agains the new
kernel/headers, and I've sent a patch to that mailing list. I also
had to fix lttng-modules (as usual) and have sent a patch to that
mailing list as well.

devsrc needed a few tweaks as well, and they are included in the
series.

Note: I've mixed in the poky / meta-yocto patches as part of this
pull request, just for ease of sending it for wider testing and to
see if I missed any references to 5.10 or have left any else
dangling.

Cheers,

Bruce

The following changes since commit 25248acfdf92465b360ca464725b679ac5200d8d:

  initscripts: run umountnfs as a KILL script (2022-07-23 13:55:26 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (13):
  linux-yocto/5.15: update to v5.15.58
  linux-yocto/5.10: update to v5.10.134
  linux-yocto-rt/5.15: update to -rt48 (and fix -stable merge)
  linux-libc-headers: update to v5.19
  linux-yocto: introduce v5.19 reference kernel recipes
  meta/conf: update preferred linux-yocto version to v5.19
  kernel-devsrc: support arm v5.19+ on target build
  kernel-devsrc: support powerpc on v5.19+
  lttng-modules: fix build against mips and v5.19 kernel
  linux-yocto: drop v5.10 reference kernel recipes
  poky: update preferred version to v5.19
  poky: change preferred kernel version to 5.15 in poky-alt
  yocto-bsp: drop v5.10 bbappend and create 5.19 placeholder

 .../include/poky-distro-alt-test-config.inc   |   2 +-
 meta-poky/conf/distro/poky-tiny.conf          |   2 +-
 meta-poky/conf/distro/poky.conf               |   4 +-
 .../linux/linux-yocto_5.10.bbappend           |  23 ----
 .../linux/linux-yocto_5.19.bbappend           |  23 ++++
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/conf/machine/include/x86/x86-base.inc    |   2 +-
 meta/conf/machine/qemuarmv5.conf              |   2 +-
 ...ers_5.16.bb => linux-libc-headers_5.19.bb} |   4 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  17 +++
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 ...octo-rt_5.10.bb => linux-yocto-rt_5.19.bb} |  10 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 ...-tiny_5.10.bb => linux-yocto-tiny_5.19.bb} |  14 +--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 ++---
 ...inux-yocto_5.10.bb => linux-yocto_5.19.bb} |  66 ++++++-----
 ...tracepoints-condtional-on-CONFIG_COM.patch | 103 ++++++++++++++++++
 .../lttng/lttng-modules_2.13.4.bb             |   1 +
 18 files changed, 222 insertions(+), 91 deletions(-)
 delete mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend
 create mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.19.bbappend
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.16.bb => linux-libc-headers_5.19.bb} (81%)
 rename meta/recipes-kernel/linux/{linux-yocto-rt_5.10.bb => linux-yocto-rt_5.19.bb} (87%)
 rename meta/recipes-kernel/linux/{linux-yocto-tiny_5.10.bb => linux-yocto-tiny_5.19.bb} (59%)
 rename meta/recipes-kernel/linux/{linux-yocto_5.10.bb => linux-yocto_5.19.bb} (47%)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-compaction-make-tracepoints-condtional-on-CONFIG_COM.patch

-- 
2.19.1


