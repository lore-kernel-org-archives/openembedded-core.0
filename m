Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Uam70-0007dQ-Bi
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 14:07:52 +0200
Received: by mail-pb0-f49.google.com with SMTP id rp2so18148pbb.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 04:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=kDhfvVaNaW3/0MQrgkA4X8KypTd/trGx21rtJs1J2Ec=;
	b=ROm3DnYNVkB8vj0Y3ejVatt5KjYXUFTylJGBeT6ROA10l3b4ROUbIWcgBgXPgbCVzX
	RhAsvd0xUiq6w8+ukCvvn5/xgdTB61LY9Xxbx5TMOGqPU1BSztYQcoTsRZ1BTWhLp34i
	q3DYK4gcKulrCQJinw5XFe/t9a83GF/kRBDVKmy5vgQJKJTaEc22Y9K8rnTKUEhhrNhk
	xzKldonfxIF2ADj/Bsw8rTkSQJzDEZhYkO85QlPuezfNkfszyvX1E2ApN5NF3e9FWRop
	9OYK+MjOtIYgJvzY3necSlxVKfnHlKw/9qM5JSMG87BX3dSg2BshoFzqwOKqRXmsh91H
	uSGA==
X-Received: by 10.68.212.35 with SMTP id nh3mr16959348pbc.40.1368186580466;
	Fri, 10 May 2013 04:49:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ih1sm2406900pbb.44.2013.05.10.04.49.37 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 10 May 2013 04:49:39 -0700 (PDT)
Date: Fri, 10 May 2013 13:49:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Erik =?iso-8859-1?Q?Bot=F6?= <erik.boto@pelagicore.com>
Message-ID: <20130510114931.GE12329@jama.dyndns-home.com>
References: <CA+AhUGw+4ysoS5PGBp6J_DJcHxLeO6BbB_iK9k8z2arv=81G+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+AhUGw+4ysoS5PGBp6J_DJcHxLeO6BbB_iK9k8z2arv=81G+g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: meta-qt5 - problems with pkgconfig-0.25
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
X-List-Received-Date: Fri, 10 May 2013 12:08:12 -0000
X-Groupsio-MsgNum: 39017
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Content-Disposition: inline

--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 03:26:41PM +0100, Erik Bot=F6 wrote:
> Hi,
>=20
> (This message was previously posted to openembedded-devel, but I got
> feedback that it might belong here)
>=20
> When I build qtbase using https://github.com/meta-qt5/meta-qt5 I get cross
> compiler badness warnings, it uses some includes from my host machine
> instead of from sysroot. I have seen this before when cross compiling qt5
> manually, and then the fix was to upgrade my host pkgconfig from 0.22 to
> 0.26 (I didn't really try the versions in between, just built a more rece=
nt
> version).
>=20
> I did a quick hack by building pkgconfig 0.26 in yocto by simply removing
> the patches and using upstream vanilla 0.26 and then qtbase builds proper=
ly
> without using host includes.
>=20
> But it feels kind of strange that a bug like this hasn't affected any oth=
er
> packages? Has anyone else seen something like this and can shed more light
> on what's happening?

These warnings should be fixed by:
https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtbase/0009=
-qt_module-Fix-pkgconfig-replacement.patch
https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtbase/0011=
-qt_module-Fix-paths-in-.prl-files.patch

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGM3ssACgkQN1Ujt2V2gBzAzQCgiXbV3z4FXajzRz0bEK72p1pw
GDwAnAwmBHSZIoMaiIZgh48DeodxnobM
=VsSJ
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--
