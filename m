Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUb8A-0003Qc-Eg
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 11:02:22 +0200
Received: by wye20 with SMTP id 20so1053348wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 01:59:03 -0700 (PDT)
Received: by 10.227.200.206 with SMTP id ex14mr525386wbb.12.1307609942009;
	Thu, 09 Jun 2011 01:59:02 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm1050428wbb.14.2011.06.09.01.59.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 01:59:01 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20110609083834.GJ23137@jama.jama.net>
Date: Thu, 9 Jun 2011 10:58:58 +0200
Message-Id: <4CF34C23-9241-4FB5-9E00-C506FF597050@dominion.thruhere.net>
References: <20110609083834.GJ23137@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: LOCALCOUNT increased twice when there are 2 layers with same git recipe
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
X-List-Received-Date: Thu, 09 Jun 2011 09:02:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 jun 2011, om 10:38 heeft Martin Jansa het volgende geschreven:

> Hi,
>=20
> I was wondering why I see gobject-introspection built on every image
> build and it's because LOCALCOUNT is changing all the time.
>=20
> OE om-gta02@shr ~/shr-core $ find openembedded-core/ -name =
gobject-introspection\*
> =
openembedded-core/meta/recipes-gnome/gnome/gobject-introspection_git.bb
> SRCREV =3D "efa7266bcf78478ce62e8dd778a4f0417bfd4d15"
> PV =3D "0.10.8+git${SRCPV}"
>=20
> OE om-gta02@shr ~/shr-core $ find meta-openembedded/ -name =
gobject-introspection\*
> =
meta-openembedded/meta-oe/recipes-gnome/gnome/gobject-introspection_0.9.10=
.bb
> =
meta-openembedded/meta-oe/recipes-gnome/gnome/gobject-introspection_git.bb=

> SRCREV =3D "8d64bc23d2b837421ecf9c7b0e4b8d5d95ca0d21"
> PV =3D "1.29.0+gitr${SRCPV}"
>=20
> I had to add gobject-introspection_git.bb to meta-oe, because we're
> using newer glib with gdbus-codegen included (instead separate
> gdbus-binding-tool we were using before)
> meta-openembedded/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb with
> SRCREV =3D "d97cbc6731deab137770bc0fe9c69b06f689f5b4"
> PV =3D "2.29.3+gitr${SRCPV}"
> and default gobject-introspection version is not compatible with it.
>=20
> Problem is that with 2 _git recipes LOCALCOUNT is incremented twice
> because there are 2 different SRCREVs found during parsing.
>=20
> I wanted to use gobject-introspection_git.bbappend, but it looks like
> changing PV/SRCREV from .bbappend is not supported

And with SRCREV_pn-${PN} =3D "34932849328" ?

regards,

Koen=


