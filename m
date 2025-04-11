Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C284C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 11:46:30 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.22717.1744367946980570195
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 03:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zuwEuxmU;
 spf=pass (domain: linaro.org, ip: 209.85.219.172, mailfrom: ilias.apalodimas@linaro.org)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e6dd991a0e6so1436803276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 03:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744367946; x=1744972746; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7nRRag6/bcMxmBNUIwyf4c702nqyFzCXc8bYlyHD+Pc=;
        b=zuwEuxmUp07dBikCG1V/xIkXq+D8s1RqL9tbBqnCL6lZavUmuheSryDV9ijar0eqgk
         JlfuIUBWQYQDAqZVRFgcNMTU3LQfmpSUU2LxE9KynRLr2sF86yO6kKoIvWW1llf2ULkz
         o43o2fgszP+so/B8dVr7gwkOkHaCNxB7bMANgT37DCTxB2/eNwmY2J2/wP6yjUV1l+Eh
         j+88GgtMFdtcmpEVBoDNXRddYyVx9G42+zWLPpL/2NLzh+0dTTew0pvDlPVMum4V1ejT
         W5y0okQvZ0YUO5ic1w34fT83/mvv9SsU5H3K8DjdEvgxpAPhR0oC9eAb7yKGGxsD35s2
         abyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744367946; x=1744972746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nRRag6/bcMxmBNUIwyf4c702nqyFzCXc8bYlyHD+Pc=;
        b=qXa/1R4P1HnTPheYlLEp11XNtsBm3BIApeXzsjdQDASW5Zla0GgBgUivgYjMCnYUKl
         jdLy6IptVXugEJ0rWgx+rZiiqTsPzURAEBe1t+5/d3Wl+OnLo/zWBEwbEmBrd6HsZRu8
         G87wgBw38EPsKngFH4SpvmBafL+ljeZoJ4wsN0vRoxin0dQi6dXylI7z9dug8gBPsT7V
         YXgJKFVQfdgMFX9rXs3kt2Xa0rqm0zpvk2qqXMFN3oeVtJ1QXHlEapfnmEEQc0xawf5g
         5hfnpMhNjDc2sj6SjKZ3FG986RDpwjr9J+CpjrA57px+2Ag5x+/ooaAI0EdKCPwLZ0uW
         lu2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7O5jkiz/mQC6/gFIlKMe8sU/zkO4pd6SbGVPsix5+scjCHWscQigIHI4wEImMxrntIKGOW13101QMFvIlUsyawQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxgoFEX956+Y5ztEDpjGRg5Yng1gxlyJsVycVP8eQ+Y11DuOFdW
	YAUgktLddIHm+a+Oiyz2Ec7BG2I4ooVHWJ9K0DhAjmetlDgL6nu51Hwi7P9sHFBKziavT+SxKfR
	OA3iFEZI4B3+IIF7majymwBYA6TSVYC0UXeIHQA==
X-Gm-Gg: ASbGncuGv/P3v3Gf4JjFMNoovnXw5bLLGMvAK2+arOgT9Kvkocx0J27iFqKr/udvymR
	1c8BEAk+Yw3M+dno8B3kCwm5Ct8bGOnwARK4a0d0x4y5ZF+4hk+J5ZT7W9LWHh59K+LTnpN9Bil
	DXW7AsKd2sxfS8rWIv9PpNzog=
X-Google-Smtp-Source: AGHT+IEs0nks+TTDrflgV1VAi7308GcUECS9Olqp0DAnLXqoAP0YtF+CQJHFo0CZBz2xUT9EMpsTfbLCFfCW2jIdrew=
X-Received: by 2002:a05:6902:2513:b0:e6d:ee8e:876c with SMTP id
 3f1490d57ef6-e704df8f948mr4254493276.43.1744367945925; Fri, 11 Apr 2025
 03:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
 <CAC_iWjJTuV=TcNYhSeyybaU8hr-b9sauJiYt3Jo8+wxYC_7eUQ@mail.gmail.com> <c7b639077c36c0bc3bdd3eb43f314b348cd2e3f8.camel@gmail.com>
In-Reply-To: <c7b639077c36c0bc3bdd3eb43f314b348cd2e3f8.camel@gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 11 Apr 2025 13:38:29 +0300
X-Gm-Features: ATxdqUGLrrqiCa-FfzjGLMNSlt3Zcj0znSVD--w9wBqYlWTVRrDlEpfNY2zzFWc
Message-ID: <CAC_iWj+SSsSDKHGKaLGUZEGKiWV0fxHXB+tN6-t9WJ9tZbQxKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, openembedded-core@lists.openembedded.org, 
	alex.kanavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 11:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214734

Hi Adrian

On Thu, 10 Apr 2025 at 23:53, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> On Thu, 2025-04-10 at 15:12 +0300, Ilias Apalodimas wrote:
> > Apologies for the noise, I forgot to add Adrian in CC
> >
> > On Thu, 10 Apr 2025 at 14:45, Ilias Apalodimas
> > <ilias.apalodimas@linaro.org> wrote:
> > >
> > > Hi Adrian
> > >
> > > On Thu, 10 Apr 2025 at 14:21, Adrian Freihofer
> > > <mikko.rapeli@linaro.org> wrote:
> > > >
> > > > Hi Mikko
> > > >
> > > > On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> > > > lists.openembedded.org wrote:
> > > > > For example genericarm64 enables "efi" in MACHINE_FEATURES
> > > > > and in u-boot. Boot without "efi" in systemd works with
> > > > > EFI protocols but for example efivars is not mounted at
> > > > > all so various checks fail in userspace. Fix these by
> > > > > enabling "efi" support by default to avoid making
> > > > > it machine specific. Fixes efivars mount to
> > > > > /sys/firmware/efi/efivars etc.
> > > >
> > > > My point is that many OE/Yocto-based embedded products rely on a
> > > > fully
> > > > redundant and power fail-safe firmware update and boot
> > > > implementation.
> > > > So far I have not understood how this could be implemented in a
> > > > similarly robust way based on EFI as we have now without EFI-
> > > > based
> > > > boot-up.
> > >
> > > As far as the firmware updates are concerned there's [0], which is
> > > also implemented in U-Boot.
> > > But even in that case, I am not sure I understand your concerns.
> > > What
> > > prevents you from having the existing mechanisms for firmware
> > > updates
> > > on a system that boots with EFI?
>
> Many thanks for the link.

yw

> Yes, that basically describes how it should
> be. But is there such a thing in reality?

Yes it actually works for some boards in U-Boot and people are
shipping it. I am also discussing with the fwupd maintainers on how to
make it seamless in the future.

The Socionext Synquacer and some ST (stmp32mp1) are the ones I
remember. We definitely want to add more boards.

> The discussion here doesn't
> really convince me that EFI is already the proven easy way to build
> robust and maintainable embedded systems.

Again, I'll limit the discussion in U-Boot -- if there are other EFI
implementations you are worried about, feel free to add them.
UEFI has a weird learning curve, I understand that but it standardizes
a few things that people are struggling with and that's why distros
use it.
I don't know if that's useful for vertical distros -- but the ability
to boot the same OS across many different devices is appealing to some
vendors. It also tries to standardize security and most notably Secure
Boot and measured boot which is  a usual headache.  There's still a
vendor specific bit in there on how to setup your chain of trust, but
once you reach BL33( the efi loader) everything looks identical.
U-Boot nowadays is pretty complete. You can literally install a distro
using its installer either via putting the installer on a disk or
doing it over HTTP.
There are some kernel module requirements for the latter, but AFAIK
debian and the latest fedora42 already support the modules (notably
OF_PMEM).

> I understand why many people
> are working towards EFI. But I still see great advantages in simpler
> and available (in the sense of power-fail, robust) technologies for
> many use cases today.

Fair enough. However, what I am trying to say here is with or without
EFI i am not aware of any limitations. In fact most of the arch
kernels build with EFI support enabled by default.
IOW, no one *forces* you to use capsule updates to update your
firmware or use EFI to boot your system.

>
> Anyway, my intention is not to start a controversial discussion about
> EFI or SystemReady. My intention is to ensure that building systems
> without disadvantages caused by the "EFI by default strategy" remains
> possible and ideally also tested. As long as that is the case, I fully
> agree with the patch.

Understood and as I said, I don't think it will break anything -- and
if it does, we should just fix it because in principle it shouldn't.

>
> > >
> > > >  I would therefore like to see the EFI implementation remain
> > > > opt-in until it covers at least the most important use cases for
> > > > robust
> > > > embedded systems. What I primarily miss with EFI is a reference
> > > > implementation for an A/B update system without having to rely on
> > > > a FAT
> > > > partition without journaling. Please correct me if I'm missing
> > > > something!
> > >
> > > Where does the FAT partition requirement come from?
> > >
> > > >
> > > > Would it make sense to declare poky as an EFI ready reference
> > > > distribution by enabling the efi DISTRO_FEATURE there, rather
> > > > than
> > > > starting with making recipes enabling efi unconditionally?
> > > >
> > > > Could something like this in poky.conf work?
> > > > DISTRO_FEATURES:append:aarch64 = " efi"
> > > > DISTRO_FEATURES:append:riscv64 = " efi"
> > > > DISTRO_FEATURES:append:x86-64 = " efi"
>
> I was thinking about making this ARCH specific because:
> - Defaulting to the most typical and use cases
> - Keep a test matrix on the AB which builds systemd without efi
> - ARCH specific is not an issue like MACHINE specific would be
> - Having this policy in the distro seams more logical to me than in a
> generic package.
>
> But as I said, if the disadvantages of building with efi are negligible
> for users without EFI use cases, then even better.

Agreed.

Thanks
/Ilias
>
> Thank you and regards,
> Adrian
>
> > >
> > > [0]
> > > https://github.com/ARM-software/edge-iot-arch-guide/blob/main/source/FWU/MBFW/chapter1-introduction.md
> > >
> > > Thanks
> > > /Ilias
> > > >
> > > > Thank you and regards,
> > > > Adrian
> > > >
> > > > >
> > > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > > ---
> > > > >  meta/recipes-core/systemd/systemd_257.4.bb | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/recipes-core/systemd/systemd_257.4.bb
> > > > > b/meta/recipes-core/systemd/systemd_257.4.bb
> > > > > index 64fb8fe69a..06e5621398 100644
> > > > > --- a/meta/recipes-core/systemd/systemd_257.4.bb
> > > > > +++ b/meta/recipes-core/systemd/systemd_257.4.bb
> > > > > @@ -68,13 +68,14 @@ PAM_PLUGINS = " \
> > > > >  "
> > > > >
> > > > >  PACKAGECONFIG ??= " \
> > > > > -    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor
> > > > > efi
> > > > > ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> > > > > +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor
> > > > > ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> > > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo',
> > > > > 'coredump elfutils', '', d)} \
> > > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill',
> > > > > '',
> > > > > d)} \
> > > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> > > > > 'xkbcommon', '',
> > > > > d)} \
> > > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit',
> > > > > 'sysvinit',
> > > > > 'link-udev-shared', d)} \
> > > > >      backlight \
> > > > >      binfmt \
> > > > > +    efi \
> > > > >      gshadow \
> > > > >      hibernate \
> > > > >      hostnamed \
> > > > >
> > > > > 
> > > > >
> > > >
>

