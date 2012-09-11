Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBN5B-0007BS-Gw
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 11:48:37 +0200
Received: by eekb57 with SMTP id b57so188825eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 02:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/gy5Iz8RRaWWgWO1eyIF6wLkoeTmmEH8FtgtDvcFECY=;
	b=IA5CTKyaC2RBZ07op1LEvkY0N7OC8EmBebsXzjzXhMjOIHfbbXwJ27Sh4CnJGRbORy
	3soyWqzd6cxgf7/pP8zNnfHoaWq1RD9Xre/mtBRu9JuMXW0uV7YAeezXnmmC4CF+ve2Z
	Phx1Zdy94PavSR7kQftHYWxNNq3x3OQVNOmRQPDgvMkh3R3B8LNtfsGuFOdERg94Ei53
	TkqTPxjSyeAL3n0KuEMRQ3fyO16jw1cgJY2ckNuHHMe2L7YZ6+Hul89y7VYlcfFOliI6
	KNfelszxsjyJtsWWr09WA0XkMAC3Yuc2hFUWaYNY3rHN/HYvycGgWs6A/5oheGz05Cn5
	NG3g==
Received: by 10.204.10.92 with SMTP id o28mr4564607bko.39.1347356166549;
	Tue, 11 Sep 2012 02:36:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y20sm8847722bkv.11.2012.09.11.02.36.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 02:36:05 -0700 (PDT)
Date: Tue, 11 Sep 2012 11:36:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120911093605.GE3465@jama.jama.net>
References: <20120911080334.GD3465@jama.jama.net>
	<1347354207.2122.29.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1347354207.2122.29.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: andrei.gherzan@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: DEPENDS_virtclass-native = "libpng jpeg" not extended to libpng-native jpeg-native
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
X-List-Received-Date: Tue, 11 Sep 2012 09:48:37 -0000
X-Groupsio-MsgNum: 29017
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline

--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 10:03:27AM +0100, Richard Purdie wrote:
> On Tue, 2012-09-11 at 10:03 +0200, Martin Jansa wrote:
> > Hi,
> >=20
> > in meta-openembedded/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb:
> >=20
> > DEPENDS_virtclass-native =3D "libpng jpeg"
> > DEPENDS =3D "libpng jpeg expat gtk+"
> >=20
> > BBCLASSEXTEND =3D "native"
> >=20
> > Did it work (at least at some point of time) that DEPENDS for
> > libwmf-native were expanded to libpng-native and jpeg-native?
>=20
> I don't think that has ever worked. Its assumed that if you're going to
> use class overrides, you put the right thing in place.

OK, good. That probably applies also to:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-August/028091.h=
tml
ccing Andrei Gherzan

> > Because now it does not:
> > OE tuna@shr ~/shr-core $ bitbake-diffsigs
> > stamps.1347348593/nokia900/x86_64-linux/libwmf-native-0.2.8.4-r1.do_con=
figure.sigdata.315a83efebb27040d6bf0aaead16671e
> > stamps.1347348593/om-gta02/x86_64-linux/libwmf-native-0.2.8.4-r1.do_con=
figure.sigdata.0f8349ada0c8a18a6d6ed7b7841ec955
> > Hash for dependent task libpng_1.2.49.bb.do_populate_sysroot changed
> > from 640001ee0530e51ef0aefb300c34f7dd to 7ba7d74a27e1e0af253ddac00a2be1=
c2
> > Hash for dependent task libjpeg-turbo_svn.bb.do_populate_sysroot changed
> > from 3fe6eae3a6fd1af40233d548680c5bab to ff852ac3d5e826ff74e68b5ddc4ac3=
e1
> >=20
> > So native recipe depending on target checksum -> rebuilding with each
> > MACHINE switch.
> >=20
> > I can fix it by:
> > DEPENDS_virtclass-native =3D "libpng-native jpeg-native"
> > but maybe there is more cases like this and this could be checked by
> > native.bbclass or something like that.
>=20
> That is the correct thing to do, the code assumes when you write
> explicit class overrides, you mean what you say...

Ok, testing patch for that. 2nd similar issue is with sip-native which
gets target DEPENDS through inherits, weirdly if I override DEPENDS
in recipe after inherit it still gets qt4-x11-free :/

meta-oe/recipes-extended/sip/sip-native_4.13.3.bb:
inherit qt4x11 native python-dir

# inherit qt4x11 adds dependency on target qt4-x11-free, which is bad,
# because we don't need it and it's causing different sstate checksum:
# $ bitbake-diffsigs
#     stamps.1347348593/nokia900/x86_64-linux/sip-native-4.13.3-r0.do_confi=
gure.sigdata.6e44871660ef91eab5ee4d56e55b6728
#     stamps.1347348593/om-gta02/x86_64-linux/sip-native-4.13.3-r0.do_confi=
gure.sigdata.cdaf666b98c2c6ccfb710743dcdbd988
#       Hash for dependent task qt4-x11-free_4.8.1.bb.do_populate_sysroot c=
hanged from 79234aca07686c1d97782e21fc098071 to 7e9ba3de3ba9f709a5d9ef5abad=
b2d9e
DEPENDS_class-native =3D "qt4-tools-native "

Even with different overrides it does not work, from bitbake -e:
sip-native.env.DEPENDS:# DEPENDS=3Dqt4-tools-native ${@base_contains("PROVI=
DES", "qt4-x11", "", "qt4-x11 ", d)}${BASEDEPENDS} qt4-tools-native=20
sip-native.env.DEPENDS:DEPENDS=3D"qt4-tools-native qt4-x11  qt4-tools-nativ=
e"
sip-native.env.DEPENDS_class-native:# DEPENDS_class-native=3DNone
sip-native.env.DEPENDS_class-native:# DEPENDS=3Dqt4-tools-native ${@base_co=
ntains("PROVIDES", "qt4-x11", "", "qt4-x11 ", d)}${BASEDEPENDS} qt4-tools-n=
ative=20
sip-native.env.DEPENDS_class-native:DEPENDS=3D"qt4-tools-native qt4-x11  qt=
4-tools-native"
sip-native.env.DEPENDS_virtclass-native:# DEPENDS_virtclass-native=3Dqt4-to=
ols-native=20
sip-native.env.DEPENDS_virtclass-native:# DEPENDS=3Dqt4-tools-native ${@bas=
e_contains("PROVIDES", "qt4-x11", "", "qt4-x11 ", d)}${BASEDEPENDS}=20
sip-native.env.DEPENDS_virtclass-native:DEPENDS_virtclass-native=3D"qt4-too=
ls-native"
sip-native.env.DEPENDS_virtclass-native:DEPENDS=3D"qt4-tools-native qt4-x11"
sip-native.env.old.DEPENDS:# DEPENDS=3Dqt4-tools-native ${@base_contains("P=
ROVIDES", "qt4-x11", "", "qt4-x11 ", d)}${BASEDEPENDS}=20
sip-native.env.old.DEPENDS:DEPENDS=3D"qt4-tools-native qt4-x11"

How to override DEPENDS_prepend from inherited bbclasses?

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBPBgUACgkQN1Ujt2V2gBy68QCgnAvpcDY+mVGDd1snevs/DwUL
2aoAn1ODS15Us/mogUUKRFIHSz6xZKeI
=06Xx
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
