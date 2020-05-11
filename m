Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.8728.1589188864906802861
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 02:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rM9mRl6J;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id s11so5113547vsq.13
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ibLdv0ONUayhCjc5OMfFEO5fMq08lRF6TtBY7s9fIs8=;
        b=rM9mRl6JhYDwVsP9vJqetF5RQ6lmhOGghxvYvvJmR/4f17hAbyDSR5VSC3PjasPSqQ
         Fj5bixBqnKTN9b6/mjTEqPPj1jhWviq3ScBt7vtGtVpxHlNbqvt1LrbZx2lpv6ehaDXy
         /GEPqb4QCPKtKzUod2vrd76AdeJ3IszxXu1jq8aK6pDPLMtvQjCbVWBd5olA9qhjYydW
         5EZ59d8Qj1ZIa8Jj4iSjWiL1lP7Fz/9i/yuLWDEJLl3Tslc80JQrcIqcaruZ+70IGdPM
         r/toZ6e71iDlkWcnp7I8RmmNFXG17gCWcDxDzd/eVM1inu/5v+JBI4tymRiu9dY97jwe
         4DXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ibLdv0ONUayhCjc5OMfFEO5fMq08lRF6TtBY7s9fIs8=;
        b=kwPhiBa2TnSwON/XwokkP6uLH8SzCCpk2V/8y7vncj4NUh3AsRW1AdOcnLG7MVVNwq
         9mNKynKEcwoZfXDgBtKrgdER0LTM9QSJkK9UH9mL8qQUwTjIQ2tsFoayweXUOyNW6Qwu
         ybOyN0ArVaG2VxdHFxbkEhsgFGIZhvlfIpSdlB7tCDHKlbVVg1rE+ZJm8O/s47y0xoQq
         mNVQjmkuFRr4eaVDrfFK+JTZ7kSFZiXOu5mXETTc+z1tnDr4MKBSq/O9d3fLKohmPkEB
         ku/kXfsDKcbvBLetHeA5mfXFhqbXQyMIP7uoZjKirYly5lRu07sTsgjiGgWncY6lGwnY
         /JUg==
X-Gm-Message-State: AGi0PuY+nqvqRthfGz+VBPAMvWsbOoPZZTrsqg+MsvoUnO/AtbBS0LuV
	O4yDIxONucxNJNffCAn9BL1g2uTSEeEw0zLo9xw=
X-Google-Smtp-Source: APiQypLWdmZEzc/K79IdbE4d+Ab5/L+nZA4G2jYY+nh//0UrUGlRLyGQxsOXR5UxjNUbB1WQneeX2rymejjOCe49Ma0=
X-Received: by 2002:a67:342:: with SMTP id 63mr9963153vsd.11.1589188864030;
 Mon, 11 May 2020 02:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAGCTLNQW1WWHmy1zaE+LF-AKBQa-UpY8sfOy=HH3tt0rJLJFLg@mail.gmail.com>
In-Reply-To: <CAGCTLNQW1WWHmy1zaE+LF-AKBQa-UpY8sfOy=HH3tt0rJLJFLg@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 11 May 2020 02:20:55 -0700
Message-ID: <CAJ86T=W8CGra0J_SafTEEuNwuamifCkWykXy1S3FV4V3zJ6r1A@mail.gmail.com>
Subject: Re: [OE-core] [oe][yocto][bitbake] Fetching source using different protocols
To: Dawod <mhm.dawod@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Yocto discussion list <yocto@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 11, 2020 at 2:03 AM Dawod <mhm.dawod@gmail.com> wrote:
>
> Hello,
>
> I need to fetch a git repo using 2 different protocols ( ssh & https )
> So that when I run bitbake, It will fetch using ssh protocol first and if it fails to fetch, It will try to fetch using https protocol.
>
> can I do some thing like that or I will have to change it manually every time ?

You can add fallback rules to MIRRORS (either globally or per-recipe).
See the last few lines of meta/classes/mirrors.bbclass as an example.

> Thank you,
> --
>
> Mohamed Dawod
> Computer Engineer
>
> 
