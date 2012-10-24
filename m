Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TR2q1-000499-Je
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 17:25:45 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so4352246wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pw5+XPC3GPBTYyTHr1SZTbgjh4pRpbBdLax5u23iWd8=;
	b=fm0trBjXgoDzOOy4U0HSpdOorrHI9cyG8ZNkC+s3fdCqvhqfLVR2+agiic5o3vssyz
	GAqsAROGcvttkeyw4IPWo2X2QX7hs3bE+gwC5mpKD7rCtQwZe2LcNn8J/lwiWuRh8Cwc
	TgpUVuq//D0XaLl4fl66vecA67LZOoUKsWDUU709Rs3CLjx7CFPA/9P0+LH382kdW5Bh
	VIJXTRmmcM7dhCzN3BybgmZ5AAs4xTDcmdsTtbGlFn0+gKjGxJPsRZb9TPD4xztgIETX
	RpqCcbK+Ls+g8NYTQG47CtBQc+yaKEzq4a5TU2D1OfyJlCiJUGKCGfp0cIE5BewHD0wl
	wdUg==
Received: by 10.216.209.40 with SMTP id r40mr10021825weo.144.1351091538087;
	Wed, 24 Oct 2012 08:12:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cn6sm5411548wib.9.2012.10.24.08.12.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 08:12:16 -0700 (PDT)
Date: Wed, 24 Oct 2012 17:12:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20121024151234.GH3269@jama.jama.net>
References: <1350569021-17352-1-git-send-email-ross.burton@intel.com>
	<50880419.9000203@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <50880419.9000203@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmare: upgrade to latest commit
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
X-List-Received-Date: Wed, 24 Oct 2012 15:25:45 -0000
X-Groupsio-MsgNum: 30948
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LNKrWK8T5LDJo+fl"
Content-Disposition: inline

--LNKrWK8T5LDJo+fl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 24, 2012 at 08:07:05AM -0700, Saul Wold wrote:
> On 10/18/2012 07:03 AM, Ross Burton wrote:
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >   meta/recipes-kernel/linux-firmware/linux-firmware_git.bb |    4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b=
/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > index 559f82a..f4eb4cf 100644
> > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > @@ -19,10 +19,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.radeon;md5=3De=
56b405656593a0c97e478513051ea0e \
> >                       file://LICENCE.rtlwifi_firmware.txt;md5=3D00d06cf=
d3eddd5a2698948ead2ad54a5 \
> >                      "
> >
> > -SRCREV =3D "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
> > +SRCREV =3D "0d6729f2b0bc6254d3628eb831bc80a36b5a17db"
> >   PE =3D "1"
> >   PV =3D "0.0+git${SRCPV}"
> > -PR =3D "r4"
> > +PR =3D "r5"
> >
> >   SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/l=
inux-firmware.git;protocol=3Dgit"
> >
> >
> Merged into OE-Core

Probably not caused by this upgrade, but do you also see:

NOTE: Running setscene task 1956 of 2655 (/OE/shr-core/openembedded-core/me=
ta/recipes-kernel/linux-firmware/linux-firmware_git.bb, do_package_setscene)
NOTE: recipe linux-firmware-1_0.0+git2+0d6729f2b0bc6254d3628eb831bc80a36b5a=
17db-r5: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-firmware-1_0.0+git2+0d6729f2b0bc6254d3628eb831bc80a36b5a=
17db-r5: task do_package_setscene: Started
WARNING: The recipe linux-firmware is trying to install files into a shared=
 area when those files already exist. Those files are:
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/ti_5052.fw
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/mts_edge.fw
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/whiteheat_loader.=
fw
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/mts_cdma.fw
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/whiteheat.fw
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/mts_gsm.fw
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/ti_3410.fw
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/kaweth/new_code_f=
ix.bin
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/kaweth/trigger_co=
de_fix.bin
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/kaweth/new_code.b=
in
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/kaweth/trigger_co=
de.bin
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/keyspan_pda/keysp=
an_pda.fw
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/keyspan_pda/xirco=
m_pgs.fw
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/edgeport/down.fw
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/edgeport/down3.bin
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/edgeport/down2.fw
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/edgeport/boot.fw
   /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/edgeport/boot2.fw
NOTE: recipe linux-firmware-1_0.0+git2+0d6729f2b0bc6254d3628eb831bc80a36b5a=
17db-r5: task do_populate_sysroot_setscene: Succeeded

Here it's installed by kernel recipe (linux-openmoko not linux-yocto based)=
 but I don't=20
see firmware install disabled in kernel.bbclass or linux-yocto.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LNKrWK8T5LDJo+fl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCIBWIACgkQN1Ujt2V2gBzXGQCgseryPIb2eb8SMonQu16MBXaK
oboAnRusUP/+OtVq1Qm64ITsuPBy1qIq
=ZQVb
-----END PGP SIGNATURE-----

--LNKrWK8T5LDJo+fl--
