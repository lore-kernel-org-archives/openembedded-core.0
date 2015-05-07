Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2C173EED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 06:33:13 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so32480222pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 23:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=otIqbI5UzcUxY2E3jdCOpzWVl4A/owTpL6REfAJqjp8=;
	b=de0sVtAGj5T2Hev3ehWCbqVeL9g4kJ0EAqsZmNpUeDxjH1uEEmsAZBoj9YffwleBYB
	Lu09gIlMVugFwkNFyLmZ9BDun6N/YRVxSckjrALyrycajFEd3zWAjpEYGavFGVCXwBPs
	t4CDM/v7EdOKXgv9rehqX8cKhBE7+IMYEY5kqJ2Lx5jEsYNRBVe/05h2byDh37g8Nvr9
	9g7Tynoki/i+xcPsV8Ywoc07+9KtMCywEhf4TldMBz+Mv5YxehUiKJv5QjvEV0IUUpuh
	/xZQaF/vo6YXS+dBffrwY9oywygAcnvZey9ATA3Qb/VCRcsEYMPKgqZ6rkPwOKYuckpY
	9uYg==
X-Received: by 10.66.167.232 with SMTP id zr8mr4185055pab.23.1430980394383;
	Wed, 06 May 2015 23:33:14 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:2019:32dd:e815:cffd?
	([2601:9:3580:84c:2019:32dd:e815:cffd])
	by mx.google.com with ESMTPSA id ge4sm964449pbc.52.2015.05.06.23.33.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 May 2015 23:33:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150506153325.GB2067@jama>
Date: Wed, 6 May 2015 23:33:12 -0700
Message-Id: <B72FAFCA-6F01-4EFC-8C11-BD7DBDEA0217@gmail.com>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
	<1430521154.18360.28.camel@linuxfoundation.org>
	<55440C90.5060605@windriver.com> <20150502081346.GD2366@jama>
	<55458D0D.6070904@windriver.com> <20150506144241.GA2067@jama>
	<554A2C1C.5040304@windriver.com> <20150506153325.GB2067@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 07 May 2015 06:33:13 -0000
X-Groupsio-MsgNum: 65231
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3C3D12DE-C71D-43B6-B494-8117FB017BD2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3C3D12DE-C71D-43B6-B494-8117FB017BD2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 6, 2015, at 8:33 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> I'm considering providing simple old-style recipes for vanilla kernels
> and using them in my jenkins builds instead linux-yocto, because =
kernel
> shouldn't block testing other recipes from meta-oe and other layers as
> often as linux-yocto does.

just for build sake to avoid full kernel builds, having a dummy kernel =
recipe should be another alternative


--Apple-Mail=_3C3D12DE-C71D-43B6-B494-8117FB017BD2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVLBygACgkQuwUzVZGdMxS0BACeJW5tg+Q3kKM+negtTUtepk1C
RrEAnjQ0F8DVez4wcuImXAT4ADpc7EFA
=Lc82
-----END PGP SIGNATURE-----

--Apple-Mail=_3C3D12DE-C71D-43B6-B494-8117FB017BD2--
