Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.9948.1612876186218903624
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 05:09:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WMEP9eX6;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id f14so31250873ejc.8
        for <Openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 05:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YjKHBSX3e5TKJtr8iEK19/fKfKT5wAnk7kh76OEuRsA=;
        b=WMEP9eX6fWvxrOxhWLUZ1ZL612KyZn0d8MY58XH+1+fNfLZ0QMMWIoa6Soabu3XuMz
         UWJZ3ctMmlt9O+hDkL4EvTWUZZwcUXOKDuoMyfUSg2qkXOdbarPiPTkOiXTwDQKsek6L
         SoU0ZaC2p6TxK8uNZQFWv7Kj/43pnVNJBweUwjM5WHZ0VInY4AmdRVUG09YdTLfvE/Y9
         gYv6sbmPTATHJ+iHegyklaHfbGcWnmywfk3n8rpFWhIsa6TA9B55+hPQY2+GUZ0505e5
         YKTTtq1L9gSKpDuzxsDlJTXju44jEJdpEaBh44Djhje1PGa6EH0E89yK1p8hx2viXcFD
         G8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YjKHBSX3e5TKJtr8iEK19/fKfKT5wAnk7kh76OEuRsA=;
        b=jbWHLTdJ5S0re5UNPV4vUfhlEABm+5N5XQ16qvkC9l9y99HWSWqeB/4Cp3qb3fpUyd
         MDBNzxWhJx4FXqeJWTeg302btCzZfNFTYni8JCtjWyXGtc6RcMKQBMbRB1r9WiTDyg2W
         mG2FrRFSHfb4XCFv5Ia9mAkoeOyCiu28VSmMmEKejin2e/NCLmck6FVi+VZEC6dzwHUZ
         5+mA3HpK1rrIaKgTCvPrujuWc3SvujXR80mK6qk+vPIUdChuvZLl5oYZFGiDchRBqjP4
         g/w+3RSM9YBMMLOZR9ufgkpV1nXaU79aIBUmtHcMl71eiyGuZsJsMqHX9z1Z8nLgIr+o
         /Ejg==
X-Gm-Message-State: AOAM533+rNPaA+WHRIkiYFWwbYIhF6ZK/XylIbxgjTDtmozi3rwUn1f9
	c0TNZbM3iLpeNs+mbNcZB4NYo99FWxTEXkKmcOk=
X-Google-Smtp-Source: ABdhPJx+Oq4WQZmjSvTDGmTLBl/vMrsSJKP5yGpfJjl4Bj1nGFcdmU2QVZ0gNqyqIsJk2lR8jJT6zYVG6YKrVV0S+kY=
X-Received: by 2002:a17:906:7a49:: with SMTP id i9mr14824572ejo.247.1612876184721;
 Tue, 09 Feb 2021 05:09:44 -0800 (PST)
MIME-Version: 1.0
References: <CAGi-RUJUdQf4LtsYusmzDH-FSpuq=6ZvEpyPBJkj3=XojqR4kw@mail.gmail.com>
In-Reply-To: <CAGi-RUJUdQf4LtsYusmzDH-FSpuq=6ZvEpyPBJkj3=XojqR4kw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 9 Feb 2021 08:09:32 -0500
Message-ID: <CADkTA4Pd=bHOz7yNsQPHPsxtps=A_HwWp4yN7k_n-9jeSY=t0Q@mail.gmail.com>
Subject: Re: [OE-core] libsystemd is missing ?
To: Ramon Fried <rfried.dev@gmail.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 3:29 AM Ramon Fried <rfried.dev@gmail.com> wrote:
>
> Hi.
> I stumbled upon a recipe which needs libsystemd (fluentbit).
> In the configuration phase, during pkg-config, it fails finding libsystemd.
> Specifically, it fails to find the journald header file: sd-journal.h
>
> Am I missing some configuration, or systemd recipe doesn't install the
> dev libraries, only the runtime ?

Did you try putting "systemd" in the DEPENDS of the recipe ?

Bruce

>
> Thanks,
> Ramon.
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
