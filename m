Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 913D06BEA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:29:08 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so428801ead.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=X8cfCF5qQgUwC8Zyh29555VFRlT77QlsnAKAUhbsgCg=;
	b=oM/VCs3dfjmokZDiYSMU3plF6ph41Jhh+zkAM9gnQEEOBP4ug1upTB3tRhP5Ui9M13
	2Ch+DAfKv6HZbSOhnJ7o3ZX0EWq6hYp7Rlc6taHUcgH3a+qhh+YeeS7s2lh/n8BDA8sZ
	mA+rxgFHPD/AAf6emZvz4L+QXC88VB2lEsZlEbPRg0J21PB53Xyj0ReIuyTPYHwaf5+P
	uxpv5f1blLYoATSnoCDJXn5YPqGG/pFBVbukGNPZX2+6/2C/i5EWcq22h8isOjPMkcQj
	u+9tFLpE2AKO0zbqOkBytaxu7TB4aOpL2KTuyjUpVvsbICX3svejzpVUgikhohh35Ni3
	5g1w==
X-Received: by 10.14.69.206 with SMTP id n54mr10564eed.118.1377800949022;
	Thu, 29 Aug 2013 11:29:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm48261151eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 11:29:08 -0700 (PDT)
Date: Thu, 29 Aug 2013 20:30:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130829183021.GR3544@jama>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<e77564486cce8199bd317f1ee79adb4f8b508ffa.1377792006.git.Martin.Jansa@gmail.com>
	<521F898F.1060209@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <521F898F.1060209@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [WIP][PATCH 17/20] librsvg: Fix dependencies for PACKAGECONFIG gdkpixbuf
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
X-List-Received-Date: Thu, 29 Aug 2013 18:29:09 -0000
X-Groupsio-MsgNum: 44296
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdxaWYUQIlOfL+ny"
Content-Disposition: inline

--fdxaWYUQIlOfL+ny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2013 at 10:49:03AM -0700, Saul Wold wrote:
> On 08/29/2013 09:03 AM, Martin Jansa wrote:
> > * without gtk+ or gdk-pixbuf available it gets disabled even with --ena=
ble-pixbuf-loader
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta/recipes-gnome/librsvg/librsvg_2.32.1.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipe=
s-gnome/librsvg/librsvg_2.32.1.bb
> > index 4818422..30846bf 100644
> > --- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> > +++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> > @@ -29,7 +29,7 @@ PACKAGECONFIG ??=3D "croco gdkpixbuf"
> >   # Support embedded CSS stylesheets (recommended upstream)
> >   PACKAGECONFIG[croco] =3D "--with-croco,--without-croco,libcroco"
> >   # gdk-pixbuf loader
> > -PACKAGECONFIG[gdkpixbuf] =3D "--enable-pixbuf-loader,--disable-pixbuf-=
loader"
> > +PACKAGECONFIG[gdkpixbuf] =3D "--enable-pixbuf-loader,--disable-pixbuf-=
loader,gtk+ gdk-pixbuf"
>=20
> I think this needs to be a target only PACKAGECONFIG, as it will try to=
=20
> depend on gtk+-native when building the librsvg-native.

Yes I've noticed it couple minutes after sending this patchset and it's
already fixed in branch (just not squashed yet - waiting for next
build).

Thanks for review

>=20
> Sau!
>=20
> >   # GTK+ 2 theme engine
> >   PACKAGECONFIG[gtk] =3D "--enable-gtk-theme,--disable-gtk-theme,gtk+"
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fdxaWYUQIlOfL+ny
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIfkz0ACgkQN1Ujt2V2gByYKQCfXT07LLf1BzvEumijHMS8mSlV
bi4AoKkVBpgcaiJSKUFrfGECO+OesvNF
=8yb6
-----END PGP SIGNATURE-----

--fdxaWYUQIlOfL+ny--
