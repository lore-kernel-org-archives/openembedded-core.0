Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.12409.1603797553438383854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 04:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Cmpw1qMg;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id x16so1321081ljh.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 04:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jzDN2tTT2ZtYTYty62EfUR7A4aLbuVuq26E24MvLVDE=;
        b=Cmpw1qMghPtXq+fgQIFfW3nli1z01MVJxiKLo7aeG6BuZBSYcfZ7ILEpBL/wivOfBP
         06NKLVQqjlpRaqt109O62r/LkWffT9p0J4frULBN6gQChgB7rT0xYRY3o8czsH0qKyIH
         sbme0X/nhlfDAfyIr4Uv/e1PaMIcmnB/3ZD/9H7h66cJbQ1cUMB7+MfYVcQ+MMKfSVr6
         E2T9QMf86oki7Tm4PW30kOj81wOfp+F1yDaifOXtJEKYFrZE9tSuLNm/IF+gH0nCuqHS
         zF0cexvYqvWQnu7nLksI0rP6PTilnnc1bnl3ulnrCGJAKnOeN1kp9nfYhvXvv/9M4Xzc
         UyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jzDN2tTT2ZtYTYty62EfUR7A4aLbuVuq26E24MvLVDE=;
        b=sxYf1+MXdkMGZ4d0z6EIp1doZd1/g8MskxdBBb0ajyAr/66Urwj+JEQvawzvJfk9hZ
         W04bo3G8pnhNi9TdyTHlLnlldCDDmvlHc2mlKHXdtEDcQnBo8STyX5DlQTEnknSXBOW1
         KyxN/BVHu8hCzQF8R30VK/yGmJw11+AK0CXjeId11iwLt+xwwOeHdG9xwarPTJ1ZMvvZ
         WiJ8tLGpuX/chrxJjwH4aajB8CUEAoxPP+tJ104MiPFJaW1ZdctLkdCIr8/85FS8AXBB
         jwRRzYdTjyuFpcFCsPtd9eEFqjdI0u8qhXnQE5ERcDRzRgurZ8HPCm2+NlOMETKLQKRt
         w7Ug==
X-Gm-Message-State: AOAM533Tz0HuUKkSk8cHVIAMPA1vJ6UL85QfWLZzLjkNLFkq3XTpMOq2
	sIKI6NvoacVNifQy3LVkiXnaS9JzJD9DkL/nfIEPjg==
X-Google-Smtp-Source: ABdhPJwVPiEEhmOVU6Sjrea3yPxwE94u1l0zmcxbhIkCbt0Am068X52HzdGcAjxcLCtjfvI7KsbQs4kHDQki6/KMC1w=
X-Received: by 2002:a2e:b0cb:: with SMTP id g11mr871589ljl.397.1603797551243;
 Tue, 27 Oct 2020 04:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201022113036.2938947-1-luca.boccassi@gmail.com>
 <20201026100503.3200192-1-luca.boccassi@gmail.com> <2ad67eb9e783fa044d4d97f35f93a35014aa73e1.camel@linuxfoundation.org>
 <f76c89f8255ef9ecf082439c910f37cef38c893f.camel@gmail.com>
 <4d2560d4440be40ecd73020c931d5bfd83fd9b1c.camel@linuxfoundation.org> <ed94167201a9730b0a54504e2bf0be8fc3a19c9f.camel@gmail.com>
In-Reply-To: <ed94167201a9730b0a54504e2bf0be8fc3a19c9f.camel@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 27 Oct 2020 11:19:00 +0000
Message-ID: <CAAnfSTshvbY7gbhrcJna6KNRUNtBNYp1LXvLoYFXqpiS3pJ=Wg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] Add new recipe for squashfs-tools-ng
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2020 at 10:59, Luca Bocassi <luca.boccassi@gmail.com> wrote:
> > > Ok - who should be listed as maintainer?
> >
> > The person who is going to look after this recipe in OE-Core. Each
> > recipe needs to have a maintainer listed, someone who is prepared to
> > get the upgrade helper emails, handle upgrades, help with security
> > issues, bugs related to the recipe and so on.
> >
> > If we don't have anyone willing to maintain it, I'd argue its not
> > important enough to have in OE-Core...
>
> Ok, I'll move to meta-openembedded then.

If you care enough to write and submit a recipe, don't you care enough
to maintain it in the future?

Ross
