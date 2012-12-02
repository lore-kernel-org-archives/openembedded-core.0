Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TfFUe-0001eD-74
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Dec 2012 20:46:25 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so3037963ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2012 11:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gFQKDUKJMMEHixDpkri/gkhpagrYZVtLamoz1cZAads=;
	b=zWPTmvXVLDiQmoM8+FV1avixmppw20Li15jKFXcO9mG0K69v9EPgLf8aHtmWD+rKq3
	Ypqw8AkzWrxuewNgQrbv21jEn1VG7w/JmtLyNiiad5SKodKjGk+48U4PvKNtBZeVNFt4
	T9lCS32g/KS7xy8DU6aZquhFqSs6MWC3aVGxapfZksRJfu6hVay9ichMjnzaNN612GjI
	35+7rqhUGtRD1NDrdjk5iHksW6B6pqVDt/B7xUdLEmck9lh5kQx+npMr1ttf47lH0ZF/
	IDJfCytQHSRicxphpBZSpf39sHKolPyRBE/VPOPpdCjQ+UFbA8DWIFbpw5NZcuYxHdtN
	G1Pg==
Received: by 10.43.92.72 with SMTP id bp8mr6073528icc.49.1354476723433; Sun,
	02 Dec 2012 11:32:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Sun, 2 Dec 2012 11:31:32 -0800 (PST)
In-Reply-To: <cover.1354116375.git.raj.khem@gmail.com>
References: <cover.1354116375.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Dec 2012 11:31:32 -0800
Message-ID: <CAMKF1spc28n5eWKCy6H6KOvLS6GNhOYkeNrDVL3GaSPjVD1K9Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Upgrade binutils to 2.23.1
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
X-List-Received-Date: Sun, 02 Dec 2012 19:46:25 -0000
Content-Type: multipart/alternative; boundary=bcaec517c8c8f4f0aa04cfe3af42

--bcaec517c8c8f4f0aa04cfe3af42
Content-Type: text/plain; charset=UTF-8

Hello

There is an annoying change in binutils/bfd which now wants autoconf
generated config.h so basically any package depending on binutils-dev and
using bfd.h now needs to adapt to this change. I have fixed oprofile for
this and pushed refreshed patches to pull branch. You can fix rest of
packages modeling the oprofile fix
or let me know of the failing package I will help out.

Thanks
-Khem


On Wed, Nov 28, 2012 at 7:29 AM, Khem Raj <raj.khem@gmail.com> wrote:

> This patchset updates binutils to 2.23 branch I have tested systemd-image
> meta-toolchain and core-image-sato target with it they all built fine
> I did not (yet) delete the 2.22 recipes since there must be some time
> given for folks to try 2.23 in couple of weeks 2.22 recipes will move
> out of OE-Core. Preferably deleted if need be moved into toolchain-layer
>
>
> The following changes since commit
> bdce08215396e5ab99ada5fa0f62c3b002a44582:
>
>   openssh: CVE-2011-4327 (2012-11-28 07:38:26 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib kraj/binutils-2.23
>
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/binutils-2.23
>
> Khem Raj (3):
>   binutils-2.23.1: Add recipes
>   oprofile: Define PACKAGE and PACKAGE_VERSION
>   tcmode-default.inc: Use binutils 2.23.1
>
>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>  meta/recipes-devtools/binutils/binutils-2.23.1.inc |   46 +
>  .../binutils-2.23.1/backport/0001-bfd.patch        |   58 +
>  ...3-Assemble-all-sources-files-in-each-test.patch |  187 +
>  .../binutils-2.23.1/backport/0005-bfd.patch        |  103 +
>  .../backport/0010-bfd-ChangeLog.patch              |   95 +
>  ...012-Fix-TLS-LD-to-LE-optimization-for-x32.patch |   57 +
>  .../backport/0013-gas-ChangeLog.patch              |   43 +
>  .../0014-Fix-opcode-for-64-bit-jecxz.patch         |  112 +
>  ...-data.exp-Add-XFAIL-for-arm-targets-refer.patch |   40 +
>  .../binutils-2.23.1/backport/0018-bfd.patch        |   78 +
>  .../binutils-2.23.1/backport/0024-bfd.patch        |   49 +
>  .../backport/0026-ld-testsuite.patch               |   65 +
>  .../binutils/binutils-2.23.1/binutils-armv5e.patch |   25 +
>  .../binutils/binutils-2.23.1/binutils-poison.patch |  259 +
>  .../binutils-uclibc-100-uclibc-conf.patch          |   40 +
>  ...binutils-uclibc-300-001_ld_makefile_patch.patch |   55 +
>  ...binutils-uclibc-300-006_better_file_error.patch |   45 +
>  ...ils-uclibc-300-012_check_ldrunpath_length.patch |   49 +
>  .../binutils-uclibc-gas-needs-libm.patch           |   38 +
>  .../binutils-x86_64_i386_biarch.patch              |   29 +
>  .../binutils-2.23.1/libiberty_path_fix.patch       |   22 +
>  .../binutils-2.23.1/libtool-2.4-update.patch       |19407
> ++++++++++++++++++++
>  .../binutils-2.23.1/libtool-rpath-fix.patch        |   39 +
>  .../mips64-default-ld-emulation.patch              |   49 +
>  .../binutils/binutils-2.23.1/relocatable_sdk.patch |   49 +
>  .../binutils/binutils-cross-canadian_2.23.1.bb     |    3 +
>  .../binutils/binutils-cross_2.23.1.bb              |    3 +
>  .../binutils/binutils-crosssdk_2.23.1.bb           |   14 +
>  meta/recipes-devtools/binutils/binutils_2.23.1.bb  |   35 +
>  meta/recipes-kernel/oprofile/oprofile.inc          |    4 +-
>  31 files changed, 21097 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1.inc
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-bfd.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/backport/0003-Assemble-all-sources-files-in-each-test.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/backport/0005-bfd.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/backport/0010-bfd-ChangeLog.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/backport/0012-Fix-TLS-LD-to-LE-optimization-for-x32.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/backport/0013-gas-ChangeLog.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/backport/0014-Fix-opcode-for-64-bit-jecxz.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/backport/0017-ld-elf-comm-data.exp-Add-XFAIL-for-arm-targets-refer.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/backport/0018-bfd.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/backport/0024-bfd.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/backport/0026-ld-testsuite.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/binutils-armv5e.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/binutils-poison.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-100-uclibc-conf.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-300-001_ld_makefile_patch.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-300-006_better_file_error.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-300-012_check_ldrunpath_length.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-gas-needs-libm.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/binutils-x86_64_i386_biarch.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/libiberty_path_fix.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/libtool-2.4-update.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/libtool-rpath-fix.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/mips64-default-ld-emulation.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils-2.23.1/relocatable_sdk.patch
>  create mode 100644 meta/recipes-devtools/binutils/
> binutils-cross-canadian_2.23.1.bb
>  create mode 100644 meta/recipes-devtools/binutils/
> binutils-cross_2.23.1.bb
>  create mode 100644 meta/recipes-devtools/binutils/
> binutils-crosssdk_2.23.1.bb
>  create mode 100644 meta/recipes-devtools/binutils/binutils_2.23.1.bb
>
> --
> 1.7.9.5
>
>

--bcaec517c8c8f4f0aa04cfe3af42
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div><font><font face=3D"courier new,monospace">Hello</font></font></div><p=
><font><font face=3D"courier new,monospace">There is an annoying change in =
binutils/bfd which now wants autoconf generated config.h so basically any p=
ackage depending on binutils-dev and using bfd.h now needs to adapt to this=
 change. I have fixed oprofile for this and pushed refreshed patches to pul=
l branch. You can fix rest of packages modeling the oprofile fix</font></fo=
nt></p>

<font><font face=3D"courier new,monospace"><div>or let me know of the faili=
ng package I will help out.</div><div>=C2=A0</div><div>Thanks</div><div>-Kh=
em<br></div></font></font><div class=3D"gmail_extra"><br><br><div class=3D"=
gmail_quote">

On Wed, Nov 28, 2012 at 7:29 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">

This patchset updates binutils to 2.23 branch I have tested systemd-image<b=
r>
meta-toolchain and core-image-sato target with it they all built fine<br>
I did not (yet) delete the 2.22 recipes since there must be some time<br>
given for folks to try 2.23 in couple of weeks 2.22 recipes will move<br>
out of OE-Core. Preferably deleted if need be moved into toolchain-layer<br=
>
<br>
<br>
The following changes since commit bdce08215396e5ab99ada5fa0f62c3b002a44582=
:<br>
<br>
=C2=A0 openssh: CVE-2011-4327 (2012-11-28 07:38:26 +0000)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" target=3D"_blank">git.openembedded.org/openembedded-core-contrib</a> kr=
aj/binutils-2.23<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-c=
ontrib/log/?h=3Dkraj/binutils-2.23" target=3D"_blank">http://cgit.openembed=
ded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dkraj/binutils-2.23</a><=
br>
<br>
Khem Raj (3):<br>
=C2=A0 binutils-2.23.1: Add recipes<br>
=C2=A0 oprofile: Define PACKAGE and PACKAGE_VERSION<br>
=C2=A0 tcmode-default.inc: Use binutils 2.23.1<br>
<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-devtools/binutils/binutils-2.23.1.inc | =C2=A0 46 +<br>
=C2=A0.../binutils-2.23.1/backport/0001-bfd.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 58 +<br>
=C2=A0...3-Assemble-all-sources-files-in-each-test.patch | =C2=A0187 +<br>
=C2=A0.../binutils-2.23.1/backport/0005-bfd.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0103 +<br>
=C2=A0.../backport/0010-bfd-ChangeLog.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 95 +<br>
=C2=A0...012-Fix-TLS-LD-to-LE-optimization-for-x32.patch | =C2=A0 57 +<br>
=C2=A0.../backport/0013-gas-ChangeLog.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 43 +<br>
=C2=A0.../0014-Fix-opcode-for-64-bit-jecxz.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0112 +<br>
=C2=A0...-data.exp-Add-XFAIL-for-arm-targets-refer.patch | =C2=A0 40 +<br>
=C2=A0.../binutils-2.23.1/backport/0018-bfd.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 78 +<br>
=C2=A0.../binutils-2.23.1/backport/0024-bfd.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 49 +<br>
=C2=A0.../backport/0026-ld-testsuite.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 65 +<br>
=C2=A0.../binutils/binutils-2.23.1/binutils-armv5e.patch | =C2=A0 25 +<br>
=C2=A0.../binutils/binutils-2.23.1/binutils-poison.patch | =C2=A0259 +<br>
=C2=A0.../binutils-uclibc-100-uclibc-conf.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| =C2=A0 40 +<br>
=C2=A0...binutils-uclibc-300-001_ld_makefile_patch.patch | =C2=A0 55 +<br>
=C2=A0...binutils-uclibc-300-006_better_file_error.patch | =C2=A0 45 +<br>
=C2=A0...ils-uclibc-300-012_check_ldrunpath_length.patch | =C2=A0 49 +<br>
=C2=A0.../binutils-uclibc-gas-needs-libm.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 38 +<br>
=C2=A0.../binutils-x86_64_i386_biarch.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 29 +<br>
=C2=A0.../binutils-2.23.1/libiberty_path_fix.patch =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 22 +<br>
=C2=A0.../binutils-2.23.1/libtool-2.4-update.patch =C2=A0 =C2=A0 =C2=A0 |19=
407 ++++++++++++++++++++<br>
=C2=A0.../binutils-2.23.1/libtool-rpath-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 39 +<br>
=C2=A0.../mips64-default-ld-emulation.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 49 +<br>
=C2=A0.../binutils/binutils-2.23.1/relocatable_sdk.patch | =C2=A0 49 +<br>
=C2=A0.../binutils/<a href=3D"http://binutils-cross-canadian_2.23.1.bb" tar=
get=3D"_blank">binutils-cross-canadian_2.23.1.bb</a> =C2=A0 =C2=A0 | =C2=A0=
 =C2=A03 +<br>
=C2=A0.../binutils/<a href=3D"http://binutils-cross_2.23.1.bb" target=3D"_b=
lank">binutils-cross_2.23.1.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A03 +<br>
=C2=A0.../binutils/<a href=3D"http://binutils-crosssdk_2.23.1.bb" target=3D=
"_blank">binutils-crosssdk_2.23.1.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 14 +<br>
=C2=A0meta/recipes-devtools/binutils/<a href=3D"http://binutils_2.23.1.bb" =
target=3D"_blank">binutils_2.23.1.bb</a> =C2=A0| =C2=A0 35 +<br>
=C2=A0meta/recipes-kernel/oprofile/oprofile.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| =C2=A0 =C2=A04 +-<br>
=C2=A031 files changed, 21097 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1.inc=
<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bac=
kport/0001-bfd.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bac=
kport/0003-Assemble-all-sources-files-in-each-test.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bac=
kport/0005-bfd.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bac=
kport/0010-bfd-ChangeLog.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bac=
kport/0012-Fix-TLS-LD-to-LE-optimization-for-x32.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bac=
kport/0013-gas-ChangeLog.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bac=
kport/0014-Fix-opcode-for-64-bit-jecxz.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bac=
kport/0017-ld-elf-comm-data.exp-Add-XFAIL-for-arm-targets-refer.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bac=
kport/0018-bfd.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bac=
kport/0024-bfd.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bac=
kport/0026-ld-testsuite.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bin=
utils-armv5e.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bin=
utils-poison.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bin=
utils-uclibc-100-uclibc-conf.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bin=
utils-uclibc-300-001_ld_makefile_patch.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bin=
utils-uclibc-300-006_better_file_error.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bin=
utils-uclibc-300-012_check_ldrunpath_length.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bin=
utils-uclibc-gas-needs-libm.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/bin=
utils-x86_64_i386_biarch.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/lib=
iberty_path_fix.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/lib=
tool-2.4-update.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/lib=
tool-rpath-fix.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/mip=
s64-default-ld-emulation.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/rel=
ocatable_sdk.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/<a href=3D"http://b=
inutils-cross-canadian_2.23.1.bb" target=3D"_blank">binutils-cross-canadian=
_2.23.1.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/<a href=3D"http://b=
inutils-cross_2.23.1.bb" target=3D"_blank">binutils-cross_2.23.1.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/<a href=3D"http://b=
inutils-crosssdk_2.23.1.bb" target=3D"_blank">binutils-crosssdk_2.23.1.bb</=
a><br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/<a href=3D"http://b=
inutils_2.23.1.bb" target=3D"_blank">binutils_2.23.1.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br></div>

--bcaec517c8c8f4f0aa04cfe3af42--
