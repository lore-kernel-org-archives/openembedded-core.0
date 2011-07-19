Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjHil-0001rK-Jr
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 23:20:51 +0200
Received: by pvf24 with SMTP id 24so4196574pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 14:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=K5gg89Mu50ampW+80pVg6CevFdi5a5PBzktHqDnug98=;
	b=oJTo14XTof4mfvbgdiW4MGBct7CaW0h5H28NREmVStB0aE5ei19hhCxbbqrJwrH3qE
	F9A8FADtW3uY354qBNTyguq0t/rjgTm45VOUGPSYHpQXHlqWjdRgQ3qLJa5JvrztT8TC
	vVkidXtSuhWCQdGTNS7peqqsKv1GKZqZbHhHg=
Received: by 10.68.35.105 with SMTP id g9mr8796442pbj.479.1311110205103; Tue,
	19 Jul 2011 14:16:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Tue, 19 Jul 2011 14:16:15 -0700 (PDT)
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jul 2011 14:16:15 -0700
Message-ID: <CAMKF1sp8EtzexADC8rL5HYrghiNPEmZhYNj3p=is4hhzipcCZQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/16] Make core-image-minimal core-image-sato buildable with uclibc
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
X-List-Received-Date: Tue, 19 Jul 2011 21:20:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 18, 2011 at 5:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
> This patch is V3 of the recents posts I have been doing from kraj/uclibc-=
oecore
> branch. With this patchset now core-image-minimal is buildable and bootab=
le
> for all arches in oe-core. Core-image-sato is buildable but I have not tr=
ied to
> boot it first attemp hung but then I have been trying to build eglibc bas=
ed
> core-image-sato and make sure that that boots.

OK. I have updated the patchset in the pull tree to incorporate
comments and further fix to get core-image-sato building and booting
on
x86.

>
> The following changes since commit 3d2c1ca9096790e4c6922b65b83ea1dffb90c3=
62:
>
> =C2=A0util-linux: Replace sigsetmask with posix compliant functions (2011=
-07-15 18:52:49 -0700)
>
> are available in the git repository at:
> =C2=A0git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-oe=
core
> =C2=A0http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log=
/?h=3Dkraj/uclibc-oecore
>
> Khem Raj (16):
> =C2=A0bitbake.conf: Change TERM default fallback to XTERM instead of
> =C2=A0 =C2=A0GNOME_TERM
> =C2=A0oe-buildenv-internal: Replace POKYMODE POKYLIBC with TCMODE and
> =C2=A0 =C2=A0TCLIBC
> =C2=A0default-distrovars: Add largefile and argp to DISTRO_FEATURES
> =C2=A0acl,attr: Fix build failures when NLS is disabled on uclibc
> =C2=A0classes/gettext: Do not disable nls for non target recipes
> =C2=A0libxdamage,libxft,libxrandr: Add missing dependency on virtual/libx=
11
> =C2=A0tzcode,tzdata: Update tzdata to 2011h
> =C2=A0task-core-x11-sato: Add empty NETWORK_MANAGER for uclibc
> =C2=A0uclibc_0.9.32: Implement sync_file_range2.
> =C2=A0oprofile: Fix build when query_module is not there
> =C2=A0powertop: Add lintl to linker commandline on uclibc
> =C2=A0pimlico/dates: Fix build on uclibc
> =C2=A0binutils: Fix build when compiling target binutils recipe with gcc
> =C2=A0 =C2=A04.6
> =C2=A0clutter-box2d: Replace use of finite macro with C99 compliant
> =C2=A0 =C2=A0isfinite()
> =C2=A0sysprof: Define NT_GNU_BUILD_ID if undefined
> =C2=A0mesa-xlib: Dont use locales with uclibc
>
> =C2=A0meta/classes/gettext.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0meta/conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A04 +-
> =C2=A0meta/conf/distro/include/default-distrovars.inc =C2=A0 =C2=A0| =C2=
=A0 =C2=A03 +-
> =C2=A0.../uclibc/uclibc-0.9.32/sync_file_range2.patch =C2=A0 =C2=A0| =C2=
=A0 15 ++++
> =C2=A0meta/recipes-core/uclibc/uclibc_0.9.32.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A03 +-
> =C2=A0.../binutils/binutils/clone-shadow.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 79 ++++++++++++++++++++
> =C2=A0meta/recipes-devtools/binutils/binutils_2.21.1.bb =C2=A0| =C2=A0 =
=C2=A03 +-
> =C2=A0.../recipes-extended/tzcode/tzcode-native_2011g.bb | =C2=A0 =C2=A07=
 +-
> =C2=A0.../tzdata/{tzdata_2011g.bb =3D> tzdata_2011h.bb} =C2=A0 =C2=A0| =
=C2=A0 =C2=A08 +-
> =C2=A0.../clutter/clutter-box2d/isfinite.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 19 +++++
> =C2=A0meta/recipes-graphics/clutter/clutter-box2d_git.bb | =C2=A0 =C2=A06=
 +-
> =C2=A0.../mesa/mesa-xlib/uclibc_locale.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 18 +++++
> =C2=A0meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb =C2=A0 =C2=A0 | =C2=
=A0 =C2=A03 +-
> =C2=A0meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb | =C2=A0 =C2=A04=
 +-
> =C2=A0meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb =C2=A0 =C2=A0 | =C2=
=A0 =C2=A04 +-
> =C2=A0meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb =C2=A0| =C2=A0 =
=C2=A04 +-
> =C2=A0.../oprofile/oprofile-no-query-modules.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 29 +++++++
> =C2=A0meta/recipes-kernel/oprofile/oprofile_0.9.6.bb =C2=A0 =C2=A0 | =C2=
=A0 =C2=A03 +-
> =C2=A0meta/recipes-kernel/powertop/powertop_1.13.bb =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 11 ++-
> =C2=A0.../sysprof/files/define-NT_GNU_BUILD_ID.patch =C2=A0 =C2=A0 | =C2=
=A0 22 ++++++
> =C2=A0meta/recipes-kernel/sysprof/sysprof_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A05 +-
> =C2=A0meta/recipes-sato/pimlico/dates.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0.../uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 37 +++++++++
> =C2=A0meta/recipes-sato/pimlico/dates_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A06 +-
> =C2=A0meta/recipes-sato/tasks/task-core-x11-sato.bb =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0meta/recipes-support/attr/acl_2.2.51.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-support/attr/attr.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A04 -
> =C2=A0meta/recipes-support/attr/attr_2.4.46.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-support/attr/ea-acl.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 +
> =C2=A0scripts/oe-buildenv-internal =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A030 files changed, 271 insertions(+), 41 deletions(-)
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/sync_file=
_range2.patch
> =C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/clone-sh=
adow.patch
> =C2=A0rename meta/recipes-extended/tzdata/{tzdata_2011g.bb =3D> tzdata_20=
11h.bb} (96%)
> =C2=A0create mode 100644 meta/recipes-graphics/clutter/clutter-box2d/isfi=
nite.patch
> =C2=A0create mode 100644 meta/recipes-graphics/mesa/mesa-xlib/uclibc_loca=
le.patch
> =C2=A0create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-n=
o-query-modules.patch
> =C2=A0create mode 100644 meta/recipes-kernel/sysprof/files/define-NT_GNU_=
BUILD_ID.patch
> =C2=A0create mode 100644 meta/recipes-sato/pimlico/dates/uclibc-NL_TIME_F=
IRST_WEEKDAY-absent.patch
>
> --
> 1.7.4.1
>
>


