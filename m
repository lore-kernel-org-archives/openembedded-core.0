Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19vE2INKSqx3p6rWTRq2zhXVZgU9zu66hY=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QrC4T-0001gV-4I
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 18:55:57 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7AGpP2C013976
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 11:51:26 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E429966.3030607@gmail.com>
Date: Wed, 10 Aug 2011 11:51:25 -0500
Message-Id: <E0030AC3-67DD-4AC7-ADB1-B83C423F7ECF@kernel.crashing.org>
References: <032728F4-C51D-4298-B50C-B1C2C7050E22@kernel.crashing.org>
	<1312898286.14274.298.camel@rex>
	<2C6C8741-1012-47BC-BDA9-2A02A08C5027@kernel.crashing.org>
	<822AACC4-810B-4113-A214-EE283679EA06@kernel.crashing.org>
	<4E429966.3030607@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: python automake dirs (was meta-toolchain-sdk failure)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Aug 2011 16:55:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 10, 2011, at 9:44 AM, Khem Raj wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
>=20
>> So the root of this seems to stem from the following in automake's
>> python.m4:
>>=20
>> =
am_cv_python_pythondir=3D$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-pac=
kages
>>=20
>>=20
> =
am_cv_python_pyexecdir=3D$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/sit=
e-packages
>>=20
>> So the question at hand is how to fix this?
>>=20
>> Do we patch automake to respect libdir setting for these?
>>=20
>=20
> yes seems sane to me

posted some patches in which I do this via python-dir.bbclass which I =
think is better

- k=


