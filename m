Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.12163.1586949273470695547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 04:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=nA9sBU0t;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.180, mailfrom: brgl@bgdev.pl)
Received: by mail-il1-f180.google.com with SMTP id d2so2952277ilc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 04:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BvyP6np0MLLptsF/p67irOhOEkH3/Q08JB3mDRY9XRA=;
        b=nA9sBU0tjIm7w/Sj6tb4/SxcKbhoQ5EpZWYXdI1DqiRW5YcHywkL7ZfMmBZK7msZ48
         NpAbisXVHUr3efHlcgnyGum4LcxebHvpSF+ubGgekiCd/XYH2LvRZ3apZa+beKYk6sic
         e1RN7oE5QlHF/N1d4Hz6J0ntqU5nMs27jrTj/wRXtnEei0JYE2nmGnEA605sX7ZieNxw
         qv0R68k6GW2hFFwh4SIljq/UPd3rG805PHiw3e56sJC6o+VPCxTgXtdfO8Hh3R0UZ/1Q
         K6kGS4bXkgIKkzCW1+bgxDlHqdjbkmadfH0IH266JWDPxEVrMR99cn4lKGoiM2VwPlgB
         gqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BvyP6np0MLLptsF/p67irOhOEkH3/Q08JB3mDRY9XRA=;
        b=TrepVqjUg8AYdnEC02mMwPkMfVMhZzoDh/n9NxQgKxWLf3ZYZZcfe+0CprDVBdlLmG
         /c0871J1bfSPaEFXi9fLQdj6yDBDKj+KzWpgTEHmkLlv3NgXSHOkC/6F0xEWrchDWMss
         UquNUS3y6v7e5FaXeRN+Ylp5AL4Dr6G87NJSu4DID81KytdpgNNbP+LWNZNLYSedOWuc
         2Ls+4tjdfxHxaxvN9V19Mw0B9tlAUyM//D577PWZtgoSOswvvd1CGNy43T2LSvjEGrif
         BFByyTsc4HPFPqixDw7JYzvcqE6Ppjtg4ClpeHLjoHBkabgzHGQGgSVhrQpw9xZrTGFy
         REUw==
X-Gm-Message-State: AGi0PuZey+3iMZNmLCadGAzb+cD8ntcBqM3/oQ3l+QMYACfSlb28Qwp+
	Q5FSVtdf+JZaNrtyN12f/qNy9SX4XBVq26UcRm7jTA==
X-Google-Smtp-Source: APiQypJXE/Gg83b7ZgmilHHeOuv9ussHM7gnEWiHCkGYfoNfhl43Y4vrCW1BAooDEHhQ1EPC+98aEwPTNJIfGC87N38=
X-Received: by 2002:a92:bbd8:: with SMTP id x85mr5018474ilk.40.1586949272898;
 Wed, 15 Apr 2020 04:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200406170229.25363-1-brgl@bgdev.pl> <20200406170229.25363-3-brgl@bgdev.pl>
 <CAMRc=MdmrCSUYJXu7nhipPLLJFa6qdzD0E8Zq3S38mZKANpLUg@mail.gmail.com> <2ee5d8832f691c36c00fcdb31609fff3648e2673.camel@linuxfoundation.org>
In-Reply-To: <2ee5d8832f691c36c00fcdb31609fff3648e2673.camel@linuxfoundation.org>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Wed, 15 Apr 2020 13:14:22 +0200
Message-ID: <CAMRc=MeFqHxGcV_qqQEMWC2Ke8VBCkzr86=29YzEJ-MkwPtTaQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/2] image.bbclass: deploy image artifacts in stages
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>, 
	Jerome Neanne <jneanne@baylibre.com>, Quentin Schulz <quentin.schulz@streamunlimited.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C5=9Br., 15 kwi 2020 o 12:32 Richard Purdie
<richard.purdie@linuxfoundation.org> napisa=C5=82(a):
>
> > >
> >
> > Gentle ping.
>
> Gentle reminder that we're in the middle of sorting out a release. This
> will not merge until after the release and I don't have the cycles for
> review of this kind of change right now.
>

Got it, I'll get back to you after the release then.

> FWIW I still don't like the way this integrates into sstate and I want
> to spend some time trying to find a better way. I don't have any
> constructive suggestion as to what that would look like so I haven't
> replied, I simply don't know and that isn't a useful answer to you.
>

Sure, thanks. Despite my best efforts I couldn't figure out any
solution without touching sstate.

> You've also ignored my request to follow the coding style used in the
> rest of the class code :(.
>

Indeed, although "forgot" would describe it better. :)

Bart
