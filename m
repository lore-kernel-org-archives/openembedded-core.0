Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92692EE4993
	for <webhook@archiver.kernel.org>; Sun, 20 Aug 2023 18:29:00 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.1224.1692556133809292399
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Aug 2023 11:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Jaad9l1u;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-790f831c6fbso89932039f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 11:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692556133; x=1693160933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiHyL3lzqn73nHRmdpNLyyj1yi0/OTsT8+IE5t1yMwI=;
        b=Jaad9l1u11wz2HtnsS/ZCTSxcwJ1k751V48BnYGPaoGwL1qNMcX6UAWUMpPeoJnDVR
         13kUjzxW9GZaeHdaJe13nCGtyUTpXWtEzuNYA9+Q3SLSb3IbnhpXjiFvkegYRgB2BCax
         R35AGs/vE5Be9cenKRj9sI2hK85V/OvKlG7h5gq9oNtiwDmBqf6cNTHSkHe77BVDSQsP
         T4VpRObKrYWoDFGWc2T5p9jyV5/pJvIvhKYLs4V9tzz3YPR4hSKlP+4tQf+jmcENbceN
         let7IB5PG4+1QT7AaxLPkLvWQ8hr53DL+TeWzWBggFPI6R8jUvVLyD0lquTaG2JxNlps
         xSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692556133; x=1693160933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiHyL3lzqn73nHRmdpNLyyj1yi0/OTsT8+IE5t1yMwI=;
        b=eGDUcCsAnhMJuyFAclubylc+x8ZmEQ9O+xHGQbRbqfvtt4vQxTFBhKWHtRB4HI/GYQ
         vJruVmolGly7jZ5MgosQEnIQDTpjddyGwNFD6neobl7VF/GqsoXtbrI3Qf+Idw9IGwuT
         J30r+cHtlkTGPQ3Es1V3E5K5k5p1KVDK7CRQh/OL8WFNLz6ZtxsjhxvG8rv3aQ0+c95I
         WEfL9Ek0ZZ+1fZABkPeD+rM+P0rlkmVtb5W5MBhO0T7IQTTi4nd92Ni7lyAbV3ykPnQV
         IfPmPmNGnt5D4/7pg1lqlg+qeOgwh9yXdsi4Lz7Ibi80IeRZ0ImaX6SbgYTtw2eSmc6Y
         tClQ==
X-Gm-Message-State: AOJu0Yz43u1R3lsj6RsQKMvfXyE9/hcQiENC43lNxJgK+HaS3Nh+yAnZ
	N3bB1OkvsTI8lNJG9bw/eNaymSWrucjb4l404s0=
X-Google-Smtp-Source: AGHT+IEvYglOUE9jUvrqb7NcA1G9mrysfytJwBOmTYwQOyyDcxzCKRXkFwQW2wi4J+UgzgrwVx6U3lOr+l7nEK5C2Hw=
X-Received: by 2002:a6b:e305:0:b0:790:a9e4:7d4b with SMTP id
 u5-20020a6be305000000b00790a9e47d4bmr6419938ioc.16.1692556132967; Sun, 20 Aug
 2023 11:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <177B9B269D618F2D.8497@lists.openembedded.org> <CAOSpxdbAToPehX6e5wdwG-MH8+8VdU0bMUU86C3Vi_sVNzdMcA@mail.gmail.com>
 <177C5BF219AB3C22.3047@lists.openembedded.org> <ZN/ygrsJU3k18Vm4@windriver.com>
In-Reply-To: <ZN/ygrsJU3k18Vm4@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 20 Aug 2023 14:28:41 -0400
Message-ID: <CADkTA4ONKt66CUZGnvPVNid0ow4kMpvXoz1Gb9_7w8ZcL5FO9A@mail.gmail.com>
Subject: Re: [OE-core][mickledore 00/18] Patch review
To: paul.gortmaker@windriver.com
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 18:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186416

On Fri, Aug 18, 2023 at 6:37=E2=80=AFPM Paul Gortmaker via
lists.openembedded.org
<paul.gortmaker=3Dwindriver.com@lists.openembedded.org> wrote:
>
> [Re: [OE-core][mickledore 00/18] Patch review] On 17/08/2023 (Thu 23:17) =
Paul Gortmaker via lists.openembedded.org wrote:
>
> > [Re: [OE-core][mickledore 00/18] Patch review] On 16/08/2023 (Wed 07:50=
) Steve Sakoman via lists.openembedded.org wrote:
> >
> > > On Tue, Aug 15, 2023 at 6:24???AM Steve Sakoman via
> > > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> > > wrote:
> > > >
> > > > Please review this set of changes for mickledore and have comments =
back by
> > > > end of day Thursday, August 17.
> >
> > [...]
> >
> > > > Bruce Ashfield (2):
> > > >   linux-yocto/6.1: update to v6.1.41
> > > >   linux-yocto/6.1: update to v6.1.43
> > >
> > > I'm seeing intermittent failures with these 6.1 "stable" version bump=
s
> > > (issues are also seen in master).
> > >
> > > So I am dropping these for now till we can fix the problem.
> >
> > aka "NOHZ tick-stop error: local softirq work is pending, handler #80!!=
!"
> >
> > For those not on IRC, the "cause" was tracked down to a v6.1.39 change:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git=
/tree/releases/6.1.39/tick-rcu-fix-bogus-ratelimit-condition.patch
> >
> > [linux-stable commit ID 77cc52f1b8d7 in v6.1]
> >
> > The bad news - when you look at that commit, you realize the softirq-80
> > problem has been there for an as-yet undetermined length of time, but
> > was never output because of the bogus/broken "less than 10" check.
> >
> > The "less than 10" was introduced in v5.18, so that sets a lower bound,
> > but I've not yet tested if the pending-80 was there immediately at 5.18
> > or appeared somewhere between v5.18 and v6.1 - stay tuned.
>
> For the mail archives - it turns out the issue was there immediately at
> v5.18, based on my testing results. - I'm optimistic (for once) that we
> have this softirq-80 issue solved.  But we'll have to wait and see.

To keep everyone in the loop, I'm obviously aware of paul's fix, and I'm
letting it sit upstream briefly, and will cherry pick it to everything post
5.18 if it doesn't merge quickly enough.

Bruce

>
> If folks are interested, more details are in the commit log here:
>
> https://lore.kernel.org/lkml/20230818200757.1808398-1-paul.gortmaker@wind=
river.com/
>
> Paul.
> --
>
> >
> > The same change/issue 1st appears in v6.4.4 stable kernel [7fe63c29cb].
> >
> > Paul.
> > --
> >
> > >
> > > I reran a-full without the version bumps and all tests passed:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/574=
2
> > >
> > > Steve
> > >
> > > > Dmitry Baryshkov (1):
> > > >   linux-firmware: split platform-specific Adreno shaders to separat=
e
> > > >     packages
> > > >
> > > > Joel Stanley (1):
> > > >   kernel: don't fail if Modules.symvers doesn't exist
> > > >
> > > > Marek Vasut (1):
> > > >   linux-firmware: Fix mediatek mt7601u firmware path
> > > >
> > > > Mark Hatle (1):
> > > >   tcf-agent: Update to 1.8.0 release
> > > >
> > > > Richard Purdie (1):
> > > >   oeqa/ssh: Further improve process exit handling
> > > >
> > > > Ross Burton (1):
> > > >   openssh: upgrade to 9.3p2
> > > >
> > > > Sudip Mukherjee (1):
> > > >   bind: upgrade to v9.18.17
> > > >
> > > > Yogita Urade (3):
> > > >   qemu: fix CVE-2023-3301
> > > >   qemu: fix CVE-2023-3255
> > > >   qemu: fix CVE-2023-2861
> > > >
> > > > sanjana (1):
> > > >   binutils: stable 2.40 branch updates
> > > >
> > > >  meta/classes-recipe/kernel.bbclass            |   4 +-
> > > >  meta/conf/distro/include/maintainers.inc      |   2 +-
> > > >  meta/lib/oeqa/core/target/ssh.py              |   5 +-
> > > >  ...1-avoid-start-failure-with-bind-user.patch |   0
> > > >  ...d-V-and-start-log-hide-build-options.patch |   0
> > > >  ...ching-for-json-headers-searches-sysr.patch |   0
> > > >  .../bind/{bind-9.18.16 =3D> bind}/bind9         |   0
> > > >  .../bind/{bind-9.18.16 =3D> bind}/conf.patch    |   0
> > > >  .../generate-rndc-key.sh                      |   0
> > > >  ...t.d-add-support-for-read-only-rootfs.patch |   0
> > > >  .../make-etc-initd-bind-stop-work.patch       |   0
> > > >  .../bind/{bind-9.18.16 =3D> bind}/named.service |   0
> > > >  .../bind/{bind_9.18.16.bb =3D> bind_9.18.17.bb} |   4 +-
> > > >  .../{openssh_9.3p1.bb =3D> openssh_9.3p2.bb}    |   2 +-
> > > >  meta/recipes-core/glibc/glibc-locale.inc      |   8 +-
> > > >  .../binutils/binutils-2.40.inc                |   2 +-
> > > >  meta/recipes-devtools/qemu/qemu.inc           |   3 +
> > > >  .../qemu/qemu/CVE-2023-2861.patch             | 171 ++++++++++++++=
++++
> > > >  .../qemu/qemu/CVE-2023-3255.patch             |  65 +++++++
> > > >  .../qemu/qemu/CVE-2023-3301.patch             |  65 +++++++
> > > >  .../tcf-agent/tcf-agent_git.bb                |   4 +-
> > > >  .../linux-firmware/linux-firmware_20230625.bb |  28 ++-
> > > >  .../linux/linux-yocto-rt_6.1.bb               |   6 +-
> > > >  .../linux/linux-yocto-tiny_6.1.bb             |   6 +-
> > > >  meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  28 +--
> > > >  meta/recipes-support/curl/curl/disable-tests  |   2 +
> > > >  meta/recipes-support/curl/curl/run-ptest      |   2 +-
> > > >  scripts/lib/devtool/upgrade.py                |   2 +
> > > >  28 files changed, 366 insertions(+), 43 deletions(-)
> > > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/000=
1-avoid-start-failure-with-bind-user.patch (100%)
> > > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/000=
1-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
> > > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/bin=
d-ensure-searching-for-json-headers-searches-sysr.patch (100%)
> > > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/bin=
d9 (100%)
> > > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/con=
f.patch (100%)
> > > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/gen=
erate-rndc-key.sh (100%)
> > > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/ini=
t.d-add-support-for-read-only-rootfs.patch (100%)
> > > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/mak=
e-etc-initd-bind-stop-work.patch (100%)
> > > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/nam=
ed.service (100%)
> > > >  rename meta/recipes-connectivity/bind/{bind_9.18.16.bb =3D> bind_9=
.18.17.bb} (96%)
> > > >  rename meta/recipes-connectivity/openssh/{openssh_9.3p1.bb =3D> op=
enssh_9.3p2.bb} (98%)
> > > >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-2861.p=
atch
> > > >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3255.p=
atch
> > > >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3301.p=
atch
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > > >
> > > >
> >
> > >
> > >
> > >
> >
>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186398): https://lists.openembedded.org/g/openembedde=
d-core/message/186398
> Mute This Topic: https://lists.openembedded.org/mt/100761429/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

