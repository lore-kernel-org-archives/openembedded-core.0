Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 924437703A;
	Fri,  9 Oct 2015 15:19:07 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so75263685wic.0;
	Fri, 09 Oct 2015 08:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zALG8BmBUvBBxuaPqdywjoB/38UShOdyCM45PVdKxJI=;
	b=Ef+hAj4NAg3Bq6KC7tYOI1EDx3e5NG8a01Mrl/BOtdcvCdWehNP/jTZ60NT3gLJjp6
	+Si0zDPlHpDH77MlASqqQnpS8Gz/zXWflyTyM7h38nL/aB9x/vUtV3D0F+oUda/g4Yw+
	bKC74ni+qKTvLgc4rDIFM/oT9U3VmjOKteaxHdOLqocBjFwkhr90aUHvPpDgocD9ixGE
	+ku0UiWwenVKesC/sKEacBB3/m4jTl2oX8p4r8Z2enwoR+nJI/I2ysKojc1grvhcFNuB
	IGQj8O8VPvJgef6tSPvV88uv/dFzH+WeDnyFrFV/1OwvVxR8TN523//5fS7nYsFw9K5l
	O9jQ==
X-Received: by 10.194.80.100 with SMTP id q4mr17152876wjx.113.1444403947442;
	Fri, 09 Oct 2015 08:19:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	qc4sm2656520wjc.33.2015.10.09.08.19.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Oct 2015 08:19:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Oct 2015 17:19:24 +0200
To: "Burton, Ross" <ross.burton@intel.com>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20151009151924.GC2384@jama>
References: <20151003133343.GC2381@jama>
	<CAJTo0LYSc3TV1D2OhmO4KN9ucJLm+d_U2BgrCq40Pk=+RiXqFA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYSc3TV1D2OhmO4KN9ucJLm+d_U2BgrCq40Pk=+RiXqFA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-10-02
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
X-List-Received-Date: Fri, 09 Oct 2015 15:19:08 -0000
X-Groupsio-MsgNum: 72052
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Content-Disposition: inline

--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2015 at 03:40:39PM +0100, Burton, Ross wrote:
> On 3 October 2015 at 14:33, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> >     * /openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.18.2.=
bb,
> > do_compile
> >
>=20
> This fails with a giant number of assembler warnings, but works when I try
> with current master.  Does your build change some tunes?

Yes, it's caused by thumb(1).

I thought it's caused by upgrade to gcc-5.2, but
ARM_INSTRUCTION_SET =3D "arm"
was removed by Alexander when importing libsecret from meta-oe to
oe-core, without even mentioning it in commit message :/.

The same with webkitgtk now failing to build for thumb.. old webkit-gtk
already had ARM_INSTRUCTION_SET which was silently removed.

I'll stop accepting recipe removals in meta-oe layers for recipes moved
to oe-core unless the submitter proves that they weren't modified/broken
in the process. I hate overlayed/duplicated recipes, but breaking them
is even worse.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYX2vsACgkQN1Ujt2V2gByOfgCfV441sMvVEKGIrXfMexkgQw2i
T9UAnR9l4ntYzL+FBuJ6vhSq5kRbDvwd
=0aSn
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--
