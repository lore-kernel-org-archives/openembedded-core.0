Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.10284.1619716679227629125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 10:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BY7qVyCC;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.53, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f53.google.com with SMTP id m9so54956271wrx.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 10:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aTq3uBsjmj37GFtME8RlmA7G4KwdsBNM8GZOA1hhKxQ=;
        b=BY7qVyCCzCk2ADSMjtq1rtTyTSU1a9ISgxke+IZXzk90+075+AlDSkeD/E2o3qQMz+
         9OKp4pjVm/rYlpwaqNWs2n1gEYldKVZkvx64EzeT89Yqb4EyHa9+JTvHxrYYJUFTewF1
         kxgXQhaPgW8ol4fDzK4IwJhHBfQEQkB3iW8pazNEjd+vIYP1SD2KgEphyCH47oczvL1p
         dEjPS4jhDta4iDoec5oXAb/ucN4XE/TbAku2Kgpw9i6cMsrnk5kjxWOR63NUcbiQF/6L
         +mbAJiWOSB6nRuIl98ZdivO42nUQ5x9M64uJS1E+W27SBUDUcPiNfHGKiPkPRbcfJnZb
         CoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aTq3uBsjmj37GFtME8RlmA7G4KwdsBNM8GZOA1hhKxQ=;
        b=aRblLiGrZCoeHC0jgxqy8aGQiYpee6BTR0ORqN8ze5aNPdaaUtRfKbyUZ8xaOXckfW
         InQSubWdlKdet6KdvggfjNojvwB6aXR8Y03n+8E0rw5D52Z7MYy79IFhc9pm3l9b51sd
         j4W7aHTW3ZEMGAGK5XsqZ2TXHnDRMAU8o1UI1ReH4qOy1M5rFFuW+qL+VzqwpEaCYpAc
         Hhk8VExNYRPFc6GhjcRg50z2hntWWT4/fsanki2HLrH/iFtF+fQlTOdxnA9aUgOAxIUk
         Hk5kUvPssEeg6q6KorhH9bhPnbC1X9KmDSpBZsgRzZXmGS0P02rc6joFg/O5D0ZaBJz3
         XnSQ==
X-Gm-Message-State: AOAM532sO+polbyXowBaNG9n6ow7fngJXKgvxAHVZtLyqgmBKrdIenrl
	c2wPeaxi6elG153Ml2vKjzyvDRfImh2F4r+ayClEIg==
X-Google-Smtp-Source: ABdhPJxQZygusLcubOiIGjWb2Ht1ia+gYflHnGo+2r7nfxySRTGz1RdG4pu8zIcPNfCnqHR5bIwXep07jvB2wQbtD3A=
X-Received: by 2002:adf:ee83:: with SMTP id b3mr909260wro.329.1619716677681;
 Thu, 29 Apr 2021 10:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdbUdiAU4Eq-6Ogzudm70ieGhzuop0_zCiOBYvczYKi+cQ@mail.gmail.com>
 <CALbNGRS5TPuj_+prg_jsFyMckyoaFzxFO0g_Lq4QCSZCw+-CJA@mail.gmail.com>
In-Reply-To: <CALbNGRS5TPuj_+prg_jsFyMckyoaFzxFO0g_Lq4QCSZCw+-CJA@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 29 Apr 2021 07:17:46 -1000
Message-ID: <CAOSpxdYnKTSjBPD1BuqYyo6r1X6TzQm9M6_wpDPWq4y66Vhk3Q@mail.gmail.com>
Subject: Re: [OE-core] Dunfell support for Fedora 33
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 6:57 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Thu, Apr 22, 2021 at 6:24 PM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > I'd like to work toward getting Fedora 33 as a supported distro for
> > the next dunfell release (3.1.8).
> >
> > Initial autobuilder testing looks fairly good, but I'd like to get
> > some feedback from people who are already doing dunfell builds on
> > Fedora 33.  Have you run into any issues?  If including
> > meta-openembedded in your builds, any issues there?
> >
> > Thanks!
> >
> > Steve
> >
> Hi,
>
> FWIW: on my new machine I gave my monster image a build with dunfell /
> fedora 33. Ok this is not a world build but I had no issues on oe-core
> / meta-openembedded.

Thanks for the report!

Steve
