Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tsw3K-0001A7-6C
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 14:50:57 +0100
Received: by mail-pa0-f52.google.com with SMTP id fb1so1040120pad.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 05:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=gLxvESVGBxqFb5zOp4ZM0uJ61U2g1oPwZu+eop18KOw=;
	b=Jq9O184JyzS2QWdUaKj8BS9X8nG1Idt7zl7yjuHtb6lWWFt+dzVlpOF7gZ0X+XXO4r
	m8hPrLvUsaNVq61vxapfSunBhEyhW+qJaN9CsMjCW0TSuRFp1hFnmP3iT4Dgl2OPB9pv
	BT4pTcbFbYAYoSCVsj4ITgCzlady2N21XsJIfDDciQqOSBrsdXQjnZzPWy8fc/cAoQ/O
	o3Qylh9h588/6pfXU7UjEvodIucUaPOL/bsdf/qQ9lmHPpSuaQUxFpUXw3wekPLnzcHX
	4WnTdFhCo9ZfrVqEKFjUK1EocgSOB9/ZwgQlDI1cdYxcXDmgXBOUon0eIi0rzN8wfZs/
	T9EQ==
X-Received: by 10.68.238.136 with SMTP id vk8mr16186037pbc.86.1357738533502;
	Wed, 09 Jan 2013 05:35:33 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id tq4sm41645958pbc.50.2013.01.09.05.35.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 05:35:31 -0800 (PST)
Date: Wed, 9 Jan 2013 14:35:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130109133536.GK3722@jama.palm1.palmone.com>
References: <cover.1357343832.git.raj.khem@gmail.com>
	<CAMKF1spo+=xXVZSDNw3kaLbSc-XKUw8Uewn5DNTvgueu2TLt_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spo+=xXVZSDNw3kaLbSc-XKUw8Uewn5DNTvgueu2TLt_Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/4] eglibc 2.17 upgrade
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
X-List-Received-Date: Wed, 09 Jan 2013 13:51:01 -0000
X-Groupsio-MsgNum: 33596
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZG5hGh9V5E9QzVHS"
Content-Disposition: inline

--ZG5hGh9V5E9QzVHS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 07, 2013 at 02:49:48PM -0800, Khem Raj wrote:
> A bit of an update here.
> I have pushed another patch on top of this list to the branch to fix
> udev and after that I have been able
> to build and boot core-image-sato on all supported qemu machines.

I've build tested with bitbake world (23 layers enabled) and runtime
tested on armv4t (om-gta02). Looks good! Thanks

Cheers,
=20
> On Fri, Jan 4, 2013 at 4:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > I would like folks to try and test this upgrade. I have tested it on an=
gstrom/systemd-image
> > booted on all supported qemu images.
> >
> > This is however now the final set since I have to put the 2.17 tars on
> > downloads location
> >
> > Please try it out in your configurations and let me know if you find is=
sues.
> >
> > The following changes since commit b693f6d3d48b281fbbf71fd56996c85e23c3=
a9c9:
> >
> >   freetype: update to 2.4.11 which includes fixes for CVE-2012-{5668, 5=
669, 5670} (2012-12-31 09:42:49 +0000)
> >
> > are available in the git repository at:
> >
> >   git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.17
> >   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?=
h=3Dkraj/eglibc-2.17
> >
> > Khem Raj (3):
> >   eglibc: Upgrade recipes 2.16 -> 2.17
> >   eglibc_2.17: Fix Tibetian locale generation error
> >   ofono: Fix build with eglibc 2.17
> >
> > Noor Ahsan (1):
> >   cairo: Adds libxext in X11DEPENDS.
> >
> >  meta/conf/distro/include/tcmode-default.inc        |    2 +-
> >  .../ofono/ofono/missing-ssize_t.patch              |   23 ++
> >  meta/recipes-connectivity/ofono/ofono_1.12.bb      |    3 +-
> >  ...tive_2.16.bb =3D> cross-localedef-native_2.17.bb} |   12 +-
> >  .../0001-Add-ARM-specific-static-stubs.c.patch     |   27 --
> >  ..._handle_at-open_by_handle-etc.-to-PowerPC.patch |   65 ----
> >  ...f-libgcc_s-and-libgcc_eh-when-building-gl.patch |  343 ------------=
--------
> >  .../eglibc-2.16/use-sysroot-cxx-headers.patch      |   42 ---
> >  .../0001-R_ARM_TLS_DTPOFF32.patch                  |    0
> >  .../0001-eglibc-menuconfig-support.patch           |    0
> >  ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |    0
> >  ...0002-eglibc-menuconfig-hex-string-options.patch |    0
> >  ...0003-eglibc-menuconfig-build-instructions.patch |    0
> >  .../GLRO_dl_debug_mask.patch                       |    0
> >  .../IO-acquire-lock-fix.patch                      |    0
> >  .../add_resource_h_to_wait_h.patch                 |    0
> >  .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
> >  .../eglibc_fix_findidx_parameters.patch            |    0
> >  .../{eglibc-2.16 =3D> eglibc-2.17}/etc/ld.so.conf    |    0
> >  .../fileops-without-wchar-io.patch                 |    0
> >  .../eglibc/eglibc-2.17/fix-tibetian-locales.patch  |   38 +++
> >  .../fix_for_centos_5.8.patch                       |    0
> >  .../fsl-ppc-no-fsqrt.patch                         |    0
> >  .../generate-supported.mk                          |    0
> >  .../glibc.fix_sqrt2.patch                          |    0
> >  .../initgroups_keys.patch                          |    0
> >  .../ld-search-order.patch                          |    0
> >  .../mips-rld-map-check.patch                       |    0
> >  .../multilib_readlib.patch                         |    0
> >  .../ppc-sqrt_finite.patch                          |    0
> >  .../ppc_slow_ieee754_sqrt.patch                    |    0
> >  .../relocatable_sdk.patch                          |    0
> >  .../tzselect-awk.patch                             |    0
> >  .../{eglibc-2.16 =3D> eglibc-2.17}/tzselect-sh.patch |   54 ++-
> >  ...libc-initial_2.16.bb =3D> eglibc-initial_2.17.bb} |    0
> >  meta/recipes-core/eglibc/eglibc-locale.inc         |    2 -
> >  ...eglibc-locale_2.16.bb =3D> eglibc-locale_2.17.bb} |    0
> >  meta/recipes-core/eglibc/eglibc-mtrace.inc         |    1 -
> >  ...eglibc-mtrace_2.16.bb =3D> eglibc-mtrace_2.17.bb} |    0
> >  ...libc-scripts_2.16.bb =3D> eglibc-scripts_2.17.bb} |    0
> >  .../eglibc/{eglibc_2.16.bb =3D> eglibc_2.17.bb}      |   39 +--
> >  meta/recipes-graphics/cairo/cairo.inc              |    8 +-
> >  meta/recipes-graphics/cairo/cairo_1.12.8.bb        |    2 +-
> >  43 files changed, 107 insertions(+), 554 deletions(-)
> >  create mode 100644 meta/recipes-connectivity/ofono/ofono/missing-ssize=
_t.patch
> >  rename meta/recipes-core/eglibc/{cross-localedef-native_2.16.bb =3D> c=
ross-localedef-native_2.17.bb} (74%)
> >  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-ARM-s=
pecific-static-stubs.c.patch
> >  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_=
to_handle_at-open_by_handle-etc.-to-PowerPC.patch
> >  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Avoid-use=
-of-libgcc_s-and-libgcc_eh-when-building-gl.patch
> >  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cx=
x-headers.patch
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/0001-R_=
ARM_TLS_DTPOFF32.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/0001-eg=
libc-menuconfig-support.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/0001-eg=
libc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/0002-eg=
libc-menuconfig-hex-string-options.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/0003-eg=
libc-menuconfig-build-instructions.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/GLRO_dl=
_debug_mask.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/IO-acqu=
ire-lock-fix.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/add_res=
ource_h_to_wait_h.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/eglibc-=
svn-arm-lowlevellock-include-tls.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/eglibc_=
fix_findidx_parameters.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/etc/ld.=
so.conf (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/fileops=
-without-wchar-io.patch (100%)
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/fix-tibetian-l=
ocales.patch
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/fix_for=
_centos_5.8.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/fsl-ppc=
-no-fsqrt.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/generat=
e-supported.mk (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/glibc.f=
ix_sqrt2.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/initgro=
ups_keys.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/ld-sear=
ch-order.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/mips-rl=
d-map-check.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/multili=
b_readlib.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/ppc-sqr=
t_finite.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/ppc_slo=
w_ieee754_sqrt.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/relocat=
able_sdk.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/tzselec=
t-awk.patch (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-2.16 =3D> eglibc-2.17}/tzselec=
t-sh.patch (77%)
> >  rename meta/recipes-core/eglibc/{eglibc-initial_2.16.bb =3D> eglibc-in=
itial_2.17.bb} (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-locale_2.16.bb =3D> eglibc-loc=
ale_2.17.bb} (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-mtrace_2.16.bb =3D> eglibc-mtr=
ace_2.17.bb} (100%)
> >  rename meta/recipes-core/eglibc/{eglibc-scripts_2.16.bb =3D> eglibc-sc=
ripts_2.17.bb} (100%)
> >  rename meta/recipes-core/eglibc/{eglibc_2.16.bb =3D> eglibc_2.17.bb} (=
74%)
> >
> > --
> > 1.7.9.5
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZG5hGh9V5E9QzVHS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDtcigACgkQN1Ujt2V2gByhzgCfe/Ga0+ZLV2oqyL0gRDdmwquA
IWwAn1RGzavBEYUwkEa26wZCpwfqi6gP
=DEv1
-----END PGP SIGNATURE-----

--ZG5hGh9V5E9QzVHS--
