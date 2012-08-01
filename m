Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwXlu-0004FV-1j
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:11:26 +0200
Received: by bkcik5 with SMTP id ik5so2962568bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 04:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0P2k5vmkQB451BedJfsle2zhqBfkrl46bZuXkgT553w=;
	b=CipnC6g323ug+7cvX5Fh21blr//kqRXO9BFmTauu9EN3S0LSQzE07t3X8MgDWICgGe
	6f7BgGBTd1yk1zvlMSP9ophkzRzYC4peAT5i/Cr6Oasnujh3TcWQFxRKwSSVKZHk2jgp
	Rav+kkvrDnDTLz2NNHCtchF817C0Pjl1vO3UC+6jSUxdxP++m57TGv+jLQrglhL4onAU
	dbH+de+9Yo7NAQ6rXihVhkdpJVDc1/TNFz4j+Gg9PUthK28IyoSs8/k2mEB+k+QATEYZ
	3w2tcQSeaCsJxTq6rqYErPojYCEQjlG2lGyjClXsf2x1KYJ/vfWBVapXqyLROFNbolfV
	Wn5w==
Received: by 10.204.154.66 with SMTP id n2mr6628152bkw.138.1343822387786;
	Wed, 01 Aug 2012 04:59:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y20sm1570900bkv.11.2012.08.01.04.59.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 04:59:46 -0700 (PDT)
Date: Wed, 1 Aug 2012 13:59:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20120801115943.GC16306@jama.jama.net>
References: <20120801065021.GC15199@jama.jama.net>
	<CAP9ODKoa2AWz=A8YOmcBDXjDt9jDXaUsgo1WOVrMsivwU--m_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoa2AWz=A8YOmcBDXjDt9jDXaUsgo1WOVrMsivwU--m_w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: u-boot do_compile should be reentrant even with ld-is-gold
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 12:11:26 -0000
X-Groupsio-MsgNum: 26617
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Content-Disposition: inline

--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 08:48:08AM -0300, Otavio Salvador wrote:
> On Wed, Aug 1, 2012 at 3:50 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > reexecuting do_compile in u-boot causes .bfd being appended multiple
> > times and resulting in errors like:
> > /bin/bash: arm-oe-linux-gnueabi-ld.bfd.bfd.bfd: command not found
>=20
> I am just wondering why it'd end re-executed? due changes on sstate hash?

e.g. when it fails due to compile error and someone reexecutes it then
he will see arm-oe-linux-gnueabi-ld.bfd.bfd.bfd instead of real compile
error.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAZGi8ACgkQN1Ujt2V2gBwpGgCghapbEoHpynrtSAPS2l0B9lKy
PkIAni0I6Ao0p7RJO33ns1smoUvw1yQx
=FgIe
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--
