Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TczPo-0006tL-RF
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 15:12:04 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4329180eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 05:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2nYQRmskKViQ0pa1XDS5doExFXkcr+pw4BVXKQCuRNo=;
	b=nwvU+D96DwRLAJqWoKb9FE6/ALj5rwpahhs5JZgM4yMe4Wqfl6qusVrvmgEVDIDjpm
	6moW0/ZgCFmyxvNpXO7o7kSP/Gdb51aKlzTDApRIFTqD6BH7Rddu1BpEPdMNwKa+22Ek
	PvcCG/6DfOaiZ5HCWZsWbZHQLJ8yj4fNcQCBCDouy9jvGSOQ0/2toDcu3g5Z5YuiDuhO
	Lk95z3qMODDO+uxl8G4C96YeFiNKeehPu6LLDZoR0vUFOxWHJhxytlc5BRqFR65okj6s
	iem4tv9Ce1enmEccKkrBRfIIfIgql+z//bMUq8oD5VSC7ui5srEINUIIW7Bz/RKzdHzq
	e5Bw==
Received: by 10.14.173.65 with SMTP id u41mr145256eel.13.1353938273157;
	Mon, 26 Nov 2012 05:57:53 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm34288935eep.15.2012.11.26.05.57.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 05:57:52 -0800 (PST)
Date: Mon, 26 Nov 2012 14:57:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20121126135758.GB3401@jama.jama.net>
References: <1348318001-18232-1-git-send-email-Martin.Jansa@gmail.com>
	<1353933452-13251-1-git-send-email-Martin.Jansa@gmail.com>
	<CADkTA4N2mbhBgh4o3W9mwa3Jg7ohZEB13FsEGoOLQZ04t1fAcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4N2mbhBgh4o3W9mwa3Jg7ohZEB13FsEGoOLQZ04t1fAcQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: use the same versioning schema for modules.tgz and provide link to latest
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
X-List-Received-Date: Mon, 26 Nov 2012 14:12:04 -0000
X-Groupsio-MsgNum: 31760
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline

--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2012 at 08:49:32AM -0500, Bruce Ashfield wrote:
> On Mon, Nov 26, 2012 at 7:37 AM, Martin Jansa <martin.jansa@gmail.com>wro=
te:
>=20
> > * so it will work look KERNEL_IMAGE
> > * also we were recreating modules.tgz with every kernel build, but
> >   overwritting the same output file
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/kernel.bbclass | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index ee59aaf..9c70e70 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -497,6 +497,10 @@ KERNEL_IMAGE_BASE_NAME ?=3D
> > "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DA
> >  # Don't include the DATETIME variable in the sstate package signatures
> >  KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
> >  KERNEL_IMAGE_SYMLINK_NAME ?=3D "${KERNEL_IMAGETYPE}-${MACHINE}"
> > +MODULE_TARBALL_BASE_NAME ?=3D
> > "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}.tgz"
> > +# Don't include the DATETIME variable in the sstate package signatures
> > +MODULE_TARBALL_BASE_NAME[vardepsexclude] =3D "DATETIME"
> > +MODULE_TARBALL_SYMLINK_NAME ?=3D "modules-${MACHINE}.tgz"
> >
> >  do_uboot_mkimage() {
> >         if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" ; then
> > @@ -526,7 +530,8 @@ addtask uboot_mkimage before do_install after
> > do_compile
> >  kernel_do_deploy() {
> >         install -m 0644 ${KERNEL_OUTPUT}
> > ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> >         if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> > -               tar -cvzf
> > ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
> > +               tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C $=
{D}
> > lib
> > +               ln -sf ${MODULE_TARBALL_BASE_NAME}.bin
> > ${MODULE_TARBALL_SYMLINK_NAME}
> >
>=20
> Just a quick question, are there any concerns about existing users of the
> old tgz name ? Obviously, if they were in oe-core, we'd know about them
> and update them, but I have no idea myself how much (if anything) was bas=
ed
> on the old name. I'm not sure of the best practices oe-core/oe uses for
> cases
> like this in the past, so I thought I'd ask.

I remember seeing some thread about making whole modules tarball
creation optional and disabled by default, so I guess there is only a
few users of this.

> The old shorter name was nice, but I agree that having it different than
> the image
> name makes it non obvious how to associate the image and modules, and tha=
t's
> a nice thing to fix.

True, but since oldname was the same for different kernel images I
always found misleading to see 5 different uImages and only one modules
tarball (which we know was created during build of latest uImage - but
maybe not newest uImage version wise - so quite confusing for someone
just trying to download matching uImage and modules).

> Since we are already making a symlink, I guess we could consider
> a transnational
> symlink with the old name ? (but then again, if the link is there, people
> will continue
> to have dependencies on it and not update their own code).

I don't mind having 2 symlinks if there is the need for old name.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCzdWYACgkQN1Ujt2V2gBwPxgCfX3q3SnhJRsPu+rmsBbJ2iaoK
LBgAn0HVfwJNXm9a2DJMvxC+IDZ0X3IU
=/6DJ
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
