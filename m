Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web10.1059.1587850556700747411
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 14:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QXL9I+3G;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id w145so10676707lff.3
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 14:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=emRDKF+DqKg/2cvyYaVceEzPVuCCG7SO0wTNN4uyBiE=;
        b=QXL9I+3GrQWxaNq8RvF4YKfz9keob8G8M6LxN2VUh4MiamgGct2QgW6rhukdXMdHTs
         1OE9WEJl8URNZtHfgiIUG7IQV81raYeYLt0RcisDIhaW//Gl7c6KR+XTXXCFZXpBNjwi
         U2APhRLixqN5q81s+fKdBf2NOpAnGdSVuKrHIHsK2Etd6gO8P7r9DTKKvvVJXU0vCNlU
         g8suHUS3gVADLfB226foTWK2YIeRkaCMtcy5YbjzwZzTxzILUmBtfXrv93uCV2nUMV6r
         7HDzUtyDB0BW+rkwfsthriDGlhDteYy7zZ9/2luTbKw7NbKUNVrm9Vw+mlNoh1ZE7SaA
         5ceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=emRDKF+DqKg/2cvyYaVceEzPVuCCG7SO0wTNN4uyBiE=;
        b=NgptiUA+xo/wpX5wBsz9Zkp/cyakqQoTXcmkhEJtci7NUtsii3CaRhFvFn5PVXnlh5
         yclPgAQ6I+cXrKEccRZu+cpVkPrvK5mFUfYQnb3kONW3384lkirthUsCVlZuQRuY++Nd
         uhHDw5XgGgoUbXTPD6SiE2FyR2/PfWspmxGtkG5+FF1A2aGsVceUnn4pfX2fzVP0M6YH
         tT/zDRlgHJUAYqxy0fasxmY1GH/lfWl7kFAtGzqZABfizuqVT1wDaabUpnjQWGgvcPsy
         ZNu4O3gbn/FFl8bTHrKsY0MlvwCNTo+RqIcz2TZtUJGZVu1Vt8/fRBOVI8650KIdfzv1
         dibw==
X-Gm-Message-State: AGi0PuazO4wGDwf7ZPmlFGtM1fOg7vtgKKIA1yP0EoS3661wqt5QR+R1
	8YWKWL+i11hFBn9/+qFZoG+d1Kp9xREKE8UW8uw=
X-Google-Smtp-Source: APiQypLE+Dehe/jj00Y4pqCGot4H0YrthpjWuciIbigCDZmSSCuwfwy7KVRS3tVP7j7SxUHTVVyZKFPjx9uCIllQ/Dc=
X-Received: by 2002:a19:88a:: with SMTP id 132mr10627241lfi.130.1587850554751;
 Sat, 25 Apr 2020 14:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200419063539.1467641-1-ricardo@ribalda.com> <258be2a52105a49413b954df67e61444dc73492e.camel@linuxfoundation.org>
 <CAPybu_1XdULtkfUQsjTa=PvuyUECKpNLoFXX95F_+Ly3=fbqBg@mail.gmail.com>
 <ebb64c86224b51b49b1d86f864566ecd91696f95.camel@linuxfoundation.org>
 <16086D1E57B63D5A.14079@lists.openembedded.org> <CAPybu_16DsHfqq-Frixoq+ySqCbb2qvGmapZR-UbKGgmT8sJyA@mail.gmail.com>
 <d15d1601fdec27b7667dd16f62db13fc9ff475cd.camel@linuxfoundation.org>
 <CAPybu_0n37=eUhXtAZiOoxogY6Wyb4N8VLJSQre=RUO7U8ScqQ@mail.gmail.com> <714c9522fe1f5377f019f67cf43ec75eecf6fec0.camel@linuxfoundation.org>
In-Reply-To: <714c9522fe1f5377f019f67cf43ec75eecf6fec0.camel@linuxfoundation.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Sat, 25 Apr 2020 23:35:38 +0200
Message-ID: <CAPybu_3ho1BpD9fz4s_eEWrcBhm9jq=AuAb1itARRFtBHJn-Eg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 00/10] Fix permissions and embed-rotofs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

Hi

On Sat, Apr 25, 2020 at 11:29 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2020-04-25 at 23:25 +0200, Ricardo Ribalda Delgado wrote:
> > I have also been working on the issue, and eventhought I have not
> > been
> > able to replicate locally the bug, the code insspection was pointing
> > to the same direction.
> > My running hypothesis is that the logger keeps writting to the
> > filehandler because nobody has removed it, so the second time we use
> > qemu, the log file is missing and all dies
> >
> >
> > Eg: Here I cannot see where the handler is removed
> > https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/targetcontrol.py?h=master-next#n122
> >
> >
> > Eg: Here I can
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/commands.py#n353
> >
> >
> > Unfortunately, as I said, I cannot replicate it, so it is a bit
> > frustrating.
>
> The line I gave in the last email should reproduce it reliably. The key
> is to have a runqemu session which you then clean the image for
> (devtool does), then a write happens to a directory which no longer
> exists from the logging.
>
> > Since you can replicate it, could I send you a couple of patches, not
> > to fix it, but to find out if I am on the right direction?
>
> Since my other email I couldn't resist poking at the code. Locally this
> patch fixed it so its now also running on the autobuilder:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=3e7d64adba65559e9b8af42e973c8524988b216a
>
> > Can you also publish a git branch somewhere with the current error,
> > so we work on the same codebase?
> >
> > Or you just prefer to continue on your own?
>
> Happy to have help but I'm simply using master-next and with any luck I
> might have found it.

If you could replicate it locally, and this fixes it. I am almost sure
you found it. I was looking in the same place ;)

Thanks

>
> Cheers,
>
> Richard
>
>
>


-- 
Ricardo Ribalda
