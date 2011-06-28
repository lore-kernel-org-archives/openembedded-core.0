Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QbZLm-0007vI-Oh
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 16:36:55 +0200
Received: by ywa12 with SMTP id 12so106746ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 07:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=/u+shIVeH03nt+leYU7Fkd1IbMMpYZNh3fAeWvm5i2E=;
	b=r0zMhEwik06EpbYsF+Gg8x6CyPAYAG4mBx/maUA7NeQ5XabpdXQcuhRGynYAPHLvIr
	bjjqv2zK1BA4KO/WLC/kFYD1EUVAV6z8c9XUGeTZpdT70aHhPnpVLjkeUf7OmYY2aZS7
	pcHnyfDfXDu3De5bvquDrktV8azhJ/rTmXJ7w=
MIME-Version: 1.0
Received: by 10.91.6.14 with SMTP id j14mr8340185agi.35.1309271240169; Tue, 28
	Jun 2011 07:27:20 -0700 (PDT)
Received: by 10.90.78.5 with HTTP; Tue, 28 Jun 2011 07:27:20 -0700 (PDT)
In-Reply-To: <cover.1309203545.git.anders@chargestorm.se>
References: <cover.1309203545.git.anders@chargestorm.se>
Date: Tue, 28 Jun 2011 10:27:20 -0400
Message-ID: <BANLkTimCF1jmxUjfKjPaak1ECF=5gLjhTg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC v2 PATCH 0/9] Linux 3.0 build support
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
X-List-Received-Date: Tue, 28 Jun 2011 14:36:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2011 at 3:39 PM, Anders Darander <anders@chargestorm.se> wr=
ote:
>
>
> v2: Probably some more patches could be squashed together. There might al=
so
> =A0 =A0be more places that should be addressed in these patches.
>
> =A0 =A0- Whitespace fixes
> =A0 =A0- Updated module-init-tools to 3.16. I'm not applying the ignore*.=
patch
> =A0 =A0(it didn't apply).
> =A0 =A0- Do not provide virtual/*/depmod-2.6; just provide virtual/*/depm=
od.
> =A0 =A0- Do only install as depmod.
> =A0 =A0- Rearrange the order of some patches.
> =A0 =A0- Added patches to clean up (partly) task-base, distro_tracking_fi=
elds.
>
> =A0 =A0A few of the patches might be ready to pull, but the majority will=
 need
> =A0 =A0to be revised.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This work is unfinished and incomplete...
> It is published in its current form both to get feedback, but also to aid
> anyone else who is working on 3.0-support. If some of the patches are fou=
nd to
> be OK, it's fine to cherrypick them.

The series looks pretty good to me. I'm gearing up to complete the 3.0 carr=
y
forward shortly, and I've applied these to my local tree to take them
for a spin.

Cheers,

Bruce

>
> The kernel-related classes has been modified to build a 3.0 kernel. The
> patches has been simplified by removing support for the 2.4-series. (The
> latter was suggested in an older mail thread:
> http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg0=
2682.html
> ).
>
> The patches has been tested on linux-yocto_2.6.37 and a hacked version us=
ing
> the linux-yocto-dev repository (using a 3.0-rcX). The latest versions has=
 only
> been built for qemuarm, prior iterations has also been built for qemux86.
>
> Finally, no work has been done on the libc-linux-headers classes and reci=
pes.
>
> /Anders
>
> Please review the following changes for suitability for inclusion. If you=
 have
> any objections or suggestions for improvement, please respond to the patc=
hes. If
> you agree with the changes, please provide your Acked-by.
>
> The following changes since commit 3aec2fa2df9aaa883feda0d7aed85e63d01398=
b9:
>
> =A0qemuimagetest: update cvs and iptables to newer version for toolchain =
test (2011-06-24 11:28:28 +0100)
>
> are available in the git repository at:
> =A0git://github.com/darander/oe-core kernel-3.0
> =A0https://github.com/darander/oe-core/tree/kernel-3.0
>
> Anders Darander (9):
> =A0Remove support for building 2.4 kernels
> =A0image=A1kernel.bblass: do not use depmod-2.6
> =A0modules-init-tools(-cross): update to 3.16
> =A0module-init-tools-cross: do not install depmod as depmod-2.6
> =A0kernel.bblass: remove get_kernelmajorversion
> =A0modutils-initscripts: move recipe prior to modutils removal
> =A0modutils: remove modutils
> =A0task-base: remove modutils reference.
> =A0distro_tracking_fields: remove modutils.
>
> =A0meta/classes/image.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A02 +-
> =A0meta/classes/kernel.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 22 ++----
> =A0meta/classes/linux-kernel-base.bbclass =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A08 --
> =A0meta/classes/module-base.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0.../conf/distro/include/distro_tracking_fields.inc | =A0 =A08 +--
> =A0meta/recipes-core/tasks/task-base.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 22 +----
> =A0.../{modutils =3D> module-init-tools}/files/PD.patch | =A0 =A00
> =A0.../files/modutils.sh =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A00
> =A0.../module-init-tools-cross_3.12.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 12 ---
> =A0.../module-init-tools-cross_3.16.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A08 ++
> =A0.../module-init-tools/module-init-tools.inc =A0 =A0 =A0 =A0| =A0 =A01 =
-
> =A0...nit-tools_3.12.bb =3D> module-init-tools_3.16.bb} | =A0 =A06 +-
> =A0.../modutils-initscripts.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A00
> =A0meta/recipes-kernel/modutils/files/armeb.patch =A0 =A0 | =A0 16 ----
> =A0meta/recipes-kernel/modutils/files/configure.patch | =A0 34 -------
> =A0meta/recipes-kernel/modutils/files/gcc4.patch =A0 =A0 =A0| =A0 93 ----=
----------------
> =A0meta/recipes-kernel/modutils/files/lex.l.diff =A0 =A0 =A0| =A0 35 ----=
----
> =A0.../modutils/files/modutils-notest.patch =A0 =A0 =A0 =A0 =A0 | =A0 16 =
----
> =A0.../modutils/files/program_prefix.patch =A0 =A0 =A0 =A0 =A0 =A0| =A0 7=
1 ---------------
> =A0.../recipes-kernel/modutils/modutils-collateral.bb | =A0 21 -----
> =A0.../modutils/modutils-cross/module.h.diff =A0 =A0 =A0 =A0 =A0| =A0 35 =
--------
> =A0.../modutils/modutils-cross_2.4.27.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 20 ----
> =A0meta/recipes-kernel/modutils/modutils_2.4.27.bb =A0 =A0| =A0 93 ------=
--------------
> =A023 files changed, 25 insertions(+), 500 deletions(-)
> =A0rename meta/recipes-kernel/{modutils =3D> module-init-tools}/files/PD.=
patch (100%)
> =A0rename meta/recipes-kernel/{modutils =3D> module-init-tools}/files/mod=
utils.sh (100%)
> =A0delete mode 100644 meta/recipes-kernel/module-init-tools/module-init-t=
ools-cross_3.12.bb
> =A0create mode 100644 meta/recipes-kernel/module-init-tools/module-init-t=
ools-cross_3.16.bb
> =A0rename meta/recipes-kernel/module-init-tools/{module-init-tools_3.12.b=
b =3D> module-init-tools_3.16.bb} (87%)
> =A0rename meta/recipes-kernel/{modutils =3D> module-init-tools}/modutils-=
initscripts.bb (100%)
> =A0delete mode 100644 meta/recipes-kernel/modutils/files/armeb.patch
> =A0delete mode 100644 meta/recipes-kernel/modutils/files/configure.patch
> =A0delete mode 100644 meta/recipes-kernel/modutils/files/gcc4.patch
> =A0delete mode 100644 meta/recipes-kernel/modutils/files/lex.l.diff
> =A0delete mode 100644 meta/recipes-kernel/modutils/files/modules
> =A0delete mode 100644 meta/recipes-kernel/modutils/files/modules.conf
> =A0delete mode 100644 meta/recipes-kernel/modutils/files/modutils-notest.=
patch
> =A0delete mode 100644 meta/recipes-kernel/modutils/files/program_prefix.p=
atch
> =A0delete mode 100644 meta/recipes-kernel/modutils/modutils-collateral.bb
> =A0delete mode 100644 meta/recipes-kernel/modutils/modutils-cross/module.=
h.diff
> =A0delete mode 100644 meta/recipes-kernel/modutils/modutils-cross_2.4.27.=
bb
> =A0delete mode 100644 meta/recipes-kernel/modutils/modutils_2.4.27.bb
>
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


