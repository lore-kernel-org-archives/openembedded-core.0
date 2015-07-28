Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 162787626F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 13:48:22 +0000 (UTC)
Received: by wicgb10 with SMTP id gb10so157679130wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0iMBMt4BNjYId/N86JCTlTUKDNZQFs5xSKMEsRdsVIQ=;
	b=Kvy/YT01I0XOacf6070iBbZpN/D2xZkwO9uulBM5tFjBhCJhidrlJqdmpHZiTcz2CK
	mgPKp8oYylP8Q3hDAiG8+ZLDb10t4uR1AS4RsBJh6f/+yqt+cV119srXnswuWvp6lprt
	h/6wKFp9NJZ83uJe8eif7icgB7J7zQzJQOl+iEo5cZFnf+o3BMKGcsLnLcw5HNeDaJlT
	JF5MqQY5Z7MDcq2at6vED/sXj6JDoLfvk+g476Q2NZKjJF9mR11IZ3c2CWAZfdJG16tP
	z3tU08JPhSFQRnqBLEQswXQUXV6MqXrmvySJK6lK1/Jd7ml+TBEOnLywsYv6TEDamVAg
	FbZQ==
X-Received: by 10.194.88.69 with SMTP id be5mr65631409wjb.149.1438091302141;
	Tue, 28 Jul 2015 06:48:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ib9sm33413833wjb.2.2015.07.28.06.48.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jul 2015 06:48:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 28 Jul 2015 15:48:25 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150728134825.GB2465@jama>
References: <cover.1438049511.git.liezhi.yang@windriver.com>
	<edf889b1140dcb63168fe1c0dd2368ea3d6d1875.1438049511.git.liezhi.yang@windriver.com>
	<CAJTo0Lbz+MGPLHZCc4jphi3os9Nk8RvUpnonBThxpz0tR3btKw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbz+MGPLHZCc4jphi3os9Nk8RvUpnonBThxpz0tR3btKw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] file: 5.23 -> 5.24
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
X-List-Received-Date: Tue, 28 Jul 2015 13:48:24 -0000
X-Groupsio-MsgNum: 68520
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline

--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2015 at 02:08:20PM +0100, Burton, Ross wrote:
> On 28 July 2015 at 03:12, Robert Yang <liezhi.yang@windriver.com> wrote:
>=20
> > * Use git repo rather than tarball since the original SRC_URI is not
> >   stable, it is not reachable sometimes.
> >
>=20
> Personally speaking I see this as a recipe for a release of file which ju=
st
> happens to use git to fetch the tarball (and presumably that hash is the
> 5.24 tag).  In situations like this I prefer to see the recipe called
> file_5.24.bb as there's no point having a giant PV including git SHAs when
> it's just the release.

until someone sets SRCREV_pn-file =3D "${AUTOREV}" somewhere and git SHAs
in PV suddenly gets very useful.

Personally speaking I prefer recipes with git SCM in SRC_URI named
<foo>_git.bb and PV set to "A.B.C+gitr${SRCPV}".

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW3iCgACgkQN1Ujt2V2gBwRGQCfaEP/cV4k3lhsCir51VVSyrS+
qSoAmwcWw0ozfqMwloDbzyprGJ4bmyOj
=OV49
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
