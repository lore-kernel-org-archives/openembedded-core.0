Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.10538.1608392928511033508
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 07:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NbEpqIjy;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id jx16so7526336ejb.10
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 07:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fRr4mFnrBvLHhLY8AIc4RLOZcyJpqtQWpexQaKazg1w=;
        b=NbEpqIjyIhZg03bmumylSOXis0tLOKfRUhr0VzSOvSWCvmp/BNtvwxdxnjAFIcAGUZ
         DNTpP+ukvJJ+jmaDen+f0GmrKoo2NVhcKHmCrMEIQ6dR5GSP3YHuG36GiAL7kpbvVlk8
         LUjuCBU0h5BEiWqkBUn3AoN7PMgTnq+bTD+knCaHvFlx5wJuQBgkCNbJjr7R5i3ncGdz
         aUQeurJy6pF12+eBjoDlPybGdzKWLebXrezQRpo324mmQrgbf2aYoU3Z2i+73sfNU48o
         0zUo1mAyW9uXQxccdN7PImi2emOQ9abo4LFqwYhBLK/7Rcl0YnI14MXVvhaVIuBdRB9x
         tPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fRr4mFnrBvLHhLY8AIc4RLOZcyJpqtQWpexQaKazg1w=;
        b=rMbvCEZnpJuC8yBpjCcRejkzsBR/pKCp7cMuABc+42jEy1cRK4NAmIBU6gMmwEPJj9
         u3HvU2WMP9NdLxIFYePJH0qbDWNLYjgbfhNX8GMG/xPAmyHSbP3yGzMPctlcEZlwuIC/
         aZDpT9sVEIM2qIWARlu/55rGBAA93CdBW2CF8y4SUgo5V9quWKcVPZaLaLeMh6Py/+gV
         ZC9iC0W0wy0zQ7Ffo6ogqeG6LUn47oNXF63BfnJxhZQ0ej/AL8Vwg/3xtIinfxEX0NZW
         eEgliaNXTbQN1PVVUOd6zJxiBUN0rrw+gcxiseCRxKpMWG40akmXxM3YasRDVx8UJNrM
         HsjQ==
X-Gm-Message-State: AOAM533Gn2O1rxIuP44ali2B00wq86X8FlQSHTQxxTizimXHPXWlh0ln
	swGnX+/7wt1SICu3fGDTT7QKTiGFpXJWMb7NZu8=
X-Google-Smtp-Source: ABdhPJyCs9wA+IpvHb/i4AN56y+M04Ug/jalo4bmwywA1NtK+uFGDF7RjhiW8edKK92QzX+5qnC7zBohMCuvL/mBK9g=
X-Received: by 2002:a17:906:5e0f:: with SMTP id n15mr2267012eju.459.1608392926912;
 Sat, 19 Dec 2020 07:48:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607958349.git.bruce.ashfield@gmail.com> <faff0743666a4ef199d2902a1611a83ee5c2a4a9.camel@linuxfoundation.org>
In-Reply-To: <faff0743666a4ef199d2902a1611a83ee5c2a4a9.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 19 Dec 2020 10:48:35 -0500
Message-ID: <CADkTA4Ou33v4AhB+JTTwxytUr1-UWRrbS8qd562utkiq-a49HQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] linux-yocto: consolidated pull requesrt
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Paul Eggleton <bluelightning@bluelightning.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 19, 2020 at 6:31 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Bruce,
>
> On Mon, 2020-12-14 at 10:09 -0500, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > 5.10 dropped this morning, so I'm switching over to the libc-headers
> > and reference kernel upgrade (5.4 and 5.10 will be in master, with
> > 5.8 being dropped).
> >
> > But since that will take a bit to sort out, I wanted to send my queue
> > of patches for other fixes/versions.
> >
> > I didn't pick up any issues with local testing, so hopefully this
> > won't
> > cause any problems.
> >
> > I have the lttng-modules patch from a previous send repeated here,
> > since
> > it may be easier to take it as part of the bulk update. I checked
> > just a few minutes ago, and there isn't a new tagged version of the
> > modules yet, so we still need the backported patches for 5.10+
> > builds.
>
> I was able to merge part of the series but there were some warnings
> that came up:
>
> meta-intel:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1020
> poky-tiny:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/3105
>
> so I've deferred the kernel tooling bit until we can figure these out.
> That means several other patches which depended on that also couldn't
> make it in.

Nothing else should have depended on the kern-tools ones, it is independent
of the rest. Either way, I'll submit next week!

Cheers,

Bruce

>
> Cheers,
>
> Richard
>



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
