Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>)
	id 1Ra1kc-0001lh-5j; Mon, 12 Dec 2011 10:00:46 +0100
Received: by lahd3 with SMTP id d3so1746436lah.6
	for <multiple recipients>; Mon, 12 Dec 2011 00:53:52 -0800 (PST)
Received: by 10.152.109.5 with SMTP id ho5mr7281118lab.51.1323680031870;
	Mon, 12 Dec 2011 00:53:51 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id pf2sm14021258lab.1.2011.12.12.00.53.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 00:53:50 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111212084731.GD3783@jama.jama.net>
Date: Mon, 12 Dec 2011 09:53:47 +0100
Message-Id: <3658FA4C-A757-40C6-B6CC-CB4A925103A4@dominion.thruhere.net>
References: <20111212084206.608CB10332@opal>
	<20111212084731.GD3783@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel version has extra '+' when kernel is built from git
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
X-List-Received-Date: Mon, 12 Dec 2011 09:00:46 -0000
X-Groupsio-MsgNum: 14081
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BF657857-B80E-4910-865B-35C798F409D4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BF657857-B80E-4910-865B-35C798F409D4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 12 dec. 2011, om 09:47 heeft Martin Jansa het volgende geschreven:

> On Mon, Dec 12, 2011 at 08:42:06AM +0000, git@git.openembedded.org =
wrote:
>> Module: meta-openembedded.git
>> Branch: master
>> Commit: c486dfa4013b37972c1a1e4df8616eb6f49de498
>> URL:    =
http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=3Dc486=
dfa4013b37972c1a1e4df8616eb6f49de498
>>=20
>> Author: Koen Kooi <koen@dominion.thruhere.net>
>> Date:   Sun Dec 11 09:46:28 2011 +0100
>>=20
>> kernel bbclass: sync with OE-core
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> If you're working on shared linux.inc in meta-oe, could you please
> integrate this:
>=20
> do_configure_prepend() {
> #otherwise it gets extra '+' "2.6.37+"
> #because:
> #$ scripts/setlocalversion . =3D> +
> #$ make kernelversion =3D> 2.6.37
> #$ make kernelrelease =3D> 2.6.37+
>  rm -rf ${S}/.git
> }

That would break the following:

koen@dominion:/OE/tentacle$ tail conf/local.conf -n15 | head -n4
ASSUME_PROVIDED +=3D "gitam-native"
PATCHTOOL_pn-linux-ti33x-psp =3D "gitam"
PATCHTOOL_pn-linux =3D "gitam"
PATCHTOOL_pn-u-boot =3D "gitam"


> I have to do this in every git recipe as I don't like dirs like
> /lib/modules/2.6.37+


> Maybe it should be fixed on kernel.bbclass level, because linux-yocto
> suffers the same ie /lib/modules/3.0.12-yocto-standard+
>=20
> Ccing oe-core for that..


I had a patch for scripts/setlocalversion that got rid of the '+', but I =
stopped caring after a while. We could just run sed in kernel.bbclass to =
fix the script.

regards,

Koen=

--Apple-Mail=_BF657857-B80E-4910-865B-35C798F409D4
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7lwR4ACgkQMkyGM64RGpFXvQCcD2nHtfbU+O9QaHxqK48wbr2S
RAEAn1iWYrDT4umJtYRw6kdwM4E6PwtY
=q08g
-----END PGP SIGNATURE-----

--Apple-Mail=_BF657857-B80E-4910-865B-35C798F409D4--
