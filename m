Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B8BC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 16:06:14 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.22501.1671638772150798955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 08:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HRnoJgwG;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id o8so8128706ilo.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 08:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjrO75c5EqXD62QZptwm1ukpkaf7+QJOq+V66P0gA2s=;
        b=HRnoJgwGcrvSiH9lxa2BS5KpEis+LM1d0QAMCFGvJ4+zhjwZcUFUYsAtfaJLShbr3E
         yzv1sgnTJpT8kP2KZg2Mt+PSUDx/74wTMFMFlDcCwoAphfGm0SwOih/wwkseXGOBY/La
         pe/W91V1Xajt7Wcw5qLmoXn+eFDu/guWx6cdTSpQ7W0zUA1RGpP+CdcutKxEt69WvJKr
         NqAFhVLfrjyoozzKDCRktrG5YoHjvFrLTMh399aMh0LmIu/urr4IBOec/ykp/Au+k3+r
         hp8EHs/BXZmb4rvUuOtD2hlcaVrEzb2XGQeKcR4u/d8Xo0ke+bslwzydcb3MIVTUBxvh
         xC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjrO75c5EqXD62QZptwm1ukpkaf7+QJOq+V66P0gA2s=;
        b=tmTGTB9LVo2h/76lN4bE82pV3Hv0OfKA+IbiJAFwnd5A25LRdE8xdeDkUuR5vbxFw4
         SsDL9V2R/hw+HiRKqGo9rJfusHTThCT0vKXQ6eLMFX9KmNkcou3ffo/UuTofoSO7uM1U
         GcJPgTDBApV24sP6rjwr1/gjNxOuUXFzjB856dgH5wI/6UHyi+gbzetxGcfBN5/GODQX
         Jt8rU0TUEWcZj5RFhcpnyAivhBtJyqsdyWS1V6j8d1YK9g90FOQPeCjw7hXDf3em+cuI
         143RgRpqxXpZOMk5u0OawqiTlF5lxGqcsNv/9ra70onu+0cxvdJkgsG4r0jfj5PeEbaD
         G8VQ==
X-Gm-Message-State: AFqh2kpMJWd7Ljd5+7rHMvyuPjd2N6cSH+AFykR9mS8MVdzR+iEstDyy
	E4a3VnyAN0bCFX1DmXJTCtV7KY0R/0vpwE5WokE=
X-Google-Smtp-Source: AMrXdXusYokQqUgZPZNeK2HFAZGRJ0HHC6/RyTezlMJHmwFDHGMngYjiKnbiEuiYAdsPrvX4PtT3TCd5yWLGz97nD0w=
X-Received: by 2002:a92:7f05:0:b0:305:e047:8dfd with SMTP id
 a5-20020a927f05000000b00305e0478dfdmr223777ild.263.1671638771485; Wed, 21 Dec
 2022 08:06:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671560768.git.bruce.ashfield@gmail.com> <Y6MtEWtI2N7AAlK0@mail.local>
In-Reply-To: <Y6MtEWtI2N7AAlK0@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Dec 2022 11:06:00 -0500
Message-ID: <CADkTA4O2ixC3HbL94Usw6cVHHabtnSiyK60Ch_PaqLJsB0UQ_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/9] kernel: consolidated pull request
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 16:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174919

On Wed, Dec 21, 2022 at 10:58 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Bruce,
>
> I think I applied everything properly and I end up with the following
> error for multiple architectures:
>
> stdio: ERROR: linux-yocto-5.15.78+gitAUTOINC+72756ee16d_24c30a8e9f-r0 do_=
kernel_version_sanity_check: Package Version (5.15.78+gitAUTOINC+72756ee16d=
_24c30a8e9f) does not match of kernel being built (5.15.84). Please update =
the PV variable to match the kernel source or set KERNEL_VERSION_SANITY_SKI=
P=3D"1" in your recipe.
> stdio: ERROR: linux-yocto-5.15.78+gitAUTOINC+72756ee16d_24c30a8e9f-r0 do_=
kernel_version_sanity_check: ExecutionError('/home/pokybuild/yocto-worker/q=
emuarm-alt/build/build/tmp/work/qemuarm-poky-linux-gnueabi/linux-yocto/5.15=
.78+gitAUTOINC+72756ee16d_24c30a8e9f-r0/temp/run.do_kernel_version_sanity_c=
heck.3360864', 1, None, None)
>

The kernels are released via script, so the sknew should never happen.

But looking at the series, I see what the issue is. I ran the script
against the yocto-bsps, versus oe-core, so it has jumped the version.

If you just drop the patch: linux-yocto/5.15: update to v5.15.84

I'll send a v2 of it shortly.

Bruce

> https://autobuilder.yoctoproject.org/typhoon/#builders/110/builds/5262/st=
eps/11/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#builders/131/builds/1756/st=
eps/12/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#builders/102/builds/3982/st=
eps/12/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#builders/107/builds/3957/st=
eps/11/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#builders/109/builds/5225/st=
eps/11/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#builders/101/builds/5156/st=
eps/11/logs/errors
>
>
> On 20/12/2022 13:42:01-0500, Bruce Ashfield wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Most of these are -stable udpates, mixed in are a couple of clang fixes
> > from Khem, and of course the bigger items of the libc-headers bump and
> > the v6.1 reference kernel recipes.
> >
> > I've built both musl and glibc for all architectures with the new libc
> > headers, and sent patches last week for issues that I found in core or
> > meta-oe.
> >
> > That being said, I'm sure there's something .. somewhere lurking, but
> > there's no sense sitting on it longer.
> >
> > As for the 6.1 reference kernel, I've done the same. Built and booted
> > core-image-minimal, sato and kernel dev on all architectures. The chang=
es
> > sent before the last release meant that our normal culprits of lttng-mo=
dules
> > and kernel-devsrc don't need any tweaking to work. -rt has also been
> > tested.
> >
> > We can't make 6.1 the default yet, as the reference h/w BSPs need to
> > be updated, and then 5.19 removed. But again, no sense sitting on these
> > longer.
> >
> > I'm around full time for the rest of this week, and then off and on
> > through the first week of January to squash any fallout from the
> > updates.
> >
> > Cheers,
> >
> > Bruce
> >
> > The following changes since commit ace02cec70a4a1bc9088044905b3c4a801a3=
9a1b:
> >
> >   systemd: Make importd depend on glib-2.0 again (2022-12-18 19:48:00 +=
0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.yoctoproject.org/poky-contrib zedd/kernel
> >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kerne=
l
> >
> > Bruce Ashfield (9):
> >   yocto-bsps/5.15: update to v5.15.78
> >   linux-yocto/5.15: update to v5.15.80
> >   linux-yocto/5.19: fix perf build with clang
> >   linux-yocto/5.15: ltp and squashfs fixes
> >   linux-libc-headers: bump to 6.1
> >   linux-yocto: introduce v6.1 reference kernel recipes
> >   linux-yocto/5.15: fix perf build with clang
> >   linux-yocto/5.15: update to v5.15.84
> >   linux-yocto/5.15: libbpf: Fix build warning on ref_ctr_off
> >
> >  .../linux/linux-yocto_5.15.bbappend           | 16 ++---
> >  meta/conf/distro/include/tcmode-default.inc   |  2 +-
> >  ...d-input-and-output-files-instead-of-.patch | 67 ------------------
> >  ...ders_5.19.bb =3D> linux-libc-headers_6.1.bb} |  5 +-
> >  .../linux/linux-yocto-rt_5.15.bb              |  4 +-
> >  .../linux/linux-yocto-rt_5.19.bb              |  4 +-
> >  .../linux/linux-yocto-rt_6.1.bb               | 45 ++++++++++++
> >  .../linux/linux-yocto-tiny_5.15.bb            |  4 +-
> >  .../linux/linux-yocto-tiny_5.19.bb            |  4 +-
> >  .../linux/linux-yocto-tiny_6.1.bb             | 30 ++++++++
> >  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++----
> >  meta/recipes-kernel/linux/linux-yocto_5.19.bb | 22 +++---
> >  meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 70 +++++++++++++++++++
> >  13 files changed, 187 insertions(+), 110 deletions(-)
> >  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-h=
eaders/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
> >  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.19=
.bb =3D> linux-libc-headers_6.1.bb} (70%)
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.1.bb
> >
> > --
> > 2.37.3
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#174873): https://lists.openembedded.org/g/openembed=
ded-core/message/174873
> > Mute This Topic: https://lists.openembedded.org/mt/95791763/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

