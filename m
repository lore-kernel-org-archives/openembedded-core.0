Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4477F60196
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 11:24:53 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so11040178wgh.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 04:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zQ+29mXm9bILF78IrRFpHLQC6OoOKR36Q0H3MlMJ7gk=;
	b=ZEUnHoV/eAh//km516lkPLPuxgvsMaS+eDH7LCtjHQkbPwXCXYRIXJfusWljXd5Kvn
	PiCrCJdbGtR4ESl8imb2X0HQez0vsYeIsWwGiErcqfI77y0Wyk89HES15kSkxoAk2iuG
	tc7znodgIvCfMTcWahdf2nxJsh2it6FiTPNl2AdlYjQSKDnvPuQ0mqvGOmrGqlfD2bqc
	WCmrPcGaUdLohr069AE1kl66XCj/BVHyXsyeEDN25q4pvu1Io2V1SA9UHJDYLKly8Lo7
	zd5bCx5XDdaE1Pg/NScfA1EVg+33ol/QYfc30VvDdwxZI3NcYcdqJtlK7uz0V4O5qhLj
	x05Q==
X-Received: by 10.180.84.66 with SMTP id w2mr37723709wiy.27.1407929094883;
	Wed, 13 Aug 2014 04:24:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ga2sm3754474wjb.44.2014.08.13.04.24.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 04:24:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Aug 2014 13:25:31 +0200
To: Yevhen Kyriukha <kirgene@gmail.com>
Message-ID: <20140813112531.GU14848@jama>
References: <CADV-EXHPuDtDk8pnFfJ4QQCVQufidX+7YuuK_FdgsEXj_46t6A@mail.gmail.com>
	<CADV-EXHDKqVR8Quu=Vj7-Tk8BrB-OS1Y=Y0iYi+ES2YNUiREMQ@mail.gmail.com>
	<CAP71WjyHMhzdRWmxNwM8Ot=t1O0qFvONyaKqpWSaeEZU_+PKVQ@mail.gmail.com>
	<CADV-EXF_+nNXPUEY0hJ3akxNCb0HeD+tHAYAiVcq9hACCv-ExA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADV-EXF_+nNXPUEY0hJ3akxNCb0HeD+tHAYAiVcq9hACCv-ExA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Two distros with same MACHINE
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
X-List-Received-Date: Wed, 13 Aug 2014 11:25:04 -0000
X-Groupsio-MsgNum: 56398
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6Ij8Fe+3khmaPw8P"
Content-Disposition: inline

--6Ij8Fe+3khmaPw8P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2014 at 02:09:36PM +0300, Yevhen Kyriukha wrote:
> 13 =D0=90=D0=B2=D0=B3 2014 =D0=B3. 13:51 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=
=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C "Nicolas Dechesne" <
> nicolas.dechesne@linaro.org> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> >
> > On Wed, Aug 13, 2014 at 12:46 PM, Yevhen Kyriukha <kirgene@gmail.com>
> wrote:
> > > I have 2 distro configs that use different PACKAGECONFIG settings for
> the
> > > same package. I'm building all distros for single MACHINE. Do I need =
to
> set
> > > different TMPDIR to build these two distros or I can use same dir?
> > >
> >
> > yes, you should. i generally recommend to use 1 build dir for each
> > combination of <machine>, <distro> and <OE version>. keep in mind that
> > TMPDIR are 'cheap', assuming you are sharing ssate-cache, downloads
> > and using rm_work..
>=20
> Thanks!

I don't agree with separate dirs for <machine>.

Sharing the native sysroot and huge part of deploy/ipk/<common-arch> is
very useful for lowering disk space usage.


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6Ij8Fe+3khmaPw8P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPrSysACgkQN1Ujt2V2gByhlQCfa0T/xWKKBVBRBb0644qvJQwd
WZgAoIM6ecM6YS5xQ26XgxRCTkshtyN8
=km2S
-----END PGP SIGNATURE-----

--6Ij8Fe+3khmaPw8P--
