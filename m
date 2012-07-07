Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SnSEA-00015N-82
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 12:27:02 +0200
Received: by wgbdr1 with SMTP id dr1so9177424wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jul 2012 03:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0p2dDxhY3SpT5rWA51xirvSKgjdqbjsGwnI1RZnShTs=;
	b=doTh+LFnXixG/+4Q8cOzFBZs9NMuVrzEABln+272v1r5XqNkIrFKPVCTF6KqoBe3kG
	hflVOmrugHgITDguIpQcne2aC0W1Alaip47h9smv3djQLOZJ6BX8Fm+bSJYwhuIKcFwa
	c62VoOumpcI6tf1cS5SNy5jurHWvNubB2bBbCE5kKYR42UAb+watgP+bMkSsaTrO4+RN
	sLr0cotxGbtOxsao3pUubxwDMLD6OKLtjM3Z87q8OnoLFPz1Ipo3mx0yCyxeShx6BaOd
	szkpf5gtSaO4U0JDjreh4doBpnvYF/iSDszcYRe0/FQeVC/840OUzs7RK6D3pRgFQvfT
	4W0Q==
Received: by 10.180.99.196 with SMTP id es4mr14372290wib.18.1341656155359;
	Sat, 07 Jul 2012 03:15:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d10sm16319579wiy.3.2012.07.07.03.15.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 Jul 2012 03:15:54 -0700 (PDT)
Date: Sat, 7 Jul 2012 12:15:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120707101549.GI3708@jama.jama.net>
References: <alpine.DEB.2.02.1207070547020.17784@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1207070547020.17784@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: wanting to clarify patch mechanics
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
X-List-Received-Date: Sat, 07 Jul 2012 10:27:02 -0000
X-Groupsio-MsgNum: 24820
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="D6z0c4W1rkZNF4Vu"
Content-Disposition: inline

--D6z0c4W1rkZNF4Vu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 07, 2012 at 06:04:07AM -0400, Robert P. J. Day wrote:
>=20
>   not sure if there's a more comprehensive coverage of how OE patches
> work than the brief discussion in the bitbake user manual, but i'd
> like to clarify the variations just so i can document them.
>=20
>   here's what's in the bitbake manual that seems to be the entire
> coverage of patches:
>=20
> SRC_URI=3D "file://relativefile.patch"
> SRC_URI=3D "file://relativefile.patch;this=3Dignored"
> SRC_URI=3D "file:///Users/ich/very_important_software"
>=20
> and so, to questions.
>=20
>   first, what is this "this=3Dignored"?  does that still exist?  is it
> equivalent to "apply=3Dno"?  i don't see a single example of
> "this=3Dignored" anywhere throughout oe-core, but i see a single example
> of "apply=3Dno" in net-tools_1.60-23.bb.
>=20
>   speaking of apply, it would seem that "apply=3Dyes" is redundant, is
> that correct?  there are a couple dozen examples of that throughout
> oe-core, mostly in the bash recipe file.  is there anything subtle
> about that parameter, or is it truly superfluous?

apply=3Dyes is default for *.patch and .diff, for files with other
extension it's still needed (e.g. those entries in bash)

so there is only a few redundant usages in oe-core:
meta/recipes-connectivity/portmap/portmap.inc:  file://make.patch;apply=3Dy=
es"
meta/recipes-core/eggdbus/eggdbus_0.6.bb:          file://gtk-doc.patch;app=
ly=3Dyes \
meta/recipes-core/eggdbus/eggdbus_0.6.bb:           file://marshal.patch;ap=
ply=3Dyes \
meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb:     =
   file://link-x11.patch;apply=3Dyes \
meta/recipes-graphics/xorg-proto/calibrateproto_git.bb:           file://fi=
x.patch;apply=3Dyes"
meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky =3D " fil=
e://owl-menu.patch;apply=3Dyes "
meta/recipes-sato/pimlico/contacts.inc:SRC_URI_append_poky =3D " file://con=
tacts-owl-window-menu.patch;apply=3Dyes "
meta/recipes-sato/pimlico/dates.inc:SRC_URI_append_poky =3D " file://dates-=
owl-window-menu.patch;apply=3Dyes "
meta/recipes-sato/settings-daemon/settings-daemon_git.bb:           file://=
addsoundkeys.patch;apply=3Dyes \
meta/recipes-support/libcroco/libcroco_0.6.3.bb:SRC_URI_append =3D " file:/=
/croco.patch;apply=3Dyes \

some devs cleanup those when doing upgrades.. if it bothers you enough=20
you can send patch removing those...


>   there's no mention of the "striplevel" parameter in the manual,
> which i think would be useful, and that its default value is "1".  and
> i can see the warning that "pnum" is deprecated in favour of
> "striplevel", but at the moment, i see not a single usage of "pnum"
> and wonder if that warning can just be tossed and support for "pnum"
> abandoned entirely.  (there's not a single usage of "pnum" anywhere in
> the entire yocto pull, either.  just an observation.)

pnum is still used e.g. in meta-oe vim recipe.

Cheers,

>=20
>=20
>   i think that's all i had for now.  anything else about patches worth
> writing down?
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--D6z0c4W1rkZNF4Vu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/4DFUACgkQN1Ujt2V2gBxECQCfcXYblbafsffDO+N5lnzjUKYs
GDQAn1Pa2VE/vH9z0p8DO/+FctfITHZM
=JagW
-----END PGP SIGNATURE-----

--D6z0c4W1rkZNF4Vu--
