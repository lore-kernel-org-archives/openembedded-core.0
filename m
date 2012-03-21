Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SAAji-00068T-N3
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 02:53:14 +0100
Received: by vcbfl13 with SMTP id fl13so792941vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 18:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MSJU5Pdt+u0apONQzij4kklzBcRShy0f8c+q10HDEJ0=;
	b=nxoeaCAesjQCM2RdDJjAaHqYQsL8x7ZPpBy2nkYvuHpO9iB0i3pmOIm/xyNZpqDRcm
	84dMXpJ7GxQaWNGd2CuHn1G9G9V8MpSNKO7/2TBlssX7qQTE3pNxmFFp9ne/PT8+jW42
	QmRgJi80rRK3CvQjXva4vJms9EQUF8lI/nmbq5KUBlLw0Ts4nrpobFs3+rxrnwjPAxxV
	cUrhvoPGkZsieX9eZ7qF1yvPf5arHHHb9k36kH9Qyi6cVmhSA+PkpfvrpdUsoINMDvMg
	2AkyMbQaknFzrBzwnlpLFqWGD41hL96+PVZ7GYR1e34HQ06TwGGowkapSEeZAoCGPw8F
	ldLA==
MIME-Version: 1.0
Received: by 10.52.72.130 with SMTP id d2mr831381vdv.80.1332294261296; Tue, 20
	Mar 2012 18:44:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Tue, 20 Mar 2012 18:44:21 -0700 (PDT)
In-Reply-To: <1332283657-5978-1-git-send-email-obi@opendreambox.org>
References: <1332283657-5978-1-git-send-email-obi@opendreambox.org>
Date: Tue, 20 Mar 2012 22:44:21 -0300
X-Google-Sender-Auth: riKpSQuVhQNvSQla6o6h_RIyDJI
Message-ID: <CAP9ODKqD4D05U8ursNq7_Z-oWDx869ANGrh2Gh4E4CraZpqHCQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] parted: update to version 3.1
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
X-List-Received-Date: Wed, 21 Mar 2012 01:53:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked by: Otavio Salvador <otavio@ossystems.com.br>

On Tue, Mar 20, 2012 at 19:47, Andreas Oberritter <obi@opendreambox.org> wr=
ote:
> * Supports disks > 2TB
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> * v2: Updated DEPENDS to match shlibs.
> =A0 =A0 =A0Updated fix-git-version-gen.patch (applied upstream).
>
> =A0.../parted/parted-3.1/fix-doc-mandir.patch =A0 =A0 =A0 =A0 | =A0 20 ++=
+++++++
> =A0.../parted/parted-3.1/fix-git-version-gen.patch =A0 =A0| =A0 43 ++++++=
++++++++++++++
> =A0.../{parted-3.0 =3D> parted-3.1}/no_check.patch =A0 =A0 =A0| =A0 =A00
> =A0.../{parted-3.0 =3D> parted-3.1}/syscalls.patch =A0 =A0 =A0| =A0 =A00
> =A0.../parted/{parted_3.0.bb =3D> parted_3.1.bb} =A0 =A0 =A0 =A0| =A0 12 =
+++--
> =A05 files changed, 70 insertions(+), 5 deletions(-)
> =A0create mode 100644 meta/recipes-extended/parted/parted-3.1/fix-doc-man=
dir.patch
> =A0create mode 100644 meta/recipes-extended/parted/parted-3.1/fix-git-ver=
sion-gen.patch
> =A0rename meta/recipes-extended/parted/{parted-3.0 =3D> parted-3.1}/no_ch=
eck.patch (100%)
> =A0rename meta/recipes-extended/parted/{parted-3.0 =3D> parted-3.1}/sysca=
lls.patch (100%)
> =A0rename meta/recipes-extended/parted/{parted_3.0.bb =3D> parted_3.1.bb}=
 (52%)
>
> diff --git a/meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch=
 b/meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch
> new file mode 100644
> index 0000000..0711d4e
> --- /dev/null
> +++ b/meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch
> @@ -0,0 +1,20 @@
> +Upstream-Status: Submitted [bug-parted@gnu.org]
> +
> +| for po in `ls -1 ./*.pt_BR.po 2>/dev/null`; do \
> +| =A0 =A0 =A0 =A0 =A0 =A0 =A0make $(basename ${po%.pt_BR.po}); \
> +| =A0 =A0 =A0done
> +| Makefile:904: *** Recursive variable `mandir' references itself (event=
ually). =A0Stop.
> +
> +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> +
> +--- parted-3.1/doc/po4a.mk.orig =A0 =A0 =A0 =A02012-03-15 14:09:11.55583=
1872 +0100
> ++++ parted-3.1/doc/po4a.mk =A0 =A0 2012-03-15 14:10:44.243830985 +0100
> +@@ -23,7 +23,7 @@
> + # threshold is 80%), it won't be distributed, and the build won't fail.
> + #
> +
> +-mandir =3D $(mandir)/$(lang)
> ++mandir :=3D $(mandir)/$(lang)
> +
> + # Inform automake that we want to install some man pages in section 1, =
5
> + # and 8.
> diff --git a/meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.=
patch b/meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
> new file mode 100644
> index 0000000..a9f26e9
> --- /dev/null
> +++ b/meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
> @@ -0,0 +1,43 @@
> +Upstream-Status: Accepted [Expected to be included in parted versions > =
3.1]
> +Upstream-URL: http://git.savannah.gnu.org/cgit/gnulib.git/patch/?id=3Dcb=
c11ff0020eb9c04caea6b3e7dc4e4281dff1f9
> +
> +From cbc11ff0020eb9c04caea6b3e7dc4e4281dff1f9 Mon Sep 17 00:00:00 2001
> +From: Andreas Oberritter <obi@opendreambox.org>
> +Date: Sun, 18 Mar 2012 17:39:14 +0000
> +Subject: git-version-gen: don't let "prefix" envvar cause trouble
> +
> +* build-aux/git-version-gen (prefix): Initialize properly,
> +so as not to use a value specified via the environment.
> +Details here: http://thread.gmane.org/gmane.comp.gnu.parted.bugs/10810
> +---
> +diff --git a/build-aux/git-version-gen b/build-aux/git-version-gen
> +index d5542a2..0fa9063 100755
> +--- a/build-aux/git-version-gen
> ++++ b/build-aux/git-version-gen
> +@@ -1,6 +1,6 @@
> + #!/bin/sh
> + # Print a version string.
> +-scriptversion=3D2012-01-06.07; # UTC
> ++scriptversion=3D2012-03-18.17; # UTC
> +
> + # Copyright (C) 2007-2012 Free Software Foundation, Inc.
> + #
> +@@ -92,6 +92,8 @@ Options:
> +
> + Running without arguments will suffice in most cases."
> +
> ++prefix=3Dv
> ++
> + while test $# -gt 0; do
> + =A0 case $1 in
> + =A0 =A0 --help) echo "$usage"; exit 0;;
> +@@ -120,7 +122,6 @@ if test -z "$tarball_version_file"; then
> + fi
> +
> + tag_sed_script=3D"${tag_sed_script:-s/x/x/}"
> +-prefix=3D"${prefix:-v}"
> +
> + nl=3D'
> + '
> +--
> +cgit v0.9.0.2
> diff --git a/meta/recipes-extended/parted/parted-3.0/no_check.patch b/met=
a/recipes-extended/parted/parted-3.1/no_check.patch
> similarity index 100%
> rename from meta/recipes-extended/parted/parted-3.0/no_check.patch
> rename to meta/recipes-extended/parted/parted-3.1/no_check.patch
> diff --git a/meta/recipes-extended/parted/parted-3.0/syscalls.patch b/met=
a/recipes-extended/parted/parted-3.1/syscalls.patch
> similarity index 100%
> rename from meta/recipes-extended/parted/parted-3.0/syscalls.patch
> rename to meta/recipes-extended/parted/parted-3.1/syscalls.patch
> diff --git a/meta/recipes-extended/parted/parted_3.0.bb b/meta/recipes-ex=
tended/parted/parted_3.1.bb
> similarity index 52%
> rename from meta/recipes-extended/parted/parted_3.0.bb
> rename to meta/recipes-extended/parted/parted_3.1.bb
> index 2fba6d1..21d3a66 100644
> --- a/meta/recipes-extended/parted/parted_3.0.bb
> +++ b/meta/recipes-extended/parted/parted_3.1.bb
> @@ -3,15 +3,17 @@ HOMEPAGE =3D "http://www.gnu.org/software/parted/parted=
.html"
> =A0LICENSE =3D "GPLv3+"
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2f31b266d3440dd7ee50f92cf67=
d8e6c"
> =A0SECTION =3D "console/tools"
> -DEPENDS =3D "readline e2fsprogs"
> +DEPENDS =3D "ncurses readline util-linux"
> =A0PR =3D "r0"
>
> -SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
> +SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
> =A0 =A0 =A0 =A0 =A0 =A0file://no_check.patch \
> - =A0 =A0 =A0 =A0 =A0 file://syscalls.patch "
> + =A0 =A0 =A0 =A0 =A0 file://syscalls.patch \
> + =A0 =A0 =A0 =A0 =A0 file://fix-git-version-gen.patch \
> + =A0 =A0 =A0 =A0 =A0 file://fix-doc-mandir.patch"
>
> -SRC_URI[md5sum] =3D "a94e84a9b9944715c4453f82ccc639bf"
> -SRC_URI[sha256sum] =3D "8886eece015202f6bd5ce8414f4b68838452cef509f2e338=
9ad56128219837b7"
> +SRC_URI[md5sum] =3D "5d89d64d94bcfefa9ce8f59f4b81bdcb"
> +SRC_URI[sha256sum] =3D "5e9cc1f91eaf016e5033d85b9b893fd6d3ffaca532a48de1=
082df9b94225ca15"
>
> =A0EXTRA_OECONF =3D "--disable-device-mapper"
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
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


