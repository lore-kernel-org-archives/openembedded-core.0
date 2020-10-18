Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.26332.1603044746216439406
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 11:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=O9wPvtan;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.53, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f53.google.com with SMTP id l16so7979117eds.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 11:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CCnJnleX0Ipcbd69WSyCLqHDbPpa4ldIGnqcP9OILU0=;
        b=O9wPvtanVN6ZFN3MrgCmfnXj01KnWqh7E9XBYiQnPi9JsOFPcgGo7I7gzuU21gj4WI
         mznNjomxlhbLSQ9Ss287IDOAAum2ZhGwW3gWhZPnho16PPWYLEDKUVkUfmMtmFWqAIJY
         xcD1oOZ8A7OudXQodTefCXdaO8sjSksJEnDhXi9L6nn67LPgQiZwZcuuhx/OkFrwLTm8
         mB0VjZg66DHlnibhBmJKShZDJu30owrO0/8mwXOXII5JoGhJz5iY5+UNLIzwzpRcZxQf
         WdH2B7uAts0z/xq7gRepV4MQGDc4y6qhrIEclyAe/knkUVZRu9bOV8WovaQARzlMfp0E
         RkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CCnJnleX0Ipcbd69WSyCLqHDbPpa4ldIGnqcP9OILU0=;
        b=We02YxbuAdrNH2M9NcUOXNJktTHpMpL51Sc3hv9QnwBM7IvsdOU2aBhqQMqPHaM/YK
         aiqgKCVEKwW57Le+XHa+wwHjvf2joLXH4kjG/if0ZApobUnxV/dLZ9IqJAsjxczACj6X
         hyYwVNTgbWfxJaYgJVw2DW2/X5yl7XhIilS5r+BSi5sV037zO70QLbJXLbTElqvHPau6
         bU+wuFexxbh9dGsTU3c7QRzGtP2C2Pmv61Q9Edmw6rF4OGvD1BgptuULimCIlyqjV3vc
         oGGqVMBW1hSAnrdDA476nLSME62ai4aulnf2eNcDE4YSps432ksLl84Gx16dnfa+xD66
         bLpw==
X-Gm-Message-State: AOAM531Z+HMFkTsbO2ujbyBwALoVnIFjctZnfET/lB+pjC57bUtqxTrk
	e4pmb2E/cfJkvE3QkNwrIdlfU/CQMRPFgKrwVmIZ8w==
X-Google-Smtp-Source: ABdhPJwXbXXdFOFzNYbGhje3BDu0P9TKbsD3sVh5XjIhv03QX2O4ruMOuf0H8nzcn5HYTK6m6zpQd0PB8wWlV1dKi1I=
X-Received: by 2002:a50:d517:: with SMTP id u23mr14644370edi.338.1603044744491;
 Sun, 18 Oct 2020 11:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201018100004.8512E9601C6@nuc.router0800d9.com> <27f0873f9e4c50789588953a20d530c9965e1a35.camel@linuxfoundation.org>
In-Reply-To: <27f0873f9e4c50789588953a20d530c9965e1a35.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Sun, 18 Oct 2020 08:12:13 -1000
Message-ID: <CAOSpxdYO3dB_9PtC7pvmqNTa8ZUbGQU6YOfEFezM0mtCBjC7AQ@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 18 Oct 2020 12:00:01 AM HST
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 18, 2020 at 7:56 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2020-10-18 at 00:00 -1000, Steve Sakoman wrote:
> > Branch: master
> >
> > New this week:
> > CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
> > CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
> > CVE-2020-26116: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26116 *
> > CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
> >
> > Removed this week:
> > CVE-2019-18276: bash https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-18276 *
> > CVE-2019-20907: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20907 *
> > CVE-2020-14346: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14346 *
> > CVE-2020-14361: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14361 *
> > CVE-2020-14362: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14362 *
> > CVE-2020-14363: libx11 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14363 *
> > CVE-2020-16092: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16092 *
>
> I'm a little puzzled about how dunfell improved significantly but
> master didn't?

I am too!  The master CVE check runs first, so I guess it is possible
that the database updated between runs.  But that seems unlikely.

I'll review the scripts, it seems more likely I have a bug.

FWIW, the dunfell report looks correct -- those are the upstream qemu
database updates I submitted earlier this week.  There were a couple I
submitted for other packages later in the week, but those don't seem
to have taken effect yet.

Steve
