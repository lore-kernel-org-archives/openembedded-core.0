Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0A94C6A49F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 21:38:18 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h10so597257eaj.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2013 14:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J3t4Aq4UwE4xMUtCRwTTtDtmRFQIXUgrPTIcx0O444I=;
	b=O4OavcTIdjqbfijlC1BMXAHtplEjhm2A0u9nQGgpKw0R9JQGb+s/OQMZKxDt8RLbFu
	husuY/onesJQ5BW1J1lQo50Vt5uDS68Xo+OWNUdQR8Tf9P309UuNkeYPqV/Zj9sR+tvn
	9T87cCIADlyhDn8S0pVxlNWACXTGV8nuf2pBVCf4X9BJKMRew4r6wVP24NRR62D9oMIR
	CXMy1bRZruuUH395YeMWQRJ06IW7AwmyO/IzEa+8Oh3+wn7Gv+9+hgQkNUzaKapU7/dI
	jCb4eB4KbyujkvGluZuULcMYxQWGDNuiWeCu/uxUN14SaTdPtCgrbY3/Y5FfHvrpOVSb
	Kp+A==
X-Received: by 10.14.219.136 with SMTP id m8mr12818350eep.86.1370381898961;
	Tue, 04 Jun 2013 14:38:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bo9sm80586036eeb.9.2013.06.04.14.38.17 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 04 Jun 2013 14:38:18 -0700 (PDT)
Date: Tue, 4 Jun 2013 23:38:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130604213835.GC30727@jama>
References: <cover.1370012689.git.ross.burton@intel.com>
	<5bed792688d848b38d1565e2705b1f9dca7a17d5.1370012689.git.ross.burton@intel.com>
	<51ACFF04.80101@linux.intel.com> <20130604142627.GA30727@jama>
MIME-Version: 1.0
In-Reply-To: <20130604142627.GA30727@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/11] at-spi2: add -core and -atk, for GTK+ 3.8
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
X-List-Received-Date: Tue, 04 Jun 2013 21:38:19 -0000
X-Groupsio-MsgNum: 40161
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline

--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2013 at 04:26:27PM +0200, Martin Jansa wrote:
> On Mon, Jun 03, 2013 at 01:39:32PM -0700, Saul Wold wrote:
> > On 05/31/2013 08:05 AM, Ross Burton wrote:
> > > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > ---
> > >   meta/recipes-support/atk/at-spi2-atk_2.8.1.bb  |   19 +++++++++++++=
++++++
> > >   meta/recipes-support/atk/at-spi2-core_2.8.0.bb |   17 +++++++++++++=
++++
> > >   2 files changed, 36 insertions(+)
> > >   create mode 100644 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
> > >   create mode 100644 meta/recipes-support/atk/at-spi2-core_2.8.0.bb
> > >
> >=20
> > Ross,
> >=20
> > I ran into a do_configure issue with this new recipe, the at-spi2-core=
=20
> > failed to configure on my local test machine.
> >=20
> > Possibly this is the reason:
> > > configure:13783: checking alignment of char
> > > configure:13819: result: 0
> > > configure:13822: error: Failed to find alignment. Check config.log fo=
r details.
> >=20
> > Sau!
>=20
> Hi,=20
>=20
> this issue is known:
> http://lists.openembedded.org/pipermail/openembedded-core/2013-February/0=
75178.html

I've send site data for arm,=20
http://lists.openembedded.org/pipermail/openembedded-core/2013-June/079485.=
html

but now I've noticed that ac_cv_alignof_char is also missing in x86_64
version of Ross's patch
http://git.openembedded.org/openembedded-core/commit/?id=3D8c46ec2edc0197b3=
2d32e0f27d5b60271338b600
so qemux86-64 also fails.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGuXlsACgkQN1Ujt2V2gBz8VwCfcXcKSqm+DoeZfnTaH+XcFxCc
/SYAn1PYEM94KUNg6k8Twp2iVxVt/w1O
=pKKf
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--
