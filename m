Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.1331.1593110448428043153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 11:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=tCYdi06N;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.45, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f45.google.com with SMTP id p7so3311421qvl.4
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 11:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/C7OKMoc/A0P7rmVru+r5EHGrj3sVVkdHK1jEXNhOb8=;
        b=tCYdi06NFloigVK0hzW5TdwjP/VQwACmAIc3WODAAdQyi5B4lh9vrmXMeUSxsk3qif
         jSroZhnHPJgIKLnnoPffF3DqrlE9ToSLfWtjGy3gdJPnoEf5ADfxaprE2/CwBbu+Z2Z0
         Bf7F+SBDErOi7XvDuNr+/zktgLRb2NBgLQCDnpb9B1rDKukvpC9VsY8d6XJL9o9MVuI5
         qefaJ46oVYS1cOizyLOmhWiRD35emjKk82srSxkd0l9Gr+4lij/T0SQFLgUcDAPrTCx8
         0vr4DPh2d8XCuy5KFiB4kq8MDWXlq2vfnk1aIkvemCto1aH4kluLOdmf1sm534HjDXun
         Iw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/C7OKMoc/A0P7rmVru+r5EHGrj3sVVkdHK1jEXNhOb8=;
        b=MS9SeUHdABdzmzmDYxqhlcTSZK+NwjLCybrcb7kpVJvU/gfBzVuFQsYd1J8MBP86WM
         4mUk33w6+WrBLhzULNhTh+/AtPnwuUsxLmhWkiIXb1AZlcjrw4cVeaiPlT4BUOQRGdcd
         5628OJDlbamrj59I5NWwrchA0VO7uvTgaRHq4jjPWmpAgS1f2/sSjGTiRhqBBi5IWxfR
         nmOr3s2S2MF5nUx1DK+uxUGzaQ/yU/K9R1B8j9EZ0LKO8Glzdpjd5h3+TWkKSWSmyBh1
         yOG1lgnpBaX0WIEAfz29w66GNxvlZgZ45dvpdDlGqLubCTaYCOYwOAiJp7e1NDbbJaVx
         WnXw==
X-Gm-Message-State: AOAM5319Z6hlDAcLn9k+uYanz9hw08FIJj4GmI5QwwujUq1zIwNE2lsY
	laq1OOUh399MNJe8HfCpyjOshbZa36fDAA==
X-Google-Smtp-Source: ABdhPJyVdLtv0A5Acl4lb0NohszUAVV0oJfqTl2CRi+49i4KhNzqCnl850zsA9SdiSxZsjo6XZywWQ==
X-Received: by 2002:ad4:55e8:: with SMTP id bu8mr8132925qvb.97.1593110447266;
        Thu, 25 Jun 2020 11:40:47 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id z4sm6105081qkj.131.2020.06.25.11.40.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 11:40:46 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f174.google.com with SMTP id c139so6359353qkg.12
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 11:40:46 -0700 (PDT)
X-Received: by 2002:a37:64cd:: with SMTP id y196mr7056518qkb.26.1593110445925;
 Thu, 25 Jun 2020 11:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
 <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
 <CAMKF1srKPeNpoX0uRPSHQM3VDuqe+C=adNsDFZ85L+irrs6xDQ@mail.gmail.com>
 <2f176c09-1647-6d46-548c-e58fff7559b6@herbrechtsmeier.net>
 <c0aee660-78e1-d6b0-00d1-687853b89578@gmail.com> <9f3cf7b6-7240-f1ea-6c4f-27dde0dbdc6a@herbrechtsmeier.net>
 <CAP9ODKpQ+ZgNqoZvWtHRF_RyrvpXan4v-ZM=U9fiHXj8o8Daww@mail.gmail.com>
 <6c1c02b9-842a-1d33-2727-932d7a46f702@herbrechtsmeier.net>
 <CAP9ODKo=41yAPeMvLU4uX=0fj+x3rv5DiAHMCFu_BwYWWm3uQQ@mail.gmail.com> <6a604026-37d1-eeef-3a2a-99471640409a@herbrechtsmeier.net>
In-Reply-To: <6a604026-37d1-eeef-3a2a-99471640409a@herbrechtsmeier.net>
Date: Thu, 25 Jun 2020 15:40:34 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo16+MpqyDMwidkLaRS2vO5GKiN=UbA43yU9o0m3pFzqw@mail.gmail.com>
Message-ID: <CAP9ODKo16+MpqyDMwidkLaRS2vO5GKiN=UbA43yU9o0m3pFzqw@mail.gmail.com>
Subject: Re: [OE-core] Status of Go support
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: Khem Raj <raj.khem@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 25 de jun. de 2020 =C3=A0s 15:35, Stefan Herbrechtsmeier
<stefan@herbrechtsmeier.net> escreveu:
>
> Am 25.06.20 um 18:43 schrieb Otavio Salvador:
> > Offline build, using go mod, I can only envision if we somehow provide
> > a local server which uses the bitbake cache as source. This by itself
> > is not a small project.
>
> What do you mean by 'provide a local server'? Do you mean a registry
> server for go-mod and cargo?

Yes, this is how imagine it'd work for long term and with a more
maintainable way. That said, it is not a small project, for sure.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
