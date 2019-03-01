Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 190767CD86
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 16:37:10 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w6so23310738wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2019 08:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version;
	bh=jWyzQRFQxMW4wXge1sBwMDhyzpiuxO/8wTrrK1cfLSc=;
	b=EqViOhuSY5bQgHN+DnofLsD7QOWf86xWb4rbYG4h2Ce71C/HLMATib8pBAnAEi4Msj
	0CHoVBLQQcxCevV00nUILZrR3Mci/TVTGlWnadXTMCbx6Q27+cnPOGmWbe9GaeV9+I/a
	VsmO44MCJDyIKfQ6hcFAsoRnXZHgq6gg5/QTVhXDLjcBYUD3d1w2LVWwQlyO6YombnJ/
	Tyeu8rpjt/vWbX4yGkpt+rQdoPOPLmetyEsJaByoVNUa0rpKFkEkhac/fBnKw0ktHPfK
	KItFoe+HFpnAqgDrizaYJNzStzwrP95XHGserOwaDA/kcWb1C4HtgrXAfMBsePrjC4PN
	ePoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version;
	bh=jWyzQRFQxMW4wXge1sBwMDhyzpiuxO/8wTrrK1cfLSc=;
	b=AFRi0+1Mx5BJh5yu9P/s4oaHkc3H4H+hWI+7Xl3JJyuq6T+t+FC6S0lZw7zsbrRAxo
	blhECH5hVSAwymhPmXo0iZDdTJKBFT9q7gY0WkcQ4ahh4A54RdcOw6fhbvAyfLI0N4g8
	c2DFiQKEB0Fh1CpY4tGhVsB1fOco3QEmbc0p8nlr6yYKukeN/E5nRDkT0WoJ6t+ncXG+
	tOZd17DRgPqa8Er+CYs7klruxKBwSKYxClRVMWS+/RjOmDIA1QhtBulkeCTpxjRA/XVp
	MetNirF7Tmmq34KJxhng4vS47C6H4P1BunZ5z0CsZu+yzQQTAKjUO1JSFPPo2HcuL+XU
	EIhA==
X-Gm-Message-State: APjAAAVI4j0qh9PtbO2A47ksbWqbZdDXZxNkDtq3lW0VMIyajR2Ww7ZI
	0F3xWZqe3Nnh/rWdlZUm36U=
X-Google-Smtp-Source: APXvYqw8+oq8BALi6HW3VFKTNpWxgb6LfvlA+JvMQB8ocEWs2CDEm0MXSvDw9WGxwcej2PKeqLukoQ==
X-Received: by 2002:a5d:5386:: with SMTP id d6mr1041403wrv.104.1551458231577; 
	Fri, 01 Mar 2019 08:37:11 -0800 (PST)
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:b00c:66c8:99df:336])
	by smtp.gmail.com with ESMTPSA id
	b10sm18741300wru.92.2019.03.01.08.37.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 01 Mar 2019 08:37:10 -0800 (PST)
Message-ID: <ebbb814734a6bcefdf24be10c8ffc108fd6c3f65.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 01 Mar 2019 16:37:09 +0000
In-Reply-To: <CAJTo0La+VEpKorv4BDBuBxyqsgBk=Ym2Z9M6-OR9d0+u7p93UQ@mail.gmail.com>
References: <20190228142745.23630-1-luca.boccassi@gmail.com>
	<CAJTo0La+VEpKorv4BDBuBxyqsgBk=Ym2Z9M6-OR9d0+u7p93UQ@mail.gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] swig: fix build with musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2019 16:37:11 -0000
X-Groupsio-MsgNum: 121800
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vsu5HsawS7VIXRm7IoGg"

--=-vsu5HsawS7VIXRm7IoGg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-03-01 at 13:43 +0000, Burton, Ross wrote:
> On Thu, 28 Feb 2019 at 14:28, <luca.boccassi@gmail.com> wrote:
> > +Origin:=20
> > https://github.com/swig/swig/commit/90ba174fcea1618af57aa594199541d47a8=
9b7f6
> > +Applied-Upstream: yes
>=20
> This should be:
>=20
> Upstream-Status: Backport
> [
> https://github.com/swig/swig/commit/90ba174fcea1618af57aa594199541d47a89b=
7f6
> ]
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>=20
> Can you update the patch and repost?
>=20
> Ross

Certainly, sent v2, thanks for reviewing.

--=20
Kind regards,
Luca Boccassi

--=-vsu5HsawS7VIXRm7IoGg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAlx5X7UACgkQSylmgFB4
UWJYawf/X3bo9QeDjsk0o18dNYLp5xQQCZ8Zef8Lw0HKgxELv5p0czVUeUWs5no5
JP4lImi9XYI7h6nIuNS/u2iEwvjpvhpqn9diiBDJxHJ7jPKGaDzHa3/wDVhQQ+/H
RtEkj0lYfOq9QWLq90T2fKY4OLbWOelNU0WaAnS7GcBxEi9tmrzSnwohZL404G/U
xI6BqkTdZgUsQdgvg9VoSMknC3TvfSfViFvdMG1CcW/1Q3AdMWjSTBdURzEKIFj9
teiIiJ8xVQE0xpSdEDL5BCZW4ialtjm3xmZi8TPBzGBOp9Lrpm578YJh8K2lgHRm
DEy4pjvlm3zAgpLSwW75B/+DCfdwVQ==
=xxGt
-----END PGP SIGNATURE-----

--=-vsu5HsawS7VIXRm7IoGg--
