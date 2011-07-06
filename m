Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QeLz0-0003H1-KS
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 08:53:15 +0200
Received: by pvf24 with SMTP id 24so6154937pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 23:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Mjle/wONZrPSPQmxCRoKZISuGY+s3lWMEWZiL73N5RA=;
	b=wn4LKZZyx6Mg68KertwsE96msDsbNiJe4KP0vII/ulhto00Pvyrl1QrizxTufxpYI2
	xMPcLnZpavgVEySUadl3Eg/7LY0QxTNJIJI50rs3dwRjG2m/iUud05f8Vc2xpBUg9oJd
	Ph6trawmOdAro/6EFiO4QEryfsGJrY/PtDJIc=
Received: by 10.68.28.104 with SMTP id a8mr3035456pbh.431.1309934962100; Tue,
	05 Jul 2011 23:49:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.57.104 with HTTP; Tue, 5 Jul 2011 23:48:52 -0700 (PDT)
In-Reply-To: <cover.1309899985.git.raj.khem@gmail.com>
References: <cover.1309899985.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Jul 2011 23:48:52 -0700
Message-ID: <CAMKF1souQCFTzy4D9i1kWrS_y0fFZJb=00eDxtP5OtQE2tf73Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Add recipes for 0.9.32 release
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
X-List-Received-Date: Wed, 06 Jul 2011 06:53:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 5, 2011 at 2:09 PM, Khem Raj <raj.khem@gmail.com> wrote:
> With this changeset we add new recipes for 0.9.32 and make that default
> preference. Then the git recipe are moved to track the latest master.
> systemd related fixes are separately applied to both git recipe and 0.9.3=
2
> recipes
>
> Both sets work for arm,mips,ppc,x86,x86-64
>
> Thanks
> -Khem
>
>
> The following changes since commit 4eb3abaa5f4b5df0314dc0d503298d65cd2032=
59:
>
> =C2=A0uclibc-0.9.32: Implement execvpe and refresh scheduler functions (2=
011-07-05 13:53:05 -0700)
>
> are available in the git repository at:
> =C2=A0git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-0.=
9.32
> =C2=A0http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log=
/?h=3Dkraj/uclibc-0.9.32
>
> Khem Raj (5):
> =C2=A0uclibc: Add recipes for 0.9.32 release
> =C2=A0tcmode-default: Define UCLIBCVERSION and set it to 0.9.32
> =C2=A0uclibc_git: Move SRCREV past 0.9.32 release

I have update PV in above commit to 0.9.32+0.9.33-rc0 instead of
0.9.32+gitr${SRCPV} which is troublesome to use with git

> =C2=A0uclibc_git: Implement execvpe and refresh scheduler functions

refreshed after above change

> =C2=A0uclibc-0.9.32: Implement execvpe and refresh scheduler functions
>

> =C2=A0meta/conf/distro/include/tcmode-default.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A03 +
> =C2=A0...rch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch | =C2=A0 =C2=A00
> =C2=A0...fd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch | =C2=A0 =C2=A00
> =C2=A0.../uclibc/uclibc-0.9.32/argp-headers.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0581 +++
> =C2=A0.../uclibc/uclibc-0.9.32/argp-support.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 5189 ++++++++++++++++++++
> =C2=A0.../uclibc-0.9.32/compile-arm-fork-with-O2.patch =C2=A0 | =C2=A0 21=
 +
> =C2=A0.../detect-bx-availibility.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../epoll-asm-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../include-arm-asm.h.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0...so_use_arm_dl_linux_resolve_in_thumb_mode.patch | =C2=A0 21 +
> =C2=A0.../uclibc/uclibc-0.9.32/mips/uClibc.machine =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 16 +
> =C2=A0.../uclibc/uclibc-0.9.32/orign_path.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0183 +
> =C2=A0.../uclibc/uclibc-0.9.32/powerpc_copysignl.patch =C2=A0 | =C2=A0107=
 +
> =C2=A0.../remove-eabi-oabi-selection.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../remove-sub-arch-variants.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../remove_attribute_optimize_Os.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0186 +
> =C2=A0.../uclibc/uclibc-0.9.32/rtld_no.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0215 +
> =C2=A0.../select-force-thumb.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../transform-eabi-oabi-choice.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../uclibc/uclibc-0.9.32/uClibc.distro =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0184 +
> =C2=A0.../uclibc/uclibc-0.9.32/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 14 +
> =C2=A0.../uclibc-0.9.32/uclibc-arm-ftruncate64.patch =C2=A0 =C2=A0 | =C2=
=A0 13 +
> =C2=A0.../uclibc/uclibc-0.9.32/uclibc-execvpe.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0160 +
> =C2=A0.../uclibc-0.9.32/uclibc_enable_log2_test.patch =C2=A0 =C2=A0| =C2=
=A0 30 +
> =C2=A0.../uclibc-0.9.32/uclibc_scheduler_update.patch =C2=A0 =C2=A0| =C2=
=A0455 ++
> =C2=A0.../uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch =C2=A0 =C2=A0| =C2=
=A0 33 -
> =C2=A0.../uclibc/uclibc-git/orign_path.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 42 +-
> =C2=A0.../uclibc/uclibc-git/reorder-use-BX.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 72 -
> =C2=A0meta/recipes-core/uclibc/uclibc-git/rtld_no.patch =C2=A0| =C2=A0 83=
 +-
> =C2=A0meta/recipes-core/uclibc/uclibc-git/uClibc.distro =C2=A0| =C2=A0 =
=C2=A03 +
> =C2=A0.../uclibc/uclibc-git/uclibc-execvpe.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0160 +
> =C2=A0.../uclibc-git/uclibc_scheduler_update.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0455 ++
> =C2=A0meta/recipes-core/uclibc/uclibc-initial_0.9.32.bb =C2=A0| =C2=A0 39=
 +
> =C2=A0meta/recipes-core/uclibc/uclibc_0.9.32.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 32 +
> =C2=A0meta/recipes-core/uclibc/uclibc_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 23 +-
> =C2=A035 files changed, 8139 insertions(+), 181 deletions(-)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-git =3D> uclibc-0.9.32}/000=
1-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch (100%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-git =3D> uclibc-0.9.32}/000=
1-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch (100%)
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/argp-head=
ers.patch
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/argp-supp=
ort.patch
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/compile-a=
rm-fork-with-O2.patch
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-git =3D> uclibc-0.9.32}/det=
ect-bx-availibility.patch (100%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-git =3D> uclibc-0.9.32}/epo=
ll-asm-fix.patch (100%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-git =3D> uclibc-0.9.32}/inc=
lude-arm-asm.h.patch (100%)
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/ldso_use_=
arm_dl_linux_resolve_in_thumb_mode.patch
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/mips/uCli=
bc.machine
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/orign_pat=
h.patch
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/powerpc_c=
opysignl.patch
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-git =3D> uclibc-0.9.32}/rem=
ove-eabi-oabi-selection.patch (100%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-git =3D> uclibc-0.9.32}/rem=
ove-sub-arch-variants.patch (100%)
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/remove_at=
tribute_optimize_Os.patch
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.p=
atch
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-git =3D> uclibc-0.9.32}/sel=
ect-force-thumb.patch (100%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-git =3D> uclibc-0.9.32}/tra=
nsform-eabi-oabi-choice.patch (100%)
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.di=
stro
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.ma=
chine
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-ar=
m-ftruncate64.patch
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-ex=
ecvpe.patch
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_en=
able_log2_test.patch
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_sc=
heduler_update.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-git/append_UCLIB=
C_EXTRA_CFLAGS.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-git/reorder-use-=
BX.patch
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc-execv=
pe.patch
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc_sched=
uler_update.patch
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-initial_0.9.32.b=
b
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc_0.9.32.bb
>
> --
> 1.7.4.1
>
>


