Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 99FDD6AF02
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 05:38:03 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t59so1745287wes.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Q6jxJ84HUC/3sKMflG+8zi5o4lq6pJ3GFmbYTwKbno0=;
	b=S5eufB7N/8xqvwbXZuPrAClnNJD+UMQSIK8qWZseExn19HK+TZK669NTZGwGRAuDKI
	k1ECSjdpzmQM1aFEmG3MbATH1PoONmjdhgO1aurauI7+/VGnwYPfD8W3iiAnZVxdxduB
	1+VXx6fpYYV3qRCvXN6SS35u2rMGirmegj7TPP89L41YZt6pswvz9+/hgCdWcYoTWmMH
	dcBQFEkGLF3ni+nLcqA7nBZTYVsLiBAVBLpNTtyA3QMkwAOlBFz/7bSCgVzIU2rZUD8j
	DAJuztBqF8CnkQOIrYvswA+zcQRlBd1UHNoREmudbD/Io+j594qNaOMt3WHvivn3BiaZ
	JOkA==
X-Received: by 10.180.90.240 with SMTP id bz16mr4798255wib.24.1372484284343;
	Fri, 28 Jun 2013 22:38:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj46sm14849447eeb.13.2013.06.28.22.38.03 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 22:38:03 -0700 (PDT)
Date: Sat, 29 Jun 2013 07:38:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130629053844.GQ3261@jama>
References: <cover.1372456294.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Sat, 29 Jun 2013 05:38:04 -0000
X-Groupsio-MsgNum: 41192
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jXoUnAu9pZeaHebo"
Content-Disposition: inline

--jXoUnAu9pZeaHebo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2013 at 03:03:39PM -0700, Khem Raj wrote:
>=20
>   generate-manifest-3.3.py: Add script to generate python 3.3 manifests
>   python-3.3-manifest: Add python3 manifest file

>   classes: Add distutils for python3
>   setuptools.bbclass: Use python-distribute instead of
>     python-setuptools
>   distutils3.bbclass: Port the distutils class fix to handle filenames
>     with spaces
>   setuptools3.bbclass: Remove useless multiline comment
>   distutils: Introduce PYTHON_ABI variable
>   distutils3: Do build_ext as separate step during compile

I think these 2 groups could be squashed together for easier review, but
otherwise great work, thanks for doing it!

I'll add them to jenkins a bit later when I get some better build that
what we have now.

--jXoUnAu9pZeaHebo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHOcuQACgkQN1Ujt2V2gBxfygCgkcI82SRqr3oQZz29/bn6mA1d
02QAnAt+hRjv9AYC44LUJc5sfOO0Eh9R
=7tw6
-----END PGP SIGNATURE-----

--jXoUnAu9pZeaHebo--
