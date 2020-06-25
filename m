Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.277.1593103416464814745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 09:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=IzRgjwNN;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.45, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f45.google.com with SMTP id t11so1040821qvk.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 09:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zhJ4Lw5Oegc42LYQY22B9LaZbyjkS+s8OMVpau+Q/Uo=;
        b=IzRgjwNNUA+zMaMLGno0PYME9EGwnR1UJMs41Vjg03gi+IqK8QtXatWItHGvd/q453
         XaUaw6Myxum958pnAw653eEf32efxucqlNZgsg8BOPkXs7mzrO6ghEEzw7RPhDQrSLZ5
         9+c+sc2r6MMuR3I+RzqNtNQV54saVHpQ/ejbs2T42LvDwkzr5ldCnhxnDMuOR/9+Fhzl
         wX7t6m1lbWiM/y0dN2Ndh97oktkzQZXKVXn9S3NUuxNbTtcGObLG/cWPmieCoUAYzAZZ
         mpXqzPuh1nLaU/qWKNqE2NJNPVgrxYwnhdWbP0LE1UnmxQBHdL3WrHgsRVk4wa9sPAcH
         IZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zhJ4Lw5Oegc42LYQY22B9LaZbyjkS+s8OMVpau+Q/Uo=;
        b=YpSJLFuaAPwVRtLp3OLpxBONLGJTK627F8Ur85DA2LtQyja2avj3+JORWKHBbnI6yo
         4WbGSu+fQrSS9T9AO4nFZtQAHxRhwIQfOoRjq2V8oVgJ4JQe3UHYqSKpQKvBq2lIrk/s
         CN0adduqfSS4BC8MSVsFDjknT3/b8afh5qLQWps6+kGElcuYA4ql8E3YTg+BTTWMRoq3
         37dVMQkH+Z6fnUTs0AxKgk075g0/ez4RDp2neKV1EnBIm7Q0iOMj0CUeeAfcDBwCPeKg
         KTYSmF/d0a0N3Urkv2aoh16vuKHVIF4VXSoPZQ1+xqeJ5TfR1hHzo7bXicQLQ0UDZOw/
         hzvA==
X-Gm-Message-State: AOAM532iV7KDNT+AKQ68MwHA4AxPfc/VCAfG/CFmhDUA8in7nNNP+3no
	QwlI50451WgMWkWvEz/gM5olvuqxVeUV1Q==
X-Google-Smtp-Source: ABdhPJzsNUCTW3f3xZTxVaUBwCOKrDX/H1yaNZDkFxdJ1K0Vj4W6NqCJdFHedYM5Gtggtela682fRw==
X-Received: by 2002:a0c:bece:: with SMTP id f14mr37319248qvj.19.1593103414967;
        Thu, 25 Jun 2020 09:43:34 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id v59sm6514069qte.96.2020.06.25.09.43.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 09:43:34 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f177.google.com with SMTP id z63so5935398qkb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 09:43:34 -0700 (PDT)
X-Received: by 2002:a37:490f:: with SMTP id w15mr8776215qka.71.1593103413699;
 Thu, 25 Jun 2020 09:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
 <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
 <CAMKF1srKPeNpoX0uRPSHQM3VDuqe+C=adNsDFZ85L+irrs6xDQ@mail.gmail.com>
 <2f176c09-1647-6d46-548c-e58fff7559b6@herbrechtsmeier.net>
 <c0aee660-78e1-d6b0-00d1-687853b89578@gmail.com> <9f3cf7b6-7240-f1ea-6c4f-27dde0dbdc6a@herbrechtsmeier.net>
 <CAP9ODKpQ+ZgNqoZvWtHRF_RyrvpXan4v-ZM=U9fiHXj8o8Daww@mail.gmail.com> <6c1c02b9-842a-1d33-2727-932d7a46f702@herbrechtsmeier.net>
In-Reply-To: <6c1c02b9-842a-1d33-2727-932d7a46f702@herbrechtsmeier.net>
Date: Thu, 25 Jun 2020 13:43:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo=41yAPeMvLU4uX=0fj+x3rv5DiAHMCFu_BwYWWm3uQQ@mail.gmail.com>
Message-ID: <CAP9ODKo=41yAPeMvLU4uX=0fj+x3rv5DiAHMCFu_BwYWWm3uQQ@mail.gmail.com>
Subject: Re: [OE-core] Status of Go support
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: Khem Raj <raj.khem@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 25 de jun. de 2020 =C3=A0s 12:36, Stefan Herbrechtsmeier
<stefan@herbrechtsmeier.net> escreveu:
> Am 24.06.20 um 22:24 schrieb Otavio Salvador:
> > Em qua., 24 de jun. de 2020 =C3=A0s 17:17, Stefan Herbrechtsmeier
> > <stefan@herbrechtsmeier.net> escreveu:
> >> The go-mod.bbclass download data from the internet during do_compile. =
If
> >> you cut the internet connection after a do_fetch the do_compile failed=
:
> >
> > Yes, this was the better we could get without hacking go mod tool
> > itself. It would be nice if you can provide an alternative way to
> > improve it.
> >
>
> What are the alternative?
>
> a) Add a fetcher to bitbake to create a vendor directory via `go mod
> vendor`?
> b) Add a `create_go.py` to recipetool and create a recipe per module?
>
> The solutions are related to the npm (a) and python (b) solution.
>
> I don't like a) because it breaks the best practices of OE (for example
> one major version per project and avoid embedded dependencies). On the
> other side b) isn't so simple because of the circular dependency between
> go projects. This means we need a package (recipe) for the source and
> the binary.

Honestly, it is hard. It kinda conflicts with the way go mod, cargo,
and similar tools work.

Offline build, using go mod, I can only envision if we somehow provide
a local server which uses the bitbake cache as source. This by itself
is not a small project.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
