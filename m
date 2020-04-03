Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.1739.1585936427001073053
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 10:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=acVNbMBE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id r16so8011932wmg.5
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 10:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Wb1FaiX5xtpOdRo/c5+0cx2Kw+viYkjB/DwO5jpgrto=;
        b=acVNbMBEs6izKBVXtKRZfmjJKwwCidpBUgAof7/KMZJSzmJ++8+qQPzCxZ//X466cP
         9UbB/4SGegrOVEEatltoPQKP/9Mr+CEcCr78tSX0kN/q0juUFUhtBfFYpemJ985UbXo/
         PQ3EId+jWe/v6vG4gT+5Ye20dK/a53Aq9MpQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Wb1FaiX5xtpOdRo/c5+0cx2Kw+viYkjB/DwO5jpgrto=;
        b=X9O94Ty6WGwBlVsiqkpv3Lu/ZuuPjdc1QCY6Ydss7Qb333g2B/4+T2G7GW6IH0ajzX
         6viJ8lrJuSNGtbYuX1IDpo14jp5YaCZfu3EA47FRfhtJdx5ypdkjtmkbSzahBFsxix0E
         c9UfGWBJL9sTS0t2y12HtWGbEcYpIhgRmHzO7wsNSYjdF0m6CPzqCQ+zBq5MpQNJTNVb
         nu6J10o5FhAMo2MeszIJ/IV57rwMCDy7fAvEKhgzD1fX2JQMjai4SGKmquVBwinCpXg+
         G6sWTG3UoTxbpsuA+aV4/u4wyPF5U9h35RwKfAQ9J8o0vqMDjtqfmLEHarZ8AJMkf40K
         sffg==
X-Gm-Message-State: AGi0PuaEQw7qsAO31gJ0oTxVsD4dSnr/hC4RDkkFZgc/nD4JQQP4pyqv
	j+UPjDg0QBcSibUq7fSdDQ8cow==
X-Google-Smtp-Source: APiQypLGkYZqz/tr/PcsSSczvF1uu9iccqhxaGSqRLcpcZJqStG2V3DFnSIubLHDxkUl/3AIxrLoAw==
X-Received: by 2002:a05:600c:2c4d:: with SMTP id r13mr9204904wmg.146.1585936425446;
        Fri, 03 Apr 2020 10:53:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v26sm13181112wra.7.2020.04.03.10.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 10:53:44 -0700 (PDT)
Message-ID: <1d202abdb429a4e49027986c0c47aa66f13fa0d4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] file: explicitly disable seccomp
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Jan Luebbe <jlu@pengutronix.de>, Ross Burton <ross.burton@intel.com>, 
 Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>, Patches and
 discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Enrico Jorns
 <ejo@pengutronix.de>
Date: Fri, 03 Apr 2020 18:53:42 +0100
In-Reply-To: <CAMKF1sotrF5wOYxxQJ_XsJgD2FgLxGAqJJ_fcuuMUJnChtkbVA@mail.gmail.com>
References: <20191018112819.16210-1-ross.burton@intel.com>
	 <CAMKF1soy5adOpd49H0dTqtwu=vSRc0EPMnXFvD5uQTaJd+JCig@mail.gmail.com>
	 <1615697b554b612f329820f2b3f692011b7722ba.camel@linuxfoundation.org>
	 <9bac0b45-777c-faba-f448-d2d03c7e6fac@geanix.com>
	 <CAMKF1soa5bEfN23uPAhDCk4rfD_OGjaf2xR+m5ET9cLt+kOn0Q@mail.gmail.com>
	 <f6cb669c-d302-c1fa-e2ed-5995b82677ed@intel.com>
	 <9464fbdc93aa48aac796a3ea44e04efcd9564963.camel@pengutronix.de>
	 <b409429b4afa97ddeeeec6313fb7315110775f9f.camel@linuxfoundation.org>
	 <CAMKF1sotrF5wOYxxQJ_XsJgD2FgLxGAqJJ_fcuuMUJnChtkbVA@mail.gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-04-03 at 07:23 -0700, Khem Raj wrote:
> On Fri, Apr 3, 2020 at 6:36 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2020-03-31 at 12:57 +0200, Jan Luebbe wrote:
> > > Hi,
> > > 
> > > On Mon, 2020-01-20 at 17:10 +0000, Ross Burton wrote:
> > > > On 20/01/2020 15:45, Khem Raj wrote:
> > > > > pseudo needs some love since it alters syscalls which go out of
> > > > > bounds
> > > > > what is allowed by libseccomp until then pin your file version to
> > > > > 5.37
> > > > > in arch till a supported distro is affected by same problem. It
> > > > > wont
> > > > > be long better option is to fix pseudo
> > > > 
> > > > That's not quite right.  pseudo LD_PRELOADs itself into file, and
> > > > makes
> > > > syscalls which are not whitelisted in file's seccomp configuration.
> > > > 
> > > > There's nothing pseudo can do to solve this.
> > > 
> > > I stumbled across this thread when checking why libseccomp is not in
> > > oe-core or meta-oe. It seems to me that pseudo could intercept the
> > > seccomp(2) or libseccomps seccomp_* function calls and report them as
> > > unsupported to simulate running on a kernel without seccomp support.
> > > 
> > > What am I missing? :)
> > 
> > I made a guess at a patch:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=d675ff53d3ccbc6bd7db5f067d331bf3f94de5cd
> > 
> > Just need someone with a system that can test it now!
> > 
> 
> seems pseudo still has same issue with archlinux latest file
> (file-5.38-3) utility
> 
> Command '['file', '-b',
> '/mnt/b/yoe/build/tmp/work/aarch64-yoe-linux/glibc/2.31+gitAUTOINC+71f2b249a2-r0/package/lib/libnss_db-2.31.so']'
> died with <Signals.SIGSYS: 31>.: Traceback (most recent call last):
>   File "/mnt/b/yoe/sources/openembedded-core/meta/lib/oe/utils.py",
> line 280, in run
>     ret = self._target(*self._args, **self._kwargs)
>   File "/mnt/b/yoe/sources/openembedded-core/meta/lib/oe/package.py",
> line 74, in is_elf
>     result = subprocess.check_output(["file", "-b", path],
> stderr=subprocess.STDOUT).decode("utf-8")
>   File "/usr/lib/python3.8/subprocess.py", line 411, in check_output
>     return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
>   File "/usr/lib/python3.8/subprocess.py", line 512, in run
>     raise CalledProcessError(retcode, process.args,

There is a pretty horrendous hack in master-next which avoids this (I
think). I went through the following:

a) Disabling seccomp syscall. It falls back to prctl().

b) Disabling prctl() (which is variadac) means file exits with an
error, seccomp must be enabled.

c) Return success but do nothing (don't load the seccomp program)

It appears that returning success works.

Not convinced we want to do that mind...

Cheers,

Richard



