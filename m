Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.15393.1602776325585475365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 08:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=htm9nHmp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id s9so4044821wro.8
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 08:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2Mt3LR/59WPppOXtgxb4io+HuYWHK3famBOHDxoqutU=;
        b=htm9nHmpA18onQp0GqjHYbJRA6RWoksqQZCCAgeRt937BIT+SavaLvlDhk+m/kYXEm
         Tsq6OX0xo2B/biOM0GI9t7I4r/S8o3PfObvDkDWrIUim8qNDcK/YXh9hg4DrmtfwyaDA
         H3hN3BURqBnit5EuZtcrsABHgu9SV+ntlDRto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2Mt3LR/59WPppOXtgxb4io+HuYWHK3famBOHDxoqutU=;
        b=k+Re1oj71k7Oqdna+6BJrCjmrDXy3NtLzwBTsUAKd15PQe9fOgFd0ai0AoYco4IIVf
         XuuWHx8EM2l4LN3Pv0MApJ//OpBq4koc/dTpu8YphVFrMaGUGA3CGRmNp+TSyi+gZYCV
         YUv/XPtHMzj1iKSf3ZeaePGMkY6obkv6xBcp7sKgVQtqso4m2jZUgHWuqTA34W/kXGWe
         AeSQSrUF63jvjRZmwqtRzxkCm8MDACSjii6oDxiloLtHOkyfje4yumQfyChOI5CTHoU6
         XrApUAhoIfRPCskW3sT5PpO0HAdbZiqjX5Glg/FR3rmbf0NgdEg7yTx6udVopms/Lp9K
         o2VQ==
X-Gm-Message-State: AOAM532bJ0z4fX1n9f5w/aXV0awXnqVgkA0D8GJtkVZGMJMkrKuLAZJ0
	THEkbr5bkKxEoN04jUFPmxOMJg==
X-Google-Smtp-Source: ABdhPJwr6YrEBts344BFnUeuhk5rHLKXykYLs3rWXYEyCAqrBC+/kVJP/CDO3e8rdXm39vInXu6kEQ==
X-Received: by 2002:adf:94e3:: with SMTP id 90mr4701236wrr.380.1602776323927;
        Thu, 15 Oct 2020 08:38:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id u15sm4792742wml.21.2020.10.15.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 08:38:43 -0700 (PDT)
Message-ID: <bb0f5febd3b110e47a5567225d32c2a9b8eba7a2.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 00/12] Pull request (cover letter only)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Oct 2020 16:38:40 +0100
In-Reply-To: <CAOSpxdaQYF59hYetU8dA8y=wxFtMM0EKBC7XzqLRGvmPy8qrmQ@mail.gmail.com>
References: <163DBD610FCA88DD.13380@lists.openembedded.org>
	 <CAOSpxdYU75NyNxwQ4yomwR1X1VLJuBXnUfvQo0ycUjZGs1XFog@mail.gmail.com>
	 <CAJdd5GZunnLXbpKQL_4X+6E3E05g0gznh5YjpC+Hgmxo+WEyKQ@mail.gmail.com>
	 <CAOSpxdaQYF59hYetU8dA8y=wxFtMM0EKBC7XzqLRGvmPy8qrmQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-15 at 04:20 -1000, Steve Sakoman wrote:
> On Thu, Oct 15, 2020 at 4:13 AM Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > On Thu, Oct 15, 2020 at 9:07 AM Steve Sakoman <steve@sakoman.com>
> > wrote:
> > > Gentle reminder :-)
> > > 
> > > On Tue, Oct 13, 2020 at 5:14 PM Steve Sakoman via
> > > lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> > > wrote:
> > > > The following changes since commit
> > > > 552739383321bd9b4780bd0026d6107ece530522:
> > > > 
> > > >   perl: fix ptest test count (2020-10-05 04:29:40 -1000)
> > > > 
> > > > are available in the Git repository at:
> > > > 
> > > >   git://git.openembedded.org/openembedded-core-contrib
> > > > stable/dunfell-next
> > > >   
> > > > http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
> > > > 
> > > > Bruce Ashfield (4):
> > > >   linux-yocto/5.4: fix kprobes build warning
> > > >   linux-yocto/5.4: update to v5.4.67
> > > >   linux-yocto/5.4: update to v5.4.68
> > > >   linux-yocto/5.4: update to v5.4.69
> > > > 
> > > > Joshua Watt (1):
> > > >   classes/sanity: Bump minimum python version to 3.5
> > 
> > I assume since this passed on the AB, that 3.5 is actually the
> > minimum
> > tested version of dunfell, and changing on a stable branch won't be
> > a
> > problem?
> > 
> > Do we know if anyone is using OE core with 3.4? It seems unlikely
> > since bitbake has a minimum version of 3.5.
> 
> The fact that bitbake has a minimum version of 3.5 is what convinced
> me to include this patch, it seemed silly to have a mismatch between
> oe-core and bitbake.

Its effectively a no-op but does clean up the confusion about what out
minimum version is which is why I was happy enough to see it go to
dunfell.

I had merged Steve's series but not run "push", sorry :)

Cheers,

Richard

