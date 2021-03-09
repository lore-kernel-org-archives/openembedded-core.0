Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.9091.1615298221739598079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 05:57:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fwCJ3L00;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id l12so15745922wry.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 05:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=rNbDa0LVTMMZ0iLjhcvqBfeWt6M1NuYfXCQCTbwpwLU=;
        b=fwCJ3L007xmu8t2sEazl8EsqUvL4H0M1ry2RYJYSQvNxmD5D+/nFaq3b7UJ1H8eJR3
         vRJByNvlBjxE2eR2Bo/sjefD9/9gfzG/hKQkyy6wbEWn2mFJIbm+FLnsIl5R+chXOaln
         zgvWQogdzCVPMmC77jjIbTcNZD8eOZYsVGoh9VIRsKPHkC5/LG/tOl+VAwaiRf3dyIP/
         e6oaagpygy/SmGcgipQoeSwM8iSpQTNpFsfHVprsplRYP+UsOk/IQ4l7AcCcbR1l8Xxc
         4xkyv8Aate4nIzDJebaw7yNtDSo7cIDAFVJbkPtNIsxd5ZRA6dBcBRKJqMeoMLuEnsGh
         Ph4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=rNbDa0LVTMMZ0iLjhcvqBfeWt6M1NuYfXCQCTbwpwLU=;
        b=UOb6CHaQ4jMRjdSJgfhtrN6QQQxyn+K42YyPFMxE4Gv4OH+NgvOK7JYqMKKJ5DJvai
         xjik50RYh7h7BPtuBk9G/Koxiv41W64wyOQmOmzMsZBTASn2FgIsY/Eq/D6eExMe8dbk
         00pKIkypa82wdpoDxbvC5X13bor3gSxyTjhMBJ3oWIOUV23rjakhYSPfvGeiEzJEqmZT
         vAV6VDniLjuN4NFS6IdQfG+v+R3hN/AuKwbbEOeBDlz3WnP6EtVhd97PrdUGEPp2A24L
         noLRHwjqw5Sc9TetVDK/aW2Tl4xfBo0/G2rjE6UgeX5Lk/EWL+s54tD0sY2w8I1VNJKL
         3K/g==
X-Gm-Message-State: AOAM530MilXp+IwuT7ban5t+nrCJAK5IG0Pm3tIYnaCTEq9bDzkRllNp
	h3NNXfahhrGhUr1K4L4qJDo=
X-Google-Smtp-Source: ABdhPJyJ7/MSTR+SizGXAgFuoNFqXnMl8YeD7CRXbutW39aUs3EUwaN03cG8RzIYLL38WDkP5SuzjA==
X-Received: by 2002:a5d:4bcd:: with SMTP id l13mr16667137wrt.56.1615298220281;
        Tue, 09 Mar 2021 05:57:00 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id s12sm4098898wmj.28.2021.03.09.05.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 05:56:59 -0800 (PST)
Message-ID: <b98cac20a8f7e1211a6e940dd25bbed45ee30021.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v7] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?ISO-8859-1?Q?K=F6ry?= Maincent
	 <kory.maincent@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 bluelightning@bluelightning.org,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Tue, 09 Mar 2021 13:56:58 +0000
In-Reply-To: <2c2120081009a89543d1c1929d9abc88cf37136d.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210305110218.24635-1-luca.boccassi@gmail.com>
	 <58bcb66c9e15d4121defef93cb6b34266fd89037.camel@linuxfoundation.org>
	 <20210309121859.053dbeb1@kmaincent-XPS-13-7390>
	 <c8159284d8980632a111126f61885e401a1eac90.camel@gmail.com>
	 <20210309144734.7203cbb7@kmaincent-XPS-13-7390>
	 <2c2120081009a89543d1c1929d9abc88cf37136d.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 149164
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Uveolsi9t8BgIHaSztjY"

--=-Uveolsi9t8BgIHaSztjY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-03-09 at 13:48 +0000, Richard Purdie wrote:
> On Tue, 2021-03-09 at 14:47 +0100, K=C3=B6ry Maincent wrote:
> > On Tue, 09 Mar 2021 13:26:55 +0000
> > Luca Boccassi <luca.boccassi@gmail.com> wrote:
> >=20
> > > > It miss also the Maintainer description for linux-util-uuid recipe:
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1=
901/steps/14/logs/stdio
> > > >=20
> > > > Regards,=20
> > > >=20
> > > > K=C3=B6ry =20
> > >=20
> > > Hi,
> > >=20
> > > The DESCRIPTION field is in the util-linux.inc which is included by t=
he
> > > recipe. Or is that something else entirely? What is it, precisely?
> > >=20
> >=20
> > Sorry I was not enough explicit.
> > When you add a new recipe to oe-core you need to update the file:
> > meta/conf/distro/include/maintainers.inc
>=20
> The test which failed can be run as:
>=20
> oe-selftest -r distrodata.Distrodata.test_maintainers
>=20
> Cheers,
>=20
> Richard

Got it, thanks. Sent v9, set to the same value as util-linux for now,
since the sources are shared.

--=20
Kind regards,
Luca Boccassi

--=-Uveolsi9t8BgIHaSztjY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmBHfqoACgkQSylmgFB4
UWLhXAf/R/KoEbTa6UgSlquxwTgMT4O6pHVmdV+ogSxuYgW95JgqZfrLLI75lW20
yQf3GgoS+IfFMUCc/j8asRK7vV7YK3ujriBCZn+hBeeAPa70Mf83XKH0K0Dk5Sr3
ggPUPIlo/Bja15hNQQauvMruzcGWCSN18cEYHExs4b/OgQkY8dXeOr5mIJ1FnhW2
f/c4aMwx+xjg4qLlqXqxJFEnmQe8QMBZatT3BeBoVVgLkcxvwvG9R26tXHhHdExw
N2Ep3HLjxEgBY2Rh6brQXsJCper+5vBbVfYpJJoq2iiRKKl+bRKgHFOBDQ6zwc/P
IRPDQ57bLNFCVWtTBiGRvRpXoKmWQA==
=nqdX
-----END PGP SIGNATURE-----

--=-Uveolsi9t8BgIHaSztjY--
