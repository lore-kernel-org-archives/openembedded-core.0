Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web08.7335.1607043217807413284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 16:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=Vf+a5AI3;
 spf=pass (domain: nathanrossi.com, ip: 209.85.210.67, mailfrom: nathan@nathanrossi.com)
Received: by mail-ot1-f67.google.com with SMTP id 11so3673232oty.9
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 16:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ucZ0gvNkFVCcE6nfLDVFKVyThmEdi2bOZsezEPRiCms=;
        b=Vf+a5AI3WZGAclfnN/940w4aDyK27eSeJYZ9cg5dWdNg9f8moEft5CcVB/k71MrqSg
         whg/4iWMnZ13rr5S8RPpytGfgOiSD5pPyvtCrj3rQArmEEYpZ5paeFb16kuTOJpzt+dR
         4F1ZvW5BIKuSEmTl58bfnwdzBRmKRd+Gusv45U7vPEk+t99gFhmPVxTXfQ5PWhBERDq8
         HXVPYbZGAEYKYh4yliWEKjip9a8IyAzwGL/SJS8VNGASR9FUoc0NhwwizVM97Gr1zy7C
         MkufnfrxbvylnUX0WDHaGY+fGBCfdFrmmf6hF477kucTnT7Kr2PdX00YKHvFBNOAbUxz
         u8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ucZ0gvNkFVCcE6nfLDVFKVyThmEdi2bOZsezEPRiCms=;
        b=OgKCep1sIQcOVVg+fENzQwSVrC5bxlOeOowsor/4AJHAq95SCLQqSm5XVMlpU3eFO1
         HeORUxLloC6icb6lRELDFmrtSPhAyFroXHV7N0Fkpk48oRHnJKFgC6UyEroNQMaMjeNy
         LO9apvMtje4SJBQUXhuohHoEdwjIbfeVKa29zsjwsnIOUoqrmwg5kr3wyp/osi/0F/0b
         sl2wmiaDOoKNd9f83XSA8NgaLwg1xSKhN1csNxq9uBsxkbMoT9fzPgZ1LG/RXDiTlID4
         JIt/q50uMaGbHRyJbbtnvSL9ZzLvjX8xR1BenlF2FiVnAhHVlNgh5PysSDqxLJY8s3lq
         tdtA==
X-Gm-Message-State: AOAM532ngqabkkXRQWRd20vT23NijuKt5nssm/KwQpbMS9GBIbdSHNyd
	jNKtkOdv1pdWkZ7Lo1ZH/9vU9hPii+BPUpxM1GhCow==
X-Google-Smtp-Source: ABdhPJxCBzSjxFmUyVoBY/4G6UXxTjN+gDTBicLff77l1UnqomjrR9FAJCWxcSZ/ddSSYefvTsSf92t9A/9Squla6Rs=
X-Received: by 2002:a05:6830:2385:: with SMTP id l5mr1578850ots.321.1607043217104;
 Thu, 03 Dec 2020 16:53:37 -0800 (PST)
MIME-Version: 1.0
References: <bb945efa-f12d-6ff6-a783-8010269c9931@broadcom.com>
 <CA+aJhH20y3q84WkxfAb_-Dj2fpaankFD9VbskhyV8uPrQauPFQ@mail.gmail.com>
 <baf9a93e-188c-4c45-9ba5-b4d08a655564@broadcom.com> <CAHtQpK4jkSeJaWNuok13NhbD2Ghcd+DeVs5f23gSqoSaDh0Cbg@mail.gmail.com>
In-Reply-To: <CAHtQpK4jkSeJaWNuok13NhbD2Ghcd+DeVs5f23gSqoSaDh0Cbg@mail.gmail.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
Date: Fri, 4 Dec 2020 10:53:25 +1000
Message-ID: <CA+aJhH3uckHaetL5b8wWWLEyExfQSFiBBykEeNd6=wUwcdSu1w@mail.gmail.com>
Subject: Re: [OE-core] commit breaks menuconfig on upstream kernel "cml1.bbclass: Handle ncurses-native being available via pkg-config"
To: Andrey Zhizhikin <andrey.z@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Scott Branden <scott.branden@broadcom.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Dec 2020 at 08:31, Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Hello Scott and Nathan,
>
> On Thu, Dec 3, 2020 at 7:18 PM Scott Branden via
> lists.openembedded.org
> <scott.branden=broadcom.com@lists.openembedded.org> wrote:
> >
> >
> >
> > On 2020-12-02 4:19 p.m., Nathan Rossi wrote:
> > > On Thu, 3 Dec 2020 at 05:17, Scott Branden <scott.branden@broadcom.com> wrote:
> > >> Hi Nathan,
> > >>
> > >> Your commit:
> > >> "cml1.bbclass: Handle ncurses-native being available via pkg-config"
> > >> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=master-next&id=ce447d70df386ca55ce1672478b245851556374e
> > >>
> > >> breaks bitbake menuconfig when using the upstream kernel.
> > > Interesting. The purpose of the commit was to actually fix that exact
> > > use case since previously the mainline kernel menuconfig was relying
> > > on hardcoded paths to the host ncurses libraries.
> > >
> > > Would you be able to provide the error messages you are getting (and
> > > anything else that can help to reproduce the failure), because I am
> > > not able to reproduce any failures with a mainline kernel, linux-yocto
> > > (with and without the below mention patch) or with other projects that
> > > are using cml1 (e.g. u-boot).
> > >
> > >> It only works with the linux-yocto kernel due to this workaround which is not upstream.
> > >> If you revert this commit in linux-yocto menuconfig will not work in linux-yocto:
> > >> "menuconfig,mconf-cfg: Allow specification of ncurses location"
> > >> https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/scripts/kconfig/mconf-cfg.sh?h=v5.8/standard/base&id=1714a5ad9cf61f4d0f4b8432f327cca2998aba77
> > > This change should not be required to have menuconfig working when
> > > pkg-config is used.
> > >
> > >>
> > >> Seems like your commit needs to be reverted or a change made to work with the upstream kernel.
> > >> Or, the linux-yocto change needs to actually be upstreamed.  I submitted it and the upstream maintainer questioned why the change is needed:
> > >> https://lore.kernel.org/lkml/CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com/
> > > The problem is if it was accepted, every kernel prior to its inclusion
> > > would need to be patched, as well as other projects (u-boot, busybox).
> > > This makes supporting menuconfig using that change for kconfig
> > > generically problematic. This is why the pkg-config solution is
> > > preferable.
>
> As I've already said before I had similar issues with doing menuconfig
> kernel task. I took a deeper look and actually found out that the
> recipe-sysroot-native/usr/lib/pkgconfig/ncursesw.pc in the kernel
> recipe build folder contained the absolute path to the ld, which for
> me was taken from the SSTATE_MIRROR produced on the CI system.
>
> The string inside ncursesw.pc looked like this (note the -Wl,--dynamic-linker):
> Libs:  -L${pcfiledir}/../../../usr/lib -Wl,--enable-new-dtags
> -Wl,-rpath-link,${pcfiledir}/../../../usr/lib
> -Wl,-rpath-link,${pcfiledir}/../../../lib
> -Wl,-rpath,${pcfiledir}/../../../usr/lib
> -Wl,-rpath,${pcfiledir}/../../../lib -Wl,-O1
> -Wl,--allow-shlib-undefined
> -Wl,--dynamic-linker=/teamcity/work/c3acfc3a6f255dcb/build-output/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> -lncursesw -ltinfo
>
> I then manually changed it to match the path on my local PC, and
> menuconfig went totally fine after that.
>
> Nathan,
> I tend to believe this issue is not caused directly by the patch
> committed, but rather by the fact that pkg-conf files do contain
> absolute paths pulled from shared state. At least this is what I've
> observed for my setup.

That is indeed an issue with uninative/sstate, likely because
UNINATIVE_LOADER (which put into BUILD_LDFLAGS) is not covered by the
sstate pack/unpack path rewriting. But uninative already handles
rewriting interp as part of its sstate unpack function, maybe it needs
to be updated to replace instances of LDFLAGS as well? Perhaps Richard
has an opinion on this.

Regards,
Nathan

>
> Scott,
> Can you have a look at the content of your <path to kernel build
> folder>/recipe-sysroot-native/usr/lib/pkgconfig/ncursesw.pc and check
> if you have the absolute ld path there, which does not match you build
> folder?
>
> > The kernel works with menuconfig without your yocto change today.
> > Only linux-yocto (with the patch mentioned above) works with your yocto change.
> > >
> > > Regards,
> > > Nathan
> >
> >
> > 
> >
>
>
> --
> Regards,
> Andrey.
