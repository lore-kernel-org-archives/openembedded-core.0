Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web09.10797.1607062938211472653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 22:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=N3zFK0Vh;
 spf=pass (domain: nathanrossi.com, ip: 209.85.210.65, mailfrom: nathan@nathanrossi.com)
Received: by mail-ot1-f65.google.com with SMTP id 11so4216119oty.9
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 22:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+9KRTZfy0B3aa0UUXF+ItMgsZAu66Kls2VwyiZeWfsA=;
        b=N3zFK0Vhe7MPrJ+CEibJ9jMgwtS8KThHS5/5rA1W3fszg9BcMUsj0qLgieA8LeburF
         X3Npe3z0ezZd4l+EqnfqhdfvGshIE5xFYWTCWcKZV5plIr+gjEyFGNq1AYADbUysb1sJ
         czyUgN+nYOWsZ1tpnCGg5CtkBLuceC4+W4dk4Yv0TgovNNbymASWqEsV7BX2MnSMnY0v
         oHgBPq7XLVLNV17liDNDEgOTqHwLcLRvWCv2X/ilRVmaytUtrzk6IO3UQOYinZshSHbS
         LyzdQHJXJpWNQkFKlmdXbgxunm4+ot5FRC3ljVlxam0NdKch4KQcIAsF7I4q3owKggBt
         z2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+9KRTZfy0B3aa0UUXF+ItMgsZAu66Kls2VwyiZeWfsA=;
        b=Tj90FvmStYbBMemTv4FqDZhBfzLXdGSrsQDq3z/LA9KNX2/GYjCJm1/nX34ZebajWw
         zIH8RhTkep02hbKfOLlP0yzU25VDkZ3WleElR31DuTzqqYuKuQ3IUOr/fcZl4Nc1dVb3
         wHSRh4mNG2fYmMDF/TrVecaH7BpDnmVO1IybGEKWakmR6J0jmt5jA0SSRfNARH5LdAP+
         q9H4wRlQ9mmseh/NgX3R66LuSDKq8SBIHAODLXPcjM2nR9IikhMWBKRAfqymjQoMYZQs
         d/DzF0ayb6B3ziZc7RlJotDtcyD3wF3f7VPUSjYmsPg56n6RWhiL9PDJIQxYb9QerLyx
         0KhA==
X-Gm-Message-State: AOAM532HAH/h/tKtKqW9LkdolB2/HtAkU4sqMjuRU5TRL3yLG7AtO8An
	rrshq7oTssgMwaGh/xjKfity/IGHjQ3D2tyMqWMvrQ==
X-Google-Smtp-Source: ABdhPJyuTpdjXiry2ZVY2zfSnrpvMsMesACjTkC6ppcE8HZJMsTZV5PI4GGTHD2qev4oT5XjVQUNb84n+Lk9VBujiIs=
X-Received: by 2002:a05:6830:2385:: with SMTP id l5mr2398066ots.321.1607062937392;
 Thu, 03 Dec 2020 22:22:17 -0800 (PST)
MIME-Version: 1.0
References: <bb945efa-f12d-6ff6-a783-8010269c9931@broadcom.com>
 <CA+aJhH20y3q84WkxfAb_-Dj2fpaankFD9VbskhyV8uPrQauPFQ@mail.gmail.com>
 <baf9a93e-188c-4c45-9ba5-b4d08a655564@broadcom.com> <CAHtQpK4jkSeJaWNuok13NhbD2Ghcd+DeVs5f23gSqoSaDh0Cbg@mail.gmail.com>
 <CA+aJhH3uckHaetL5b8wWWLEyExfQSFiBBykEeNd6=wUwcdSu1w@mail.gmail.com> <6de3791839a669b2c4fad3c347045a38e412a89d.camel@linuxfoundation.org>
In-Reply-To: <6de3791839a669b2c4fad3c347045a38e412a89d.camel@linuxfoundation.org>
From: "Nathan Rossi" <nathan@nathanrossi.com>
Date: Fri, 4 Dec 2020 16:22:06 +1000
Message-ID: <CA+aJhH3dnH5pb89SMSaORJ31p5TB_7+=+1K83MkfU5Ki4GE7xA@mail.gmail.com>
Subject: Re: [OE-core] commit breaks menuconfig on upstream kernel "cml1.bbclass: Handle ncurses-native being available via pkg-config"
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, Scott Branden <scott.branden@broadcom.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Dec 2020 at 14:58, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-12-04 at 10:53 +1000, Nathan Rossi wrote:
> > On Fri, 4 Dec 2020 at 08:31, Andrey Zhizhikin <andrey.z@gmail.com>
> > wrote:
> > > Hello Scott and Nathan,
> > >
> > > On Thu, Dec 3, 2020 at 7:18 PM Scott Branden via
> > > lists.openembedded.org
> > > <scott.branden=broadcom.com@lists.openembedded.org> wrote:
> > > >
> > > >
> > > > On 2020-12-02 4:19 p.m., Nathan Rossi wrote:
> > > > > On Thu, 3 Dec 2020 at 05:17, Scott Branden <
> > > > > scott.branden@broadcom.com> wrote:
> > > > > > Hi Nathan,
> > > > > >
> > > > > > Your commit:
> > > > > > "cml1.bbclass: Handle ncurses-native being available via pkg-
> > > > > > config"
> > > > > > https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=master-next&id=ce447d70df386ca55ce1672478b245851556374e
> > > > > >
> > > > > > breaks bitbake menuconfig when using the upstream kernel.
> > > > > Interesting. The purpose of the commit was to actually fix that
> > > > > exact
> > > > > use case since previously the mainline kernel menuconfig was
> > > > > relying
> > > > > on hardcoded paths to the host ncurses libraries.
> > > > >
> > > > > Would you be able to provide the error messages you are getting
> > > > > (and
> > > > > anything else that can help to reproduce the failure), because
> > > > > I am
> > > > > not able to reproduce any failures with a mainline kernel,
> > > > > linux-yocto
> > > > > (with and without the below mention patch) or with other
> > > > > projects that
> > > > > are using cml1 (e.g. u-boot).
> > > > >
> > > > > > It only works with the linux-yocto kernel due to this
> > > > > > workaround which is not upstream.
> > > > > > If you revert this commit in linux-yocto menuconfig will not
> > > > > > work in linux-yocto:
> > > > > > "menuconfig,mconf-cfg: Allow specification of ncurses
> > > > > > location"
> > > > > > https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/scripts/kconfig/mconf-cfg.sh?h=v5.8/standard/base&id=1714a5ad9cf61f4d0f4b8432f327cca2998aba77
> > > > > This change should not be required to have menuconfig working
> > > > > when
> > > > > pkg-config is used.
> > > > >
> > > > > > Seems like your commit needs to be reverted or a change made
> > > > > > to work with the upstream kernel.
> > > > > > Or, the linux-yocto change needs to actually be
> > > > > > upstreamed.  I submitted it and the upstream maintainer
> > > > > > questioned why the change is needed:
> > > > > > https://lore.kernel.org/lkml/CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com/
> > > > > The problem is if it was accepted, every kernel prior to its
> > > > > inclusion
> > > > > would need to be patched, as well as other projects (u-boot,
> > > > > busybox).
> > > > > This makes supporting menuconfig using that change for kconfig
> > > > > generically problematic. This is why the pkg-config solution is
> > > > > preferable.
> > >
> > > As I've already said before I had similar issues with doing
> > > menuconfig
> > > kernel task. I took a deeper look and actually found out that the
> > > recipe-sysroot-native/usr/lib/pkgconfig/ncursesw.pc in the kernel
> > > recipe build folder contained the absolute path to the ld, which
> > > for
> > > me was taken from the SSTATE_MIRROR produced on the CI system.
> > >
> > > The string inside ncursesw.pc looked like this (note the -Wl,
> > > --dynamic-linker):
> > > Libs:  -L${pcfiledir}/../../../usr/lib -Wl,--enable-new-dtags
> > > -Wl,-rpath-link,${pcfiledir}/../../../usr/lib
> > > -Wl,-rpath-link,${pcfiledir}/../../../lib
> > > -Wl,-rpath,${pcfiledir}/../../../usr/lib
> > > -Wl,-rpath,${pcfiledir}/../../../lib -Wl,-O1
> > > -Wl,--allow-shlib-undefined
> > > -Wl,--dynamic-linker=/teamcity/work/c3acfc3a6f255dcb/build-
> > > output/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> > > -lncursesw -ltinfo
> > >
> > > I then manually changed it to match the path on my local PC, and
> > > menuconfig went totally fine after that.
> > >
> > > Nathan,
> > > I tend to believe this issue is not caused directly by the patch
> > > committed, but rather by the fact that pkg-conf files do contain
> > > absolute paths pulled from shared state. At least this is what I've
> > > observed for my setup.
> >
> > That is indeed an issue with uninative/sstate, likely because
> > UNINATIVE_LOADER (which put into BUILD_LDFLAGS) is not covered by the
> > sstate pack/unpack path rewriting. But uninative already handles
> > rewriting interp as part of its sstate unpack function, maybe it
> > needs
> > to be updated to replace instances of LDFLAGS as well? Perhaps
> > Richard
> > has an opinion on this.
>
> I'd say that:
>
> a) .pc files are assumed to be correct and sstate is therefore probably
> not relocating paths in them
>
> b) paths like that should be triggering warnings about build paths in
> the .pc file. It might not be as sysroot-uninative is a bit of a
> special case we probably don't currently test for?

Just looking in the sysroot, it appears that for the kernel at least,
ncurses and python sysconfigdata are the only cases of the uninative
sysroot path being kept. Also the buildpath checks are only done for
package_qa and so are skipped for native correct? Should that be
improved so that native also does the buildpath checks?

>
> c) that flags should be unneeded, they'd be in BUILD_LDFLAGS if we
> needed them
>
> So I'm guessing we probably need to tweak the .pc file to better handle
> this corner case. Most libs don't inject LD_FLAGS into their .pc file
> that I know of...

Yes it looks like ncurses is unnecessarily adding LDFLAGS to the .pc.
Patching ncurses should resolve this problem.

Thanks,
Nathan
