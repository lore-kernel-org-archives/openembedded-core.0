Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.9854.1610829486751591444
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jan 2021 12:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HncQk4eY;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id y8so6475337plp.8
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Jan 2021 12:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=N7HfAe7xT+rKnd8XSqhu5+emzBtKrP43vzB0/MfCWa0=;
        b=HncQk4eYAenk0DRxZyo5YCtUNJmRHQ6lX8zBgK6Y5oATSJ8OBmxB+qadlXzSnGumEK
         erCoTI7LqhCUncL+gQhMgBR4Ya6D7SOuq9w2XLwcad1LEtPMp1iOlyQluMf4/CvvUpQ4
         9PgbHknxvXHFzpGs8gRfgDFHe8SYeECQLeC2QUasA1JnpFOQ9Rfr1na/ndIuhMhIQWoT
         72uKvh/QW561M/5dHX68nOYmBw9aZmRywkqwyz0ELmTFVz6PjWM9fWKxa2W5HuApjK1e
         Y6sUwH6/9qWBLMwls57Y+8yd3h3H31JehQX1TX3ficnP6oqEtBiyYm1QXkGhBUqMFuUR
         nViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=N7HfAe7xT+rKnd8XSqhu5+emzBtKrP43vzB0/MfCWa0=;
        b=DUYTxRoSIlhtGTFocEvfu5CPOfYct9WUoyEC1wHgIyy7wFDWmAZIvzx0MeHwifkuBy
         She2ZNKhxlMgeXsUP/6DtBoXFp5xgmJJeqhWbI7b6oYMduaFsn9YIzm2bpMnL33rF2Bj
         vCqPO9ghd2Wm/0KACFM968y/IRo6VTrgNauNYzzZlAMU8F+yEsrQad+Ls9oqqsjAFBLU
         cgTLv5HpYInAeULFFbWLtkNo28knpv/MX9v5VxUwVFF27xPPmJkaEvldk8lxPr/wcs66
         lcqpVbOwiGQsfsn+URsUsmZ9kI/h2+24DMKY3jhvTV8t2mSF5stRxX6Psy0R1Gh9W7SK
         F1fw==
X-Gm-Message-State: AOAM5324r5TqTQ5oKk8BP9lYUoRYDE7Gx6kQZuJKPvqVJIkx326yNfam
	0f1GJv0UUTRGy4Kk1lQ709JP1JGuq2zl/iCj2ic=
X-Google-Smtp-Source: ABdhPJxd5pggZQg3GXsxe3/EJQEc3grUuJqZvHJlXOIicnAAjw27blXn0JpaHuUEjpKYXtT9csikEIU3DOf9ykYynbU=
X-Received: by 2002:a17:90a:a10e:: with SMTP id s14mr16977746pjp.133.1610829486296;
 Sat, 16 Jan 2021 12:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20210116174414.23584-1-akuster808@gmail.com> <20210116174414.23584-2-akuster808@gmail.com>
 <165AD0D36D4C4851.15753@lists.openembedded.org>
In-Reply-To: <165AD0D36D4C4851.15753@lists.openembedded.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 16 Jan 2021 21:37:54 +0100
Message-ID: <CALbNGRTtSYKQfoth3uySW3bofF-CfTTWeu9DUqVyDXDwW71Z2Q@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 1/2] classes/waf: Add build and install arguments
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: akuster <akuster808@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <JPEWhacker@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Aargh just read cover letter - sorry

On Sat, Jan 16, 2021 at 9:37 PM Andreas M=C3=BCller via
lists.openembedded.org
<schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Sat, Jan 16, 2021 at 6:44 PM akuster <akuster808@gmail.com> wrote:
> >
> > From: Joshua Watt <JPEWhacker@gmail.com>
> >
> > Adds variables that can be used to allow a recipe to pass extra
> > arguments to `waf build` and `waf install`. In most cases, you want to
> > pass the same arguments to `build` and `install` (since install is a
> > superset of `build`), so by default setting EXTRA_OEWAF_BUILD also
> > affects `waf install`, but this can be overridded.
> >
> Hi Armin,
>
> Have no problem with this - most of my layers are compatible from
> dunfell up to master but from meta-musicians (musicians seem to like
> waf) I know that this can cause breakages for packages shipping (very)
> old waf. Nothing unsolvable but...
> Just out of my curiosity: Why add this patch to dunfell?
> Cheers
>
> Andreas
>
>=20
>
