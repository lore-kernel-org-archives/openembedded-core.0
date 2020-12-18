Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.7502.1608284621517023560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 01:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ihN1N9qX;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id a12so1422199wrv.8
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 01:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version;
        bh=+LONfpQYT4akIGKA1a+uKjIyaEGFrabxqzCPdTXwHvM=;
        b=ihN1N9qXtdgzINwR9VNcW9PH1WzYRIUMdXUJH6839Zi+FcyCWZyXPxYCmBc4dDg26s
         z+HjFFU/G9JGBpUu+NSDiu0vFwt43fo3laH1MHhqf63IohCPtZ9joEz+H7SR5NmYUfTu
         vQ9HgX5WPrE1JTgxqec7XtnUIWswcHRm2fvyZ86RZlke/yCspZzK6mYocBlb7Inf8e7t
         KTEbDtw4oO6BOMnQBmkRnIe4zgeb5ypnXTCG9HM6wY+Qr17l1V3UXG72Lhy8MKi61ohm
         p6EWPwIuL5Llc4ULbuJc+3xeLtJgtD2EPR2NNc6OZ5zciVzZwSscZYMy05GQSvivPsT0
         42Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version;
        bh=+LONfpQYT4akIGKA1a+uKjIyaEGFrabxqzCPdTXwHvM=;
        b=Iw1sJ8umntmnJ29279M1lLZq8Edo7cAs0oJyLcuD+Rx4wL6XX/D4gKoUbkWrMjRQ25
         K0GR75c7vZ0G02/pwx0/M+/fchlxwxTAXE5m4R/40piLv7qbRryERZCpL2grKNIyJR/A
         Hea5FyV3Hy0y4ucgmI0J7oAae9RS5cmnSU4A7sudA2+SVRZW1n+YHpiv1Nl4DdQKpLK+
         lQgVeYqJAz82dib2XOu8/+yyk1xuBjtkHVt59PxOsuGOtJA9bBKG4GwjV7JBjXMc2VBW
         IAO/VoE8S4rdhgvnPfZ4IDepR7pcwdwM9lpYaX9je7era4MYissZvnCngPMk1xTp/VgW
         kB2Q==
X-Gm-Message-State: AOAM530yooqlNHkqFnm3vg9hvWet9GigynveUzdOzNu5n6cQESl08hWr
	v5tSTdi1Y3U+JN1Lbl7suoQ=
X-Google-Smtp-Source: ABdhPJyPmUmgkrAUz4EQRv0hThQtvySFlpxeKjfOab4P1iPAWonl7TkY9EZipLxVCl4VMeAqOYFDBQ==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr3465727wru.118.1608284620163;
        Fri, 18 Dec 2020 01:43:40 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
        by smtp.gmail.com with ESMTPSA id l8sm11605258wmf.35.2020.12.18.01.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 01:43:39 -0800 (PST)
Message-ID: <722fb1730229ad409a24f77df81037d7f1c69132.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/5] systemd: update 246 -> 247
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"richard.purdie@linuxfoundation.org"
	 <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Dec 2020 09:43:33 +0000
In-Reply-To: <d189ccc302adbfa869935c9d5c03ba4af8db2740.camel@intel.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <20201214123457.122655-1-luca.boccassi@gmail.com>
	 <7d16bf791179cc0e90fd0172e984eeeacb065112.camel@linuxfoundation.org>
	 <d189ccc302adbfa869935c9d5c03ba4af8db2740.camel@intel.com>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 145855
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ecuWUBOHO/VTA5ElmutO"

--=-ecuWUBOHO/VTA5ElmutO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-12-18 at 02:00 +0000, Mittal, Anuj wrote:
> On Wed, 2020-12-16 at 18:07 +0000, Richard Purdie wrote:
> > Unfortunately there is still something not quite right in this
> > patchset
> > as it failed again during testing. There are a few different
> > problems:
> >=20
> > meta-intel in systemd-boot:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1016
>=20
> It looks like this happened because of systemd-boot change from Ross. I
> have removed the bbappend from meta-intel so this shouldn't fail now.
>=20
> Thanks,
>=20
> Anuj

Thank you! Sent v3 with some other changes, hopefully the CI will be
happy now.

--=20
Kind regards,
Luca Boccassi

--=-ecuWUBOHO/VTA5ElmutO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAl/cecYACgkQSylmgFB4
UWJD8Af+LniqqaeGyAl25TC2dGt2fhCXN3vCZaMf/u3bj70lNEHdCvWfiBGYY35O
I4/7DdSvrM/2TV+p1J2dxYOlZsDP8tbTrJMRo8Y/+uR94LDEACjf2AC0b8ayWNd8
zMDbON594aDRYQm6evPs45Xv/BzFrKGdeoqp9h9e7VAwoFgVz+socz0W0ThQKc/H
pxoChyCmEIaSgKZOviHkVApBsVF7TyBHrmWeW2FH6VMpLl7QA+qFpFsbMtyk+ETZ
auch1Lzf5cX3/mv5crJUSNZcuH4UdZYGXxq/cKzVirLv0KlwB88vGLuD1ipcVnaE
36l/s+9FpH4LyPEk2fAYv+RFQscSIg==
=3v1A
-----END PGP SIGNATURE-----

--=-ecuWUBOHO/VTA5ElmutO--
