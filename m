Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srcqr-0003DI-6L
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 00:36:13 +0200
Received: by wgbdr1 with SMTP id dr1so1667505wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 15:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=C9GXqCcxaLpaEx9wTLXSNz1pwG9AmtoQdyam4Yigv28=;
	b=oNdKSOCaIoZJLVXjN4Ix/IES8oHQ2G3tm21RAOsfHbTKxoIUvEwMXhdZlGVfx246gY
	UaV1NtHlyrM3GHuHk8XoekNBebURnEjSNW4WSNai4EOYuqEi0tFV9Fna9jw/yjLW/w/s
	eggcbtAphaJX4Z1lFzGsyKuSPwdFnEnZAnM0NJ5sIdB8AgFcELKObhaukRv9NYQxAl7Z
	GeWrkb6p6iWGwHwyrnyW8O1gojg3bNHCXcwNriSkEuH9QhxemqVdMDKZNs7SLMX9kkyi
	UEJITDTEYM7R0Z86vXuEz6RMQrqurcPHpLh6/wveAx3RoUN2VaJxwtozymiYu9zeHitb
	lDng==
Received: by 10.180.86.226 with SMTP id s2mr10331858wiz.9.1342650292084;
	Wed, 18 Jul 2012 15:24:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df4sm34948864wib.4.2012.07.18.15.24.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 15:24:51 -0700 (PDT)
Date: Thu, 19 Jul 2012 00:25:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120718222502.GA3331@jama.jama.net>
References: <1342517864-26972-1-git-send-email-Martin.Jansa@gmail.com>
	<20120717093846.GB3390@jama.jama.net> <1342648581.513.55.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1342648581.513.55.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] netbase: remove networkmanager handling for qemu machines
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
X-List-Received-Date: Wed, 18 Jul 2012 22:36:13 -0000
X-Groupsio-MsgNum: 25678
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 10:56:21PM +0100, Richard Purdie wrote:
> On Tue, 2012-07-17 at 11:38 +0200, Martin Jansa wrote:
> > On Tue, Jul 17, 2012 at 11:37:43AM +0200, Martin Jansa wrote:
> > > * see http://lists.linuxtogo.org/pipermail/openembedded-core/2012-Feb=
ruary/018279.html thread
> >=20
> > Sorry this was sent by accident..=20
>=20
> I'm confused, the comment or the whole patch was by accident?

Whole patch, I've sent this patch a while ago (probably in that
2012-February) to make netbase not MACHINE specific from sstate POV
and it was refused.. so I've kept it in my branch since then and now
accientaly used git send-email -2 instead of -1..

Cheers,

>=20
> Cheers,
>=20
> Richard
>=20
> > >=20
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/recipes-core/netbase/netbase_5.0.bb |    9 ---------
> > >  1 files changed, 0 insertions(+), 9 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-=
core/netbase/netbase_5.0.bb
> > > index 3aea874..7c609af 100644
> > > --- a/meta/recipes-core/netbase/netbase_5.0.bb
> > > +++ b/meta/recipes-core/netbase/netbase_5.0.bb
> > > @@ -34,15 +34,6 @@ do_install () {
> > >  	install -m 0644 etc-services ${D}${sysconfdir}/services
> > >  	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/int=
erfaces
> > >  	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre=
-up.d
> > > -
> > > -	# Disable network manager on machines that commonly do NFS booting
> > > -	case "${MACHINE}" in
> > > -		"qemuarm*" | "qemux86" | "qemux86-64" | "qemumips*" | "qemuppc" | =
"qemush*")
> > > -			touch ${D}${sysconfdir}/network/nm-disabled-eth0
> > > -			;;
> > > -		*)
> > > -			;;
> > > -	esac
> > >  }
> > > =20
> > >  CONFFILES_${PN} =3D "${sysconfdir}/hosts ${sysconfdir}/network/inter=
faces"
> > > --=20
> > > 1.7.8.6
> > >=20
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAHN74ACgkQN1Ujt2V2gByBzQCfdswTswOrRa4h+TuyZ3x87EnJ
ygoAn1sDUhdmp7CxNDkqQAf99VvISIxN
=eUVV
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
