Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVHfT-0002Pg-Bz
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 07:59:51 +0100
Received: by bkbzs2 with SMTP id zs2so8940179bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 22:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2MCrynzOEqdmgU1EgKCRCgWRS6dxa3MEhV+sNH2uo3s=;
	b=tJ3WWRamDWUFH61draJuwvh/kZOlSSd5pYHi25PaQx+5yU+LXcMBLogG+o47Wj8uZX
	AL09uSX7HE2FatjlMehYR1wQdkvJbc3Maqvahe8QrpxkbJW9z41w9OT/jpnQHDPpsaPY
	5mI2ZpSqY7z6UskUQu0jgqcaOD2/UV1EaTR1g=
Received: by 10.205.137.135 with SMTP id io7mr50021565bkc.88.1322549591713;
	Mon, 28 Nov 2011 22:53:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x14sm34942621bkf.10.2011.11.28.22.53.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 22:53:10 -0800 (PST)
Date: Tue, 29 Nov 2011 07:52:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20111129065257.GB7441@jama.jama.net>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
	<d10d38e320b27bfbbf6d069e820a2b6c013bbbdc.1321028799.git.Martin.Jansa@gmail.com>
	<20111115234557.GD3600@jama.jama.net>
	<1321438335.26881.232.camel@ted>
	<20111125075121.GX3565@jama.jama.net>
	<4ED46F00.20700@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4ED46F00.20700@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][oe-core 14/22] libsdl: enable alsa/opengl based on PACKAGECONFIG and respect DISTRO_FEATURES
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
X-List-Received-Date: Tue, 29 Nov 2011 06:59:51 -0000
X-Groupsio-MsgNum: 13020
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline

--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2011 at 09:34:56PM -0800, Saul Wold wrote:
> On 11/24/2011 11:51 PM, Martin Jansa wrote:
> > On Wed, Nov 16, 2011 at 10:12:15AM +0000, Richard Purdie wrote:
> >> On Wed, 2011-11-16 at 00:45 +0100, Martin Jansa wrote:
> >>> On Fri, Nov 11, 2011 at 05:28:50PM +0100, Martin Jansa wrote:
> >>>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> >>>> ---
> >>>>   meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |   10 +++++++---
> >>>>   1 files changed, 7 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/re=
cipes-graphics/libsdl/libsdl_1.2.14.bb
> >>>> index 17a3103..2f49f16 100644
> >>>> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> >>>> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> >>>> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd=
7fd83877a8e3ef82b82798ef4"
> >>>>
> >>>>   PROVIDES =3D "virtual/libsdl"
> >>>>
> >>>> -DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual=
/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender alsa-lib tslib"
> >>>> +DEPENDS =3D "virtual/libx11 libxext libxrandr libxrender tslib"
> >>>>   DEPENDS_virtclass-nativesdk =3D "libx11-nativesdk libxrandr-native=
sdk libxrender-nativesdk libxext-nativesdk"
> >>>
> >>> As Saul reported PACKAGECONFIG adds build time depends not only to
> >>> DEPENDS but they also ends in DEPENDS_virtclass-nativesdk and nothing
> >>> provides virtual/libgl-nativesdk. So I've resend this patch changing
> >>> only alsa handling to PACKAGECONFIG and keeping opengl as it was.
> >>>
> >>> Cheers,
> >>>
> >>>>   PR =3D "r1"
> >>>> @@ -29,17 +29,21 @@ SRC_URI[sha256sum] =3D "5d927e287034cb6bb0ebccfa=
382cb1d185cb113c8ab5115a0759798642
> >>>>   inherit autotools binconfig pkgconfig
> >>>>
> >>>>   EXTRA_OECONF =3D "--disable-static --disable-debug --enable-cdrom =
--enable-threads --enable-timers --enable-endian \
> >>>> -                --enable-file --disable-oss --enable-alsa --disable=
-esd --disable-arts \
> >>>> +                --enable-file --disable-oss --disable-esd --disable=
-arts \
> >>>>                   --disable-diskaudio --disable-nas --disable-esd-sh=
ared --disable-esdtest \
> >>>>                   --disable-mintaudio --disable-nasm --enable-video-=
x11 --disable-video-dga \
> >>>>                   --disable-video-fbcon --disable-video-directfb --d=
isable-video-ps2gs --disable-video-ps3 \
> >>>>                   --disable-video-xbios --disable-video-gem --disabl=
e-video-dummy \
> >>>>                   --enable-input-events --enable-input-tslib --enabl=
e-pthreads \
> >>>> -		${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-ope=
ngl', '--disable-video-opengl', d)} \
> >>>>   		--disable-video-svga \
> >>>>                   --disable-video-picogui --disable-video-qtopia --e=
nable-dlopen \
> >>>>                   --disable-rpath"
> >>>>
> >>>> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'opengl', =
'opengl', '', d)} \
> >>>> +                   ${@base_contains('DISTRO_FEATURES', 'alsa', 'als=
a', '', d)}"
> >>>> +PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib,"
> >>>> +PACKAGECONFIG[opengl] =3D "--enable-video-opengl,--disable-video-op=
engl,virtual/libgl,"
> >>>> +
> >>
> >> What we could do is have a
> >> PACKAGECONFIG_virtclass-nativesdk =3D "${@base_contains('DISTRO_FEATUR=
ES', 'alsa', 'alsa', '', d)}"
> >> or something like that.
> >
> > We've discussed this on IRC and just to be sure, do you want me to add
> > this first or can this patch go in now when builder is greener? The
> > jansa/pull branch has the version using PACKAGECONFIG only for alsa and
> > keeping opengl mangling as it was.
> >
> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa=
/pull&id=3Daafe9d871bcbdf6995432e2c8404a6c49ba942b5
> >
> Martin,
>=20
> Where are we with this one?  I was a way for a bit at LinuxCon Brazil,=20
> do you have a respun and tested patch set (tested against building the=20
> SDK and meta-toolchian...)?

Yes the version with PACKAGECONFIG used only for alsa (not for opengl)
is tested and works
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/012691=
=2Ehtml

jansa/pull branch was also updated

>=20
> Thanks
> 	Sau!
>=20
> > Regards,
> >
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7UgUkACgkQN1Ujt2V2gBzbSQCfWSI6tN3ua7X7yxcSPOl10+bS
6y8An3uO80SBKtUQ8cLl4NTP+khrhkHg
=UtzR
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
