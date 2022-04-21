Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077B9C8303E
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:13 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web08.21796.1650549619671487557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 07:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=H5oKGnCo;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id e30so3130234eda.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 07:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=boCDq6DTz4e0p2BBJ4uaqhFLtm5pYL2oSGmm3dd3rbg=;
        b=H5oKGnCoO+CC60o+A548s3RLad7ZSSI6KUoSmqva9srnGkSPmBfTbZe6RV+kZ0UdLn
         0wsJYvk2bCBwgJVmr55DIGM7ncEbuMqEwYWh6sQGpMZQfaOgLpLGVs8iUsrBbjdwnRB1
         +CfKY6Qg7XPVq5C+CGq+pMw1Xxj7D3vy8i/SFRwBPxxU9JRexJSRiMtQDgC0oE8A+b82
         3qTpm4HbFScQkWzhPC2OblNwUj/Qs1RDpbHclNlrQCYwa9U1x/RLc/y3YHwR8b/hj3Q+
         OkM/92rHr8GRawKWcW9h0Fhb66GDJaf2BGkLnSkqhstlR0gLeAlNPfh+h0zkq16tzHvm
         n72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=boCDq6DTz4e0p2BBJ4uaqhFLtm5pYL2oSGmm3dd3rbg=;
        b=r860ZKFHU+nzRvXcLDMOMWP6MMk67LT9g/uyanVRdhj20ax6Y6q0TAOdj6ZwJMfZEG
         p4zusLjAT+vA62nBVL9MIYT7Ka2rtnsL35XUTwb6A7OmRsLGmzX3wSJHJ4K1GkYqwjyq
         DRid3elieDc2OQE3xauMZW2/n6FMzmpCWvfbEt/IzuFmeU+wqrYKQosc1DUCJnuC9al6
         J/sa1Shb4jVhpW4fFw7GpNQvK59TNwcVYkEV+YZbSoYYkKbxXr02xWUsycJdKGje3mjI
         DWrDQJUFixh8Rr96xpEXQdrXaoGsFwKIWoaBsqCYQ4cUjhZBa+r9YrQfGsN7G58+Bf7q
         VjnA==
X-Gm-Message-State: AOAM532tAG2Pmu6Z/rjdS7JLB3S51ISxQ969vHespM75o8RG64SpLdlq
	8u6jYvf8Q5hUYU9d7Z7Bb63FelWcWibzPkA1U6d1KQ==
X-Google-Smtp-Source: 
 ABdhPJximeDPVfbjgccntI3iYVSR4u5WLUMB6nxIxueeVh6lREsIQ/7S5wWtXTEGmaVaDmKgMg+ZDfvJF/+FSlwfDGY=
X-Received: by 2002:a05:6402:2945:b0:41d:aad:c824 with SMTP id
 ed5-20020a056402294500b0041d0aadc824mr29307191edb.364.1650549617870; Thu, 21
 Apr 2022 07:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <16E7A00050A35F84.23874@lists.openembedded.org>
 <CAOSpxdbjagCMneqiUTotst++FJspGQXsd577H9TOfnVTm+xMpQ@mail.gmail.com>
 <CAK6=ix5yd8nrnGYEsNLrqsAVmyzZmMh-q5O-kvv16CXEZDJRCQ@mail.gmail.com>
In-Reply-To: 
 <CAK6=ix5yd8nrnGYEsNLrqsAVmyzZmMh-q5O-kvv16CXEZDJRCQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 21 Apr 2022 04:00:05 -1000
Message-ID: 
 <CAOSpxdaOqjOFv7RaB-+ym7OZEji1tL5S6C08WAuOGLGnarWV6w@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 00/27] Patch review
To: Randy MacLeod <rwmacleod@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164762

On Wed, Apr 20, 2022 at 7:14 PM Randy MacLeod <rwmacleod@gmail.com> wrote:
>
>
>
> On Wed., Apr. 20, 2022, 10:54 Steve Sakoman, <steve@sakoman.com> wrote:
>>
>> On Wed, Apr 20, 2022 at 4:08 AM Steve Sakoman via
>> lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
>> wrote:
>> >
>> > Please review this set of patches for kirkstone and have comments back by
>> > end of day Friday.
>>
>> I'd particularly like feedback on the security/bug fix version updates
>> at the end of this series.
>>
>> In the past I took these only on request.
>>
>> Would people like me to be more proactive on this type of upgrade
>> (such as this series), or should I continue to take them only on
>> request?
>
>
> Proactive but reasonably cautious. ;-)

That's my feeling too.

>> > Passed a-full on autobuilder:
>> >
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3547
>> >
>> > The following changes since commit d2ba3b8850d461bc7b773240cdf15b22b31a3f9e:
>> >
>> >   lua: fix CVE-2022-28805 (2022-04-19 14:02:08 +0100)
>> >
>> > are available in the Git repository at:
>> >
>> >   git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
>> >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut
>> >
>> > Alexander Kanavin (1):
>> >   webkitgtk: adjust patch status
>> >
>> > Davide Gardenal (1):
>> >   create-spdx: fix error when symlink cannot be created
>> >
>> > Ferry Toth (2):
>> >   apt: add apt selftest to test signed package feeds
>> >   package_manager: fix missing dependency on gnupg when signing deb
>> >     package feeds
>> >
>> > Jon Mason (1):
>> >   qemuarm64: use virtio pci interfaces
>> >
>> > Kai Kang (1):
>> >   update_udev_hwdb: fix multilib issue with systemd
>> >
>> > Khem Raj (5):
>> >   babeltrace: Disable warnings as errors
>> >   xserver-xorg: Fix build with gcc12
>> >   systemtap: Fix build with gcc-12
>> >   gnupg: Disable FORTIFY_SOURCES on mips
>> >   mdadm: Drop clang specific cflags
>> >
>> > Konrad Weihmann (2):
>> >   git: correct license
>> >   ncurses: use COPYING file
>> >
>> > Martin Jansa (1):
>> >   systemd-boot: remove outdated EFI_LD comment
>> >
>> > Paulo Neves (1):
>> >   selftest/lic_checksum: Add test for filename containing space
>> >
>> > Peter Kjellerstedt (2):
>> >   u-boot: Correct the SRC_URI
>> >   u-boot: Inherit pkgconfig
>> >
>> > Richard Purdie (1):
>> >   buildtools-tarball: Only add cert envvars if certs are included
>> >
>> > Ross Burton (1):
>> >   zlib: upgrade to 1.2.12
>> >
>> > wangmy (5):
>> >   linux-firmware: upgrade 20220310 -> 20220411
>
>
>
> It's firmware so it should be fine but I don't know much about such things. Have  firmware updates ever broken older kernels?
> Certainly there could be performance degradation. I guess it's a release note item for others to worry about.

I've been doing these regularly for dunfell and it hasn't been an
issue in the past two years.

>> >   libsoup: upgrade 3.0.5 -> 3.0.6
>> >   apt: upgrade 2.4.3 -> 2.4.4
>> >   libusb1: upgrade 1.0.25 -> 1.0.26
>> >   libgit2: upgrade 1.4.2 -> 1.4.3
>> >
>> > zhengruoqin (3):
>> >   wireless-regdb: upgrade 2022.02.18 -> 2022.04.08
>> >   git: upgrade 2.35.2 -> 2.35.3
>> >   ruby: upgrade 3.1.1 -> 3.1.2
>
>
> These all seem like bug fix only updates.
> Are you assuming that third number updates don't change API/ABI or looking at commit summaries, git logs, or using a tool?

Yes, my criteria for including is that they are bug/security only updates.

I don't assume anything from the version number, I review the release
notes (if any) and the git logs.  In many cases the version updates in
master don't include this info in the commit message.  In that case I
add either the release notes or the git log to the commit message when
cherry-picking from master.

So it is a time consuming manual process :-)

BTW, those who include release notes or commit logs in their version
bumps get smiles and brownie points from me!

Steve

