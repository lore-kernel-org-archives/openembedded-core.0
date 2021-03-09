Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web08.1357.1615332852384296269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 15:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kSNBJ/Iw;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id r3so22053109lfc.13
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 15:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LFci3hwrGaBlX+iZvItTinBSQe5L1By6d6SMQcAv18c=;
        b=kSNBJ/Iwm5ydTedomAETakCMCGmbmdoCP93Z6ly7Fny43fkJlRXVnO7bYkdN+RNGIQ
         fpUKp7ONCJYQNeZXDMWxIHdMQuftPbP+NjRFPsiqGCOq5CpsVDVPE5uV+MD2AEN3lgvb
         XxqmNdtrKwIqmTCDzEv946D8U3iuTofye8IJdn+a2j32IFVaKWqBL6MpPXL4Qlmp3E9g
         /AywI4mCughdopr6AALgozdS8p8Erra6/SMAxoN/qZSLBHykOescgDhCe3MnzQSZ6ecm
         cXzUIuU8PTDr2LnvOIh07gkdbZhSzootim8AOkFO8gy4ablCVD5VDAIXrerlMGWAfmGH
         8VSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LFci3hwrGaBlX+iZvItTinBSQe5L1By6d6SMQcAv18c=;
        b=NNL7wGLIfoXt0ZWDVOBZPv5yS73Dc+T6nGvLkDIAkJPPeOCj1mPwN6Sk4mla+hszaU
         nSYmsyT0zyyFe51uuecKiohK1NMerjS8f5Rl/SPkMDnXosQht1BiNBV7zKvPO0NlI+di
         3zUBt68Z3DCTx0lioZyDK0z83GjQ5jfG7mYBGj3LFkCKC7tJcHL22Ex6sA/M4HZgsXAc
         yKATRFp5zunJvR7b3KlueZTs8YWySR089x39pFSJ1ZJ0wJ7moMKRXG3561xR3yh3kB7f
         7gnHuhYZ/dhTMh7vpc92Xl0KtkUiPb03IQ+2lFUesvy1MhV2nkg/GO7poCofmuPbLxpD
         1sWA==
X-Gm-Message-State: AOAM533NuBEWvio1G9WOoLpssv0uSuL1NXwIWU0kCI5l9phxKbVg+twV
	0EiAVEP0g4XI6edbSkT/eT9ai9l02CHNv4HISCk=
X-Google-Smtp-Source: ABdhPJzd3lmAipDpEWQeGzUb0TpMTteMJgONyy3rB1+o6LxJ3P1nSMSuZ3YgKDCe1VixfsBnxBMc9YFqgyGRPeGgvI4=
X-Received: by 2002:a05:6512:3081:: with SMTP id z1mr261960lfd.257.1615332850669;
 Tue, 09 Mar 2021 15:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20210308193028.34418-1-raj.khem@gmail.com> <CAJ86T=WW59ZDOpvgEQXRCqwnJKCKpmVsUeFVPk8kUC5m8zCz=g@mail.gmail.com>
 <2a597a00-fbc0-470e-0f43-1d710c74aeaa@gmail.com> <CAJ86T=UbEJ730gFbj=WtrGUO2=6+bbgHpuxcuSChV6uGxve3-Q@mail.gmail.com>
 <71abca0e-fcf6-ecc3-ed79-d2269364884b@gmail.com> <1398197321.1706949.1615303386483@mail.yahoo.com>
In-Reply-To: <1398197321.1706949.1615303386483@mail.yahoo.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 9 Mar 2021 15:33:59 -0800
Message-ID: <CAJ86T=V-MRtK81ZXRG=Ry0YKt3MgBZu9C4TpCghbc5--Ng3McQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] resolvconf: add missing dependencies to RDEPENDS
To: Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 9, 2021 at 7:23 AM Frans Meulenbroeks
<fransmeulenbroeks@yahoo.com> wrote:
>
> Freaking yahoo email seems to have no option any more to quote decently.
> Guess it is time for a new email provider :-)
> Anyway my response below prefixed with FM:
>
> Op dinsdag 9 maart 2021 00:26:05 CET schreef Khem Raj <raj.khem@gmail.com>:
> On 3/8/21 2:25 PM, Andre McCurdy wrote:
> > On Mon, Mar 8, 2021 at 2:15 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On 3/8/21 2:11 PM, Andre McCurdy wrote:
> >>> On Mon, Mar 8, 2021 at 11:30 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>>>
> >>>> From: Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
> >>>>
> >>>> resolvconf uses flock and readlink.
> >>>> So explicitly added dependencies on util-linux (for flock) and coreutils
> >>>> (for readlink).
> >>>> Note that the options used with flock and readlink are not part of the
> >>>> busybox implementations so full-fledged implementations are needed.
> >>>>
> >>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>> ---
> >>>>    meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
> >>>> index 6df96b699c..6da8cd6023 100644
> >>>> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
> >>>> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
> >>>> @@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
> >>>>    LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
> >>>>    AUTHOR = "Thomas Hood"
> >>>>    HOMEPAGE = "http://packages.debian.org/resolvconf"
> >>>> -RDEPENDS_${PN} = "bash"
> >>>> +RDEPENDS_${PN} = "bash coreutils util-linux"
> >>>
> >>> util-linux-flock has its own package.
> >>
> >> yeah and busybox also provides flock too. Lets drop it
> >
> > Busybox provides flock, but it doesn't support the -w option (wait
> > with timeout). Either the util-linux flock is required or resolvconf
> > needs to be patched to drop the -w option.
>
> right, its to explore possibilities to avoid the deps.
>
> FM: While I am all in favor of avoiding these dependencies, I'm not versed enough in the resolvconf code to judge the impact of dropping -w, so my preference would be to depend on util-linux-flock.

Agreed. Adding a runtime dependency on util-linux-flock is the safest fix.

> >>> Patching resolvconf to use readlink -f (instead of readlink -m) should
> >>> be sufficient to allow it to work with busybox readlink.
>
> FM: this will most likely work. I can make a patch for that, no problem.

For reference, there's a patch which does that here:

  https://github.com/lgirdk/meta-mng/blob/ofw/recipes-misc/resolvconf/resolvconf/0001-try-to-support-busybox-readlink.patch

> >>>>    SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
> >>>>              file://fix-path-for-busybox.patch \
> >>>> --
> >>>> 2.30.1
>
> On a general note: in the current form the package is broken, so some fix is desirable.

Agreed.
