Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id B8EEB77FEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 17:39:34 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id f8so29449659wrf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=AV4TkARnX1kZ+AiaqtR4PmVDyBu4nS5DNRzCMLxqsE8=;
	b=bnJe0czDbt3PEcnjEnL5me/uGapHGs7JgK0aLB+OBs41NG0uvZxcWbW2Dxjxopz4LG
	WevaF0TDvV1PNKUlXHot31l9cF0GrX6J1XEYcYBWORwIS/+99hsLXrD+p6uBO4P3L0PK
	gpSngbv6F8o/0a0r+aEw/mPKjC9Cl7fCe006n4hA1op2TxTDJEg2x0vdHEWIa6EvoeXr
	qA/mf6RbWHL+T7gbzc/6ynmeecxQehmQ84PKV4GrsQcWZGle6bVbZAlGH+DsN/vt9aYO
	dIPWPvRetEmB7hqhesOE7BBf4KSdypHngoNF5jS6uOSXuLtfVwR0wZwZbnGI/8yHLM5h
	PrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=AV4TkARnX1kZ+AiaqtR4PmVDyBu4nS5DNRzCMLxqsE8=;
	b=qpkEjvUpqq2ZxaIFZPvAPz8ATqnleVoJ/P/RrBauQfrjCOfWfayUMsGjy8GK8xx9B3
	bW51lwMvWPeVFrDcd+WfdOp/5CsG7/SwNCURj8Cxh9OuzrzwW/wNkkgw7FFyGWswZrsK
	0O5X+Cn3hu8OOQg1NHGLFbSrTTutP86yguiT6cK8da7Og4qOwhZSYDY4ZJjIB5qjbpMo
	1fhkEqeFZXgltmEtKdKyotBiahZp5y58apwzsTaMw6Q1tgkCwckOrnJn92Cui9x4ahRI
	smgrH+lBRVYgf71f/3YkELfs4aay7Hb3MeK+o0oj7VZBewIsWpccYw6bL/M/lM5Tz2op
	mZ7w==
X-Gm-Message-State: AHYfb5iZ9KUprIdgXqnFTcr1oynUKE1nfIGF3NIM7MiLVsg/tzAIrtMX
	L41nv1tI7ofMFm2K
X-Received: by 10.223.180.66 with SMTP id v2mr5603205wrd.210.1503077975364;
	Fri, 18 Aug 2017 10:39:35 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t135sm2394743wmt.23.2017.08.18.10.39.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Aug 2017 10:39:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Aug 2017 19:41:14 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20170818174114.GA3298@jama>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
	<1502969638.13978.209.camel@linuxfoundation.org>
	<CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
	<d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: openssl10 unusable for many components
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
X-List-Received-Date: Fri, 18 Aug 2017 17:39:34 -0000
X-Groupsio-MsgNum: 101640
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2017 at 02:54:37PM +0300, Alexander Kanavin wrote:
> On 08/17/2017 02:46 PM, Martin Jansa wrote:
> > I meant "real-world" as builds for any products on the market (which ar=
e=20
> > likely using one of the failing recipes) - e.g. in LGE we have many mor=
e=20
> > failures over all internal components, so I'll just undo this openssl=
=20
> > switch (renaming openssl_1.1 as openssl11 and openssl11_1.0 back as=20
> > openssl_1.0 with PROVIDES openssl11). We won't be able to use=20
> > openssl-1.1 for long time anyway, because there are some 3rd party=20
> > component which are difficult (or expensive) to get rebuilt against new=
=20
> > openssl ABI, but we might be interested in some other improvements in=
=20
> > oe-core/master.
>=20
> Yes, this will work for you as a quick fix, but it is merely postponing=
=20
> dealing with the issue properly to a later date. Make a plan for it and=
=20
> keep in mind that openssl 1.0 goes out of upstream support at the end of=
=20
> 2019. Given its history of major security vulnerabilities, it will be=20
> removed from oe-core well before that time, so that it won't linger in=20
> supported YP releases.

openssl 1.1 goes out of upstream support on 2018-08-31 _more than a year
before_ 1.0.2 support, see:

https://www.openssl.org/policies/releasestrat.html
Version 1.1.0 will be supported until 2018-08-31.
Version 1.0.2 will be supported until 2019-12-31 (LTS).

Given its history of major security vulnerabilities, I hope you'll
remove openssl-1.1.0 even sooner than openssl-1.0.2.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWZcmuQAKCRA3VSO3ZXaA
HHP4AKCPc+3v8BUHgmMcG/wVnNwLSV4cigCfXXPMBDQh/+47CHwAErOY6x+Na8A=
=K8Ho
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
