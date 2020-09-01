Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.13949.1598969199990503043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 07:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Q4E7davL;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id i26so1811453ejb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 07:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=78jnhxbTqEdanQwDW1XLIHoescbG3P00vN/O6FYbT4c=;
        b=Q4E7davLYARZhypMu+iB4oE4glD171FJsIsTzOupquXiE1WiJ6QsPGZSRzrn+MA2Xr
         K2wSVGtFEsvzbZEHA86Kl6j7VaaCkFkV/z2jm//c3TUYarj8vSKT2Rx/G/VBbxoOEou7
         2lRfL64yN+eRhwBkl0Mr5Ko90VAiJZTt85KfkxMqDmD4yKj8wQGng28sISp1lg+YC1WB
         0R/j36UCubGchML+3oGC3XCLJIGAGYPS8c19jgSEXKn+JzXEc0ifLf88C7OrC0P28soP
         H6DnLjdHqjRu/PiNsr8a/D9j6G6UWlxk7NCKOKviEh54g2nVcXa1sqWzTBV1GFZ4DIvS
         YD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=78jnhxbTqEdanQwDW1XLIHoescbG3P00vN/O6FYbT4c=;
        b=OCcn/WK5uxMtkqzYqpXSM1PqLD4pggBwyoNcybr1ksF/2jgW8MxesXf5H0yJM/vK/2
         M/B6HVoGsveczN9/aP1cMM7Uw4WbSJ6+I6uiWNX4fdJ+4Pp7k3eN2VyFeUDpuYw4fDtn
         s2+XPYEnwxtzU9oxUhAjlMuVfTtiHG24TMeoF3c2kWfCSn9uXvjGrxSIOQZfn5KohfYo
         MbRBTTsojZqc9GaxStsQyqHVdrhhvOa1/L9BOxSEYHEj1G58WQsoIo3mPAC8iPZxk3qT
         R7uPXhLvvpyws3yo0BF4yll2IpLUOE/5svP0gh4PZeFVpjZYmkOdoDIXZ9uju3m4k3Di
         TcCA==
X-Gm-Message-State: AOAM530XILOH7LqcvOZRWXG0rQjIPOmQUkdPGg0bwdt5mt0bzmzxYEUc
	OfJyPUVJRp+V+S5LuGbk08yyKzt8ud7h2jhrijAUoA==
X-Google-Smtp-Source: ABdhPJzoCjUoYvK3ubpsEKF8UObTiSH3saLUTparY7Qgnw1sSjUx5qqWs/RgBItBSPkA2TWzB9DI/0WZqvbDu0M2PM0=
X-Received: by 2002:a17:906:6055:: with SMTP id p21mr1696721ejj.173.1598969198156;
 Tue, 01 Sep 2020 07:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598810890.git.steve@sakoman.com> <19d9787f362e8ee4460964768ca9b5f093bd4f0f.camel@linuxfoundation.org>
In-Reply-To: <19d9787f362e8ee4460964768ca9b5f093bd4f0f.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 1 Sep 2020 04:06:27 -1000
Message-ID: <CAOSpxdZ97Z3FwgE2G6Sd3gxbpnSBpi6U2Je_XNV7BfNJUg9Xwg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/25] Patch review
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 1, 2020 at 1:07 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Steve,
>
> On Sun, 2020-08-30 at 08:15 -1000, Steve Sakoman wrote:
> > Please review this next set of patches for dunfell and have comments
> > back by end of day Tuesday.
>
> A few of these (e.g. devtool, RPROVIDES, kernel fragments) are what I'd
> consider slightly riskier patches which only really just made master.
> I'm not sure if we want to give a little extra time for some of those
> in master before we backport?

Certainly, I'll drop those patches from the pull request and let them
bake for another week.

Steve
