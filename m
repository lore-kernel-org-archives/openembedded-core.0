Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SWS7i-0000vw-5U
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 14:54:06 +0200
Received: by dalh21 with SMTP id h21so5893406dal.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 05:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ISj0KsmzL75eY2g/f+TXlWxrl7ck7f71QL2inkoI8C0=;
	b=a02iKb/VW47sdWQh54X7jVFU9ig/c/P9HXCgd+EgkRckglUBMgIQ/k/ANpGv2faGln
	DxeBazDjlsbOoVrhzW+A58L1WlfGRsgfY3XF6pA5879v9g7TjNQHNPAzt4WRPRZS3oDV
	DNrn1OUQF3e0o5fgGqhIe1DaYDbHM7e/O9XpHNl8/85qW8GkDQBIhSTU3eJ+ufplca8t
	G12xdUkfW8p6bCbWUsd9Ug1MEVIRfJo/YlVgca0APiYpxFfTQPH9fkf5PHH2ebjmeU3g
	fpp6hdQGdHqCCrroknZFYeOvIlhkUMJsjkybyBhrxzV27C9qtU4NdamJ7zoeI4EJ+RUJ
	rPmA==
MIME-Version: 1.0
Received: by 10.68.231.40 with SMTP id td8mr41495372pbc.150.1337604237730;
	Mon, 21 May 2012 05:43:57 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Mon, 21 May 2012 05:43:57 -0700 (PDT)
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Date: Mon, 21 May 2012 09:43:57 -0300
Message-ID: <CADkTA4NOom5JZ26aFrykAtU5AbnHaDS+r23LVjBgE+5Y-GTk6w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 00/14] mips64 support and sh4 support
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
X-List-Received-Date: Mon, 21 May 2012 12:54:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 21, 2012 at 12:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
> This patchset adds required bits into metadata for having
> mips64/n64 support. I have tested the core-image-sato and core-image-mini=
mal
> builds and boots on qemumips64 and runs gcc regression testsuite.
> It needs linux-yocto-dev kernel for now which can be obtained from

And as an extra point on this, I have a full _3.4 recipe prep'd, but
vacation reared
it's ugly head. I'll send the changes out when I return (or sooner if
I sneak away
to a decent computer and internet connection :).

The series looks good to me, thanks Khem!

Bruce

> poky-extra repo. Additionally systemd-image on angstrom-next builds and b=
oots
> fine on qemumips64 as well.
>
> Additionally it also adds bits to have SH4 root file systems to be
> able to built and again core-image-sato builds for sh4 however qemu
> machine support is not yet done but root file sytem boots fine on
> real hardware.
>
> The images are tested on both eglibc and uclibc.
>
> Any help in providing feedback or testing these patches is welcome.
>
> I have tested them enough for over a month now.
>
> The following changes since commit 326563d5a897ae2dba7cfd8d73579d3d979d72=
c8:
>
> =A0sstate.bbclass: Make sure we don't have an empty fixmepath file (2012-=
05-18 15:24:45 +0100)
>
> are available in the git repository at:
> =A0git://git.openembedded.org/openembedded-core-contrib kraj/mips64
> =A0http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dkraj/mips64
>
> Khem Raj (14):
> =A0insane.bbclass: Add mips64{el} to known machines
> =A0site: Add mips64 eglibc and uclibc site files
> =A0gcc-4.6, gcc-4.7: Add support for building mips64 cross compiler
> =A0binutils: Default to n64 when configured for mips64
> =A0kernel-arch.bbclass: Map mips64{el} to mips KARCH
> =A0eglibc-2.15: Support mips64
> =A0libc-package: Add sh4 and mips64 to arch options
> =A0runqemu: Add qemush4 and qemumips64 knowledge
> =A0netbase: Add interface files for qemumips64 and qemush4
> =A0site/sh-common: Add missing caches variables to build glib-2.32
> =A0xserver-xorg: Fix build for mips64
> =A0tune-mips64.inc: Add new tune file for mips64 big-endian
> =A0qemumips64.conf: Add machine configuration for mips64(eb)
> =A0qemush4.conf: Add machine configuration for qemush4
>
> =A0meta/classes/insane.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A04 +
> =A0meta/classes/kernel-arch.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0meta/classes/libc-package.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A03 +
> =A0meta/conf/machine/include/tune-mips64.inc =A0 =A0 =A0 =A0 =A0| =A0 =A0=
3 +
> =A0meta/conf/machine/qemumips64.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 13 +++
> =A0meta/conf/machine/qemush4.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 13 +++
> =A0meta/recipes-core/eglibc/eglibc-locale.inc =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0meta/recipes-core/eglibc/eglibc_2.15.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0.../netbase/netbase-4.47/qemumips64/interfaces =A0 =A0 | =A0 =A08 ++
> =A0.../netbase/netbase-4.47/qemush4/interfaces =A0 =A0 =A0 =A0| =A0 =A08 =
++
> =A0meta/recipes-core/netbase/netbase_4.47.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
4 +-
> =A0.../binutils/mips64-default-ld-emulation.patch =A0 =A0 | =A0 49 ++++++=
+++
> =A0meta/recipes-devtools/binutils/binutils_2.22.bb =A0 =A0| =A0 =A03 +-
> =A0meta/recipes-devtools/gcc/gcc-4.6.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A01 +
> =A0.../gcc/gcc-4.6/mips64-default-n64.patch =A0 =A0 =A0 =A0 =A0 | =A0 32 =
++++++
> =A0meta/recipes-devtools/gcc/gcc-4.7.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A01 +
> =A0.../gcc/gcc-4.7/mips64-default-n64.patch =A0 =A0 =A0 =A0 =A0 | =A0 19 =
++++
> =A0meta/recipes-devtools/gcc/gcc-configure-common.inc | =A0 =A04 +
> =A0.../xorg-xserver/xserver-xorg-1.11.2.inc =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
1 +
> =A0.../xserver-xorg-1.11.2/mips64-compiler.patch =A0 =A0 =A0| =A0 29 ++++=
+
> =A0meta/site/mips64-linux =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 82 +++++++++++++++
> =A0meta/site/mips64-linux-uclibc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 83 +++++++++++++++
> =A0meta/site/mips64el-linux =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 82 +++++++++++++++
> =A0meta/site/mips64el-linux-uclibc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0108 ++++++++++++++++++++
> =A0meta/site/sh-common =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 =A04 +
> =A0scripts/runqemu =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0| =A0 10 ++-
> =A0scripts/runqemu-internal =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 35 ++++++-
> =A027 files changed, 594 insertions(+), 11 deletions(-)
> =A0create mode 100644 meta/conf/machine/include/tune-mips64.inc
> =A0create mode 100644 meta/conf/machine/qemumips64.conf
> =A0create mode 100644 meta/conf/machine/qemush4.conf
> =A0create mode 100644 meta/recipes-core/netbase/netbase-4.47/qemumips64/i=
nterfaces
> =A0create mode 100644 meta/recipes-core/netbase/netbase-4.47/qemush4/inte=
rfaces
> =A0create mode 100644 meta/recipes-devtools/binutils/binutils/mips64-defa=
ult-ld-emulation.patch
> =A0create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/mips64-default-n6=
4.patch
> =A0create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/mips64-default-n6=
4.patch
> =A0create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.1=
1.2/mips64-compiler.patch
> =A0create mode 100644 meta/site/mips64-linux
> =A0create mode 100644 meta/site/mips64-linux-uclibc
> =A0create mode 100644 meta/site/mips64el-linux
> =A0create mode 100644 meta/site/mips64el-linux-uclibc
>
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


