Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.5246.1607034716376301843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 14:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AWKLTPQW;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id l11so5100063lfg.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 14:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z8YRDONMqN5LmxHrbTYk29XJIEd6W8RGA4wvwJhfHOc=;
        b=AWKLTPQWHgYJFjQrdYX8hCPtTmlrlz0pqysS2sh1/qcZc6TKLwBS5OHA2oNcDLDZpT
         qokpPyN5QpvLmT4Q/PICQ8Lv8LCm7uHPr7Xxp4jj+BIOVyeyWTozJJqJcgXDvXaLHgyn
         cA+ygeyaRisMPgsavVfdWHKle+re9hA5bZOGw3xYQAu6tT5TeRaxWGvBmln4YqJdYkub
         h5lHKOEBkl8cM9pJJauYbdGqAQUsA5wjEKabp0vS3JymznovDcZnxTbDC1LVhs5ITo7b
         S8FEMN1hiwbM+gOb2zV+UddQW/tvWcbrJ60ZN/bPxc0HY9hNAYG148MIb8xfFhj4Gcq8
         T6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z8YRDONMqN5LmxHrbTYk29XJIEd6W8RGA4wvwJhfHOc=;
        b=BhNTfWiV2qc9RiGPWmWOBCyCTkKY0HoUcB5F2Z39EEd5Ce4SdrJrhMsSkTVsxOMeJC
         8gelVqIV9bF1xVH/VLHVY9LUnySYxhmdTghofV9sCV3Fz58QVMWpFe9gor5bDlUMgGHe
         HYnv76TZ79nOr1Q2frHXOozMdfgNuF7ZWNoqFPnq6kCuxM1v41lmMYbtGjrgY7s7RikE
         eSj/aaeErNCFvKItVN3SgGywdYiRKwvVipl+aZEHMKraShKYXqTASJdijaMzVbZrmw3N
         Zx3WUv/BkkGa8ZPxj/k148ZffneXe1/mm63NbeA/+pt3dK2FCfeNkaRFEe8waPm8vV1S
         JY4w==
X-Gm-Message-State: AOAM531oaMcxxi0vGh7aEFdDk8z64kHKM3UX3UiRVhIbMJKwobEcDPOv
	ePzHM7X18T6UViEMdNaCloFKtdveOtdwGUpDMDY=
X-Google-Smtp-Source: ABdhPJzd/JI3dgGsWgfzqWG5+ur1B6fbFPK+LX+vOoU0xsQumVJv0W8vAMIm6vFW2bkz3iHXW2wAHRwdIQwfEiiRPh8=
X-Received: by 2002:a19:c21a:: with SMTP id l26mr2365118lfc.590.1607034714313;
 Thu, 03 Dec 2020 14:31:54 -0800 (PST)
MIME-Version: 1.0
References: <bb945efa-f12d-6ff6-a783-8010269c9931@broadcom.com>
 <CA+aJhH20y3q84WkxfAb_-Dj2fpaankFD9VbskhyV8uPrQauPFQ@mail.gmail.com> <baf9a93e-188c-4c45-9ba5-b4d08a655564@broadcom.com>
In-Reply-To: <baf9a93e-188c-4c45-9ba5-b4d08a655564@broadcom.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Thu, 3 Dec 2020 23:31:43 +0100
Message-ID: <CAHtQpK4jkSeJaWNuok13NhbD2Ghcd+DeVs5f23gSqoSaDh0Cbg@mail.gmail.com>
Subject: Re: [OE-core] commit breaks menuconfig on upstream kernel "cml1.bbclass: Handle ncurses-native being available via pkg-config"
To: Scott Branden <scott.branden@broadcom.com>
Cc: Nathan Rossi <nathan@nathanrossi.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hello Scott and Nathan,

On Thu, Dec 3, 2020 at 7:18 PM Scott Branden via
lists.openembedded.org
<scott.branden=broadcom.com@lists.openembedded.org> wrote:
>
>
>
> On 2020-12-02 4:19 p.m., Nathan Rossi wrote:
> > On Thu, 3 Dec 2020 at 05:17, Scott Branden <scott.branden@broadcom.com> wrote:
> >> Hi Nathan,
> >>
> >> Your commit:
> >> "cml1.bbclass: Handle ncurses-native being available via pkg-config"
> >> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=master-next&id=ce447d70df386ca55ce1672478b245851556374e
> >>
> >> breaks bitbake menuconfig when using the upstream kernel.
> > Interesting. The purpose of the commit was to actually fix that exact
> > use case since previously the mainline kernel menuconfig was relying
> > on hardcoded paths to the host ncurses libraries.
> >
> > Would you be able to provide the error messages you are getting (and
> > anything else that can help to reproduce the failure), because I am
> > not able to reproduce any failures with a mainline kernel, linux-yocto
> > (with and without the below mention patch) or with other projects that
> > are using cml1 (e.g. u-boot).
> >
> >> It only works with the linux-yocto kernel due to this workaround which is not upstream.
> >> If you revert this commit in linux-yocto menuconfig will not work in linux-yocto:
> >> "menuconfig,mconf-cfg: Allow specification of ncurses location"
> >> https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/scripts/kconfig/mconf-cfg.sh?h=v5.8/standard/base&id=1714a5ad9cf61f4d0f4b8432f327cca2998aba77
> > This change should not be required to have menuconfig working when
> > pkg-config is used.
> >
> >>
> >> Seems like your commit needs to be reverted or a change made to work with the upstream kernel.
> >> Or, the linux-yocto change needs to actually be upstreamed.  I submitted it and the upstream maintainer questioned why the change is needed:
> >> https://lore.kernel.org/lkml/CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com/
> > The problem is if it was accepted, every kernel prior to its inclusion
> > would need to be patched, as well as other projects (u-boot, busybox).
> > This makes supporting menuconfig using that change for kconfig
> > generically problematic. This is why the pkg-config solution is
> > preferable.

As I've already said before I had similar issues with doing menuconfig
kernel task. I took a deeper look and actually found out that the
recipe-sysroot-native/usr/lib/pkgconfig/ncursesw.pc in the kernel
recipe build folder contained the absolute path to the ld, which for
me was taken from the SSTATE_MIRROR produced on the CI system.

The string inside ncursesw.pc looked like this (note the -Wl,--dynamic-linker):
Libs:  -L${pcfiledir}/../../../usr/lib -Wl,--enable-new-dtags
-Wl,-rpath-link,${pcfiledir}/../../../usr/lib
-Wl,-rpath-link,${pcfiledir}/../../../lib
-Wl,-rpath,${pcfiledir}/../../../usr/lib
-Wl,-rpath,${pcfiledir}/../../../lib -Wl,-O1
-Wl,--allow-shlib-undefined
-Wl,--dynamic-linker=/teamcity/work/c3acfc3a6f255dcb/build-output/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
-lncursesw -ltinfo

I then manually changed it to match the path on my local PC, and
menuconfig went totally fine after that.

Nathan,
I tend to believe this issue is not caused directly by the patch
committed, but rather by the fact that pkg-conf files do contain
absolute paths pulled from shared state. At least this is what I've
observed for my setup.

Scott,
Can you have a look at the content of your <path to kernel build
folder>/recipe-sysroot-native/usr/lib/pkgconfig/ncursesw.pc and check
if you have the absolute ld path there, which does not match you build
folder?

> The kernel works with menuconfig without your yocto change today.
> Only linux-yocto (with the patch mentioned above) works with your yocto change.
> >
> > Regards,
> > Nathan
>
>
> 
>


-- 
Regards,
Andrey.
