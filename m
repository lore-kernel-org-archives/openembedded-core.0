Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.10391.1612364424446755901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 07:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KM3avNnO;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id b9so16666351ejy.12
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 07:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=psfL5WbvoNbAtW8dWLJ/EoaAZMuzYq7anFpHtvqxgYg=;
        b=KM3avNnOqBa9oPegf+pg7k0kg2aGmtQnknzFFZvWFEjkIHH4wzPvxuJo/b2pDQyETQ
         vWJmTpk8dOQoPU2LFDmWiht6TK7lP2Yd6RpoxdtGUZftEPli1xrZPLta9oY1/lSKCPW7
         M8kDTNqrfeY9eYLCk82YtdJpHLc979BW6TpNjgm2fNtBw08Ete6/79ZGk0An1Ko05zeR
         7bcvG71UyqdJQIG2IzUmDRpj3s7o9vvTmeqfFFQN52FdkVSX0GdPCPJTLSDviDlFqy1l
         019zP4qyAmj47qiQZ4m9YpIPvmk5jPwBFT4Ernxp0NQueXjTpbQx/BJzWSzUHBfI8qII
         IJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=psfL5WbvoNbAtW8dWLJ/EoaAZMuzYq7anFpHtvqxgYg=;
        b=dXysNv/PXeDsU+3WcoqB9lgevVPGqZ8xiEWmAnUI9tIBpJlibOBv/cNYEQceLuEXvv
         ZIhyONb+pvXR322ulpKBH7TJa4F/tu3Axp8uuVf6pPpns+YJnSSN9Cp1eEi+O6VmWxxT
         JQ/+7JwBtTS9NXsme+PEP5ZiKo+t652CGG7ezQAH4P1daElgKRFnd+D5TT+yqB2wy6Ut
         Id255ffOzC96vSsARTuvkC7EsZwHM7G0rypjFrmtqk727A1mSR5XvDds//OPCm8vCDmO
         UUhFrGbtmJwrEhPCCrlXhRumTf2Usb1949iPDWDECRONITj0TVLfKrx70mx/adS6phXp
         e6oA==
X-Gm-Message-State: AOAM53176xU+cOJjagz1WHaOaTPkwvk37NuGXn2Ydepp+QufqYavGZLf
	KZq1J3Dld49uvGuoVwcftQRhYCt+X+U9YT30was=
X-Google-Smtp-Source: ABdhPJz5dZC78TyYS/mu8JBDgMaNAH3cW/746CvaFcalWddcMNQ1sFSTetLOOI3vzAesakTr5yPPcoorXlk4lMVlo0Q=
X-Received: by 2002:a17:906:b50:: with SMTP id v16mr3413483ejg.298.1612364417796;
 Wed, 03 Feb 2021 07:00:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612322536.git.bruce.ashfield@gmail.com>
 <9da75cbd42a281f7c06bda22c3765966fe9a9ca3.1612322536.git.bruce.ashfield@gmail.com>
 <67021164a90fc306800636a55aec26a69eca033d.camel@linuxfoundation.org>
In-Reply-To: <67021164a90fc306800636a55aec26a69eca033d.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 3 Feb 2021 10:00:06 -0500
Message-ID: <CADkTA4Peo1KBg+GeikvJcSgMfrqPvT08BwdrcV9xM92SYYOUNw@mail.gmail.com>
Subject: Re: [PATCH 8/8] linux-yocto/5.10: binutils 2.36 fixues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 3, 2021 at 9:39 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2021-02-02 at 22:24 -0500, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Integrating the following commit(s) to linux-yocto/5.10:
> >
> >     cdca78778415 objtool: Fix seg fault with Clang non-section symbols
> >     d3287798bd88 x86/entry: Emit a symbol for register restoring thunk
> >
> > With these, build issues with binutils 2.36 are resolved
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  .../linux/linux-yocto-rt_5.10.bb               |  2 +-
> >  .../linux/linux-yocto-tiny_5.10.bb             |  4 ++--
> >  meta/recipes-kernel/linux/linux-yocto_5.10.bb  | 18 +++++++++---------
> >  3 files changed, 12 insertions(+), 12 deletions(-)
>
> Thanks. I think to catch all the binutils issues, we need to also
> update genericx86-64:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/3016
>
> but otherwise looks good.

I just bumped all of the reference board SRCREVs and sent the patch.

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
