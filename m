Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web12.9427.1621948598613700036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 06:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=D5ROtpeP;
 spf=pass (domain: linaro.org, ip: 209.85.167.179, mailfrom: daniel.diaz@linaro.org)
Received: by mail-oi1-f179.google.com with SMTP id y76so20973338oia.6
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 06:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iePQayrtP2fav02KWGAALvwyPTxYwVq5Ie7Psq9R73w=;
        b=D5ROtpeP+tyiFKWc5g/r7up4VsMF0DAW9Vot62AqCLqd0X7g6RytV9oEDzhmWbKUMW
         WAWlNgUWvwj6BQiGaBl378A6WVr0YDHtqqUKUUF3a6yp5NOJbzkjEPhRPHXTw4UspkA7
         zQSHfMUqR7uGG5SwxB2uPf0mlIK8vwFqZ5Lt5rFRlVtWuu/DJDNtA2Dr3TSV+jLwDxjb
         j9zPChQAYVQseh9eoNZtqclZd/F+Wdr+UjM6M6is3gwrKwOhl4cJOKBIuF1QXdLbEmOO
         lG52XFr5h8veP0akTcG9fCEgj2BDTbRUVfvRaerLBCMuF/o7X5AnwKvWYiaIgaCqf1a2
         yR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iePQayrtP2fav02KWGAALvwyPTxYwVq5Ie7Psq9R73w=;
        b=SgQPu0aeSwWFYG5WRDcw0cI9tUmqyCZ/BlN2E1k3Zml/swqNwN10nDRgt/ngSuKsR5
         XAMNYQzoS2n8VrR21Y/mcL1UGWZaWXHj0vuCM7RyQPp9LR10z3C/fMD/6THm3b50CiBo
         dn1H/mD7Jlrf0aDDPGZhk7xS1zF5Y/PzHK5PvQPe2n63RYEvclC3lpQnKELR0Rhniakk
         Z4VM/eBjKIpmTSPe6K/n2ZpTUhjpK4sw2LzyvzYE6nFh/2s6Gb/5dwTLzbwkXt8A8/kA
         Cve7BdUQaNsyvfbMmfMNLC9n2WkvsvwOfrXhRy+PQvbC4DqvVMM4Nc1n5Ht0yU0duzeX
         MmXw==
X-Gm-Message-State: AOAM530cWXVMjuwMsHm8txaKgovNAAP/ILAngmuPUX0QKGs+XFUKfFNN
	FglzNKSsJA7rOgMV63eqoW1Jwc39TffEAcRRpMvPhQ==
X-Google-Smtp-Source: ABdhPJx8gKHhmaZ0uBd9xiqevi8QTGON/zcLMpgGLOpjYh59pSQT/SllkORl+EvsvVbcDnvplKfRqb3eK6nxGf1njOo=
X-Received: by 2002:aca:d596:: with SMTP id m144mr2738932oig.172.1621948597945;
 Tue, 25 May 2021 06:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210524182955.29512-1-petr.vorel@gmail.com>
In-Reply-To: <20210524182955.29512-1-petr.vorel@gmail.com>
From: "Daniel D?az" <daniel.diaz@linaro.org>
Date: Tue, 25 May 2021 08:16:24 -0500
Message-ID: <CAEUSe788VziRFpqe2NmX0ktu5ry659bfO-H+wAhtAmkfASzGZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ltp: Update to 20210524
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Mon, 24 May 2021 at 13:30, Petr Vorel <petr.vorel@gmail.com> wrote:
[...]
> diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-ext=
ended/ltp/ltp_20210524.bb
> similarity index 94%
> rename from meta/recipes-extended/ltp/ltp_20210121.bb
> rename to meta/recipes-extended/ltp/ltp_20210524.bb
> index e1ffd0ddf4..bf6e564482 100644
> --- a/meta/recipes-extended/ltp/ltp_20210121.bb
> +++ b/meta/recipes-extended/ltp/ltp_20210524.bb
> @@ -27,19 +27,14 @@ CFLAGS_append_x86-64 =3D " -fomit-frame-pointer"
>
>  CFLAGS_append_powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS_append_mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
> -SRCREV =3D "4d005621edd109d119627eb9210b224a63bf22cb"
> +SRCREV =3D "0fb171f2beddaf64bd27597577c206c0f892b3cd"
>
>  # remove at next version upgrade or when output changes
>  PR =3D "r4"
>  HASHEQUIV_HASH_VERSION .=3D ".4"

Shall we reset/remove this?

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org
