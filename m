Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKFUt-0006ky-9g
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Oct 2011 22:27:19 +0200
Received: by bkbzv3 with SMTP id zv3so1251432bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2011 13:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YiVrnAihYZsbMOF8jRh3fGz3yn0/VNR2yLC3vhfP18M=;
	b=qnezbv1bdWsoX/2gZjQdNIATz/e4csFf4OUuqffKFOCTqv6pnLuPKlUatgX/aao5EI
	/JYiRG1jWcirleApHZCmXYlOKrTE7PTHsOk50/SheXxTEyKL/F++bGyZPB9wsGzGU+O/
	P7DAJMHpnORweC6mCwfwEdL21tLqDJqmvPn4s=
Received: by 10.204.45.65 with SMTP id d1mr6284635bkf.9.1319919675441;
	Sat, 29 Oct 2011 13:21:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m4sm6667024fad.1.2011.10.29.13.21.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 13:21:13 -0700 (PDT)
Date: Sat, 29 Oct 2011 22:21:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111029202108.GH12609@jama.jama.net>
References: <cover.1318547063.git.nitin.a.kamble@intel.com>
	<70807dd62c2c498616cc544869bd710b351b7212.1318547063.git.nitin.a.kamble@intel.com>
	<20111014081939.GC3542@jama.jama.net>
	<20111014091136.GE3542@jama.jama.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E33A6D8D@orsmsx504.amr.corp.intel.com>
	<20111023062813.GC3497@jama.jama.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E33A6EBB@orsmsx504.amr.corp.intel.com>
	<20111024060535.GA3602@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111024060535.GA3602@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [review/test 3/5] python, python-native: upgrade from 2.6.6 to 2.7.2
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
X-List-Received-Date: Sat, 29 Oct 2011 20:27:19 -0000
X-Groupsio-MsgNum: 11681
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="djJN5oi3zFpblwUd"
Content-Disposition: inline

--djJN5oi3zFpblwUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2011 at 08:05:36AM +0200, Martin Jansa wrote:
> On Sun, Oct 23, 2011 at 05:07:30PM -0700, Kamble, Nitin A wrote:
> > Hi Martin,
> >   I tested python inside qemux86-64 and it was working fine. I could te=
st small python scripts working as expected.
> > Thanks,
> > Nitin
>=20
> For me it builds only after I've upgraded host's glibc version to 2.14
> while using eglibc-2.14 for qemux86-64.
>=20
> When I had glibc-2.13 on host and eglibc-2.14 for qemux86-64 it fails
> like this:
>=20
> /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/python: /lib64/libc.so.6:
> version `GLIBC_2.14' not found (required by
> /OE/shr-core/tmp/work/x86_64-oe-linux/python-2.7.2-r0.0/Python-2.7.2/libp=
ython2.7.so.1.0)
>=20
> as reported here:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/01123=
0.html

I've patch which allows me to build at least armv4t modules now, will
test qemux86-64 and other machines over night and more runtime test
tomorrow.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--djJN5oi3zFpblwUd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6sYDQACgkQN1Ujt2V2gByr2gCeMX45KpcMfuuVp+d7esfZKhmc
M4EAn0bRU+uyZIu2Om1suxFT+3J1lxsk
=ue+w
-----END PGP SIGNATURE-----

--djJN5oi3zFpblwUd--
