Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RdJ0f-0001e6-Vo
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 11:02:55 +0100
Received: by vcbf1 with SMTP id f1so4917422vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 01:55:48 -0800 (PST)
Received: by 10.220.155.3 with SMTP id q3mr4191609vcw.36.1324461348358;
	Wed, 21 Dec 2011 01:55:48 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dn20sm3754827vdb.15.2011.12.21.01.55.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 01:55:47 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAE=MDVN_3QBq_tr=-xfSrJr-5u4-azhrWytzpugzr+nzcxkJ_g@mail.gmail.com>
Date: Wed, 21 Dec 2011 10:55:43 +0100
Message-Id: <B70EE6F2-BB2B-4149-AFA3-8C07CDEDB45B@dominion.thruhere.net>
References: <CAE=MDVN_3QBq_tr=-xfSrJr-5u4-azhrWytzpugzr+nzcxkJ_g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Architecture mismatch QA issue
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
X-List-Received-Date: Wed, 21 Dec 2011 10:02:55 -0000
X-Groupsio-MsgNum: 14564
Content-Type: multipart/signed;
	boundary="Apple-Mail=_ACB76A80-E85C-43C7-AD7D-E1D80AE909BC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_ACB76A80-E85C-43C7-AD7D-E1D80AE909BC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 21 dec. 2011, om 10:49 heeft mohamed basith het volgende geschreven:

> Hi,
>=20
>  I got the error when compiling Qt, pls help me to fix this error.
>=20
> | NOTE: Checking Package: libqt-embeddedpvrqwswsegl4-dbg
> | NOTE: Checking Package: qt4-embedded-tools
> | ERROR: QA Issue: Architecture did not match (40 to 3) on =
/work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.4-r39.5/packages-spl=
it/qt4-embedded-tools/usr/bin/rcc
> | ERROR: QA Issue: Architecture did not match (40 to 3) on =
/work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.4-r39.5/packages-spl=
it/qt4-embedded-tools/usr/bin/moc
> | ERROR: QA Issue: Architecture did not match (40 to 3) on =
/work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.4-r39.5/packages-spl=
it/qt4-embedded-tools/usr/bin/uic

Hmmm, do we know why these sometimes are target binaries and sometimes =
host binaries?

regards,

Koen=

--Apple-Mail=_ACB76A80-E85C-43C7-AD7D-E1D80AE909BC
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7xrSEACgkQMkyGM64RGpFDiQCgrQcHk2KLn/ACj80Shl2epJJw
vvoAn1NsR6Ul10PEmAHJuogLNEOmRdHm
=7u1Q
-----END PGP SIGNATURE-----

--Apple-Mail=_ACB76A80-E85C-43C7-AD7D-E1D80AE909BC--
