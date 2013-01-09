Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tst8t-0004nH-PG
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 11:44:29 +0100
Received: by mail-pb0-f44.google.com with SMTP id uo1so862960pbc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 02:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=KcWMPRAmqQV3oQGKNe3PUaooDujqX3t8i7T4+tJ/nIE=;
	b=zneArw2iQPEeIqM5FCM3cen4a2UKR5hgZS6qVDOS2fVR+s+l/DLEfIwd58Iq0TrrKo
	kn0TAV7xpxvsD6Qj8o3K87LJ7n4U9s6Ag8noLrF/UjXlUgTwdG9/QvKXlW/VZHZWjmjB
	XdaI15kvUt69hnnwpAJKwTdgeR8JNzGDL8FuYttun5OdVFmWEx+q299WFNp+NP0OYKvU
	Kf3JrMvczAFJGT6eq9SxhWuMPIekCbAWvPg+7ePhtsWEF/e7DTIeV1QTbIcUKd4KlQHk
	z8Jo1bya2w4K4aRZam2eD2piPU8691zegfH2UYHKulBNYXMrAi72HDJXr4jRvXB03RJT
	NolQ==
X-Received: by 10.66.73.230 with SMTP id o6mr188325610pav.57.1357727347221;
	Wed, 09 Jan 2013 02:29:07 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qw8sm11029180pbc.39.2013.01.09.02.29.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 02:29:06 -0800 (PST)
Date: Wed, 9 Jan 2013 11:29:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Message-ID: <20130109102910.GF3722@jama.palm1.palmone.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
	<CAF6bG8ed60RO2bBTPFhKQiG+3xis6-H9icmLDWtwHCO9NAyadw@mail.gmail.com>
	<50E8FDBB.5080500@linux.intel.com>
	<CAF6bG8fBgAP_No6RkckjvEQ2XquwKagbyn-Rh01CY7Hi+8MfFw@mail.gmail.com>
	<CAF6bG8cuLp7nGzKUZscUrRoa1Z5_mrSduvWQ4r4YbvtZx2rFdg@mail.gmail.com>
	<20130109091303.GC3722@jama.palm1.palmone.com>
	<CAF6bG8dULrN_qQZWjvM2mJgQbyn0UvqzhcjV7e6Rzfj3h9GX4g@mail.gmail.com>
	<388BD596D68348D5A465A83C5E148D40@intel.com>
	<CAF6bG8evo8qRJ8hmORNVQ0GFQUDC48G0=Uj9KxDcKtyt_2U_qw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAF6bG8evo8qRJ8hmORNVQ0GFQUDC48G0=Uj9KxDcKtyt_2U_qw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 10:44:44 -0000
X-Groupsio-MsgNum: 33582
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i3lJ51RuaGWuFYNw"
Content-Disposition: inline

--i3lJ51RuaGWuFYNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 12:00:20PM +0200, Marko Lindqvist wrote:
> On 9 January 2013 11:42, Ross Burton <ross.burton@intel.com> wrote:
> > On Wednesday, 9 January 2013 at 09:33, Marko Lindqvist wrote:
> >> Exactly, except that it would be provided by bitbake, and not
> >> constructed by each recipe itself - less recipe writing work + you
> >> could count on it to always mean same thing.
> >
> > Everything but the last dot, or the first two components, or what?  For=
 anything GNOMEy you want the first two elements as some packages use nano =
releases for development snapshots (1.2.3.4).
>=20
>  Ok, do we have any counter-examples where you'd want, say, three out
> of four parts? One out of n? Of course there will always be need to
> use variables of their own in some recipes, but I'm after something
> that would be usable in most cases.

I don't remember where but 1st of 4 is also used.=20
What about stuff like "1.2.3.4+gitAUTOINC"?

GNOME is quite consistent, but it still looks better defined in
recipe/bbclass then having "something" defined by bitbake in all recipes
and usable only in some.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i3lJ51RuaGWuFYNw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEUEARECAAYFAlDtRnYACgkQN1Ujt2V2gBzC6QCfeHqmSAec7TxstmSNLD15Y4MC
zEkAmNzdL9qPYB6RHnpG8sNtlApgf7Q=
=zfnr
-----END PGP SIGNATURE-----

--i3lJ51RuaGWuFYNw--
