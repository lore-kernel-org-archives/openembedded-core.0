Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 064326AC33;
	Mon, 23 Mar 2015 17:46:55 +0000 (UTC)
Received: by weop45 with SMTP id p45so144124140weo.0;
	Mon, 23 Mar 2015 10:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+oDHXyRlCW72BiiiJQtZy68Ju+JPGym9tC4LZFSYrUo=;
	b=yJkx+URyuprmThfGqhRiJLO6Yj0XGYH5OaXXczWXBOZSBtgCiEsxFf0mE7wMYZxIhR
	9czHHBo1WQDn5qwYVQdTDH7dtotjQT3L4UYBtMn992LAif/frDqhpN5jyeaijmPNjsg7
	hB1PyDSBRAlHx20m8xOcxkBWJszLI7n5qY4KJ++2ukQBDyY0yK8xfICalTDDtUMIqvTr
	5jq5OuNiSLN2avpp6bUsvP/fwmRHvpwcWPaKGbHxnoNeCYqcqFDxDrPRfMS64KS9vRYJ
	oPGfq/4LxFXl/5m3Z1XuC3GH2M375IhUj3jw9RlrqJ/UXa6dPMCD2QGGqdjV1sTLDPXe
	u3kg==
X-Received: by 10.194.179.194 with SMTP id di2mr752616wjc.4.1427132816434;
	Mon, 23 Mar 2015 10:46:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hj10sm2342763wjc.48.2015.03.23.10.46.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Mar 2015 10:46:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Mar 2015 18:47:08 +0100
To: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <20150323174708.GC3904@jama>
References: <20150323112736.11E9B50553@opal.openembedded.org>
	<20150323164335.GB3904@jama> <55104A11.50102@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <55104A11.50102@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Jonathan Liu : systemd: fix firmware path to match linux-firmware
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
X-List-Received-Date: Mon, 23 Mar 2015 17:46:56 -0000
X-Groupsio-MsgNum: 63618
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline

--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2015 at 10:14:57AM -0700, Randy Witt wrote:
> On 03/23/2015 09:43 AM, Martin Jansa wrote:
> > On Mon, Mar 23, 2015 at 11:27:36AM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: d3fcfe346b3472170641d9194243c4bbe06b8585
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3Dd3fcfe346b3472170641d9194243c4bbe06b8585
> >>
> >> Author: Jonathan Liu <net147@gmail.com>
> >> Date:   Mon Mar 23 22:18:46 2015 +1100
> >>
> >> systemd: fix firmware path to match linux-firmware
> >>
> >> Signed-off-by: Jonathan Liu <net147@gmail.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>
> >> ---
> >>
> >>   meta/recipes-core/systemd/systemd_219.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-c=
ore/systemd/systemd_219.bb
> >> index 5ecdda9..f2d3c13 100644
> >> --- a/meta/recipes-core/systemd/systemd_219.bb
> >> +++ b/meta/recipes-core/systemd/systemd_219.bb
> >> @@ -112,7 +112,7 @@ EXTRA_OECONF =3D " --with-rootprefix=3D${rootprefi=
x} \
> >>                    --enable-split-usr \
> >>                    --without-python \
> >>                    --with-sysvrcnd-path=3D${sysconfdir} \
> >> -                 --with-firmware-path=3D${rootlibdir}/firmware \
> >> +                 --with-firmware-path=3D/lib/firmware \
> >
> > Is this false-possitive from QA check or is this change really ignored
> > by systemd build?
>=20
> Userspace firmware loading support was actually removed, but Jonathan add=
ed it=20
> back in:
>=20
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D814252efd028=
ec99a15303d9a551e950e49a6726
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D4bd886fb0081=
954879aaa2f574f3c7f6ced745d5

Ah, sorry I see it now.

meta-android adds --with-firmware-path and it was applied without these
patches from Jonathan. So now it should be fine and I dont need to
remove android firmware path tweak.

Thanks for clarification and sorry for noise.

>=20
> > NOTE: recipe systemd-1_219+gitAUTOINC+a88abde721-r0: task do_configure:=
 Started
> > WARNING: QA Issue: systemd: configure was passed unrecognised options: =
--with-firmware-path [unknown-configure-option]
> > NOTE: recipe systemd-1_219+gitAUTOINC+a88abde721-r0: task do_configure:=
 Succeeded
> >
> >>                  "
> >>   # uclibc does not have NSS
> >>   EXTRA_OECONF_append_libc-uclibc =3D " --disable-myhostname "
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >
> >
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUQUZwACgkQN1Ujt2V2gBwunwCfRPXqdCTdFKQy/9Z9wHvgM4+s
TbwAn0yOa7NEM7tr2FM9aJhiJpSiZCC+
=mvO/
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
