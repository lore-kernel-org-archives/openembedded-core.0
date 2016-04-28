Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE6D73192
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 12:14:39 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id g133so104808587ywb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 05:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Mgk+4+MbvoZVbtuq3I7dYgFGxiwyfE89vr9ACZ+fAbE=;
	b=LYCvAywIyvrVbmq6vw4pVkUtmFDbqskzRLfisr67CeTAoDJM6vXew3LC82iBK6iFci
	AZ+NGLjLnBN974Hbk5/91rd32/HcfnfjAcppY9rJp37G0alAkq9FQZjdXY55jKXZ/doU
	9T8K07pVF2y5ohImXo4eCs7dw1J0aRBQM4qh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Mgk+4+MbvoZVbtuq3I7dYgFGxiwyfE89vr9ACZ+fAbE=;
	b=DuBM4nVn9NGU5wurVe9kLPbytzGl+xd2xq7GUPmcC35N8pggUD64Q4bVBRJkhQOXKH
	UZ5Ef+dfy1LL0GKHBFJyrzlCI/crTHejEuxnaIk7KliRGCKR+9OqpIeQOuyn8zpgXw7T
	KTTx62pQS42g/o64TJyevmu+sgM9FR6SRJvu34vtQvDNVnJMTAcH2g12SPnmMxo7vWOE
	omQKrUnM0WWnbay7ZwvRy/ojh1yudx2s3Uj2XUxaXgik2Bh6PdhWwCNGNuSHWg/YWKkh
	vPxEx22lDjdraDlh95uYx6i11atbKEyEjlUgMwBaaeLy/TY53fEWoPWwwsm08bdpVNsQ
	YAiw==
X-Gm-Message-State: AOPr4FWIjCfUSG83+4legWkipRsGZT/qrWoYYXOMvUVwtG/D9jZFnMJPSvA2WmlCgK5STQ==
X-Received: by 10.129.110.138 with SMTP id j132mr7349163ywc.138.1461845679446; 
	Thu, 28 Apr 2016 05:14:39 -0700 (PDT)
Received: from bill-the-cat ([2001:470:8:32a:a8f1:8916:9925:ea71])
	by smtp.gmail.com with ESMTPSA id
	t189sm4508069ywd.43.2016.04.28.05.14.38
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 28 Apr 2016 05:14:38 -0700 (PDT)
Date: Thu, 28 Apr 2016 08:14:37 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160428121437.GJ19598@bill-the-cat>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
	<CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
	<CAJTo0LZZ3Hs_yrm5ceik4j8Orv-UQ9T72Wu=R_PCRKw4Y9-WCw@mail.gmail.com>
	<CAMKF1sozR3_Mhy5PKSaKCo7S2yHrtLzTNrUURFhN38gV0AbkYQ@mail.gmail.com>
	<20160427221005.GA19598@bill-the-cat>
	<403123E7-85F1-4CBF-9D6C-E6377B89D5EA@gmail.com>
MIME-Version: 1.0
In-Reply-To: <403123E7-85F1-4CBF-9D6C-E6377B89D5EA@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Yocto Project <yocto@yoctoproject.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Thu, 28 Apr 2016 12:14:42 -0000
X-Groupsio-MsgNum: 81353
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ExXT7PjY8AI4Hyfa"
Content-Disposition: inline

--ExXT7PjY8AI4Hyfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2016 at 12:08:46AM -0700, Khem Raj wrote:
>=20
> > On Apr 27, 2016, at 3:10 PM, Tom Rini <trini@konsulko.com> wrote:
> >=20
> > On Wed, Apr 27, 2016 at 10:53:52AM -0700, Khem Raj wrote:
> >> thanks I think most of them come to these categories. So any help in
> >> fixing them is welcome.
> >>=20
> >> 1. kernel older than 4.4, backport needed fixed into these branches or
> >> move to newer kernels.
> >> 2. uboot dont have gcc6 compiler header files, backport the needed fix=
es
> >=20
> > 9b2c282b348dfe966bbba967dc7a45ce817cce50 from mainline.
> >=20
> >> 2. meta-qt4 needs to use gnu++98
> >> 3. gcc6 providing its own stdlib.h in libstdc++
> >> 4. gcc6 swtiching to gnu++14 for C++ as default.
> >> 5. GPLv2-only versions of recipes are simply old will need fixing
> >>=20
> >> I will take a stab at fixing the nativesdk recipes which is mostly due
> >> to stdlib.h issue.
> >=20
> > Please do, I'd like to see some SDKs so I can get more U-Boot testing
> > done with gcc-6 :)
> >=20
>=20
> I have pushed couple of more fixes which should now fix the nativesdk iss=
ues and SDKs should be building
>=20
> Tree is here. Let me know how it goes.
>=20
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-6
>=20
> and also to github
>=20
> https://github.com/kraj/openembedded-core/tree/kraj/master

debian/jessie, nodistro, MACHINE=3Dqemux86. bitbake busybox:
| make[1]: Leaving directory
'/home2/trini/oe-gcc-6/openembedded-core/build/tmp-glibc/work/x86_64-linux/=
gcc-cross-initial-i586/6.0.0-r0/gcc-6.0.0/build.x86_64-linux.i586-oe-linux/=
gcc'
| cp: cannot create regular file
'/home2/trini/oe-gcc-6/openembedded-core/build/tmp-glibc/work/x86_64-linux/=
gcc-cross-initial-i586/6.0.0-r0/image/home2/trini/oe-gcc-6/openembedded-cor=
e/build/tmp-glibc/sysroots/x86_64-linux/usr/lib/i586-oe-linux.gcc-cross-ini=
tial-i586/gcc/i586-oe-linux/6.0.1/include/limits.h':
No such file or directory

Doing MACHINE=3Dqemux86-64 provides a similar error.  Thanks!

--=20
Tom

--ExXT7PjY8AI4Hyfa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXIf6tAAoJEIf59jXTHXZSmLQQALn2S9+O5jmNtXXa6wIoh1Zj
37MLt23kfmn1JJQmpC9uHIY2CHe1kCgIdiIVrK6fRgB9QG0964JYNy166fwxrugV
T3G6HcdabPf0ZtD27IOuY6vR6xX1bB/9LDCgTdsxI3ZMmhRK+RqLeU1PhuOyy5ho
q5E4dd7zpQf1YZemy1lonqcqxe/ST54W9L6Uo3m6mgLZ26d1Frieo76dtFyM1jaH
bqGXzIpKS+bjh7o7FENXAZLFa+GVOavtjmmejDdqU03Ck7/hk/s1dpx2dobW9qjA
VbZ1aWU6yfo3uaABJmTaZKlnbc8Rz/N3jLPwSk22s2mLYX7OBmEmX4WhwjddCvny
6axgl9v+/MQD3VeaHl6FNEMIPH4P+q/9d5IjeUsZsnuGrf997Xws7YAkwL0jsyk9
64HMxB2tz1iKBwNcH78eb0XFfMg4ECCNO7KxYFpyO8r1FCsTVq114WGiowkHWpAc
dPNX669HXEmMIgcBt3HQlSOqtcoHVd0EuTe9c8L1MwUbKpud1Hb/lyfNe7i5Zpn5
rjBD1W/PXS42maitosNFZWgmfrFx/dTVthZZ2zoDShdnWg3wzU+aI+qxS++XJLvG
8ckbKsiIvy92ls0090ewQH8nk3KWkdver3uPAqiZdLAfe3oSwE9jBat+n8puyGZ7
DyKmFNG8k0XZGo1HQmWD
=qW92
-----END PGP SIGNATURE-----

--ExXT7PjY8AI4Hyfa--
