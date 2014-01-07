Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3912B6C008
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 19:22:56 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so333260eaj.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2014 11:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XpdvLy5c/rhaDctAzEu7K8TOoGHKG+ehEIHma83gcHc=;
	b=0Lple0bgh2ZExv8kZWh+P4Wv2cdb0GnTTDh9LdDiVOHkgFhiYMaJ6tUczR72U97hgI
	y+wTavtm3ldRSIqJnQfusXatzofaN3uBeyHO3QLNLU9VSnq3TDWHLwcCcL1Jb0aAMR27
	Or6G0JV/KVxU1vhk93vEomxs857jNy2BpnxAgi92wAZVjfSBZwAWGpw2vF50UApnF0wN
	XEGgw2vn1mKyEuEtrqKKM+Gbun+jQ6f7nimFHn3crYOdzpL196H5VCf6Mxr/XUggTIfc
	59Wla5x5bimeLlDiD2TcA69dhgVSmvji/A98G6ywID0HDtZDY3ehK3ESsSsO0lLpbSos
	4XAg==
X-Received: by 10.15.35.194 with SMTP id g42mr6662056eev.20.1389122576443;
	Tue, 07 Jan 2014 11:22:56 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o13sm1606791eex.19.2014.01.07.11.22.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jan 2014 11:22:55 -0800 (PST)
Date: Tue, 7 Jan 2014 20:23:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20140107192305.GT3709@jama>
References: <52CC470A.9030302@linaro.org>
MIME-Version: 1.0
In-Reply-To: <52CC470A.9030302@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Qt in OE-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jan 2014 19:22:56 -0000
X-Groupsio-MsgNum: 48664
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qpPEP5KwiTnADq8L"
Content-Disposition: inline

--qpPEP5KwiTnADq8L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2014 at 01:27:22PM -0500, Trevor Woerner wrote:
> Hello everyone,
>=20
> question:
> Should some version of Qt be included in openembedded-core, or should
> all recipes to add Qt be part of their own version-specific Qt layer?
>=20
>=20
> background:
> openembedded-core[1] used to include recipes for Qt3, but as Qt3 became
> old these recipes were replaced with Qt4 and the Qt3 support was broken
> out into its own layer[2]. We're now at a point where Qt4 is getting old
> and Qt5 is "current". At some point we'll have to replace the Qt4
> support in [1] with support for Qt5. But we expect users will still want
> to use Qt4, so if the Qt4 support in [1] is replaced by support for Qt5,
> the Qt4 support will need to be broken out into its own layer. Qt5
> support is currently being developed on it's own layer[3].
>=20
>=20
> This email thread is *not* to discuss when we should replace Qt4 with
> Qt5, then question is: should [1] include *any* Qt support, or should Qt
> be always in its own layer to be added as required by the distribution?
>=20
>=20
> If we decide [1] should provide some Qt support, then we can discuss
> when we should replace the Qt4 support with Qt5 in [1]. But for now it
> would be nice to reach a consensus on whether or not [1] should include
> any Qt support at all or if it wouldn't just be easier to always have Qt
> support in its own version-specific layers to be added as required (if
> needed) by the distribution configuration.

I would like to see qt4 moved from oe-core to meta-qt4.

That would remove the feeling that using oe-core defaults to using qt4
and it would be consistent with other QT layers:

meta-qt3
meta-qt4
meta-qt5

oe-core would stay just the "core" and if you need any QT you can select
which one suits your needs the most (or combination of e.g. qt4+qt5 like
most people are using now)

With PACKAGECONFIGs which can list optional dependencies which aren't
included in the the layer itself it's now easier to have recipe with
optional qt5 support in oe-core, but qt5 itself in separate meta-qt5.

Another interesting aspect is that with qt4 we have only 6 recipes in
openembedded-core/meta/recipes-qt/qt4

while
meta-qt5/recipes-qt/qt5 has 25 different recipes (many of them with
_git.bb variant so 42 in total). And splitting the qt5 recipes (e.g. to
have only qtbase, qtdeclarative in oe-core and "additional" modules in
separate meta-qt5) isn't very good, because they are quite tightly
coupled (so upgrading recipes in meta-qt5 would be in many cases
incomatible with qtbase version in oe-core and vice-versa).

Another advantage of separate meta-qt5 layer is that in many projects
people are using older oe-core release (e.g. dylan) with newer meta-qt5
(e.g. dora or master or even qt5-5.2.0 branch), with separate layer it's
easier to mix them.

Just my 2BTC as meta-qt5 maintainer.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qpPEP5KwiTnADq8L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLMVBkACgkQN1Ujt2V2gBzMKgCbBtsj45EHeg4S4DUVBr7cL2wC
pxMAoI+8JRYu5cKw/XNEIV7GX58m6UVn
=PBb5
-----END PGP SIGNATURE-----

--qpPEP5KwiTnADq8L--
