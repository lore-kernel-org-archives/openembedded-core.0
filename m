Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TyMOP-0002Sz-O9
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:58:59 +0100
Received: by mail-da0-f51.google.com with SMTP id i30so4213920dad.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 04:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=24Kht3iZc9jNmMydhpq6s9sBwXdVxGvoevKp93iyQfU=;
	b=oWYOhihSq5qON0x+5Fint7+3LIHUqfY1LCkzDoz1Cu2QXftne9oNYS6UHTGlx0rxlr
	QsiUaReP3C/+oAqxBT/nDcciQESs+ICNNhrc6jy1WMk7yvlRyl3ZQcvGFAYLVJcU9XD5
	laQXW0VxphxJgaAhcfEXQ5kOCpAA53DzVBv1UgF0XoNzL0GB+hU1R1Cx5p0lHLtl2m9R
	J85ep67Psb9EyshmV6Uimm52jMJzKd3tWRyyMRujL5Ake9UAJQGf58V4vxtyWgB9ESuw
	fpYhM1s0zCjtRKRfqEJ2zMPUfLZ9mj8WPxKLrrCOQaALQZysirJNd44Rv+BMvyJksHE6
	khnA==
X-Received: by 10.66.78.1 with SMTP id x1mr4465139paw.2.1359031404313;
	Thu, 24 Jan 2013 04:43:24 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kl5sm14816364pbc.74.2013.01.24.04.43.21
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 04:43:23 -0800 (PST)
Date: Thu, 24 Jan 2013 13:43:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
Message-ID: <20130124124319.GC3012@jama>
References: <985E5BBDA0968D48ABDF343456A521B3F1301C@IRSMSX102.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <985E5BBDA0968D48ABDF343456A521B3F1301C@IRSMSX102.ger.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Meta-web-kiosk Layer
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
X-List-Received-Date: Thu, 24 Jan 2013 12:59:00 -0000
X-Groupsio-MsgNum: 34355
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Content-Disposition: inline

--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2013 at 12:05:00PM +0000, Ciobanu, Emilia Maria Silvia wrot=
e:
> Hi,
>=20
> I've created a new layer that can be used for kiosk devices.
> You can check it out at:
>     http://git.yoctoproject.org/cgit/cgit.cgi/meta-web-kiosk/
>=20
> It contains a new bitbake target that automatically
> starts a web browser right after boot and enables the
> use of a virtual keyboard if there is support for it.
>=20
> The layer currently includes recipes for the web browser,
> and bsp configurations.
>=20
> I'm open to receiving feedback, patches and any suggestions.

Why not add dependency on meta-openembedded/meta-oe and meta-gnome?

At least 4 duplicated recipes could be removed and newer midori from
meta-gnome would be used:

OE @ ~/meta-openembedded $ find . -name ca-certificates_\*
=2E/meta-oe/recipes-support/ca-certificates/ca-certificates_20120623.bb
OE @ ~/meta-openembedded $ find . -name vala_\*
=2E/meta-oe/recipes-devtools/vala/vala_0.16.0.bb
OE @ ~/meta-openembedded $ find . -name midori_\*
=2E/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
OE @ ~/meta-openembedded $ find . -name python-docutils_\*
=2E/meta-oe/recipes-devtools/python/python-docutils_0.5.bb

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEBLGcACgkQN1Ujt2V2gByvYACfc9HXNb8gcXusO6bIyTyiQnhj
lvUAnRg9Cb80yY4R0iqZXQx4KGStCgFV
=q1mr
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
