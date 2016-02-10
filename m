Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id C43256FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 19:01:10 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c10so1372373pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 11:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=innjA6QxhhX0aSYSMuCghHzkCKIPn99EUArLLG/IVMM=;
	b=mm76helslsw1OlSMmWRm01jbAQ65f84lWNjWIysG4HzHnw6vOwEYMxxUnFSQwFpWzO
	eWyH43YuEMWozIFiLyHMRd39mSXouopjf2/A5bJOeVowrt+MfuGJpo3PuicnMGRMj5B0
	oRTOQFJ4vxuRncZlEKJD8l57cYcVaImUr4l9c47nqUfzh5XLRDPSxM9IHnIzKkZh3g0/
	fl/spjIO2R7xR7qZywa1jeWkOEP/9Bxo1ltoXtGTaFYFsdMR2u3afXgwNLaHFqAzh8wu
	NJ+DuQ0GAPm/zw/cHRDkl9wBuzsynY0dZVWk9COKi1900UJ1erT4HjMwvBMHlpqyGZ06
	umDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=innjA6QxhhX0aSYSMuCghHzkCKIPn99EUArLLG/IVMM=;
	b=Jz6WR7DC/yOgyqfmPDplJZ8vJoI0k+f9UY1+bzlhv/MiwX+223U/OyeBdJcPPLDGEg
	HGRduD/vdOrgy8dcmp41LIuPSd/X1805mog1SrodZ0A8cznfk8dnjVe3jaRY5bINc3PU
	338xn+GfoHIDXe1DNTANX9FlVU+nRPQG5JtagpYR443j36y9z7sE3bxILiuUkJPraI1K
	QNMfXJpiKc9MgLUgitnVsrEQnIOPAl39ZMC+4EztVcIPB4hDd6ACE6Pb9MK+Od/hI6Ii
	RPqW0gcUoCP7T9zi8sVTOXMIWGbREHKz/2THrRQtMCot0kyOr+/ODlR0yPuzB1tlWl6G
	2UNg==
X-Gm-Message-State: AG10YOTLSbszvsp/0HWfFMjnHKV9ZDZEf7TKPeXOp2bs2WUWeqnQEv6P7JM/V0ye1zYyFw==
X-Received: by 10.98.89.215 with SMTP id k84mr60929821pfj.66.1455130871444;
	Wed, 10 Feb 2016 11:01:11 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:cc82:3541:372c:9294?
	([2601:646:8802:5d5c:cc82:3541:372c:9294])
	by smtp.gmail.com with ESMTPSA id
	r26sm6912054pfb.21.2016.02.10.11.01.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Feb 2016 11:01:10 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1455130461.7421.130.camel@pbcl.net>
Date: Wed, 10 Feb 2016 11:01:02 -0800
Message-Id: <B1055F43-2613-4D52-B314-F9CABC755E83@gmail.com>
References: <cover.1455126045.git.raj.khem@gmail.com>
	<d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
	<1455130461.7421.130.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/9] distutils: Consider S != B case
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
X-List-Received-Date: Wed, 10 Feb 2016 19:01:11 -0000
X-Groupsio-MsgNum: 77964
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8477A4BE-A773-4720-B085-C6A9CF7CABD1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8477A4BE-A773-4720-B085-C6A9CF7CABD1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 10, 2016, at 10:54 AM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Wed, 2016-02-10 at 17:43 +0000, Khem Raj wrote:
>> +        cwd=3D$PWD;cd ${S}
>> +        STAGING_INCDIR=3D${STAGING_INCDIR} \
>> +        STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>> +        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} =
${S}/setup.py build --build-base=3D${B} ${DISTUTILS_BUILD_ARGS} || \
>> +        bbfatal "${PYTHON_PN} setup.py build execution failed."
>> +        cd $cwd
>=20
> Why do you need to save and restore the cwd?  If this is a shell task
> then the "cd" would be local to that shell invocation anyway, right?
>=20
> Also, given that you're invoking it by full pathname as
> "${S}/setup.py ..." anyway, do you even need ${S} to be the cwd in the
> first place?  That seems a bit redundant.

yes however there are packages like
=
http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/recipes-de=
vtools/python/rpio_0.10.0.bb
and
=
http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/recipes-de=
vtools/python/python-rtimu_git.bb

whose build systems were assuming that they were building inside S and =
were referring to headers include paths
relative to source dirs.

There might be more of these kinds

>=20
> p.
>=20
>=20


--Apple-Mail=_8477A4BE-A773-4720-B085-C6A9CF7CABD1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAla7iPUACgkQuwUzVZGdMxSiDACfQPsZdAI1Knf7j11EbQA9aiqU
wAkAniylu9TbmZWEFVbiMFb+Jb14pMSB
=dEwg
-----END PGP SIGNATURE-----

--Apple-Mail=_8477A4BE-A773-4720-B085-C6A9CF7CABD1--
