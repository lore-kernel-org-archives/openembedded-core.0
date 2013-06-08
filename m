Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 430696A67B;
	Sat,  8 Jun 2013 09:10:01 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id l15so2044907eak.9
	for <multiple recipients>; Sat, 08 Jun 2013 02:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=elwra5M/lRur1JrRhD8D046HqsFE2AdlGXCCKHBBc9o=;
	b=yymajoWtOHlfMepndXBgdcErDHe0JWERap9lECcXVnZPg7MxFS4K5Kv7hlpegk1NKJ
	YtYmhX9bIszRPy7YOW7QK5piqW1HN2Y4qg/2/ogSRb4YOhcx1fziK2FrOKACwmploHZy
	pdDQud3B3p1IZJZ3muXM5yI0QKQLhXBu7idIkRQtLOlAEHlZVO5l6a7iIcR1NfyYb96s
	pRuw3Q5egse2uQ1dmySq/ajBp+6cLA7HuZ7hg+RDHDCyPQn7ZSUPPRwkdA6vQJ7i73D9
	aVTwJ/hndd2Z2JXpt2NWv4gKlEMbrKpyZaOw3cTQO7JBLZ25JDo7mwl81CXiM7e7tALR
	8pMw==
X-Received: by 10.14.221.3 with SMTP id q3mr2263311eep.149.1370682601401;
	Sat, 08 Jun 2013 02:10:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b14sm4643000ees.16.2013.06.08.02.10.00 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 08 Jun 2013 02:10:00 -0700 (PDT)
Date: Sat, 8 Jun 2013 11:10:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andy Voltz <andy.voltz@timesys.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20130608091020.GO22710@jama>
References: <20130607154357.606025038F@opal>
MIME-Version: 1.0
In-Reply-To: <20130607154357.606025038F@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andy Voltz : tune-cortexa.inc: create a common include for cortex-a armv7a tuning
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
X-List-Received-Date: Sat, 08 Jun 2013 09:10:02 -0000
X-Groupsio-MsgNum: 40351
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjXtncIm5b3tWrFJ"
Content-Disposition: inline

--qjXtncIm5b3tWrFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2013 at 03:43:57PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 3e4f4a1cf07ff7cf4c71566492385f8fbf581789
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D3e4f4a1cf07ff7cf4c71566492385f8fbf581789
>=20
> Author: Andy Voltz <andy.voltz@timesys.com>
> Date:   Wed Jun  5 11:52:29 2013 -0400
>=20
> tune-cortexa.inc: create a common include for cortex-a armv7a tuning
>=20
> The tuning files for the cortex-a* processors are mostly identical for
> the A7,A8,A9,A15 processors. Rework these files to use a CORTEX_ID
> variable to setup the tuning for each specific processor.
>=20
> Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Something is wrong with this one:

ERROR:  OE-core's config sanity checker detected a potential misconfigurati=
on.
    Either fix the cause of this error or at your own risk disable the chec=
ker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (${ARMP=
KGARCH_tune-cortexa8t-neon}).Toolchain tunings invalid:
Tuning 'cortexa8t-neon' has no defined features, and cannot be used.

ERROR: Execution of event handler 'check_sanity_eventhandler' failed

Please use tests like
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune2-=
test
to check that all tunes are still valid after such change.

>=20
> ---
>=20
>  meta/conf/machine/include/arm/README         |    3 ++
>  meta/conf/machine/include/tune-cortexa.inc   |   35 ++++++++++++++++++++=
++++++
>  meta/conf/machine/include/tune-cortexa15.inc |   35 +-------------------=
-----
>  meta/conf/machine/include/tune-cortexa7.inc  |   35 +-------------------=
-----
>  meta/conf/machine/include/tune-cortexa8.inc  |   35 +-------------------=
-----
>  meta/conf/machine/include/tune-cortexa9.inc  |   35 +-------------------=
-----
>  6 files changed, 46 insertions(+), 132 deletions(-)
>=20
> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dcommi=
tdiff;h=3D3e4f4a1cf07ff7cf4c71566492385f8fbf581789
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qjXtncIm5b3tWrFJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGy9PwACgkQN1Ujt2V2gBxYRgCfaCWHWh9MbEoj500/x3iVu+rq
hHsAoLNYuXiAjVqEdvOlzTT/lXI1/C69
=a0RN
-----END PGP SIGNATURE-----

--qjXtncIm5b3tWrFJ--
