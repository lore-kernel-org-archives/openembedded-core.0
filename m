Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.12118.1585923861140019721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 07:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K9dw1eR0;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id z24so6563888qtu.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1YgDZJvelI08zjcR3m87roQMXW/ez1NdlqHWmE4JtcY=;
        b=K9dw1eR0F1mDhEfIIADSffGGSbVeH3Es8cUb6agWNJQrX6ZgBr+AXhZQ6kyuEZtO8Z
         WQU/C4OanVvWQorZ2rWfcnwb/bJz32g7tuZ2hQmpD2aqdbNYNrBsPWe/rxtLQNCbvET1
         ngGzM1Yf4hlREpNbj3f8jdBY/G/db7QOOu5CKqqDMX8LJRGjdwgTe8U9WIVvOMYZ2UFy
         5aGD19776Jre7XKpHIMhCgqsF7pMwA3f3RIMSONXfLB1C73whpXA0BeI8Ti8PoPggaRs
         A8GprGTyqDsl0aQkZ/XK29sdAFhcfLJEoPoL6BNzaUeTHVc6GaDEgwGNR45ZQ2EiBwaC
         dwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1YgDZJvelI08zjcR3m87roQMXW/ez1NdlqHWmE4JtcY=;
        b=C0QhLo3+glQzNoNgQ/vE5+ZB3C/ADTndRLz1x5+wwTf4itNFOWYC87cPespwg7fxRa
         3Qq9Ox2pekUdVR+U7wdPkfiXpaaTw8DcxgUMUh6/uEr/pO1277TRQ/ry+QhUiTBBXEp6
         M4m0obzzVjb2yagT18k+RYvTSEFvvhyRgAaqRr09vDPOXKnN5nwfQyE5kB45Hqn6XIfc
         Rk+zvZXS68dH1167Ke+MmdWa1pVttlYIirgWoZGpCp6vKw7i9ZgfSYTDiD9TkpabB3mx
         38FNAgRisvlGeivNS+FbSf1gcBmzRP4vMBfwHqKXY7DNDER04+8PSNBPe/TFBkyHel84
         RL1w==
X-Gm-Message-State: AGi0PuasPYw0UWVSYaTHS3p66DdnmQizL3J8JzJtVNV29AFXAq8HNZMg
	1feT78VtwQfVDL4OWm8XuUmsQoRNqxY5+S1aHso=
X-Google-Smtp-Source: APiQypK36Aiu/5Oi6cZKEnNESoSuXWuqxZROq41HFPDBc71gu7Mk/JuQLrcx0liyJ5w9OKL84Wyk7EaVzpl4qB7ycWg=
X-Received: by 2002:ac8:f4a:: with SMTP id l10mr8530303qtk.146.1585923859984;
 Fri, 03 Apr 2020 07:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191018112819.16210-1-ross.burton@intel.com> <CAMKF1soy5adOpd49H0dTqtwu=vSRc0EPMnXFvD5uQTaJd+JCig@mail.gmail.com>
 <1615697b554b612f329820f2b3f692011b7722ba.camel@linuxfoundation.org>
 <9bac0b45-777c-faba-f448-d2d03c7e6fac@geanix.com> <CAMKF1soa5bEfN23uPAhDCk4rfD_OGjaf2xR+m5ET9cLt+kOn0Q@mail.gmail.com>
 <f6cb669c-d302-c1fa-e2ed-5995b82677ed@intel.com> <9464fbdc93aa48aac796a3ea44e04efcd9564963.camel@pengutronix.de>
 <b409429b4afa97ddeeeec6313fb7315110775f9f.camel@linuxfoundation.org>
In-Reply-To: <b409429b4afa97ddeeeec6313fb7315110775f9f.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 3 Apr 2020 07:23:53 -0700
Message-ID: <CAMKF1sotrF5wOYxxQJ_XsJgD2FgLxGAqJJ_fcuuMUJnChtkbVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] file: explicitly disable seccomp
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jan Luebbe <jlu@pengutronix.de>, Ross Burton <ross.burton@intel.com>, 
	=?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Enrico Jorns <ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 3, 2020 at 6:36 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-03-31 at 12:57 +0200, Jan Luebbe wrote:
> > Hi,
> >
> > On Mon, 2020-01-20 at 17:10 +0000, Ross Burton wrote:
> > > On 20/01/2020 15:45, Khem Raj wrote:
> > > > pseudo needs some love since it alters syscalls which go out of
> > > > bounds
> > > > what is allowed by libseccomp until then pin your file version to
> > > > 5.37
> > > > in arch till a supported distro is affected by same problem. It
> > > > wont
> > > > be long better option is to fix pseudo
> > >
> > > That's not quite right.  pseudo LD_PRELOADs itself into file, and
> > > makes
> > > syscalls which are not whitelisted in file's seccomp configuration.
> > >
> > > There's nothing pseudo can do to solve this.
> >
> > I stumbled across this thread when checking why libseccomp is not in
> > oe-core or meta-oe. It seems to me that pseudo could intercept the
> > seccomp(2) or libseccomps seccomp_* function calls and report them as
> > unsupported to simulate running on a kernel without seccomp support.
> >
> > What am I missing? :)
>
> I made a guess at a patch:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=d675ff53d3ccbc6bd7db5f067d331bf3f94de5cd
>
> Just need someone with a system that can test it now!
>

seems pseudo still has same issue with archlinux latest file
(file-5.38-3) utility

Command '['file', '-b',
'/mnt/b/yoe/build/tmp/work/aarch64-yoe-linux/glibc/2.31+gitAUTOINC+71f2b249a2-r0/package/lib/libnss_db-2.31.so']'
died with <Signals.SIGSYS: 31>.: Traceback (most recent call last):
  File "/mnt/b/yoe/sources/openembedded-core/meta/lib/oe/utils.py",
line 280, in run
    ret = self._target(*self._args, **self._kwargs)
  File "/mnt/b/yoe/sources/openembedded-core/meta/lib/oe/package.py",
line 74, in is_elf
    result = subprocess.check_output(["file", "-b", path],
stderr=subprocess.STDOUT).decode("utf-8")
  File "/usr/lib/python3.8/subprocess.py", line 411, in check_output
    return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
  File "/usr/lib/python3.8/subprocess.py", line 512, in run
    raise CalledProcessError(retcode, process.args,

> Cheers,
>
> Richard
>
