Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web09.3876.1603135209460833064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 12:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=rw1XOX7u;
 spf=pass (domain: burtonini.com, ip: 209.85.167.47, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f47.google.com with SMTP id a9so918157lfc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 12:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YqiHSJ+9u1NL2hw87lcozD8wtBTDobhMXEyCa1GPslc=;
        b=rw1XOX7ucm9Yx2KZs8DOA/+xju/9lvcQiyNjhZGmAAUZ+oAEPyDESsr21LCvrmBYFT
         FqR4IxI9WuyJhQFZZ3z8UjoQD0rjP4nJz0Xu/iO2h3tgCMsIruCZSFmiPquxafMP9S60
         KtdIat0U5Tp22uubf1fdBNIjcT2Kqe3XYmhgmmIW+EsiSzgVY2ZAKqJlTAWaftBraYWP
         qFj0FjoENoLOCDjlab0PvD0bnQtWdEUlQktufrVgP6vZsiHHI+HmU3Nbjc2fEB9WI++q
         JFizi7tDBywq7yLfGYC6xs1jto4Hb6kc0qWoHxrhnahzmOHBTEzGsoI/zZf36WqXSo0T
         XPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YqiHSJ+9u1NL2hw87lcozD8wtBTDobhMXEyCa1GPslc=;
        b=KgN8I6SO5m5CTEQS2ZpyX6bJC6qAXQpIOuKMuwN4Cupb3bDDNAmLZmgyT0C70xfZyM
         uLILrOsPm5UutTIgV3c1d/v9028hx9gddsFmFsabZnmzovTtlklhig6KCbCxa7ill9QI
         24T9a0Mnaeok1fhx08uBZ/lmiY02XNTPUaVBj4mTtkq08iVUzN23n5P3M8OJs+GI3eZ0
         yBtIGW/OKtFX1Nv9DVcfv8/YNrZLX90KCyzAft/8jvTw60r84+PVXZFa1rB7SQyScZv1
         UyKFC/tcuLgLxaZh24P0YM8P0NcuwEvBPvorpdhdG7S9tQmIcgu/kFJW/4zQ4bqSW8uB
         JA7Q==
X-Gm-Message-State: AOAM530Fe5/u7l6NY29g28H9ZJUhbO4xpG9QQ8r3tuVffa3jzHF2pBal
	8yNsEGV5wQ606we7RPiOwK6sUJEB/3RMn20cXWVSgg==
X-Google-Smtp-Source: ABdhPJwjql48R5IZJzI3iP7laBWRT31Iwc07/7RalZY+4J/Tu5/T9dMMR9gIGNkn2kd39yLaxWgkPIeftMFQWqqKQVc=
X-Received: by 2002:a05:6512:360e:: with SMTP id f14mr388324lfs.44.1603135207548;
 Mon, 19 Oct 2020 12:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201018100004.8512E9601C6@nuc.router0800d9.com>
 <27f0873f9e4c50789588953a20d530c9965e1a35.camel@linuxfoundation.org>
 <CAOSpxdYO3dB_9PtC7pvmqNTa8ZUbGQU6YOfEFezM0mtCBjC7AQ@mail.gmail.com> <CAOSpxdaCefKtbfRkhXf96KukVaT-hVv6JT_RNqaXVQr4eDQm1A@mail.gmail.com>
In-Reply-To: <CAOSpxdaCefKtbfRkhXf96KukVaT-hVv6JT_RNqaXVQr4eDQm1A@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 19 Oct 2020 20:19:56 +0100
Message-ID: <CAAnfSTvEfyb4o3p-MXsc7dPo_XR_YE9e0v5EDbO8PTOkAWZKfw@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 18 Oct 2020 12:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2020 at 19:27, Steve Sakoman <steve@sakoman.com> wrote:
> > I am too!  The master CVE check runs first, so I guess it is possible
> > that the database updated between runs.  But that seems unlikely.
> >
> > I'll review the scripts, it seems more likely I have a bug.
>
> I didn't see any obvious bugs, so I re-ran the report for master and
> this time all of the qemu database changes I submitted were recognized
> and we had a big decrease in master CVE count too.
>
> So perhaps the database did actually update between the master and dunfell runs.

The report runs at midnight HST. Maybe the owners of the script picked
a time that was suitably in the middle of the night for them, which
turns out to be midnight for you?

Maybe just offset the cron to half past?

Ross
