Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4FDC0731CC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 14:06:07 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l6so66108911wml.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Apr 2016 07:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=W42wYX8xcnPwMQQJ/kqGX+7R93y/UaonKo9Ok6V+c0s=;
	b=D5GBxqpC3KjSOLTntl40o/y/o5aiTUWxIiy3EGpeYfxPhJrt9uGsFE/1FnBu68oi0G
	njtCblbajfcWinNk7UE4hcmmQkhVWg4P9ziC+eHBxHKe/7VDXqMsvkfNPvfoXgV30xYy
	7rTB7T/S9dpV8P8JB665eX5uG5q1ekpoS58+vSc1pEOJBduWZacmxCf3uFZB6G/ABwts
	96/Hz0MGPjnpA09kDpxsftrIGoxbWLi9t2kElGpk91aHPmRiLJQC+F2aZQoO51whAuGq
	+0kEMW3jYISbqPwrJsmcB1ongBThLU6B3NdOT4fUkC0d67J8xpfjCOJIMKBFONcju1xU
	udYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=W42wYX8xcnPwMQQJ/kqGX+7R93y/UaonKo9Ok6V+c0s=;
	b=UcVbfAMXdXBja4jMJmNGlTHORANrfmAmPCIo5aT11Ie4sDTcQF2JMIGZrqmNH8XyjY
	kQts1oHHL+sf7YAGsYqY/pPVDeW/ak5j8R//X7mLUTdqYy88rD2R6K3m0AJkYRplPkSd
	G3eabRpYCm8mjkdZ4VKGJDpURSMenHJ1/R4ndJn1YYQ5ppxKdkT7Nwg1Uz6PRUVEs7JK
	Ol3C+rzTkHYLsc0QSFEG4xzcKxu3x0ze5eazMcGH7c3mTeIJloQXkr+cOGqU5ClvtntY
	jRP9keLnFd1VOQgCoSyTEotGAyOVEjJ2r+Oi/SL16sD0uWp6Tbt9jq6/vesf3msubk6c
	qn0g==
X-Gm-Message-State: AD7BkJLf7ao7H7jfx/ufRwn99XX0w/cdbsjfgCanbop+LAaxQXSmV4VrC+MBG1lVyA2Sbw==
X-Received: by 10.28.26.138 with SMTP id a132mr3928269wma.20.1460124367653;
	Fri, 08 Apr 2016 07:06:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l124sm3230089wmf.11.2016.04.08.07.06.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Apr 2016 07:06:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 8 Apr 2016 16:07:05 +0200
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20160408140705.GA2562@jama>
References: <alpine.LFD.2.20.1604080942280.11776@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1604080942280.11776@localhost.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: does a normal OE kernel build negate the ability to generate a local version string?
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
X-List-Received-Date: Fri, 08 Apr 2016 14:06:09 -0000
X-Groupsio-MsgNum: 80657
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 08, 2016 at 09:57:02AM -0400, Robert P. J. Day wrote:
>=20
>   i was just playing with wind river linux 8 and trying to figure out
> why i couldn't generate a local version string that contained the git
> commit ID, so i zipped over to oe-core to see how it was done there,
> and it seems to be the same way, so can someone clarify that my
> understanding here is correct?
>=20
>   normally, if i want to add the git commit ID ("-gxxxxxxxx") to the
> kernel version string so it's available via "uname", i'm used to
> selecting the kernel config option CONFIG_LOCALVERSION_AUTO, which
> uses:
>=20
>  $ git rev-parse --verify HEAD
>=20
> to extract the first 8 characters of the commit ID. so i selected that
> option, but wasn't getting that string.
>=20
>   poking around further, i saw this in scripts/setlocalversion:
>=20
> scm_version()
> {
>         local short
>         short=3Dfalse
>=20
>         cd "$srctree"
>         if test -e .scmversion; then
>                 cat .scmversion
>                 return
>         fi
>         ... snip ...
>=20
> so if the file ".scmversion" exists, its contents are used instead.
> now *i* never set that file, but lo and behold, in the kernel source
> tree, there it was, empty, which explains why i wasn't getting any
> local version string.
>=20
>   and where did that empty .scmversion file come from? i see this in
> kernel.bbclass:
>=20
> kernel_do_configure() {
>         # fixes extra + in /lib/modules/2.6.37+
>         # $ scripts/setlocalversion . =3D> +
>         # $ make kernelversion =3D> 2.6.37
>         # $ make kernelrelease =3D> 2.6.37+
>         touch ${B}/.scmversion ${S}/.scmversion    <---- there
>         ... snip ...
>=20
> which clearly appears to touch that empty file. is that deliberate? is
> this an explicit decision by this bbclass file to prevent people from
> generating that local version string? am i reading all this correctly?

Yes, see
http://lists.openembedded.org/pipermail/openembedded-core/2011-December/053=
263.html
for more details

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcHuokACgkQN1Ujt2V2gBzJdwCfc6yjbvj+YPW569ymzkNu20vT
fNcAmgIpmAiimrGmQ9YWmNmWMUXqHpdl
=y++s
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
