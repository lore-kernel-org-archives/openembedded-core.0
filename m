Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3D79060F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 10:28:54 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so2674753eek.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 03:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FAW82JvLWcMhQ4YbOVc0gz1Ixyd5tHqo1jzTGXcFN5o=;
	b=Umu9vCKhKshnO/2Qzo14Uyde6nGANFI6AXsWspQC3pdqkGUc7n0zqT7h89Pnc4Dapv
	ySWmDFUngzMcgtDPD0k//TjGTjmbP7ZYrhaKHefoRfBln3Y1CR4cxSt1h0/3iM66BxsR
	JOBdzw4U+1eIighOe5zNkPUiHIeKLjkpI+lL1D6E0YgyCH0HZ1/dlN22UtAvMHwHEi8d
	ZPgo3MPWpAokalGByPpB6vAGamml69NtYfJGFKAg8UFOVJAoae++okzU2/1vv43236zx
	8GLY88gvLdVeVAHfuefAdD+z2s2+9MVyCXrTfXUytGeuVxJaVOhtagDY8DAjkfXZBZQ4
	V22Q==
X-Received: by 10.14.210.8 with SMTP id t8mr19165055eeo.39.1379413734676;
	Tue, 17 Sep 2013 03:28:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm49667577eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 03:28:53 -0700 (PDT)
Date: Tue, 17 Sep 2013 12:30:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130917103029.GA7313@jama>
References: <1379114920-23851-1-git-send-email-jslater@windriver.com>
	<CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
	<CAJTo0LazMZXn9bajiMwNhAPiQiry4onu3iZfHws8XKb=sb1BJQ@mail.gmail.com>
	<523501AC.4010208@linux.intel.com> <5237E49C.7090608@windriver.com>
	<CAMKF1sqDxGyVnrap0=Jsq=iMFGnXkupjuWnTSwxzBv8K4tqzPg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqDxGyVnrap0=Jsq=iMFGnXkupjuWnTSwxzBv8K4tqzPg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Joe Slater <jslater@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkit-gtk: limit ld memory requirement
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
X-List-Received-Date: Tue, 17 Sep 2013 10:28:54 -0000
X-Groupsio-MsgNum: 45129
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2013 at 10:31:18PM -0700, Khem Raj wrote:
> On Mon, Sep 16, 2013 at 10:11 PM, Kang Kai <Kai.Kang@windriver.com> wrote:
> > Without patch:
> > real 76m1.646s
> > user 86m36.704s
> > sys 38m39.103s
> >
> > With patch:
> > real 63m36.193s
> > user 86m9.274s
> > sys 37m48.431s
> >
> > It seems the link option doesn't increase the compile time.
>=20
> on the contrary its reducing the build time which is kind of
> interesting and seems a win-win. are you able to extract the failing
> link command and just run that with/without the linker option to
> discard memory ? and measure just the linking time on the host where
> it already builds without this option?

I think someone should measure it on machine with a lot of ram. If the
test was executed on machine where it was linking mostly from swap,
then it's not so surprising it was faster with the option enabled.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI4L0UACgkQN1Ujt2V2gBwm6QCfV7vNL/Apl47+CJwzBFPu3kis
YTUAoK9BWOpmjbe2vOF1QkYqgxM+k83g
=q0vQ
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
