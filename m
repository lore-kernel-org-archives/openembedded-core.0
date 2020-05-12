Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.122.1589314226850463316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 13:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o4v4o3fx;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id c64so15011824qkf.12
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 13:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yog1usfudzT0CIFcPDjr9885qihT6Uhqlwh0+TCJVS4=;
        b=o4v4o3fxA4gtSuWvIzvobg6FbdsgAU3EBkOAmpB+UH6Vi9LeZQo0rto2FOva8/dr+x
         pYfWoP+Vu3WMxe3enb+tLGZ5ZDN8uFeM/UzozfbRUQOU8KuFlnxQkdkoXckDcR8m8Fsk
         VCwW+pSNfOd2ZGqYqJPi+DMsrMyJKnt+c2NKeQpeOzLe2TwqEmSzv6Lqv/N0i08BbcXh
         T/+KJ4vBDO3/wpKUL208jlBXT1CfTi7GI89baEjf2xiIq3/I1OJWlNtXPVBcQlbppYO8
         sxlmNBxXP2MX3FOQEYqtVncRv3L7Hv8NJGHF03S6E2VH4HwuYa7WYWT65v991aHqemSO
         SehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yog1usfudzT0CIFcPDjr9885qihT6Uhqlwh0+TCJVS4=;
        b=kDsmSwZ/JMGvaix9BSyreQXU+oq6ziy5Ma/z2f7/g5tcb95dgWgL5w6YXwtc/JEp82
         WNvcqJ85NSu2Vy4MOZGBvcWo6mXocmP8ZQeZjn39ySiJ0JwXxk7clCGxQciI+9NGO+ET
         K/fb6FGc6EqllDen/pOQRp6h1ith/+xp6wA/Htw7Gb/YYEwq/tHsOlvSgwnuf9iED+uf
         vDzwQKJWGypJRuOFJs0UewLUbppN7mKMRNfPuW6jF+EgQFx/KZ7TN4a1QGzkf4igBtNs
         qpEWdmOzUGXkpf4XwgADBouAzXSPvjW/cymxkiND/o5gwJgC96RdF+6SNNzilo1KSGGj
         iBMg==
X-Gm-Message-State: AGi0PuY86AZvg6ikviOgLbtc6l/n0jlv26Itxo1MT9CShhdydyTUWUUB
	EnwK2PMs23lbxt0G0reKNDQ4k2hUq3nT/J7iz5M=
X-Google-Smtp-Source: APiQypLXj6lGevPhs2KNJhE/qKPl66DXZepT9ll/E2woxBF70GIXgpXDN+5QSbqFzug46i4soX35PbNPrwr2f+WOFNo=
X-Received: by 2002:a37:7143:: with SMTP id m64mr24188914qkc.215.1589314225223;
 Tue, 12 May 2020 13:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200512070546.255409-1-raj.khem@gmail.com> <421093a7d57d548c1dcbb4dfc070bebaa0ac203b.camel@linuxfoundation.org>
In-Reply-To: <421093a7d57d548c1dcbb4dfc070bebaa0ac203b.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 12 May 2020 13:09:59 -0700
Message-ID: <CAMKF1soXVvQ84NY67UkeLq+v2mBf6SFYLN=Hn_RJC7rc_3Fd8g@mail.gmail.com>
Subject: Re: [PATCH V4] gcc10: Update to GCC 10.1 Release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 12, 2020 at 5:46 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-05-12 at 00:05 -0700, Khem Raj wrote:
> > * Package new gomp header acc_prof.h
> > * Package lto-dump which is a new tool in gcc10
> > * All Changes are here [1]
> > * Porting apps to gcc 10 help is here [2]
> > * Backport a patch to fix CET errors on cross builds
> > * Add patch to fix mingw libstdc++
> >
> > [1] https://gcc.gnu.org/gcc-10/changes.html
> > [2] https://gcc.gnu.org/gcc-10/porting_to.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > v2: Correct SRC_URI checksums
> > v3: Drop icu change
> >     Backport a patch for CET cross compile
> > v4: Do not delete icu config but restore original one
>
> There is a new meta-mingw issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/1892
>
> also a typo fix in maintainers.inc needs squashing in:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=47de13d4d208aa6a5ca89e4e0ce566990e208e96
>
> to avoid selftest failures.
>
v5 should address both issues.

> Cheers,
>
> Richard
>
