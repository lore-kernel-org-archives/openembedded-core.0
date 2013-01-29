Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0IDP-00010w-0h
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 21:55:41 +0100
Received: by mail-da0-f45.google.com with SMTP id w4so398019dam.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 12:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=AwnRSBBaQdehIusttz4ZnCX3XChcwt9gO1LmjUiBiRA=;
	b=KoUjSw6qLkR3IZIwXRqvOgWWlZUtYEig8EWd7i0g2PdrT8C/PChu6Vm4//1s/CegLz
	3mWtGwIFGX8PtKhg+0ZFEOVa0GIzXRU8kQlVFoxmXDfOPrHC8HBJbxxTU/dCRam1Q41x
	fWguphkgojhN4i8kzBxPjw/S6YvOXM0iUAFLzhr2lP/dvbw12m03VdjWwxC6nEvojWqm
	nQMJ+3gaky5LFH961dQGq9dxKOhxbj8ZtlMVviewlcHU/WOnjqhx/+PG3mwspKlrwaPI
	Tg8dx3eqIQLkZUrlGCBiUaluGH1g6Kv96K8O4IXtCgp2/+jf1Zy3Ad2spXHTBqIQsEv2
	racA==
X-Received: by 10.68.233.196 with SMTP id ty4mr5859171pbc.23.1359491994188;
	Tue, 29 Jan 2013 12:39:54 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x2sm9674848paw.8.2013.01.29.12.39.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 12:39:52 -0800 (PST)
Date: Tue, 29 Jan 2013 21:39:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130129203953.GS16904@jama.palm1.palmone.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: sstate keeping ipk for every AUTOINC value?
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
X-List-Received-Date: Tue, 29 Jan 2013 20:55:44 -0000
X-Groupsio-MsgNum: 34668
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QWwVEGBFzbXSb0Gf"
Content-Disposition: inline

--QWwVEGBFzbXSb0Gf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Or why do I have each .ipk 7 times in deploy/ipk/arch?

tmp-eglibc/sstate-control $ grep ncurses_ manifest-armv5te-ncurses.deploy-i=
pk
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.6_armv5te.ipk
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.8_armv5te.ipk
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.7_armv5te.ipk
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.4_armv5te.ipk
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.3_armv5te.ipk
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.9_armv5te.ipk
/OE/oe-core/tmp-eglibc/deploy/ipk/armv5te/ncurses_5.9-r13.1.1_armv5te.ipk

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QWwVEGBFzbXSb0Gf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEIM5kACgkQN1Ujt2V2gByfdwCdG0EME8kKeYIIbZUc0/axLuC3
9qEAoKTAsfuwrQnS0oelUM+4++KJ7E7R
=snTj
-----END PGP SIGNATURE-----

--QWwVEGBFzbXSb0Gf--
