Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D10C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 20:43:41 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web08.2228.1651178611931918379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 13:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qfEVOfQ6;
 spf=pass (domain: gmail.com, ip: 209.85.128.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-2f7d621d1caso65652027b3.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 13:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uOFE+jX26LXYLvc4sqoBNaf8Knh31bjFk7AOC6stkbw=;
        b=qfEVOfQ6FWf61d847dLZWBFWX32wbccwymtJJRS71BTE+I/sTkL4rs9KH8BLQMlbJM
         TlNg5ISPGROfHIBT94nGYTNbOMRWLOiOYmDZ3iIq6WAzyANFF1kltjLcJssLRKrVSwNl
         UYO+7ftfkQ8ojfmhXvcf35XA/DxgNx9zpmsetl5yEQr7Vg7qqcr1433Novd25O/31GZz
         0NxdGiCOB3G7kFCWueDfGC4YZSpjN0j5+SpCSCGZOtwKNboByXae/tOPfA6hiBly2+OS
         WdDowEs2QyDcjgx1egMsl7Th4P4yZj3SyU5yDSiYkz5tGfFgOaggquE2+OaoCUTTscLG
         olFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uOFE+jX26LXYLvc4sqoBNaf8Knh31bjFk7AOC6stkbw=;
        b=ahK0kKFJqTNWU2quho6cACcVwjd6VSfPp5/JdI+rh1il/Scor36inVw+UXYO6i9HCv
         iu2ZNYfRZGjjc+VoxGDwts6vcbVo7ZRXbfcWBCKX3drcWAq3XaEv5d/2UP6TwQG8ccV3
         5vzvpWaKI8ZLu8AQ9/goIIl9lTsdXmysussgorBcFNiDr4J9LR5Zur3ClaPtFvYc64oW
         wxckq+ijD2HKPIIZR3wBF+ZRPI03xTn6BV17tfI8n6T8aUyTg4UQ+kb+1HT0hMZd3e6X
         CDCznMCjzfy01RtIpU4r4jcNBULc8HEwuBWZ3CSXEC3x8LYtHRKA7b3/zqwn4vqlQOtS
         LrNw==
X-Gm-Message-State: AOAM533/+6okmp1UjbILga9EmZAK65WnqssDdE2qL7dROG0bbk6orArN
	XuL0bHHkLN3T31UyuezM+DGj5/zZrxwoTFUbD9E=
X-Google-Smtp-Source: 
 ABdhPJz5RMg288SEp8AiYVF2xtxfACZPHp19Q1rjJCoqXb7qFQPT3FUADXBCRfM/UsIic5TdFwOnB5TxxHFeSlZfm4s=
X-Received: by 2002:a05:690c:3:b0:2e0:a28a:f0eb with SMTP id
 bc3-20020a05690c000300b002e0a28af0ebmr36892507ywb.179.1651178611098; Thu, 28
 Apr 2022 13:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <16EA1387603CC89E.18966@lists.openembedded.org>
In-Reply-To: <16EA1387603CC89E.18966@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Apr 2022 16:43:19 -0400
Message-ID: 
 <CADkTA4Mogs+b+VxF1JfpEWVh40KSQM7HiRQ3sq1Y+s80OG4pzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/15] kernel-yocto: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 20:43:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164976

On Thu, Apr 28, 2022 at 9:48 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Richard,
>
> This is mainly a resend of the pull request that I sent just before
> the release builds.
>
> At that time, there was a ppc boot issue, which I've fixed. There was
> also a ptest warning, which I couldn't reproduce, so let's see if it
> pops back up on the AB.

As a follow up, I'm re-testing the ppc boot issue now. It was a
regression in the fb hotplug, which conflicted with subsequent -stable
updates. I haven't done a full series of test on PPC, so it could be
that it is undone by those updates.

Bruce

>
> There is also a known issue with some of the arm reorganization done
> for the -tiny cleaup. Jon has been working on fixes to that series, and
> I've cc'd him here so he can add context. It was some boot issues,
> even in the -standard kernel for sato (last I checked).
>
> The issue with the ARM changes is that they've already been pushed
> to my repos, so everything stacks on top. If we can't get them fixed
> shortly, I can temporarily revert and do a new patch on top.
>
> Khem has also indicated that the 5.15.36 -stable has all of the changes
> required for gcc12, so it would be a good bump to get under test.
>
> Cheers,
>
> Bruce
>
> The following changes since commit 5639708757faa00de1bc64b01220a5f7232818fb:
>
>   set_versions: update for 4.0 release (2022-04-26 10:56:47 +0100)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/poky-contrib zedd/kernel
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (15):
>   linux-yocto/5.15: arm: poky-tiny cleanup and fixes
>   linux-yocto/5.15: update to v5.15.33
>   linux-yocto/5.10: update to v5.10.110
>   linux-yocto/5.10: base: enable kernel crypto userspace API
>   linux-yocto/5.15: base: enable kernel crypto userspace API
>   linux-yocto/5.15: kasan: fix BUG: sleeping function called from
>     invalid context
>   kernel-yocto: allow patch author date to be commit date
>   linux-yocto/5.15: fix ppc boot
>   linux-yocto/5.15: netfilter: conntrack: avoid useless indirection
>     during conntrack destruction
>   linux-yocto/5.10: update to v5.10.112
>   linux-yocto/5.15: update to v5.15.35
>   linux-yocto/5.15: Fix CVE-2022-28796
>   linux-yocto: enable powerpc debug fragment
>   linux-yocto/5.15: fix -standard kernel build issue
>   linux-yocto/5.15: update to v5.15.36
>
>  meta/classes/kernel-yocto.bbclass             |  6 +++-
>  .../kern-tools/kern-tools-native_git.bb       |  2 +-
>  .../linux/linux-yocto-rt_5.10.bb              |  6 ++--
>  .../linux/linux-yocto-rt_5.15.bb              |  6 ++--
>  .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
>  .../linux/linux-yocto-tiny_5.15.bb            |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb | 26 +++++++++--------
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 28 ++++++++++---------
>  8 files changed, 48 insertions(+), 40 deletions(-)
>
> --
> 2.19.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164948): https://lists.openembedded.org/g/openembedded-core/message/164948
> Mute This Topic: https://lists.openembedded.org/mt/90753174/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

