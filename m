Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.10033.1612363152600716886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 06:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wTE40WO2;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.50, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f50.google.com with SMTP id j11so4944850wmi.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 06:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gzCaavKazNgWQji+5/bJqeqPRYiZ9eV2T7TTLuUT/0Q=;
        b=wTE40WO2zmESWp8okt65NgAz3WgqC1Ki3uVHuzBtdUEcfxtawtEddjM2FnsomZUcHU
         aMULsSEjXoaW+sj9le6Liu1uFpX99gQblGbrDsQWJWPqCp+YTQ+TUZDmKPqdBXfjFTuK
         gixD8mvZDxEUAQOQH/3Lq2LBO3/SAqhZNTmigEsKUPaGJ6uKUENFLKgNFrZ2ghO1S5wJ
         xGa2MOUfmZ1D/ybSia3qBnUTTmCrGOb4RpkCFr6m0vqbjTLQ1eTmV8qQihYFxmU0WSzN
         TVBlJl3x6zgqrKrx0wHTCSBaLzgig4dOinlJk74QdvQ5cbp3OsVS+JLFVgKteBrwkSpv
         4Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gzCaavKazNgWQji+5/bJqeqPRYiZ9eV2T7TTLuUT/0Q=;
        b=qZXOkO4Ko7c0bc5E8sS0KUUsphA3HtcN+Idzd7nKanwGYe7lYJjMhd4+4bZZ5RmIgW
         /MPiyGH7jFDUDcRXcIwiSdgtmJKKD8Hf/8RErxgxEfeW8BPHxEtJLtRZbYXMz5jOCXme
         epVmeiunFROzpefS1EFsZMfA59ZUgHhA/H0RhfiH0sLFV2+N8ExujmwiqicliJkJNcGV
         ni7QkQe5gFGhMqbsGx/rPwxbS+J5/t9/UA0VKC7ErL0RqZPNcNUSAEWFr5z4NTpC+Spj
         FTVAQb61fauP6OBXsrvSX4kI66MoGIn4eVnxvhD+ZdwQBq27u1Wh6YO6lJeP3DbnGfhs
         OWXQ==
X-Gm-Message-State: AOAM532/X+PCbx2zu7wbwk8yzXK5C7A4rtDAYSh4ElgNnH70dEWNiThT
	x33xRYp5XSL1zbw/nqQ9fbjAfRvsYoAaZz7WSKym9g==
X-Google-Smtp-Source: ABdhPJxnKIobESLUgQk8NxjuVlhMwYTdH8NxNISxbZLhLlOTZC/NP1eXfTxYFQTRrshHUznqWESuPg/3bNvLGQ21lP8=
X-Received: by 2002:a7b:c0d8:: with SMTP id s24mr3206640wmh.4.1612363151101;
 Wed, 03 Feb 2021 06:39:11 -0800 (PST)
MIME-Version: 1.0
References: <20210203084257.26778-1-anbelski@linux.microsoft.com> <YBp0r/IvR1vFubjt@korppu>
In-Reply-To: <YBp0r/IvR1vFubjt@korppu>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 3 Feb 2021 04:38:58 -1000
Message-ID: <CAOSpxdYJNWu+cPtAH_ceHuOsYVYEo8ozh0RJRRcv54-B139fOA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] glib-2.0: Rename patch file for CVE-2020-35457
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: anbelski@linux.microsoft.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 3, 2021 at 12:02 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
>
> Hi,
>
> On Wed, Feb 03, 2021 at 08:42:57AM +0000, Anatol Belski wrote:
> > The naming convention needs to be help so the CVE is recognized as
> > fixed by the tooling.
>
> Yocto CVE checker does detect CVE patches also from patch comments so
> this change is not needed for that. This is sufficient:
>
> poky$ git grep CVE-2020-35457
> meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch:CVE: CVE-2020-35457

Yes, we are detecting the CVE patch from the patch comment.

However our CVE patch guidelines do request that the patch be named
with the CVE as the name:

https://wiki.yoctoproject.org/wiki/Security

(in the "Patch name convention and commit message" section)

I'm sorry I didn't catch this when I merged this earlier.  I always
check the patch itself for the CVE tag, but I missed the name.  So I'm
happy to take this patch just to clean up the metadata and make it
easy to see that this is a CVE patch.

Steve

> Is there some other tooling that you are referring to?
>
> Cheers,
>
> -Mikko
> 
>
