Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.957.1609524086958418597
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jan 2021 10:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Ro6GiJn+;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id cw27so20690600edb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Jan 2021 10:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lPaSUho6RhkJrIblH7ydO+k2eMEBrs6tg4lALYVVrxA=;
        b=Ro6GiJn+LDhI6HwczhU/NNXUuM8PldbFFxq+zH0GbfIOuF89qc9O+wH5+EyEJ8gLCj
         Je/zsTX2BU8x560huE0Iek9xxUkKA5wQuIBNJrA8ffyVotWG/r/ht6gtfZOMzRYZMjL3
         Q+KtWk3RiY8E9t4l9mrnDfqJm3w5SpxHQk/r4kgRUE/5GxxjLxloJbPTIXwOxWKYPgS/
         hpTScYcCSSZQz3ZIItUo+/8Ki0WpE34nJRt2khQn62kPnm1H/pb/tq1jHWCyTC98daGM
         ioANLNuIKJ6SL6Yuq7L8SrGVLwFIGf6rHvwPyG0xuYAOBaNB7Mvwb45NuCwzw6V/hlZ0
         AePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lPaSUho6RhkJrIblH7ydO+k2eMEBrs6tg4lALYVVrxA=;
        b=oULJ991kuBwUM8y6mYkXC2jIiiUe1HeJBcQ6R0ZGH0H36dB6PRb6xdz5FeGmig7BhJ
         aAUf7qz1xqhPEl1C/fcbeXMYTEgcE96Qi5xfyGAumTWb4+bHyNuZm814zm3zYb1zaJ5z
         JaSK8ifGzZEsjuOAO3n7/ECLkCwzbg04Sp5ojHqer9OTygcl3oFHSkG2rUeY10ka8wOf
         ZHPKxXPf+GB0F81wspf/pa4apj2Xpan292PCNINVVQy8NBVJXXRGmGSLPigPkFr0j6+t
         x3Q7X1dtI8YG+EmjHVwveSCXTjM/M8iWURo6mJNbt60pFa/jyhQmP5sDA5x5cmSAPuE+
         67+Q==
X-Gm-Message-State: AOAM533AzX+l7nN9yV7nbb/mw89HwJgKg+cHyULcvGF+o8pDPw172MLj
	gWGWp6Wgkzf+PWC6mwx8aSv/9jHZDrab9FCyq43ioA==
X-Google-Smtp-Source: ABdhPJw0Jf3tzbvZ94I/wEqyLIOBzusW99W/OH4UmoXjiHegLuHc4+b/VnWEc2cHoejmiRMFRVdcsSMyUo84IFLVAO4=
X-Received: by 2002:a50:d60f:: with SMTP id x15mr59190498edi.224.1609524085399;
 Fri, 01 Jan 2021 10:01:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609424319.git.steve@sakoman.com> <0d8414139b060fa0d50bbd3a609513525dc94288.camel@linuxfoundation.org>
In-Reply-To: <0d8414139b060fa0d50bbd3a609513525dc94288.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 1 Jan 2021 08:01:13 -1000
Message-ID: <CAOSpxdbPEpxpwOoTWiRU0TM=0wcK+ai8v8dazn_2CUytBgQNBQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/25] Pull request (cover letter only)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 1, 2021 at 1:58 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-12-31 at 04:20 -1000, Steve Sakoman wrote:
> > The following changes since commit
> > 02870c7fbaaa1c3869ecb439f5c58fcf40a533be:
> >
> >   binutils: fix CVE-2020-16592/16598 (2020-12-14 05:58:27 -1000)
> >
> > are available in the Git repository at:
> >
> >   git://git.openembedded.org/openembedded-core-contrib
> > stable/dunfell-next
> >
> > http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
>
> I am a bit wary that we're in a holiday period and not many people are
> reviewing things. Most of this is fine but I've deferred the world
> reproducibility patches for now.

OK, not a problem.  We can revisit next week.

Steve

> Partly that is due to the holidays and review, its partly as they're
> causing me a lot of pain in master. I note for example you list grub-
> efi but not grub and both are likely affected if one is.
>
> So I've merged without those bits and we can discuss further next week.
>
> Cheers,
>
> Richard
>
>
>
