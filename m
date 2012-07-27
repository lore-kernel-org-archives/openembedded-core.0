Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SujB9-000333-Ds
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 13:57:59 +0200
Received: by wgbdr1 with SMTP id dr1so2432197wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 04:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=umCbsk2rPvmyjGC0TRVSj94kZPWVyhPzJeyORoFu0aU=;
	b=BMrUgbKwbIeAxArVmiP1sn//l1oZXfm52GyOrosKCcfZEsx1YNih0/F7ts+HC3X3fJ
	ca0esvE2ApG186MpD099ywSmzC7+eRG+9SFqVCmMeH7lisEbG2pCB30Tbo9aypf2IXOD
	kzlKSUH8rPl3LHJQRBDby79KdtTXLdcoqDtOLfLP124NYVFpkFznRHy4c26GeWSHAE1m
	cMuRjPdDSBZQmU0xgOohyf2t/JSuUa13z8d/R3s5l8SDE3AZzLeqeSlGV3yFKbz46R32
	Mx3ShPUCUWYNXTjTNtNR0c63uexaNJdXYQSVvVKAAGHjIRtysnH6rzTPU1nZBMw6I1wV
	HZHg==
Received: by 10.216.233.216 with SMTP id p66mr1051560weq.152.1343389587662;
	Fri, 27 Jul 2012 04:46:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm13496318wib.8.2012.07.27.04.46.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 04:46:25 -0700 (PDT)
Date: Fri, 27 Jul 2012 13:46:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120727114631.GJ3621@jama.jama.net>
References: <1343389394.9574.127.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1343389394.9574.127.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gobject-introspection: Drop the recipe, it has never worked and if it does cross compile, we can add it back
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
X-List-Received-Date: Fri, 27 Jul 2012 11:57:59 -0000
X-Groupsio-MsgNum: 26374
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wHh0aNzodMFDTGdO"
Content-Disposition: inline

--wHh0aNzodMFDTGdO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2012 at 12:43:14PM +0100, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb b/m=
eta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
> deleted file mode 100644
> index 8f5ca56..0000000
> --- a/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
> +++ b/dev/null
> @@ -1,28 +0,0 @@
> -# NOTE: WIP! This recipe does not cross-compile atm., only -native
> -DEPENDS =3D "glib-2.0 libffi python-native gobject-introspection-native"
> -DEPENDS_virtclass-native =3D "glib-2.0-native libffi-native python-nativ=
e bison-native flex-native"
> -BBCLASSEXTEND =3D "native"


what will provide gobject-introspection-native for meta-oe and meta-gnome n=
ow?

Or should we add this recipe back in meta-oe?

Cheers,

meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb:DEPENDS =3D "gobject-int=
rospection-native gtk+3 gdk-pixbuf-native"
meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb:DEPENDS =3D "gobject-int=
rospection-native gtk+ gdk-pixbuf-native"
meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb:#autoreconf needs introspec=
tion.m4 (staged by gobject-introspection-native) after http://git.gnome.org=
/browse/libgee/commit/?id=3Dd026a29b38ca1a3388981c6e75a92602212373d8
meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb:DEPENDS +=3D "gobject-intro=
spection-native"
meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb:DEPENDS_virtclass-native +=
=3D "gobject-introspection-native"
meta-oe/recipes-support/upower/upower_0.9.14.bb:DEPENDS =3D "libusb1 udev g=
lib-2.0 dbus-glib polkit gobject-introspection-native"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wHh0aNzodMFDTGdO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlASf5cACgkQN1Ujt2V2gBw9oACgqiPyVXcXbVljefC56Ej2/bGb
D/wAnj65fcOh70BRCC7c7G7zGeA1dcz1
=XjQZ
-----END PGP SIGNATURE-----

--wHh0aNzodMFDTGdO--
