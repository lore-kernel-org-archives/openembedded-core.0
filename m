Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S63JO-00044W-ID
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 18:09:02 +0100
Received: by wibhm17 with SMTP id hm17so559848wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2012 09:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=il2Byrul2cQ6b3qqEfJPCS6veXSrwHLGHruMplVocyE=;
	b=LVEHBC/AnxcEPpSDDa19G4YJtP93aoPb0IqXO1bq3CxBSnuWG+T3bZDJmqqf5FjahZ
	ZohlOctxUS4seq7MClLx3/+ZWiFlddz51tadfWXBV2uFLjgLAL4vm+fikmxDwKrQUMmx
	2RUfDehGNKbFjNKlYihb2i8z7tmHFLPSbLmlHcrF8rCO5AEZgjeRg+zV1YsyXxGrwA5w
	iZ/B0ocR+Mn4qR6dz3otKXwxU0tZ7xr7tqeN1Phho8bhGtja7aWpFbKsZpMajdAjkWvi
	qtFIZJhyeVDqNB6VtZ2y+jYI951r4r2wHNcs2BXgbEhl2sk3NLBD/FEinyEfZs+6q904
	3eew==
Received: by 10.180.88.199 with SMTP id bi7mr6484383wib.12.1331312423069;
	Fri, 09 Mar 2012 09:00:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p10sm7502671wic.0.2012.03.09.09.00.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 09:00:21 -0800 (PST)
Date: Fri, 9 Mar 2012 18:00:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120309170020.GH3813@jama.jama.net>
References: <20120301094052.GB3831@jama.jama.net>
	<1331275706-6917-1-git-send-email-Martin.Jansa@gmail.com>
	<CAEsOVNd4kfQvzaDxku3KOSzMFfcFbUpakM1GvnfLiPxuVdvm5w@mail.gmail.com>
	<CAEsOVNfpw=FOvmUjvPKaEVp6TO6T-RvhUuC2DJ8sKSMBzK67RA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEsOVNfpw=FOvmUjvPKaEVp6TO6T-RvhUuC2DJ8sKSMBzK67RA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake.conf: use PACKAGE_ARCH instead of TARGET_ARCH in SDK_NAME
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
X-List-Received-Date: Fri, 09 Mar 2012 17:09:02 -0000
X-Groupsio-MsgNum: 18568
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82evfD9Ogz2JrdWZ"
Content-Disposition: inline

--82evfD9Ogz2JrdWZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 09, 2012 at 04:33:33PM +0000, McClintock Matthew-B29882 wrote:
> On Fri, Mar 9, 2012 at 10:32 AM, Matthew McClintock <msm@freescale.com> w=
rote:
> > On Fri, Mar 9, 2012 at 12:48 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> >> * also use weak assignment for SDK_NAME_PREFIX as suggested by khem
> >> * PACKAGE_ARCH is not 100% right too, because such SDK image usually h=
as few
> >> =A0machine specific packages included (e.g. base-files, securetty, opk=
g configs)
> >> =A0but those are not important for SDK users so it's better to have on=
e SDK for
> >> =A0whole e.g. armv7a-vfp-neon then 6 SDK for each machine which would =
work the
> >> =A0same.
> >> =A0You can see diff between crespo and om-gta04 SDK here:
> >> =A0http://build.shr-project.org/shr-core-staging/031/sdk/oecore-i686-a=
rmv7a-vfp-neon-toolchain-efl-crespo-om-gta04.diff
> >>
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >> =A0meta/conf/bitbake.conf | =A0 =A04 ++--
> >> =A01 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >> index 87bb71c..91f8397 100644
> >> --- a/meta/conf/bitbake.conf
> >> +++ b/meta/conf/bitbake.conf
> >> @@ -364,8 +364,8 @@ PKGDATA_DIR =3D "${TMPDIR}/pkgdata/${MULTIMACH_TAR=
GET_SYS}"
> >> =A0# SDK variables,
> >> =A0##################################################################
> >>
> >> -SDK_NAME_PREFIX =3D "oecore"
> >> -SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TARGET_ARCH}"
> >> +SDK_NAME_PREFIX ?=3D "oecore"
> >> +SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_ARCH}-${PACKAGE_ARCH}"
> >
> > Why PACKAGE_ARCH over TUNE_ARCH?
>=20
> Or rather TUNE_PKGARCH?

In=20
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/018543.ht=
ml
I've said:

"And we should change TARGET_ARCH in SDK_NAME to PACKAGE_ARCH or TUNE_PKGAR=
CH"

So why TUNE_ARCH/TUNE_PKGARCH over PACKAGE_ARCH?

I don't see the advantage, but if there is some I'll update it in v2.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--82evfD9Ogz2JrdWZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9aNyQACgkQN1Ujt2V2gBx6OACgjnP31T59tAekcSu+jpYzxCO7
V8YAnivFWimqZEfqwx8oxgfoAcDP6ndw
=5CwU
-----END PGP SIGNATURE-----

--82evfD9Ogz2JrdWZ--
