Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5AC7824C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 23:55:06 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id y67so1503971wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 16:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jgpmi/ozx7bsdN9Mp3InWoNKRcIvaqqRq90J9A3Vclg=;
	b=oXSbnxPAXaOvvZaDTWfaZxJijyL/+hj1VoutEvJjly6jFujhmAELPytxWEo+ZKccJL
	QS38RQyjAe8rgBXqbH4SFx3+9qJYQ+HZUgadsKpSnX+VztXAmiZyJD2pcUgV1IgtZObP
	uoZ+HmTllLq9eTP2bwJ8tN8MZ1VUY4lLJKX6EVbi+zOdgJzEL7zmmGaCcErvd9C8LjDs
	oC6SGw0hxLDIFmVZwHHRQCqK3WZXRnCobsZJZFlBU2SKm+6sMyK9fFYnu3UiRDy/gvBo
	C88mpRtIVC10H5f/12VmzLsw5B/+su/OObDLI3PDaY0MZj7h9mVA721RxIQC2LZXBxQZ
	4mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jgpmi/ozx7bsdN9Mp3InWoNKRcIvaqqRq90J9A3Vclg=;
	b=R/L0ONbEaszT2B0JjGIDuYQbr/0oC5LYLgSk/zjc13vnbSXnhXRC3yGXNv8gc2IW8R
	2beCcdojulOSX40UaH0aRcsit7h4euyY1LMW0jN1Cb1yJYUL4orBvsJsyrqndOt8aClK
	o7rUP88TE7ZB6Q761ncAh4VY17VrWxVqyRlDdwAYjlrh+mlbouNYZaOKBDKXt6Zi+3X8
	Y9K33J8g0Eb+r0DZHj6Elx4T0EXPH9MOJHESV/UhYidJYR9ket4SuNTWvFXEHMmoaCCy
	WFfOMnUXrNeCkyohqsuuv6NfWbvKlvhVauNkFOXc9Ps7CPG2TQYNJ02yEb814MYqQsry
	8NlA==
X-Gm-Message-State: AHYfb5ip+KyUrAeHIYhpnlUQaqhG7kGKe5i2F4pxNN2UKyosWpUXUwzC
	ewYxxU5T+TWs6g==
X-Received: by 10.223.161.19 with SMTP id o19mr11101505wro.235.1502409307313; 
	Thu, 10 Aug 2017 16:55:07 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p68sm21711727wmf.0.2017.08.10.16.55.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 Aug 2017 16:55:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 Aug 2017 01:56:37 +0200
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20170810235637.GA3320@jama>
References: <f05e1212a87f739cf27fe9a6c32f45ef92a6fdab.1501250341.git-series.patrick.ohly@intel.com>
	<CAMKF1sq98x8jpV_A0Fz2doMO25Cii9v4Ez178ex4uUoPqnnB8A@mail.gmail.com>
	<CA+chaQetLEuL79Utj_C+e7yQpg9Hw1ZhVQsOdCEeLZNziAzMqQ@mail.gmail.com>
	<04c5a375-93ee-7f32-4f91-a4dc3f7c9b1c@windriver.com>
MIME-Version: 1.0
In-Reply-To: <04c5a375-93ee-7f32-4f91-a4dc3f7c9b1c@windriver.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autoconf-archive: move from meta-oe to OE-core
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
X-List-Received-Date: Thu, 10 Aug 2017 23:55:07 -0000
X-Groupsio-MsgNum: 101237
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2017 at 03:34:48PM -0500, Mark Hatle wrote:
> On 8/10/17 3:18 PM, Martin Jansa wrote:
> > -2
>=20
> I agree that autoconf-archive should be in oe-core.  But...

No argument about that, it was already merged to oe-core, I was only
commenting about the gnome-common change included in this commit.

>=20
> > LBTM
> >=20
> >=20
> > If gnome-common should depend on TUNE_PKGARCH autoconf-archive, then it=
 cannot inherit allarch anymore, see:
> >=20
> >=20
> > ERROR: gnome-common different signature for task do_package_write_ipk.s=
igdata between qemux86copy and qemuarm
> > runtaskdeps changed:
> > autoconf-archive/autoconf-archive_2016.09.16.bb.do_packagedata with has=
h e26a8076711b7e88a3ffcda74a9e5332
> >  changed to
> > autoconf-archive/autoconf-archive_2016.09.16.bb.do_packagedata with has=
h ee3f5138593bed3feb8519cf3c26aa7b
> > Hash for dependent task autoconf-archive/autoconf-archive_2016.09.16.bb=
=2Edo_packagedata changed from e26a8076711b7e88a3ffcda74a9e5332 to ee3f5138=
593bed3feb8519cf3c26aa7b
> >=20
>=20
> There should not be an architectural difference.  There is no reason it
> shouldn't be allarch.  Part of the reason we really need to move it into =
oe-core
> is that currently different BSPs may implement it differently making the
> 'allarch' even MORE complicated.

I don't understand what you mean with BSPs wrt autoconf-archive, but as
it is now, the autoconf-archive in oe-core isn't allarch, so allarch
gnome-common in meta-oe cannot depend on it.

It could be whitelisted in layer.conf or allarch can be dropped from
gnome-common or autoconf-archive can be updated to inherit allarch as
well - either of these options is fine with me, but I won't merge this
change in current state.

>=20
> --Mark
>=20
> >=20
> > On Fri, Jul 28, 2017 at 6:45 PM, Khem Raj <raj.khem@gmail.com
> > <mailto:raj.khem@gmail.com>> wrote:
> >=20
> >     On Fri, Jul 28, 2017 at 7:01 AM, Patrick Ohly <patrick.ohly@intel.c=
om
> >     <mailto:patrick.ohly@intel.com>> wrote:
> >     > Having common macros in OE-core that are needed by autotools based
> >     > projects makes sense. For example, tpm2.0-tools in meta-measured
> >     > depended on meta-oe only because of autoconf-archive.
> >     >
> >     > This is a verbatim copy of the autoconf-archive recipe in
> >     > meta-openembedded rev 1cbd1bc1, with just one change: the patch w=
hich
> >     > disabled the installation of ax_code_coverage.m4 and
> >     > ax_check_enable_debug.m4 was removed.
> >     >
> >     > So now autoconf-archive in OE-core provides them. gnome-common in
> >     > meta-oe will be changed to not install them and instead depend on
> >     > autoconf-archive.
> >=20
> >     +1
> >     LGTM
> >=20
> >     >
> >     > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com
> >     <mailto:patrick.ohly@intel.com>>
> >     > ---
> >     >  meta/recipes-devtools/autoconf-archive/autoconf-archive.inc     =
      |
> >     15 +++++++++++++++
> >     >  meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.=
16.bb
> >     <http://autoconf-archive_2016.09.16.bb> | 13 +++++++++++++
> >     >  2 files changed, 28 insertions(+)
> >     >  create mode 100644
> >     meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
> >     >  create mode 100644
> >     meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.=
bb
> >     <http://autoconf-archive_2016.09.16.bb>
> >     >
> >     > diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-arch=
ive.inc
> >     b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
> >     > new file mode 100644
> >     > index 0000000..9684d1f
> >     > --- /dev/null
> >     > +++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
> >     > @@ -0,0 +1,15 @@
> >     > +LICENSE =3D "GPLv3"
> >     > +HOMEPAGE =3D "http://www.gnu.org/software/autoconf-archive/
> >     <http://www.gnu.org/software/autoconf-archive/>"
> >     > +SECTION =3D "devel"
> >     > +
> >     > +DEPENDS +=3D "m4-native"
> >     > +DEPENDS_class-native =3D "m4-native gnu-config-native"
> >     > +DEPENDS_class-nativesdk =3D "m4-nativesdk gnu-config-nativesdk"
> >     > +
> >     > +RDEPENDS_${PN} =3D "m4 gnu-config gnome-common"
> >     > +RDEPENDS_${PN}_class-native =3D "m4-native gnu-config-native"
> >     > +RDEPENDS_${PN}_class-nativesdk =3D "m4-nativesdk gnu-config-nati=
vesdk"
> >     > +
> >     > +SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
> >     > +
> >     > +inherit autotools
> >     > diff --git
> >     a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.1=
6.bb
> >     <http://autoconf-archive_2016.09.16.bb>
> >     b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.1=
6.bb
> >     <http://autoconf-archive_2016.09.16.bb>
> >     > new file mode 100644
> >     > index 0000000..0a1a771
> >     > --- /dev/null
> >     > +++
> >     b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.1=
6.bb
> >     <http://autoconf-archive_2016.09.16.bb>
> >     > @@ -0,0 +1,13 @@
> >     > +require autoconf-archive.inc
> >     > +
> >     > +
> >     > +PARALLEL_MAKE =3D ""
> >     > +
> >     > +LICENSE =3D "GPLv2 & GPLv3"
> >     > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e=
80d47fae504"
> >     > +
> >     > +SRC_URI[md5sum] =3D "bf19d4cddce260b3c3e1d51d42509071"
> >     > +SRC_URI[sha256sum] =3D
> >     "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
> >     > +
> >     > +EXTRA_OECONF +=3D "ac_cv_path_M4=3Dm4"
> >     > +BBCLASSEXTEND =3D "native nativesdk"
> >     >
> >     > base-commit: d3a41fbd94462efc8c6f1b55f6fb54001b447c45
> >     > --
> >     > git-series 0.9.1
> >     > --
> >     > _______________________________________________
> >     > Openembedded-core mailing list
> >     > Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> >=20
> >=20
> >=20
> >=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWYzytQAKCRA3VSO3ZXaA
HCJ/AJ4/r/sqqUqw0xdcl4MSp51zB+AAiACeNyg9TWs7aU+kXgShz2S/kUUKp4o=
=N9HD
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
