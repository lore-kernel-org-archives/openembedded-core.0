Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id CC8666007B
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 14:12:50 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so4897611eek.39
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UlslsQAe3UfEaakhjvN1MM+7YMZb9qAx3xahBApg8Bk=;
	b=0BlmJoHOJifPf6YseY5rFmviMcHlTYhRr2390DPBnluwtyopqYOBf23xqUJx3U09O+
	H4z80zTKuLVkesJCQ/PvTycZc2ngg9YxM3phox39t5e7MLpm9dxwQ87kGw2lAh7qZzTE
	FgUlku8pmgsW6Iyb+sYxygRuJYTPT614aqLWfHB6O/QfXwtVPasxAGPZNpxH7fxMFa1i
	SmemgK2Z36ZYoR04uMpQjic90LUQM8LX7Or+4XsF78eDbOD9gJb+HAwQH4TD1Gj6SKGl
	2b7XH2Q7nC7bSaV8zZ2gwsJMd9fkRooQ/ywKqpT5C/DWsMxJNfYtl88A/5FsVAydoJdj
	Rzxg==
X-Received: by 10.14.119.196 with SMTP id n44mr299208eeh.116.1376489569730;
	Wed, 14 Aug 2013 07:12:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c3sm75466429eev.3.2013.08.14.07.12.48 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 07:12:48 -0700 (PDT)
Date: Wed, 14 Aug 2013 16:13:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20130814141339.GY17945@jama>
References: <520B8B6C.40408@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <520B8B6C.40408@pabigot.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: recipe whitespace style questions
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
X-List-Received-Date: Wed, 14 Aug 2013 14:12:51 -0000
X-Groupsio-MsgNum: 43328
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RLVVO53zhS75EYih"
Content-Disposition: inline

--RLVVO53zhS75EYih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2013 at 08:51:40AM -0500, Peter A. Bigot wrote:
>=20
> SRC_URI =3D "file://skeleton \
>             file://skeleton_test.c \
>             file://COPYRIGHT \
> "
>=20
> which I'll call "none", and;
>=20
> SRC_URI =3D "file://skeleton \
>             file://skeleton_test.c \
>             file://COPYRIGHT"
>=20
> which I'll call "joined".
>=20
> Again, for consistency's sake it would be nice to have a=20
> recommendation.  I personally prefer "none", which matches the closing=20
> bracket style for functions.
>=20
> Next: I've also seen:
>=20
> SRC_URI =3D " \
>      file://skeleton \
>      file://skeleton_test.c \
>      file://COPYRIGHT \
> "

I prefer this one (especially for longer variables or entries) or "none",
because with "none" it's easier to see where multiline variable ends.

Worst is IMHO "joined" because when appending one more line you have to
edit 2 lines to move '"' so the diff for review is longer and harder to
read than just one added line.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RLVVO53zhS75EYih
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlILkJMACgkQN1Ujt2V2gBwpPACfUMf+S58mQM/3HP5zysePreSC
GpIAoJnKLzMUBkeI3tpIHbFhg+vDmaq7
=HEEF
-----END PGP SIGNATURE-----

--RLVVO53zhS75EYih--
