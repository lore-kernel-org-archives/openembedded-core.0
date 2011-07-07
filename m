Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QewMM-0008G0-Ka
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 23:43:47 +0200
Received: by pwi1 with SMTP id 1so784562pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 14:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=IiJ/aCvaiXXo15yPqB7VxlZCI7Fex97xv6v3W1tWzwU=;
	b=MSi0nVM85qI0ZTK5vC9ub5F6KUpS2tGjsVP3M98dMNUrGpyg8N6kpzTgfC9PovsDuA
	kNKdBX+WDyEpoSz8jm0+wfsD746Et/uPminxfyNjQlVkpGF5diQ/UOWUVR5aNn5+yAhF
	DrGHRCcXBu7aKyRI/HvCyBD64+cDIPv4PCe7Q=
Received: by 10.68.5.135 with SMTP id s7mr1600708pbs.96.1310074785044; Thu, 07
	Jul 2011 14:39:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.57.104 with HTTP; Thu, 7 Jul 2011 14:39:15 -0700 (PDT)
In-Reply-To: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
References: <cover.1310070283.git.nitin.a.kamble@intel.com>
	<629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jul 2011 14:39:15 -0700
Message-ID: <CAMKF1srHWhp36iNaMPKBbkBNBQSSWCb7fbULP9efAsg3r29J=A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] binutils: upgrade from 2.21 to 2.21.1
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
X-List-Received-Date: Thu, 07 Jul 2011 21:43:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 7, 2011 at 1:25 PM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> =C2=A0...n_2.21.bb =3D> binutils-cross-canadian_2.21.1.bb} | =C2=A0 =C2=
=A00
> =C2=A0...tils-cross_2.21.bb =3D> binutils-cross_2.21.1.bb} | =C2=A0 =C2=
=A00
> =C2=A0...rosssdk_2.21.bb =3D> binutils-crosssdk_2.21.1.bb} | =C2=A0 =C2=
=A00
> =C2=A0.../110-arm-eabi-conf.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../binutils-2.19.1-ld-sysroot.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../binutils-poison.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../binutils-pr12366.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../binutils-uclibc-100-uclibc-conf.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0...binutils-uclibc-300-001_ld_makefile_patch.patch | =C2=A0 =C2=A00
> =C2=A0...binutils-uclibc-300-006_better_file_error.patch | =C2=A0 =C2=A00
> =C2=A0...ils-uclibc-300-012_check_ldrunpath_length.patch | =C2=A0 =C2=A00
> =C2=A0.../binutils-uclibc-gas-needs-libm.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../binutils-x86_64_i386_biarch.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../libiberty_path_fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../libtool-2.4-update.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1725 ++++++++++----------
> =C2=A0.../libtool-rpath-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../{binutils_2.21.bb =3D> binutils_2.21.1.bb} =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A07 +-
> =C2=A017 files changed, 871 insertions(+), 861 deletions(-)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.21=
.bb =3D> binutils-cross-canadian_2.21.1.bb} (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-cross_2.21.bb =3D> =
binutils-cross_2.21.1.bb} (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.21.bb =
=3D> binutils-crosssdk_2.21.1.bb} (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}=
/110-arm-eabi-conf.patch (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}=
/binutils-2.19.1-ld-sysroot.patch (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}=
/binutils-poison.patch (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}=
/binutils-pr12366.patch (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}=
/binutils-uclibc-100-uclibc-conf.patch (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}=
/binutils-uclibc-300-001_ld_makefile_patch.patch (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}=
/binutils-uclibc-300-006_better_file_error.patch (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}=
/binutils-uclibc-300-012_check_ldrunpath_length.patch (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}=
/binutils-uclibc-gas-needs-libm.patch (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}=
/binutils-x86_64_i386_biarch.patch (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}=
/libiberty_path_fix.patch (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}=
/libtool-2.4-update.patch (94%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}=
/libtool-rpath-fix.patch (100%)
> =C2=A0rename meta/recipes-devtools/binutils/{binutils_2.21.bb =3D> binuti=
ls_2.21.1.bb} (87%)
>

How about changing the recipe to fetch from binutils-2_21-branch and
call it binutils 2.21 as it is


