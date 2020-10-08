Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.1099.1602173207111681906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 09:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AqHKfSLL;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id o21so5544830qtp.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 09:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/XjGePN5lU7xNMRECQGFnPkj4d+FRRAwj8qnpuKrHhc=;
        b=AqHKfSLLmWie+k8Y7n4LxX5tUO+PjlvyoC5AeE3hjskRictI3acw8PSaFiWE2hR9a3
         zxipgEQB20jqXM8xmwwdJ70XYHWr2MqMVfP6d6gVkAUzwVRVvphNQU3FeMXFFP6mXHt9
         YgMZQzVqVjpGN58+SEj3OTdU3G6MqwsBM69ZBOAFvgtPG/txw9HKAZ44u/bD+5y9mdlb
         FbH9hPVpsVglRtYYeONQdVLvkcylyPSfHr3F4NK4678NXkh4gJaKS+84BEWwHK2ZNofz
         zjtFQcaqaHVtklOqlTRl7tsO3MDx6U3ATcniw8HXPTeH8Ma9ysiALMA8uLY6HCDviw7t
         bXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/XjGePN5lU7xNMRECQGFnPkj4d+FRRAwj8qnpuKrHhc=;
        b=pEtJkgfb3MNWvFbXAKlhn5fhHa5YmqHNcBVuIxbNa0rBPHEp+n2O5vKonlsF8qZzHL
         WPOPNjobgjamwvgNNNdut8FWwzRFmQJfVbtS0KuiGruan+ewaAH3nNcZVTWlZkmoqtdj
         fD+l+R/C1jYhDx2eO9622FU0RS7JjZzBmLJmj0ptv8MySRu0tZfvVxm99fxx93QRJMHk
         DdBGj09XtuO4KmsRBzu18MGbXosWbTqoWDyXFNuEnvlIs+LPFjDZnHC9RzyfHwBkoD/f
         xQhSZOC53RDPqtqOOXJSbb0+igPB+lvhmZ22HgNBo+CvyzlNK3a8aPVRgXFYfNnfVFqb
         m0mA==
X-Gm-Message-State: AOAM5318YBsSDKcTS/5JxTPthV0+oYEs+nRJ3br9Bwz+b2jQ5oJgqcYU
	e/RKbt7GUqIfiD7nqXmZsH96nzr5RLK/N92I4fs0Qss9Mds=
X-Google-Smtp-Source: ABdhPJyR6HtZzBDTRpX02dh/ZDzHD6roeIb1Jkiucm3gthf82DZsrM3yown2WAu3t4WYZcBqaFkFKhXwSo6qzqD05XY=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr9397689qtq.378.1602173206190;
 Thu, 08 Oct 2020 09:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201006111444.3952584-1-ross.burton@arm.com> <20201006111444.3952584-2-ross.burton@arm.com>
 <CAMKF1spSQo7vi9qVN5TMHJ4QrcLj2sw4VJXMxcM0sSiFf9OvaQ@mail.gmail.com>
 <CAAnfSTv44odADoSgCQXgYRO-yiHXejRwwe47VrhWZiwj7wYL3A@mail.gmail.com> <CAAnfSTu5Oj7MuH526JzERoq4ktj5UyZdL1-Fc0NFLcx__MsOAQ@mail.gmail.com>
In-Reply-To: <CAAnfSTu5Oj7MuH526JzERoq4ktj5UyZdL1-Fc0NFLcx__MsOAQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 8 Oct 2020 09:06:19 -0700
Message-ID: <CAMKF1srTzjHpd7sBevh2GZ=wdnFU8Lp4k486wZq89Gh7o5zctQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] boost: don't specify gcc version
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks should be good.

On Thu, Oct 8, 2020 at 1:32 AM Ross Burton <ross@burtonini.com> wrote:
>
> From boost's log.do_compile:
> notice: using rc compiler :: <toolset>gcc-10.2.0 :: as
>
> On my host:
> $ gcc --version
> gcc (Ubuntu 9.3.0-10ubuntu2) 9.3.0
>
> Ross
>
> On Tue, 6 Oct 2020 at 20:45, Ross Burton <ross@burtonini.com> wrote:
> >
> > On Tue, 6 Oct 2020 at 17:14, Khem Raj <raj.khem@gmail.com> wrote:
> > > does it probe the version from cross compiler now and not the host compiler ?
> >
> > I shall triple check :)
> >
> > Ross
