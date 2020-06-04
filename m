Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.14513.1591278580569550103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 06:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pCaGuPDc;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id z2so6139662ilq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 06:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TQPiePBeR2rY4tP2KGiAvBcuB3OESXo0Ng8D0cub6So=;
        b=pCaGuPDcPaOZnZYP5E24PCgjVWxYSe/A8jYF/72fRPo2xshDKvjEqVq9JvCUu17hnl
         kLH+fTNkRUNPmlfPUWLSWku/A5SQi+n5m0zqJrozaRyPCAgjC64nnLrIXhc2tMKEatat
         UNtbzpq0BfOto6C/NaMRyOIjIdMsc01rHmEF7XT3BNA97kAVYTy9uwDq8ZPWSfzSg/38
         AauSGkTs43yVDJcczO2MhY9BqQO54x6PyHV39pLs26DetqrnStrRsIBNBYcQAGRj/sv5
         /ADToJJGy969PHGlWZHe1P7yZqQ4Tp1wE2OgnsTpng0esIyA/Vm3PEsv/TkmtFMlPCUz
         h+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TQPiePBeR2rY4tP2KGiAvBcuB3OESXo0Ng8D0cub6So=;
        b=uR1MLRG+/Nn3ET3kC+h948zC1KuUPXo8mudFj27otkZfS8kekdgc2WEWnmIsmHXxGE
         PSry3jWq+gF8xfNwB87eVZnOal4H6JndfvPxqdDw7LmTHCqmyU1DltrC/Iyg5MZtS3Q1
         gSCwk/977XZVEXQTVJI0ji361VSug0bIbaMGyt5RZwejn+Etpopc0CbKJX8sScZaxDPC
         LJXKgIsyb0HcLBx6HdynVYLLMgJYwk7+bWC+n/D6qlLTXCEqp5kBdRCvuO30KuuqLqp1
         ZCUGrf4AXpX9ztAlCLStWsrGrk6Jag0m/XiczF8lB31oj2HlbUNUzMPJ2ZMC4ija+6IK
         vlpw==
X-Gm-Message-State: AOAM531BATgZQOshnEQDjfAET/GVQUi3xsdNPBtdCXQzDc0w3a/IXgru
	n8c8jhqy9aSCPa0+WgB09lhb47FZM0xBuOGcSfU=
X-Google-Smtp-Source: ABdhPJzIP7l8sbqrwMGOd7ULKB8s9ZjPpetfpWKBbnTyQA3+s3xUNuQ4+1plNQ3BsZvRdakHOVpRkTTq2Axv1Cy1hmM=
X-Received: by 2002:a92:cf48:: with SMTP id c8mr3949085ilr.147.1591278580000;
 Thu, 04 Jun 2020 06:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200604120349.17455-1-schnitzeltony@gmail.com>
 <faaa5a2d120eacab6825cf079e92aa220dd7b151.camel@linuxfoundation.org>
 <CALbNGRQDVCm4zDJ6NPw=+-mQ8xibCDh+pqjToPcrnXRvJcYOkg@mail.gmail.com> <421c9a5c69b54bfb41734e58b89dc66bf9e84c0a.camel@linuxfoundation.org>
In-Reply-To: <421c9a5c69b54bfb41734e58b89dc66bf9e84c0a.camel@linuxfoundation.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 4 Jun 2020 15:49:28 +0200
Message-ID: <CALbNGRQyxDXcyKUA3zFYfwRFivLWbqrYyoGSKr4CWRz0Vjo1YA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][warrior] pseudo: Fix enum typedef
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2020 at 2:47 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-06-04 at 14:18 +0200, Andreas M=C3=BCller wrote:
> > On Thu, Jun 4, 2020 at 2:11 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2020-06-04 at 14:03 +0200, Andreas M=C3=BCller wrote:
> > > > From: Jacob Kroon <jacob.kroon@gmail.com>
> > > >
> > > > 'pseudo_access_t' is a type, so use typedef.
> > > >
> > > > Fixes building pseudo with gcc 10 where -fno-common is the
> > > > default.
> > > >
> > > > (Backport of OE-Core rev:
> > > > a7d519f742aadc9110c2401f359254210a784f6b)
> > > >
> > > > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> > > > >
> > > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > >
> > > Does warrior otherwise work on gcc10 hosts?
> > Not yet but I am working on it.
>
> I think to make a decision on whether we plan to support gcc10 or not
> we'll need to know the scope of the changes. I'm starting to worry this
> would be a bit too invasive, particularly as warrior is about to enter
> community support or EOL depending on whether there is a maintainer.
>
I see. Problems for me - job's hat on - are:

1. we're close to release a product based on warrior (and a new
colleague of mine has just installed Fedora 32 with gcc 10 - that's
why I ask for it)
2. my tests with dunfell were - hmm - not running out of the box exactly.

So we should decide to upgrade to dunfell. That is what I use for
private raspi-images an am very close to happy.

Thanks for 'warning' me

Andreas
