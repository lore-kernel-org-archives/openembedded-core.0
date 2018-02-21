Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id EA581784E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 20:47:22 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id e7so3589686ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 12:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cdZ86YutW8ILy1NHzsAAM7b7CG0k1KE3svyOhvrgFK0=;
	b=DXPCYiaqqfmFaKzeiNCZv3AW7+RIGVWiuAPM6phEMPyzaeFNNFmt7YGx0KROtMP7w0
	G/ygRg4tnMMuk/67xIMawjW1LuYj/tACmj2XtZzuyidw1Vk+dALnY3IFaPRqesNkD2kC
	gYpPmrS+X074f8fTP/gBwgihaJzn2WhOnnqQYqkFKTPLxMjcX5FuIlWv8T5u7UfmT5go
	yQ7M+OBD/dX7iVi35dZfnhy3zcMmT+96IGfGcqcTz/Hw3s063mr+rIjarhNfcPp1fltQ
	I/NA4NgvIY46bb+COLYytGl63igp/0YRO4rPyJg/fbZGqiaH8s54LZ6s1m9CsY/rhstB
	GUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cdZ86YutW8ILy1NHzsAAM7b7CG0k1KE3svyOhvrgFK0=;
	b=R/z+yPwNfhNVFDpI50yJtLlwWzK0mr6VleN/Oxqdw89Rn5eCMELh2hDExCweA2Y1fH
	3Z0T4fNor7S/yIYO+hxmtvxTTHdE8L0evLZR6OR/nKa8kxVv0NuJ1v/iakC+aSYAaCXJ
	nTewWo1HIy+CRIXbu+yhcg7Y8DfqRZB3OoWJqm0MYoScxpCiAO5mVNjigu4wkGlJyqr6
	B6aQdJiycKpjM+JN19iftyY5lA3OaB5+p2ioByTq6Jz+JvC1j+Gn3+JaWssIwrRrJKcD
	mxo8O5VqVtN3hiBxox6IVim8MS7ZT/lJm+R8DU4QLUwLXM5kWQ68B/Ut3DbPbo8uasbr
	oIZw==
X-Gm-Message-State: APf1xPALcrtgyySMCIXlBMCSeOCaJjkb6FoHgpZBmMSsKrqxn2C5O9IW
	dnN0xGMDUzxnaIW5+TIKtMW4sNUOsYDjnKqRAKlWtQ==
X-Google-Smtp-Source: AG47ELsT6VVNA2h8le9zDfDaAq57mwGbMyTjRSylgcx2jJO7uZN0EHDf3QgixT/PGl/XE6LyKls9YQdCphK/wNRLVKE=
X-Received: by 10.107.161.200 with SMTP id k191mr5557895ioe.270.1519246040889; 
	Wed, 21 Feb 2018 12:47:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Wed, 21 Feb 2018 12:47:00 -0800 (PST)
In-Reply-To: <CAJTo0LZwDo8Xq_VmJWsg6s8Qpty5y1j+zSAk3uCscrE8YFiweg@mail.gmail.com>
References: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
	<20180212110521.16974-7-alexander.kanavin@linux.intel.com>
	<CAJTo0LZwDo8Xq_VmJWsg6s8Qpty5y1j+zSAk3uCscrE8YFiweg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Feb 2018 20:47:00 +0000
Message-ID: <CAJTo0Lb5nyHPrzF_c7x1CSXmGAbsfm2K70vkn57yL9pGhgDKeQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/10] man-db: replace the outdated man implementation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Feb 2018 20:47:23 -0000
Content-Type: multipart/alternative; boundary="001a113e919898202e0565bf08ff"

--001a113e919898202e0565bf08ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Easy fix: remember PN is lib32-man-db in these builds, so use BPN.  Fixed
up locally.

Ross

On 21 February 2018 at 20:07, Burton, Ross <ross.burton@intel.com> wrote:

> Fails in multilib:
>
> ERROR: lib32-man-db-2.8.1-r0 do_package_qa: QA Issue: non
> -dev/-dbg/nativesdk- package contains symlink .so: lib32-man-db path
> '/work/x86-pokymllib32-linux/lib32-man-db/2.8.1-r0/
> packages-split/lib32-man-db/usr/lib/man-db/libman.so'
> non -dev/-dbg/nativesdk- package contains symlink .so: lib32-man-db path
> '/work/x86-pokymllib32-linux/lib32-man-db/2.8.1-r0/
> packages-split/lib32-man-db/usr/lib/man-db/libmandb.so' [dev-so]
>
> Ross
>
> On 12 February 2018 at 11:05, Alexander Kanavin <alexander.kanavin@linux.
> intel.com> wrote:
>
>> Until now oe-core has been using a well obsolete implementation of man.
>>
>> Man-db on the other hand is used by all modern Linux distros, is activel=
y
>> maintained, has a standard build system, and does not require 30 patches
>> to build.
>>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>  meta/recipes-extended/man-db/man-db_2.8.1.bb       |  41 ++++++
>>  meta/recipes-extended/man/man/configure_sed.patch  |  32 -----
>>  .../man/man/man-1.5g-nonrootbuild.patch            |  16 ---
>>  .../man/man/man-1.5h1-gencat.patch                 |  14 --
>>  meta/recipes-extended/man/man/man-1.5h1-make.patch |  17 ---
>>  .../man/man/man-1.5i2-initial.patch                |  19 ---
>>  .../man/man/man-1.5i2-newline.patch                |  15 --
>>  .../man/man/man-1.5i2-overflow.patch               |  16 ---
>>  meta/recipes-extended/man/man/man-1.5j-i18n.patch  |  16 ---
>>  .../man/man/man-1.5j-nocache.patch                 |  16 ---
>>  meta/recipes-extended/man/man/man-1.5j-utf8.patch  |  61 --------
>>  .../man/man/man-1.5k-confpath.patch                |  15 --
>>  .../man/man/man-1.5k-nonascii.patch                |  18 ---
>>  meta/recipes-extended/man/man/man-1.5k-sofix.patch |  24 ----
>>  .../man/man/man-1.5m2-bug11621.patch               |  15 --
>>  .../man/man/man-1.5m2-buildroot.patch              |  52 -------
>>  .../man/man/man-1.5m2-no-color-for-printing.patch  |  15 --
>>  .../man/man/man-1.5m2-sigpipe.patch                |  30 ----
>>  .../man/man/man-1.6e-i18n_whatis.patch             | 145
>> -------------------
>>  .../man/man/man-1.6e-mandirs.patch                 |  31 ----
>>  .../man/man/man-1.6e-new_sections.patch            |  15 --
>>  .../recipes-extended/man/man/man-1.6e-ro_usr.patch |  33 -----
>>  .../man/man/man-1.6e-security.patch                |  62 --------
>>  .../man/man-1.6e-use_i18n_vars_in_a_std_way.patch  | 160
>> ---------------------
>>  .../man/man/man-1.6e-whatis2.patch                 |  59 --------
>>  .../man/man/man-1.6g-compile-warnings.patch        | 105 --------------
>>  .../man/man/man-1.6g-configure.patch               |  68 ---------
>>  .../man/man/man-1.6g-parallel.patch                |  30 ----
>>  .../man/man/man-1.6g-whatis3.patch                 |  20 ---
>>  meta/recipes-extended/man/man/man.1.gz             | Bin 12323 -> 0
>> bytes
>>  meta/recipes-extended/man/man/man.7.gz             | Bin 6192 -> 0 byte=
s
>>  meta/recipes-extended/man/man/man.conf             | 141
>> ------------------
>>  meta/recipes-extended/man/man/manpath.5.gz         | Bin 2133 -> 0 byte=
s
>>  meta/recipes-extended/man/man_1.6g.bb              |  86 -----------
>>  34 files changed, 41 insertions(+), 1346 deletions(-)
>>  create mode 100644 meta/recipes-extended/man-db/man-db_2.8.1.bb
>>  delete mode 100644 meta/recipes-extended/man/man/configure_sed.patch
>>  delete mode 100644 meta/recipes-extended/man/man/
>> man-1.5g-nonrootbuild.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.5h1-gencat.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.5h1-make.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.5i2-initial.patc=
h
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.5i2-newline.patc=
h
>>  delete mode 100644 meta/recipes-extended/man/man/
>> man-1.5i2-overflow.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.5j-i18n.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.5j-nocache.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.5j-utf8.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.5k-confpath.patc=
h
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.5k-nonascii.patc=
h
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.5k-sofix.patch
>>  delete mode 100644 meta/recipes-extended/man/man/
>> man-1.5m2-bug11621.patch
>>  delete mode 100644 meta/recipes-extended/man/man/
>> man-1.5m2-buildroot.patch
>>  delete mode 100644 meta/recipes-extended/man/man/
>> man-1.5m2-no-color-for-printing.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.5m2-sigpipe.patc=
h
>>  delete mode 100644 meta/recipes-extended/man/man/
>> man-1.6e-i18n_whatis.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.6e-mandirs.patch
>>  delete mode 100644 meta/recipes-extended/man/man/
>> man-1.6e-new_sections.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.6e-ro_usr.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.6e-security.patc=
h
>>  delete mode 100644 meta/recipes-extended/man/man/
>> man-1.6e-use_i18n_vars_in_a_std_way.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.6e-whatis2.patch
>>  delete mode 100644 meta/recipes-extended/man/man/
>> man-1.6g-compile-warnings.patch
>>  delete mode 100644 meta/recipes-extended/man/man/
>> man-1.6g-configure.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.6g-parallel.patc=
h
>>  delete mode 100644 meta/recipes-extended/man/man/man-1.6g-whatis3.patch
>>  delete mode 100644 meta/recipes-extended/man/man/man.1.gz
>>  delete mode 100644 meta/recipes-extended/man/man/man.7.gz
>>  delete mode 100644 meta/recipes-extended/man/man/man.conf
>>  delete mode 100644 meta/recipes-extended/man/man/manpath.5.gz
>>  delete mode 100644 meta/recipes-extended/man/man_1.6g.bb
>>
>> diff --git a/meta/recipes-extended/man-db/man-db_2.8.1.bb
>> b/meta/recipes-extended/man-db/man-db_2.8.1.bb
>> new file mode 100644
>> index 00000000000..4e633acd09e
>> --- /dev/null
>> +++ b/meta/recipes-extended/man-db/man-db_2.8.1.bb
>> @@ -0,0 +1,41 @@
>> +SUMMARY =3D "An implementation of the standard Unix documentation syste=
m
>> accessed using the man command"
>> +HOMEPAGE =3D "http://man-db.nongnu.org/"
>> +LICENSE =3D "LGPLv2.1 & GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://docs/COPYING.LIB;md5=3Da
>> 6f89e2100d9b6cdffcea4f398e37343 \
>> +                    file://docs/COPYING;md5=3Deb723b
>> 61539feef013de476e68b5c50a"
>> +
>> +SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz"
>> +SRC_URI[md5sum] =3D "51842978e06686286421f9498d1009b7"
>> +SRC_URI[sha256sum] =3D "a6aec641ca3d9942b054cc0e9c3f0
>> 5cb46a3a992bc0006795755e2fed1357f3e"
>> +
>> +DEPENDS =3D "libpipeline gdbm groff-native less"
>> +
>> +# | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939:
>> undefined reference to `_nl_msg_cat_cntr'
>> +USE_NLS_libc-musl =3D "no"
>> +
>> +inherit gettext pkgconfig autotools
>> +
>> +EXTRA_OECONF =3D "--with-pager=3Dless --disable-cache-owner"
>> +
>> +do_install_append_libc-musl() {
>> +        rm -f ${D}${libdir}/charset.alias
>> +}
>> +
>> +FILES_${PN} +=3D "${libdir}/tmpfiles.d"
>> +
>> +FILES_${PN}-dev +=3D "${libdir}/${PN}/libman.so
>> ${libdir}/${PN}/libmandb.so"
>> +
>> +RPROVIDES_${PN} +=3D " man"
>> +
>> +def compress_pkg(d):
>> +    if "compress_doc" in (d.getVar("INHERIT") or "").split():
>> +         compress =3D d.getVar("DOC_COMPRESS")
>> +         if compress =3D=3D "gz":
>> +             return "gzip"
>> +         elif compress =3D=3D "bz2":
>> +             return "bzip2"
>> +         elif compress =3D=3D "xz":
>> +             return "xz"
>> +    return ""
>> +
>> +RDEPENDS_${PN} +=3D "${@compress_pkg(d)}"
>> diff --git a/meta/recipes-extended/man/man/configure_sed.patch
>> b/meta/recipes-extended/man/man/configure_sed.patch
>> deleted file mode 100644
>> index d49e6831d9a..00000000000
>> --- a/meta/recipes-extended/man/man/configure_sed.patch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -man: replace ',' with '#'
>> -
>> -Sometimes, the parameters of CC/BUILD_CC contains the ',', which
>> -cause the sed command failed, so replace the ',' with '#'
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
>> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ----
>> - configure | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/configure b/configure
>> -index 9f62cf9..9a565ae 100755
>> ---- a/configure
>> -+++ b/configure
>> -@@ -1321,9 +1321,9 @@ do
>> -   echo "Creating $infile from $infile.in"
>> -   sed -e '
>> - s,@version@,$version,
>> --s,@CC@,$CC,
>> -+s#@CC@#$CC#
>> - s,@EXEEXT@,$EXEEXT,
>> --s,@BUILD_CC@,$BUILD_CC,
>> -+s#@BUILD_CC@#$BUILD_CC#
>> - s,@INSTALL@,$INSTALL,
>> - s,@DEFS@,$DEFS,
>> - s,@LIBS@,$LIBS,
>> ---
>> -1.9.1
>> -
>> diff --git a/meta/recipes-extended/man/man/man-1.5g-nonrootbuild.patch
>> b/meta/recipes-extended/man/man/man-1.5g-nonrootbuild.patch
>> deleted file mode 100644
>> index 6f834bd01bd..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5g-nonrootbuild.patch
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> -diff -u -r man-1.5g.old/configure man-1.5g/configure
>> ---- man-1.5g.old/configure     Wed Apr  7 04:16:05 1999
>> -+++ man-1.5g/configure Mon May 15 15:22:44 2000
>> -@@ -791,7 +791,7 @@
>> -     read mode
>> -     if test "$mode" !=3D ""; then man_mode=3D$mode; fi
>> -   fi
>> --  man_install_flags=3D"-m $man_mode -o $man_user -g $man_group"
>> -+  man_install_flags=3D""
>> - fi
>> -
>> - # What sections do we anticipate?
>> diff --git a/meta/recipes-extended/man/man/man-1.5h1-gencat.patch
>> b/meta/recipes-extended/man/man/man-1.5h1-gencat.patch
>> deleted file mode 100644
>> index 044b14c5099..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5h1-gencat.patch
>> +++ /dev/null
>> @@ -1,14 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- gencat/genlib.c    2006-08-02 20:11:44.000000000 +0200
>> -+++ gencat/genlib.c.oden       2008-12-21 19:18:50.000000000 +0100
>> -@@ -47,6 +47,7 @@ up-to-date.  Many thanks.
>> - 01/14/91   4 nazgul   Off by one on number specified entries
>> - */
>> -
>> -+#undef _GNU_SOURCE
>> - #include <stdio.h>
>> - #include <stdlib.h>
>> - #ifdef SYSV
>> diff --git a/meta/recipes-extended/man/man/man-1.5h1-make.patch
>> b/meta/recipes-extended/man/man/man-1.5h1-make.patch
>> deleted file mode 100644
>> index 8631eb2c539..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5h1-make.patch
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- man-1.5g/man/Makefile.in.mike      Fri Apr  9 13:35:54 1999
>> -+++ man-1.5g/man/Makefile.in   Fri Apr  9 13:36:45 1999
>> -@@ -1,8 +1,8 @@
>> - # only executed from a subdir
>> - MAN1 =3D man whatis apropos
>> --MAN5 =3D man.conf
>> -+MAN5 =3D man.config
>> - MAN8 =3D makewhatis
>> --ALL =3D man.1 whatis.1 apropos.1 man.conf.5
>> -+ALL =3D man.1 whatis.1 apropos.1 man.config.5
>> - MAYBE8 =3D makewhatis
>> -
>> - .SUFFIXES: .man .1 .5 .8
>> diff --git a/meta/recipes-extended/man/man/man-1.5i2-initial.patch
>> b/meta/recipes-extended/man/man/man-1.5i2-initial.patch
>> deleted file mode 100644
>> index fe56c0706ca..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5i2-initial.patch
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- man-1.5i2/src/makewhatis.sh.initial        Tue Jul  3 15:38:39 2001
>> -+++ man-1.5i2/src/makewhatis.sh        Tue Jul  3 15:39:39 2001
>> -@@ -81,8 +81,10 @@
>> -       continue;;
>> -     -s) setsections=3D1
>> -       continue;;
>> --    -u) findarg=3D"-newer /var/cache/man/whatis"
>> --      update=3D1
>> -+    -u) if [ -e /var/cache/man/whatis ]; then
>> -+        findarg=3D"-newer /var/cache/man/whatis"
>> -+        update=3D1
>> -+      fi
>> -       continue;;
>> -     -v) verbose=3D1
>> -       continue;;
>> diff --git a/meta/recipes-extended/man/man/man-1.5i2-newline.patch
>> b/meta/recipes-extended/man/man/man-1.5i2-newline.patch
>> deleted file mode 100644
>> index 611df5d2594..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5i2-newline.patch
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- src/man.c  2008-12-21 19:17:31.000000000 +0100
>> -+++ src/man.c.oden     2008-12-21 19:17:38.000000000 +0100
>> -@@ -391,7 +391,7 @@ again:
>> -         beg++;
>> -
>> -      end =3D beg;
>> --     while (*end !=3D ' ' && *end !=3D '\t' && *end !=3D '\n' && *end =
!=3D '\0')
>> -+     while (*end !=3D ' ' && *end !=3D '\t' && *end !=3D '\n' && *end =
!=3D '\0'
>> && (end-buf)<BUFSIZE)
>> -         end++;                /* note that buf is NUL-terminated */
>> -      *end =3D '\0';
>> -
>> diff --git a/meta/recipes-extended/man/man/man-1.5i2-overflow.patch
>> b/meta/recipes-extended/man/man/man-1.5i2-overflow.patch
>> deleted file mode 100644
>> index 52d2881a893..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5i2-overflow.patch
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- man-1.5i2/src/man.c.overflow       Mon Jun 25 00:01:45 2001
>> -+++ man-1.5i2/src/man.c        Mon Jun 25 00:01:45 2001
>> -@@ -381,6 +381,9 @@
>> -         strcat(name, "/");
>> -         strcat(name, beg);
>> -      }
>> -+     /* If this is too long, bad things have already happened. *
>> -+      * we should quit IMMEDIATELY.                            */
>> -+     if(strlen(name)>sizeof(ultname)) _exit(1);
>> -
>> -      goto again;
>> - }
>> diff --git a/meta/recipes-extended/man/man/man-1.5j-i18n.patch
>> b/meta/recipes-extended/man/man/man-1.5j-i18n.patch
>> deleted file mode 100644
>> index 2ae09c0ea49..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5j-i18n.patch
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- man-1.5j/msgs/inst.sh.i18n Wed Apr 25 10:40:50 2001
>> -+++ man-1.5j/msgs/inst.sh      Wed Apr 25 10:41:17 2001
>> -@@ -27,8 +27,7 @@
>> - for j in $M; do
>> -   if [ -f $j ]; then
>> -     i=3D`echo $j | sed -e 's/mess.//; s/.cat//'`
>> --    dest=3D`echo $locdir | sed -e "s/%N/man/; s/%L/$i/"`
>> --    dest=3D${PREFIX}$dest
>> -+    dest=3D${PREFIX}/`echo $locdir | sed -e "s/%N/man/; s/%L/$i/"`
>> -     echo "mkdir -p `dirname $dest`"
>> -     mkdir -p `dirname $dest`;
>> -     echo "install -c -m 644 $j $dest"
>> diff --git a/meta/recipes-extended/man/man/man-1.5j-nocache.patch
>> b/meta/recipes-extended/man/man/man-1.5j-nocache.patch
>> deleted file mode 100644
>> index 751dddd53b5..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5j-nocache.patch
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- man-1.5j/src/man.conf.in.nocache   Thu Nov 22 15:07:12 2001
>> -+++ man-1.5j/src/man.conf.in   Thu Nov 22 15:07:12 2001
>> -@@ -81,6 +81,9 @@
>> - #
>> - #NOCACHE
>> - #
>> -+# NOCACHE keeps man from creating cache pages
>> -+NOCACHE
>> -+#
>> - # Useful paths - note that COL should not be defined when
>> - # NROFF is defined as "groff -Tascii" or "groff -Tlatin1";
>> - # not only is it superfluous, but it actually damages the output.
>> diff --git a/meta/recipes-extended/man/man/man-1.5j-utf8.patch
>> b/meta/recipes-extended/man/man/man-1.5j-utf8.patch
>> deleted file mode 100644
>> index 33d3e4c9745..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5j-utf8.patch
>> +++ /dev/null
>> @@ -1,61 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- man-1.5j/configure.utf8    Thu Nov 22 15:02:35 2001
>> -+++ man-1.5j/configure Thu Nov 22 15:03:15 2001
>> -@@ -408,9 +408,9 @@
>> -   Fgawk=3D/bin/gawk
>> -   Fawk=3D/bin/gawk
>> -   Fmawk=3Dmissing
>> --  troff=3D""
>> --  nroff=3D""
>> --  jnroff=3D""
>> -+  troff=3D/usr/bin/troff
>> -+  nroff=3D/usr/bin/nroff
>> -+  jnroff=3D/usr/bin/nroff
>> -   eqn=3D""
>> -   neqn=3D""
>> -   jneqn=3D""
>> -@@ -453,6 +453,8 @@
>> -     done
>> -   done
>> -   Fgroff=3D/usr/bin/groff
>> -+  Fnroff=3D/usr/bin/nroff
>> -+  Fjnroff=3D/usr/bin/nroff
>> -   Fgeqn=3D/usr/bin/geqn
>> -   Fgtbl=3D/usr/bin/gtbl
>> -   Fcol=3D/usr/bin/col
>> -@@ -485,25 +487,25 @@
>> -   then
>> -     if test $Fnroff =3D "missing"
>> -     then
>> --      nroff=3D"nroff -Tlatin1 -mandoc"
>> -+      nroff=3D"nroff -Tutf8 -mandoc"
>> -     else
>> --      nroff=3D"$Fnroff -Tlatin1 -mandoc"
>> -+      nroff=3D"$Fnroff -Tutf8 -mandoc"
>> -     fi
>> -     troff=3D"troff -mandoc"
>> -     echo "Warning: could not find groff"
>> -   else
>> -     if test $Fnroff =3D "missing"
>> -     then
>> --      nroff=3D"$Fgroff -Tlatin1 -mandoc"
>> -+      nroff=3D"$Fgroff -Tutf8 -mandoc"
>> -     else
>> --      nroff=3D"$Fnroff -Tlatin1 -mandoc"
>> -+      nroff=3D"$Fnroff -Tutf8 -mandoc"
>> -     fi
>> -     troff=3D"$Fgroff -Tps -mandoc"
>> --    jnroff=3D"$Fgroff -Tnippon -mandocj"
>> -+    jnroff=3D"$Fjnroff -Tutf8 -mandocj"
>> -   fi
>> -   eqn=3D"$Fgeqn -Tps"
>> --  neqn=3D"$Fgeqn -Tlatin1"
>> --  jneqn=3D"$Fgeqn -Tnippon"
>> -+  neqn=3D"$Fgeqn -Tutf8"
>> -+  jneqn=3D"$Fgeqn -Tutf8"
>> -   tbl=3D"$Fgtbl"
>> -   col=3D"$Fcol"
>> -   vgrind=3D"$Fvgrind"
>> diff --git a/meta/recipes-extended/man/man/man-1.5k-confpath.patch
>> b/meta/recipes-extended/man/man/man-1.5k-confpath.patch
>> deleted file mode 100644
>> index b5746c2df80..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5k-confpath.patch
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- configure  2006-05-01 19:56:14.000000000 +0200
>> -+++ configure.oden     2008-12-21 19:16:50.000000000 +0100
>> -@@ -198,7 +198,7 @@
>> -     confdir=3D"${confprefix}/share/misc"
>> -   fi
>> - fi
>> --conffilename=3D"man.conf"
>> -+conffilename=3D"man.config"
>> -
>> - if test "$RANDOM" =3D "$RANDOM"; then
>> -   # Plain old Bourne shell.
>> diff --git a/meta/recipes-extended/man/man/man-1.5k-nonascii.patch
>> b/meta/recipes-extended/man/man/man-1.5k-nonascii.patch
>> deleted file mode 100644
>> index d662d9b6a70..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5k-nonascii.patch
>> +++ /dev/null
>> @@ -1,18 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- ./src/apropos.sh.nonascii  2001-11-23 00:30:42.000000000 +0100
>> -+++ ./src/apropos.sh   2002-08-13 15:44:53.000000000 +0200
>> -@@ -18,9 +18,9 @@
>> -
>> - # When man pages in your favorite locale look to grep like binary file=
s
>> - # (and you use GNU grep) you may want to add the 'a' option to
>> *grepopt1.
>> --aproposgrepopt1=3D'i'
>> -+aproposgrepopt1=3D'ia'
>> - aproposgrepopt2=3D''
>> --whatisgrepopt1=3D'iw'
>> -+whatisgrepopt1=3D'iwa'
>> - whatisgrepopt2=3D'^'
>> - grepopt1=3D$%apropos_or_whatis%grepopt1
>> - grepopt2=3D$%apropos_or_whatis%grepopt2
>> diff --git a/meta/recipes-extended/man/man/man-1.5k-sofix.patch
>> b/meta/recipes-extended/man/man/man-1.5k-sofix.patch
>> deleted file mode 100644
>> index 50b925288ec..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5k-sofix.patch
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- man-1.5j/src/man.c.sofix   Thu Nov 22 14:51:44 2001
>> -+++ man-1.5j/src/man.c Thu Nov 22 14:52:44 2001
>> -@@ -300,7 +300,7 @@
>> -
>> -      if (strlen(name0) >=3D sizeof(ultname))
>> -            return name0;
>> --     strcpy(ultname, name0);
>> -+     strncpy(ultname, name0, BUFSIZE-32);
>> -      name =3D ultname;
>> -
>> - again:
>> -@@ -332,7 +332,7 @@
>> -          * .so files - we could glob for all possible extensions,
>> -          * for now: only try .gz
>> -          */
>> --        else if (fp =3D=3D NULL && get_expander(".gz") &&
>> -+        if (fp =3D=3D NULL && get_expander(".gz") &&
>> -                  strlen(name)+strlen(".gz") < BUFSIZE) {
>> -              strcat(name, ".gz");
>> -              fp =3D fopen (name, "r");
>> diff --git a/meta/recipes-extended/man/man/man-1.5m2-bug11621.patch
>> b/meta/recipes-extended/man/man/man-1.5m2-bug11621.patch
>> deleted file mode 100644
>> index 051299906b8..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5m2-bug11621.patch
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- ./configure.ad     2003-12-11 19:17:10.000000000 +0100
>> -+++ ./configure        2003-12-11 19:17:27.000000000 +0100
>> -@@ -26,7 +26,7 @@
>> - # (Indeed, -r may cause the terminal to get into funny states.
>> - # Very inconvenient. For viewing pages in strange locales, set LC_*.)
>> - #
>> --DEFAULTLESSOPT=3D"-is"
>> -+DEFAULTLESSOPT=3D"-isr"
>> - #
>> - # Note that not creating any cat directories (/var/cache/man or so)
>> - # and not making man suid or sgid is recommended.
>> diff --git a/meta/recipes-extended/man/man/man-1.5m2-buildroot.patch
>> b/meta/recipes-extended/man/man/man-1.5m2-buildroot.patch
>> deleted file mode 100644
>> index bc97f56b9af..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5m2-buildroot.patch
>> +++ /dev/null
>> @@ -1,52 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- ./configure.less   2003-12-11 19:18:15.000000000 +0100
>> -+++ ./configure        2003-12-11 19:20:03.000000000 +0100
>> -@@ -401,18 +401,13 @@
>> -
>> - if test "$ans" =3D "false"
>> - then
>> --  for i in more less cmp cat awk gawk mawk
>> --  do
>> --    eval F$i=3D"missing"
>> --    for j in $DEFPATH
>> --    do
>> --      if test -f $j/$i
>> --      then
>> --      eval F$i=3D$j/$i
>> --      break
>> --      fi
>> --    done
>> --  done
>> -+  Fmore=3D/bin/more
>> -+  Fless=3D/usr/bin/less
>> -+  Fcmp=3D/usr/bin/cmp
>> -+  Fcat=3D/bin/cat
>> -+  Fgawk=3D/bin/gawk
>> -+  Fawk=3D/bin/gawk
>> -+  Fmawk=3Dmissing
>> -   troff=3D""
>> -   nroff=3D""
>> -   jnroff=3D""
>> -@@ -457,6 +452,19 @@
>> -       fi
>> -     done
>> -   done
>> -+  Fgroff=3D/usr/bin/groff
>> -+  Fgeqn=3D/usr/bin/geqn
>> -+  Fgtbl=3D/usr/bin/gtbl
>> -+  Fcol=3D/usr/bin/col
>> -+  Fgrefer=3D/usr/bin/grefer
>> -+  Fgpic=3D/usr/bin/gpic
>> -+  Fmore=3D/bin/more
>> -+  Fless=3D/usr/bin/less
>> -+  Fcmp=3D/usr/bin/cmp
>> -+  Fcat=3D/bin/cat
>> -+  Fgawk=3D/bin/gawk
>> -+
>> -+
>> -   for i in eqn tbl refer pic
>> -   do
>> -     if test `eval echo \\$Fg$i` =3D "missing"
>> diff --git a/meta/recipes-extended/man/man/man-1.5m2-no-color-for-printi=
ng.patch
>> b/meta/recipes-extended/man/man/man-1.5m2-no-color-for-printing.patch
>> deleted file mode 100644
>> index c85ff1d8c72..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5m2-no-color-for-printing.patc=
h
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- man-1.5m2/configure.color  2006-09-16 18:27:37.000000000 +0200
>> -+++ man-1.5m2/configure        2006-09-16 18:28:44.000000000 +0200
>> -@@ -539,6 +539,8 @@
>> -     troff=3D"$troff -c"
>> -     nroff=3D"$nroff -c"
>> -     jnroff=3D"$jnroff -c"
>> -+else
>> -+    troff=3D"$troff -c"
>> - fi
>> -
>> - if [ x$default =3D x ]; then
>> diff --git a/meta/recipes-extended/man/man/man-1.5m2-sigpipe.patch
>> b/meta/recipes-extended/man/man/man-1.5m2-sigpipe.patch
>> deleted file mode 100644
>> index 8af78eab7b1..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.5m2-sigpipe.patch
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- man-1.5m2/src/util.c_sigpipe       2006-12-09 13:43:21.000000000
>> +0100
>> -+++ man-1.5m2/src/util.c       2006-12-09 13:53:13.000000000 +0100
>> -@@ -116,11 +116,14 @@
>> - static int
>> - system1 (const char *command) {
>> -       void (*prev_handler)(int) =3D signal (SIGINT,catch_int);
>> -+      signal (SIGPIPE,SIG_IGN);
>> -       int ret =3D system(command);
>> -
>> -       /* child terminated with signal? */
>> -       if (WIFSIGNALED(ret) &&
>> --          (WTERMSIG(ret) =3D=3D SIGINT || WTERMSIG(ret) =3D=3D SIGQUIT=
))
>> -+          (WTERMSIG(ret) =3D=3D SIGINT ||
>> -+               WTERMSIG(ret) =3D=3D SIGPIPE ||
>> -+               WTERMSIG(ret) =3D=3D SIGQUIT))
>> -               exit(1);
>> -
>> -       /* or we caught an interrupt? */
>> -@@ -128,6 +131,7 @@
>> -               exit(1);
>> -
>> -       signal(SIGINT,prev_handler);
>> -+      signal(SIGPIPE,SIG_DFL);
>> -       return ret;
>> - }
>> -
>> diff --git a/meta/recipes-extended/man/man/man-1.6e-i18n_whatis.patch
>> b/meta/recipes-extended/man/man/man-1.6e-i18n_whatis.patch
>> deleted file mode 100644
>> index e321325d63f..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.6e-i18n_whatis.patch
>> +++ /dev/null
>> @@ -1,145 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> -diff -Naur man-1.6e.orig/src/apropos.sh man-1.6e/src/apropos.sh
>> ---- man-1.6e.orig/src/apropos.sh       2007-05-18 13:49:31.000000000
>> -0300
>> -+++ man-1.6e/src/apropos.sh    2007-05-18 14:24:33.000000000 -0300
>> -@@ -60,16 +60,56 @@
>> -     esac
>> - done
>> -
>> -+# list of languages to look for
>> -+LANG_LIST=3D`echo $LANGUAGE:$LC_ALL:$LC_MESSAGES:$LANG | tr ':' ' '`
>> -+DIR_LIST=3D""
>> -+for d in /var/cache/man $manpath /usr/lib
>> -+do
>> -+    for l in $LANG_LIST
>> -+    do
>> -+        if [ -d $d/$l ]
>> -+        then
>> -+            # check that the path is not already in the list
>> -+            if ! echo "$DIR_LIST" | grep " $d/$l\b" > /dev/null
>> -+            then
>> -+                DIR_LIST=3D"$DIR_LIST $d/$l"
>> -+            fi
>> -+        fi
>> -+    done
>> -+    DIR_LIST=3D"$DIR_LIST $d"
>> -+    # check that the path is not already in the list
>> -+    if ! echo "$DIR_LIST" | grep " $d\b" > /dev/null
>> -+    then
>> -+        DIR_LIST=3D"$DIR_LIST $d/$l"
>> -+    fi
>> -+done
>> -+
>> - while [ "$1" !=3D "" ]
>> - do
>> -     found=3D0
>> --    for d in /var/cache/man $manpath /usr/lib
>> -+    # in order not to display lines in more than one language for
>> -+    # a same man page; we check that a given man page name
>> -+    # hasn't already been displayed
>> -+    BAZ=3D""
>> -+    for d in $DIR_LIST
>> -     do
>> -         if [ -f $d/whatis ]
>> -         then
>> --            if grep -"$grepopt1" "$grepopt2""$1" $d/whatis
>> -+            if FOO=3D`grep -"$grepopt1" "$grepopt2""$1" $d/whatis`
>> -             then
>> --                found=3D1
>> -+                # the LC_ALL=3DC is needed in case the text is
>> -+                # in a different encoding than the locale
>> -+                BAR=3D`echo -e "$FOO" | LC_ALL=3DC sed 's/ - .*$//' | =
tr '
>> []' '_' | sort -u`
>> -+                for i in $BAR
>> -+                do
>> -+                    if ! echo "$BAZ" | grep "$i" > /dev/null
>> -+                    then
>> -+                        BAZ=3D"$BAZ $i"
>> -+                        i=3D"^`echo $i | sed 's:_\+:\\\(\[_
>> \]\\\|\\\[\\\|\\\]\\\)\\\+:g'`"
>> -+                        echo -e "$FOO" | grep "$i"
>> -+                        found=3D1
>> -+                    fi
>> -+                done
>> - # Some people are satisfied with a single occurrence
>> - # But it is better to give all
>> - #               break
>> -diff -Naur man-1.6e.orig/src/makewhatis.sh man-1.6e/src/makewhatis.sh
>> ---- man-1.6e.orig/src/makewhatis.sh    2007-05-18 13:49:31.000000000
>> -0300
>> -+++ man-1.6e/src/makewhatis.sh 2007-05-18 13:50:07.000000000 -0300
>> -@@ -41,12 +41,32 @@
>> -
>> - program=3D`basename $0`
>> -
>> -+# this allows to define language specific values fro NAME, DESCRIPTION
>> -+# if not defined, using those default values
>> -+if [ -z "$MAN_NAME" ]
>> -+then
>> -+      MAN_NAME=3D"=D0=98=D0=9C=D0=95|NOM|JM=C3=89NO|NAVN|=CE=9F=CE=9D=
=CE=9F=CE=9C=CE=91|NOMBRE|NIME|IZENA|NIMI|IME|\
>> -+N=C3=89V|NOME|=E5=90=8D=E5=89=8D|=EC=9D=B4=EB=A6=84|NAAM|NAZWA|NUME|=
=D0=98=D0=9C=D0=AF|MENO|=D0=9D=D0=90=D0=97=D0=92=D0=90|=E5=90=8D=E7=A7=B0|=
=E5=90=8D=E7=A8=B1"
>> -+fi
>> -+if [ -z "$MAN_DESCRIPTION" ]
>> -+then
>> -+      MAN_DESCRIPTION=3D"=D0=9E=D0=9F=D0=98=D0=A1=D0=90=D0=9D=D0=98=D0=
=95|DESCRIPCI=C3=93|POPIS|BESKRIVELSE|BESCH
>> REIBUNG|\
>> -+=CE=A0=CE=95=CE=A1=CE=99=CE=93=CE=A1=CE=91=CE=A6=CE=97|DESCRIPCI=C3=93=
N|KIRJELDUS|AZALPENA|KUVAUS|OPIS|
>> LE=C3=8DR=C3=81S|DESCRIZIONE|\
>> -+=E8=AA=AC=E6=98=8E|=EC=84=A4=EB=AA=85|BESCHRIJVING|DESCRI=C3=87=C3=83O=
|DESCRIERE|=D0=9E=D0=9F=D0=98=D0=A1|=E6=8F=8F=E8=BF=B0"
>> -+fi
>> -+# make them into awk regexp
>> -+MAN_NAME=3D"^(${MAN_NAME})";
>> -+MAN_DESCRIPTION=3D"^(${MAN_DESCRIPTION})";
>> -+
>> - # In case both /usr/man and /usr/share/man exist, the former is local
>> - # and should be first.
>> - # It is a bug to add /var/cache/man to DEFCATPATH.
>> - dm=3D
>> - for d in /usr/share/man /usr/man /usr/X11R6/man /usr/local/man
>> - do
>> -+    if [ -n "$LANG" -a -d "$d/$LANG" ]; then
>> -+      if [ x$dm =3D x ]; then dm=3D"$d/$LANG"; else dm=3D$dm:"$d/$LANG=
"; fi
>> -+    fi
>> -     if [ -d $d ]; then
>> -       if [ x$dm =3D x ]; then dm=3D$d; else dm=3D$dm:$d; fi
>> -     fi
>> -@@ -55,6 +75,9 @@
>> - dc=3D
>> - for d in /var/cache/man /usr/share/man/preformat /usr/man/preformat
>> /usr/share/man /usr/man
>> - do
>> -+    if [ -n "$LANG" -a -d "$d/$LANG" ]; then
>> -+      if [ x$dc =3D x ]; then dm=3D"$d/$LANG"; else dm=3D$dc:"$d/$LANG=
"; fi
>> -+    fi
>> -     if [ -d $d ]; then
>> -       if [ x$dc =3D x ]; then dc=3D$d; else dc=3D$dc:$d; fi
>> -     fi
>> -@@ -194,7 +217,7 @@
>> -           section=3D$i
>> -           curdir=3D$mandir/${pages}$i
>> -           export section verbose curdir
>> --          find $mandir/${pages}$i/. -name '*' $findarg0 $findarg -prin=
t
>> | $AWK '
>> -+          find $mandir/${pages}$i/. -name '*' $findarg0 $findarg -prin=
t
>> | LC_ALL=3DC $AWK -v MAN_NAME=3D"$MAN_NAME" -v MAN_DESCRIPTION=3D"$MAN_D=
ESCRIPTION"
>> '
>> -
>> -           function readline() {
>> -             if (use_zcat || use_bzcat) {
>> -@@ -261,13 +284,7 @@
>> -               gsub(/.\b/, "");
>> -               if (($1 ~ /^\.[Ss][Hh]/ &&
>> -                 ($2 ~ /[Nn][Aa][Mm][Ee]/ ||
>> --                 $2 ~ /^JM=C3=89NO/ || $2 ~ /^NAVN/ || $2 ~ /^NUME/ ||
>> --                 $2 ~ /^BEZEICHNUNG/ || $2 ~ /^NOMBRE/ ||
>> --                 $2 ~ /^NIMI/ || $2 ~ /^NOM/ || $2 ~ /^IME/ ||
>> --                 $2 ~ /^N[=C3=89E]V/ || $2 ~ /^NAMA/ || $2 ~ /^=CC=BE=
=EF=BF=BD=C2=B0/ ||
>> --                 $2 ~ /^=CC=BE=EF=BF=BD=C3=8E/ || $2 ~ /^=EF=BF=BD=CC=
=B8=C2=A7/ || $2 ~ /^NAZWA/ ||
>> --                 $2 ~ /^=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=C3=A5/ || $2 ~ /^=EF=BF=BD=EF=BF=BD=EF=BF=BD=C3=86/ || $=
2 ~ /^=C2=A6W=EF=BF=BD=C3=99/ ||
>> --                 $2 ~ /^NOME/ || $2 ~ /^NAAM/ || $2 ~ /^=EF=BF=BD=EF=
=BF=BD=C3=85/)) ||
>> -+                 $2 ~ MAN_NAME )) ||
>> -                 (pages =3D=3D "cat" && $1 ~ /^NAME/)) {
>> -                   if (!insh) {
>> -                     insh =3D 1;
>> -@@ -278,6 +295,7 @@
>> -                 if ($1 ~ /^\.[Ss][HhYS]/ ||
>> -                   (pages =3D=3D "cat" &&
>> -                   ($1 ~ /^S[yYeE]/ || $1 ~ /^DESCRIPTION/ ||
>> -+                   $1 ~ MAN_DESCRIPTION ||
>> -                    $1 ~ /^COMMAND/ || $1 ~ /^OVERVIEW/ ||
>> -                    $1 ~ /^STRUCTURES/ || $1 ~ /^INTRODUCTION/ ||
>> -                    $0 ~ /^[^ ]/))) {
>> diff --git a/meta/recipes-extended/man/man/man-1.6e-mandirs.patch
>> b/meta/recipes-extended/man/man/man-1.6e-mandirs.patch
>> deleted file mode 100644
>> index b240064c980..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.6e-mandirs.patch
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- man-1.6e.orig/src/man.conf.in      2005-08-20 20:26:06.000000000
>> -0300
>> -+++ man-1.6e/src/man.conf.in   2007-05-18 10:30:29.000000000 -0300
>> -@@ -36,11 +36,12 @@
>> - #
>> - # Every automatically generated MANPATH includes these fields
>> - #
>> --MANPATH       /usr/man
>> - MANPATH       /usr/share/man
>> -+MANPATH       /usr/X11R6/man
>> - MANPATH       /usr/local/man
>> - MANPATH       /usr/local/share/man
>> --MANPATH       /usr/X11R6/man
>> -+MANPATH       /usr/kerberos/man
>> -+MANPATH       /usr/man
>> - #
>> - # Uncomment if you want to include one of these by default
>> - #
>> -@@ -67,6 +68,9 @@
>> - MANPATH_MAP   /usr/X11R6/bin          /usr/X11R6/man
>> - MANPATH_MAP   /usr/bin/X11            /usr/X11R6/man
>> - MANPATH_MAP   /usr/bin/mh             /usr/share/man
>> -+MANPATH_MAP   /usr/kerberos/bin               /usr/kerberos/man
>> -+MANPATH_MAP   /usr/kerberos/sbin              /usr/kerberos/man
>> -+
>> - #
>> - # NOAUTOPATH keeps man from automatically adding directories that look
>> like
>> - # manual page directories to the path.
>> diff --git a/meta/recipes-extended/man/man/man-1.6e-new_sections.patch
>> b/meta/recipes-extended/man/man/man-1.6e-new_sections.patch
>> deleted file mode 100644
>> index fb9773c646e..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.6e-new_sections.patch
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> ---- man-1.6e.orig/configure    2006-05-01 14:56:14.000000000 -0300
>> -+++ man-1.6e/configure 2007-05-18 14:35:43.000000000 -0300
>> -@@ -960,7 +960,7 @@
>> -
>> - # What sections do we anticipate?
>> -
>> --tmpsections=3D"1 1p 8 2 3 3p 4 5 6 7 9 0p tcl n l p o"
>> -+tmpsections=3D"1 1p 8 2 3 3p 3pm 4 5 6 7 9 0p tcl n l p o"
>> -
>> - if [ x$default =3D x ]; then
>> -   echo ""
>> diff --git a/meta/recipes-extended/man/man/man-1.6e-ro_usr.patch
>> b/meta/recipes-extended/man/man/man-1.6e-ro_usr.patch
>> deleted file mode 100644
>> index 1d1cb0c724c..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.6e-ro_usr.patch
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> -Index: man-1.6f/src/makewhatis.sh
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- man-1.6f.orig/src/makewhatis.sh    2010-12-29 13:42:34.000000000
>> -0800
>> -+++ man-1.6f/src/makewhatis.sh 2010-12-29 13:42:35.667428347 -0800
>> -@@ -124,7 +124,7 @@
>> -       continue;;
>> -     -s) setsections=3D1
>> -       continue;;
>> --    -u) findarg=3D"-ctime 0"
>> -+    -u) findarg=3D"-newer /var/cache/man/whatis"
>> -       update=3D1
>> -       continue;;
>> -     -v) verbose=3D1
>> -@@ -165,14 +165,7 @@
>> - # first truncate all the whatis files that will be created new,
>> - # then only update - we might visit the same directory twice
>> - if [ x$update =3D x ]; then
>> --   for pages in man cat
>> --   do
>> --      eval path=3D"\$$pages"path
>> --      for mandir in $path
>> --      do
>> --       cp /dev/null $mandir/whatis
>> --      done
>> --   done
>> -+   cp /dev/null /var/cache/man/whatis
>> - fi
>> -
>> - for pages in man cat
>> diff --git a/meta/recipes-extended/man/man/man-1.6e-security.patch
>> b/meta/recipes-extended/man/man/man-1.6e-security.patch
>> deleted file mode 100644
>> index 312a882f063..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.6e-security.patch
>> +++ /dev/null
>> @@ -1,62 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> -diff -Naur man-1.6e.orig/src/makewhatis.sh man-1.6e/src/makewhatis.sh
>> ---- man-1.6e.orig/src/makewhatis.sh    2006-07-19 01:58:08.000000000
>> -0300
>> -+++ man-1.6e/src/makewhatis.sh 2007-05-18 10:18:31.000000000 -0300
>> -@@ -45,7 +45,7 @@
>> - # and should be first.
>> - # It is a bug to add /var/cache/man to DEFCATPATH.
>> - dm=3D
>> --for d in /usr/man /usr/share/man /usr/X11R6/man /usr/local/man
>> -+for d in /usr/share/man /usr/man /usr/X11R6/man /usr/local/man
>> - do
>> -     if [ -d $d ]; then
>> -       if [ x$dm =3D x ]; then dm=3D$d; else dm=3D$dm:$d; fi
>> -@@ -53,7 +53,7 @@
>> - done
>> - DEFMANPATH=3D$dm
>> - dc=3D
>> --for d in /usr/man/preformat /usr/man /usr/share/man/preformat
>> /usr/share/man
>> -+for d in /var/cache/man /usr/share/man/preformat /usr/man/preformat
>> /usr/share/man /usr/man
>> - do
>> -     if [ -d $d ]; then
>> -       if [ x$dc =3D x ]; then dc=3D$d; else dc=3D$dc:$d; fi
>> -@@ -76,12 +76,12 @@
>> - # We try here to be careful (and avoid preconstructed symlinks)
>> - # in case makewhatis is run as root, by creating a subdirectory of /tm=
p.
>> -
>> --TMPFILEDIR=3D/tmp/whatis.tmp.dir.$$
>> --rm -rf $TMPFILEDIR
>> --if ! mkdir -m 0700 $TMPFILEDIR; then
>> --    echo Could not create $TMPFILEDIR
>> --    exit 1;
>> -+TMPFILEDIR=3D`mktemp -d /tmp/makewhatisXXXXXX`
>> -+if [ $? -ne 0 ]; then
>> -+   echo "$0: Can't create temp file, exiting..."
>> -+   exit 1
>> - fi
>> -+chmod 0700 $TMPFILEDIR
>> - TMPFILE=3D$TMPFILEDIR/w
>> -
>> - # make sure TMPFILEDIR is deleted if program is killed or terminates
>> -diff -Naur man-1.6e.orig/src/man.c man-1.6e/src/man.c
>> ---- man-1.6e.orig/src/man.c    2006-05-01 17:34:22.000000000 -0300
>> -+++ man-1.6e/src/man.c 2007-05-18 10:11:33.000000000 -0300
>> -@@ -1234,7 +1234,6 @@
>> - #endif
>> -
>> -
>> --#if 0
>> -      {
>> -       /* There are no known cases of buffer overflow caused by
>> -          excessively long environment variables. In case you find one,
>> -@@ -1257,7 +1256,6 @@
>> -          MAN_ICONV_PATH, MAN_ICONV_OPT, MAN_ICONV_INPUT_CHARSET,
>> -          MAN_ICONV_OUTPUT_CHARSET, NLSPATH, PATH */
>> -      }
>> --#endif
>> -
>> -
>> - #ifndef __FreeBSD__
>> diff --git a/meta/recipes-extended/man/man/man-1.6e-use_i18n_vars_in_a_s=
td_way.patch
>> b/meta/recipes-extended/man/man/man-1.6e-use_i18n_vars_in_a_std_way.patc=
h
>> deleted file mode 100644
>> index 568f742100c..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.6e-use_i18n_vars_in_a_
>> std_way.patch
>> +++ /dev/null
>> @@ -1,160 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> -diff -Naur man-1.6e.orig/catopen/catopen.c man-1.6e/catopen/catopen.c
>> ---- man-1.6e.orig/catopen/catopen.c    2005-08-20 20:26:06.000000000
>> -0300
>> -+++ man-1.6e/catopen/catopen.c 2007-05-18 11:31:05.000000000 -0300
>> -@@ -9,22 +9,63 @@
>> - extern char *index (const char *, int);         /* not always in
>> <string.h> */
>> - extern char *my_malloc(int);  /* in util.c */
>> -
>> -+/* if the program has sgid/suid privileges then getenv doesn't return
>> -+ * NLSPATH; so we set here a good default value.
>> -+ */
>> - #ifndef DEFAULT_NLSPATH
>> - # if __GLIBC__ >=3D 2
>> --#  define DEFAULT_NLSPATH "/usr/share/locale/%L/%N"
>> -+#  define DEFAULT_NLSPATH "/usr/share/locale/%L/%N:/usr/
>> share/locale/%l_%t/%N:/usr/share/locale/%l/%N"
>> - # else
>> - #  define DEFAULT_NLSPATH "/usr/lib/locale/%N/%L"
>> - # endif
>> - #endif
>> -
>> --static nl_catd my_catopenpath(char *name, char *path);
>> -+static nl_catd my_catopenpath(char *name, char *path, char *lang);
>> -
>> - static                                /* this source included in
>> gripes.c */
>> - nl_catd
>> - my_catopen(char *name, int oflag) {
>> --  nl_catd fd;
>> -+  nl_catd fd =3D (nl_catd) -1;
>> -+
>> -+  /* using first the my_catopenpath, which looks with LANGUAGE
>> -+   * and only if it fails ressort to catopen, it gives better i18n
>> -+   */
>> -+  {
>> -+    char *nlspath, *lang, *s;
>> -
>> --  fd =3D catopen(name, oflag);
>> -+    /*
>> -+     * "If NLSPATH does not exist in the environment, or if a
>> -+     * message catalog cannot be opened in any of the paths specified
>> -+     * by NLSPATH, then an implementation defined default path is used=
"
>> -+     */
>> -+    nlspath =3D getenv("NLSPATH");
>> -+    if (!nlspath)
>> -+      nlspath =3D DEFAULT_NLSPATH;
>> -+
>> -+    lang =3D getenv("LANGUAGE");
>> -+    if (!lang)
>> -+      lang =3D getenv("LC_ALL");
>> -+    if (!lang)
>> -+      lang =3D getenv("LC_MESSAGES");
>> -+    if (!lang)
>> -+      lang =3D getenv("LANG");
>> -+    if (!lang)
>> -+      lang =3D "";
>> -+
>> -+    while(*lang && (fd =3D=3D (nl_catd) -1)) {
>> -+      s =3D index(lang, ':');
>> -+      if (s) *s =3D 0;
>> -+        fd =3D my_catopenpath(name, nlspath, lang);
>> -+      if (s) lang=3Ds+1;
>> -+      else lang =3D "";
>> -+    }
>> -+    if (fd =3D=3D (nl_catd) -1)
>> -+      fd =3D my_catopenpath(name, nlspath, "en");
>> -+  }
>> -+
>> -+  /* still not found, use the system catopen */
>> -+  if (fd =3D=3D (nl_catd) -1)
>> -+    fd =3D catopen(name, oflag);
>> -
>> -   if (fd =3D=3D (nl_catd) -1 && oflag) {
>> -     oflag =3D 0;
>> -@@ -32,8 +73,6 @@
>> -   }
>> -
>> -   if (fd =3D=3D (nl_catd) -1) {
>> --    char *nlspath;
>> --
>> -     /* The libc catopen fails - let us see if we can do better */
>> -     /* The quotes below are from X/Open, XPG 1987, Vol. 3. */
>> -
>> -@@ -58,17 +97,6 @@
>> - #endif
>> -     }
>> -
>> --    /*
>> --     * "If NLSPATH does not exist in the environment, or if a
>> --     * message catalog cannot be opened in any of the paths specified
>> --     * by NLSPATH, then an implementation defined default path is used=
"
>> --     */
>> --
>> --    nlspath =3D getenv("NLSPATH");
>> --    if (nlspath)
>> --      fd =3D my_catopenpath(name, nlspath);
>> --    if (fd =3D=3D (nl_catd) -1)
>> --      fd =3D my_catopenpath(name, DEFAULT_NLSPATH);
>> -   }
>> -   return fd;
>> - }
>> -@@ -90,15 +118,13 @@
>> -  *
>> -  */
>> - static nl_catd
>> --my_catopenpath(char *name, char *nlspath) {
>> --  int fd;
>> -+my_catopenpath(char *name, char *nlspath, char *lang) {
>> -   nl_catd cfd =3D (nl_catd) -1;
>> --  char *path0, *path, *s, *file, *lang, *lang_l, *lang_t, *lang_c;
>> -+  char *path0, *path, *s, *file, *lang_l, *lang_t, *lang_c;
>> -   int langsz, namesz, sz, lang_l_sz, lang_t_sz, lang_c_sz;
>> -
>> -   namesz =3D strlen(name);
>> -
>> --  lang =3D getenv("LANG");
>> -   if (!lang)
>> -     lang =3D "";
>> -   langsz =3D strlen(lang);
>> -@@ -194,14 +220,9 @@
>> -       path =3D s+1;
>> -     } else
>> -       path =3D 0;
>> --    fd =3D open(file, O_RDONLY);
>> --    if (fd !=3D -1) {
>> --      /* we found the right catalog - but we don't know the
>> --       type of nl_catd, so close it again and ask libc */
>> --      close(fd);
>> --      cfd =3D catopen(file, 0);
>> --      break;
>> --    }
>> -+      cfd =3D catopen(file, 0);
>> -+      if (cfd !=3D (nl_catd) -1)
>> -+                      break;
>> -   }
>> -
>> -   free(path0);
>> -diff -Naur man-1.6e.orig/src/manpath.c man-1.6e/src/manpath.c
>> ---- man-1.6e.orig/src/manpath.c        2006-08-03 18:18:33.000000000
>> -0300
>> -+++ man-1.6e/src/manpath.c     2007-05-18 11:02:48.000000000 -0300
>> -@@ -282,13 +282,14 @@
>> -               /* We cannot use "lang =3D setlocale(LC_MESSAGES, NULL)"=
 or
>> so:
>> -                  the return value of setlocale is an opaque string. */
>> -               /* POSIX prescribes the order: LC_ALL, LC_MESSAGES, LANG
>> */
>> --              if((lang =3D getenv("LC_ALL")) !=3D NULL)
>> -+              /* LANGUAGE is GNU/Linux and overrules all */
>> -+              if((lang =3D getenv("LANGUAGE")) !=3D NULL)
>> -                       split2(dir, lang, add_to_mandirlist_x, perrs);
>> --              if((lang =3D getenv("LC_MESSAGES")) !=3D NULL)
>> -+              else if((lang =3D getenv("LC_ALL")) !=3D NULL)
>> -                       split2(dir, lang, add_to_mandirlist_x, perrs);
>> --              if((lang =3D getenv("LANG")) !=3D NULL)
>> -+              else if((lang =3D getenv("LC_MESSAGES")) !=3D NULL)
>> -                       split2(dir, lang, add_to_mandirlist_x, perrs);
>> --              if((lang =3D getenv("LANGUAGE")) !=3D NULL)
>> -+              else if((lang =3D getenv("LANG")) !=3D NULL)
>> -                       split2(dir, lang, add_to_mandirlist_x, perrs);
>> -               add_to_mandirlist_x(dir, 0, perrs);
>> -       }
>> diff --git a/meta/recipes-extended/man/man/man-1.6e-whatis2.patch
>> b/meta/recipes-extended/man/man/man-1.6e-whatis2.patch
>> deleted file mode 100644
>> index fc4ed3135dd..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.6e-whatis2.patch
>> +++ /dev/null
>> @@ -1,59 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> -
>> -Index: man-1.6f/src/makewhatis.sh
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- man-1.6f.orig/src/makewhatis.sh    2010-12-29 13:51:45.000000000
>> -0800
>> -+++ man-1.6f/src/makewhatis.sh 2010-12-29 13:59:35.399799412 -0800
>> -@@ -164,10 +164,15 @@
>> - fi
>> - catpath=3D`echo ${catpath} | tr : ' '`
>> -
>> -+#WHATIS_DIR=3D$DESTDIR/var/cache/man/`echo $here|sed -e 's!.*/man/!!g'=
`
>> -+WHATIS_DIR=3D$DESTDIR/var/cache/man/$LANG
>> -+[[ -d $WHATIS_DIR ]] || mkdir -p $WHATIS_DIR/
>> -+
>> - # first truncate all the whatis files that will be created new,
>> - # then only update - we might visit the same directory twice
>> - if [ x$update =3D x ]; then
>> --   cp /dev/null /var/cache/man/whatis
>> -+   mkdir -p $WHATIS_DIR/
>> -+   /bin/echo -n > $WHATIS_DIR/whatis
>> - fi
>> -
>> - for pages in man cat
>> -@@ -180,13 +185,7 @@
>> -       echo "about to enter $mandir" > /dev/stderr
>> -      fi
>> -
>> --     # kludge for Slackware's /usr/man/preformat
>> --     if [ $mandir =3D /usr/man/preformat ]
>> --     then
>> --      mandir1=3D/usr/man
>> --     else
>> --      mandir1=3D$mandir
>> --     fi
>> -+     mandir1=3D$WHATIS_DIR
>> -
>> -      # if $mandir is on a readonly partition, and the whatis file
>> -      # is not a symlink, then let's skip trying to update it
>> -@@ -207,11 +206,6 @@
>> -       fi
>> -      fi
>> -
>> --     if [ -s ${mandir}/whatis -a $pages =3D man -a x$update =3D x ]; t=
hen
>> --      if [ x$verbose !=3D x ]; then
>> --         echo skipping $mandir - we did it already > /dev/stderr
>> --      fi
>> --     else
>> -        here=3D`pwd`
>> -        cd $mandir
>> -        for i in $sections
>> -@@ -447,7 +447,6 @@
>> -
>> -        chmod 644 ${mandir1}/whatis
>> -        rm $TMPFILE
>> --     fi
>> -    done
>> - done
>> diff --git a/meta/recipes-extended/man/man/man-1.6g-compile-warnings.pat=
ch
>> b/meta/recipes-extended/man/man/man-1.6g-compile-warnings.patch
>> deleted file mode 100644
>> index 4631d2d0635..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.6g-compile-warnings.patch
>> +++ /dev/null
>> @@ -1,105 +0,0 @@
>> -Fix a build error when building man.config.5 (a remnant of a long
>> -ago previous patch). Optimized the manpages Makefile for parallel
>> -builds. Also, fix compile warnings in a couple other files.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Bill Randle <william.c.randle@intel.com>
>> -
>> ---- man-1.6g/man/Makefile.in.orig      2016-03-28 17:31:08.723949180
>> -0700
>> -+++ man-1.6g/man/Makefile.in   2016-03-28 17:46:12.866910386 -0700
>> -@@ -5,6 +5,13 @@
>> - ALL =3D man.1 whatis.1 apropos.1 man.config.5
>> - MAYBE8 =3D makewhatis
>> -
>> -+SUBDIRS :=3D $(shell echo @languages@)
>> -+
>> -+.PHONY: subdirs $(SUBDIRS)
>> -+
>> -+man.config.man: man.conf.man
>> -+      @cp $< $@
>> -+
>> - .SUFFIXES: .man .1 .5 .8
>> -
>> - .man.1:
>> -@@ -19,11 +26,11 @@
>> - INSTALL =3D @INSTALL@ -c -m 644
>> -
>> - # Where to put the manual pages.
>> --mandir =3D $(DESTDIR)$(PREFIX)@mandir@$(SLANG)
>> -+mandir :=3D $(DESTDIR)$(PREFIX)@mandir@$(SLANG)
>> -
>> - all:  $(ALL)
>> -       for i in $(MAYBE8); \
>> --              do if test -f $$i.man; then make -f ../Makefile $$i.8;
>> fi; done
>> -+              do if test -f $$i.man; then $(MAKE) -f ../Makefile $$i.8=
;
>> fi; done
>> -
>> - install: $(ALL)
>> -       mkdir -p $(mandir)/man1 $(mandir)/man5 $(mandir)/man8
>> -@@ -38,24 +45,27 @@
>> -       rm -f core *.in *.@man1ext@ *.@man5ext@ *.@man8ext@ *~
>> -
>> - spotless:
>> -+      rm -f man.config.man
>> -
>> - subdirs:
>> --      @for i in @languages@; do if test -d $$i; then echo; \
>> --              echo "=3D=3D=3D=3D Making the `cat $$i.txt` man pages. =
=3D=3D=3D=3D"; \
>> --              cd $$i; make -f ../Makefile; cd ..; \
>> --              else echo "=3D=3D=3D=3D No $$i man pages found. =3D=3D=
=3D=3D"; fi; done
>> -+subdirs: $(SUBDIRS)
>> -+$(SUBDIRS):
>> -+      if test -d $@; then echo; \
>> -+              echo "=3D=3D=3D=3D Making the `cat $@.txt` man pages. =
=3D=3D=3D=3D"; \
>> -+              $(MAKE) -C $@ -f ../Makefile all; \
>> -+              else echo "=3D=3D=3D=3D No $@ man pages found. =3D=3D=3D=
=3D"; fi
>> -
>> - installsubdirs:
>> -       @for i in @languages@; do if test -d $$i; then echo; \
>> -               echo "=3D=3D=3D=3D Installing the `cat $$i.txt` man page=
s. =3D=3D=3D=3D";
>> \
>> -               cd $$i; SLANG=3D/$$i; if test $$SLANG =3D /en; then SLAN=
G=3D ;
>> fi; \
>> --              export SLANG; make -f ../Makefile install; cd ..; \
>> -+              export SLANG; $(MAKE) -f ../Makefile install; cd ..; \
>> -               else echo "=3D=3D=3D=3D No $$i man pages found. =3D=3D=
=3D=3D"; fi; done
>> -
>> - cleansubdirs:
>> --      @for i in ??; do cd $$i; make -f ../Makefile clean; cd ..; done
>> -+      @for i in ??; do $(MAKE) -C $$i -f ../Makefile clean; done
>> -       rm -f core *~
>> -
>> - spotlesssubdirs:
>> --      for i in ??; do cd $$i; make -f ../Makefile spotless; cd ..; don=
e
>> -+      for i in ??; do $(MAKE) -C $$i -f ../Makefile spotless; done
>> -       rm -f Makefile
>> -
>> ---- man-1.6g/src/gripes.c.orig 2006-11-21 11:53:44.000000000 -0800
>> -+++ man-1.6g/src/gripes.c      2016-03-30 16:32:31.601103487 -0700
>> -@@ -7,8 +7,6 @@
>> -
>> - extern char *msg[];
>> -
>> --static char *mantexts =3D "man";                /* e.g.
>> /usr/lib/locale/%L/man.cat */
>> --
>> - #ifdef NONLS
>> -
>> - static char *
>> -@@ -30,6 +28,8 @@
>> - #include <nl_types.h>
>> - #include "../catopen/catopen.c"
>> -
>> -+static char *mantexts =3D "man";                /* e.g.
>> /usr/lib/locale/%L/man.cat */
>> -+
>> - nl_catd catfd =3D (nl_catd) -1;
>> - int cat_is_open =3D 0;
>> -
>> ---- man-1.6g/src/manfile.c.orig        2005-08-20 16:26:06.000000000
>> -0700
>> -+++ man-1.6g/src/manfile.c     2016-03-29 09:10:21.527841285 -0700
>> -@@ -299,7 +299,7 @@
>> -       const char *((*tocat)(const char *man_filename, const char *ext,
>> -                             int flags))) {
>> -      char **sl;
>> --     struct manpage *res;
>> -+     struct manpage *res =3D 0;
>> -
>> -      standards =3D (flags & (FHS | FSSTND | DO_HP | DO_IRIX));
>> -      to_cat_filename =3D tocat;
>> diff --git a/meta/recipes-extended/man/man/man-1.6g-configure.patch
>> b/meta/recipes-extended/man/man/man-1.6g-configure.patch
>> deleted file mode 100644
>> index 106cc987819..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.6g-configure.patch
>> +++ /dev/null
>> @@ -1,68 +0,0 @@
>> -Use BUILD_CC and target include files for configuration tests.
>> -If cross-compiling, force pathnames for helper programs, since
>> -autodiscovery by the configure script will not work.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Bill Randle <william.c.randle at intel.com>
>> -
>> ---- man-1.6g/configure.orig    2016-03-28 17:46:12.734910976 -0700
>> -+++ man-1.6g/configure 2016-03-30 21:47:45.110572908 -0700
>> -@@ -216,7 +216,8 @@
>> - INCLUDEDIR=3D${INCLUDEDIR-/usr/include}
>> -
>> - rm -f conftest conftest.c
>> --compile=3D"$CC $DEFS conftest.c -o conftest $LIBS >/dev/null 2>&1"
>> -+# since we are interested in target feature support, use that sysroot
>> -+compile=3D"$BUILD_CC -isystem/${PKG_CONFIG_SYSROOT_DIR}/usr/include
>> $DEFS conftest.c -o conftest $LIBS >/dev/null 2>&1"
>> -
>> - # Check for various header files.
>> -
>> -@@ -455,19 +456,23 @@
>> -       fi
>> -     done
>> -   done
>> --  Fgroff=3D/usr/bin/groff
>> --  Fnroff=3D/usr/bin/nroff
>> --  Fjnroff=3D/usr/bin/nroff
>> --  Fgeqn=3D/usr/bin/geqn
>> --  Fgtbl=3D/usr/bin/gtbl
>> --  Fcol=3D/usr/bin/col
>> --  Fgrefer=3D/usr/bin/grefer
>> --  Fgpic=3D/usr/bin/gpic
>> --  Fmore=3D/bin/more
>> --  Fless=3D/usr/bin/less
>> --  Fcmp=3D/usr/bin/cmp
>> --  Fcat=3D/bin/cat
>> --  Fgawk=3D/bin/gawk
>> -+  if [ $BUILD_CC !=3D $CC ]; then
>> -+    # cross compiling =3D> target fs not available, so force defaults
>> -+    Fgroff=3D/usr/bin/groff
>> -+    Fnroff=3D/usr/bin/nroff
>> -+    Fjnroff=3D/usr/bin/nroff
>> -+    Fgeqn=3D/usr/bin/eqn
>> -+    Fgneqn=3D/usr/bin/neqn
>> -+    Fgtbl=3D/usr/bin/tbl
>> -+    Fcol=3D/usr/bin/col
>> -+    Fgrefer=3D/usr/bin/refer
>> -+    Fgpic=3D/usr/bin/pic
>> -+    Fmore=3D/bin/more
>> -+    Fless=3D/usr/bin/less
>> -+    Fcmp=3D/usr/bin/cmp
>> -+    Fcat=3D/bin/cat
>> -+    Fgawk=3D/usr/bin/gawk
>> -+  fi
>> -
>> -
>> -   for i in eqn tbl refer pic
>> -@@ -507,8 +512,8 @@
>> -     jnroff=3D"$Fjnroff -Tutf8 -mandocj"
>> -   fi
>> -   eqn=3D"$Fgeqn -Tps"
>> --  neqn=3D"$Fgeqn -Tutf8"
>> --  jneqn=3D"$Fgeqn -Tutf8"
>> -+  neqn=3D"$Fgneqn -Tutf8"
>> -+  jneqn=3D"$Fgneqn -Tutf8"
>> -   tbl=3D"$Fgtbl"
>> -   col=3D"$Fcol"
>> -   vgrind=3D"$Fvgrind"
>> diff --git a/meta/recipes-extended/man/man/man-1.6g-parallel.patch
>> b/meta/recipes-extended/man/man/man-1.6g-parallel.patch
>> deleted file mode 100644
>> index 72a88b898a1..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.6g-parallel.patch
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -The Makefile for man has a rule to create two generated targets with
>> -a program run from the shell. Because the rule was run twice, with
>> -parallel make, the generated files were being overwritten at the same
>> -time they were being compiled. This patch forces the rule to be run
>> -only once.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Bill Randle <william.c.randle at intel.com>
>> -
>> ---- man-1.6g/src/Makefile.in.orig      2010-12-31 12:28:46.000000000
>> -0800
>> -+++ man-1.6g/src/Makefile.in   2016-03-28 09:09:16.845458798 -0700
>> -@@ -43,8 +43,10 @@
>> - makemsg:
>> -       $(BUILD_CC) -o makemsg makemsg.c
>> -
>> --msg.c gripedefs.h: ../msgs/mess.en makemsg
>> -+msg.c gripedefs.h: genfiles-stamp
>> -+genfiles-stamp: ../msgs/mess.en makemsg
>> -       ./makemsg ../msgs/mess.en gripedefs.h msg.c
>> -+      touch genfiles-stamp
>> -
>> - # glob.c does not have prototypes
>> - glob.o: glob.c ndir.h
>> -@@ -117,4 +119,4 @@
>> -
>> - spotless: clean
>> -       rm -f Makefile config.status paths.h version.h man.conf
>> --      rm -f gripedefs.h msg.c mess.*.cat
>> -+      rm -f gripedefs.h msg.c mess.*.cat genfiles-stamp
>> diff --git a/meta/recipes-extended/man/man/man-1.6g-whatis3.patch
>> b/meta/recipes-extended/man/man/man-1.6g-whatis3.patch
>> deleted file mode 100644
>> index 63344568575..00000000000
>> --- a/meta/recipes-extended/man/man/man-1.6g-whatis3.patch
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -Do not use absolute path for awk while getting the path of awk
>> -when running makewhatis.
>> -This can avoid errors if path of awk changes.
>> -
>> -Upstream-Status: Submitted [man-1.6g]
>> -
>> -Signed-off-by: Jian Liu <jian.liu@windriver.com>
>> -
>> -diff -Nur man-1.6g.orig/src/makewhatis.sh man-1.6g/src/makewhatis.sh
>> ---- man-1.6g.orig/src/makewhatis.sh    2015-02-25 16:13:12.657611419
>> +0800
>> -+++ man-1.6g/src/makewhatis.sh 2015-02-25 16:14:49.334694815 +0800
>> -@@ -67,7 +67,7 @@
>> - # but that leads to problems and bugs.
>> -
>> - # AWK=3D/usr/bin/gawk
>> --AWK=3D@awk@
>> -+AWK=3D`which awk`
>> -
>> - # Find a place for our temporary files. If security is not a concern,
>> use
>> - #     TMPFILE=3D/tmp/whatis$$; TMPFILEDIR=3Dnone
>> diff --git a/meta/recipes-extended/man/man/man.1.gz
>> b/meta/recipes-extended/man/man/man.1.gz
>> deleted file mode 100644
>> index c368045153406ab730aad35bfc7ffd91238bd47d..000000000000000000
>> 0000000000000000000000
>> GIT binary patch
>> literal 0
>> HcmV?d00001
>>
>> literal 12323
>> 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
&d
>> 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
y+
>> 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
>> J#~S#D004`l-XQ=3D0
>>
>> diff --git a/meta/recipes-extended/man/man/man.7.gz
>> b/meta/recipes-extended/man/man/man.7.gz
>> deleted file mode 100644
>> index e85af82426507521badb6f5c425896385f469b5a..000000000000000000
>> 0000000000000000000000
>> GIT binary patch
>> literal 0
>> HcmV?d00001
>>
>> literal 6192
>> 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
>> OO8yVmcsMtKI{*OKZ6#>{
>>
>> diff --git a/meta/recipes-extended/man/man/man.conf
>> b/meta/recipes-extended/man/man/man.conf
>> deleted file mode 100644
>> index fc10be2758d..00000000000
>> --- a/meta/recipes-extended/man/man/man.conf
>> +++ /dev/null
>> @@ -1,141 +0,0 @@
>> -#
>> -# Generated automatically from man.conf.in by the
>> -# configure script.
>> -#
>> -# man.conf from man-1.5p
>> -#
>> -# For more information about this file, see the man pages man(1)
>> -# and man.conf(5).
>> -#
>> -# This file is read by man to configure the default manpath (also used
>> -# when MANPATH contains an empty substring), to find out where the cat
>> -# pages corresponding to given man pages should be stored,
>> -# and to map each PATH element to a manpath element.
>> -# It may also record the pathname of the man binary. [This is unused.]
>> -# The format is:
>> -#
>> -# MANBIN               pathname
>> -# MANPATH              manpath_element [corresponding_catdir]
>> -# MANPATH_MAP          path_element    manpath_element
>> -#
>> -# If no catdir is given, it is assumed to be equal to the mandir
>> -# (so that this dir has both man1 etc. and cat1 etc. subdirs).
>> -# This is the traditional Unix setup.
>> -# Certain versions of the FSSTND recommend putting formatted versions
>> -# of /usr/.../man/manx/page.x into /var/catman/.../catx/page.x.
>> -# The keyword FSSTND will cause this behaviour.
>> -# Certain versions of the FHS recommend putting formatted versions of
>> -# /usr/.../share/man/[locale/]manx/page.x into
>> -# /var/cache/man/.../[locale/]catx/page.x.
>> -# The keyword FHS will cause this behaviour (and overrides FSSTND).
>> -# Explicitly given catdirs override.
>> -#
>> -# FSSTND
>> -FHS
>> -#
>> -# This file is also read by man in order to find how to call nroff,
>> less, etc.,
>> -# and to determine the correspondence between extensions and
>> decompressors.
>> -#
>> -# MANBIN               /usr/local/bin/man
>> -#
>> -# Every automatically generated MANPATH includes these fields
>> -#
>> -MANPATH        /usr/man
>> -MANPATH        /usr/share/man
>> -MANPATH        /usr/local/man
>> -MANPATH        /usr/local/share/man
>> -MANPATH        /usr/X11R6/man
>> -#
>> -# Uncomment if you want to include one of these by default
>> -#
>> -# MANPATH      /opt/*/man
>> -# MANPATH      /usr/lib/*/man
>> -# MANPATH      /usr/share/*/man
>> -# MANPATH      /usr/kerberos/man
>> -#
>> -# Set up PATH to MANPATH mapping
>> -#
>> -# If people ask for "man foo" and have "/dir/bin/foo" in their PATH
>> -# and the docs are found in "/dir/man", then no mapping is required.
>> -#
>> -# The below mappings are superfluous when the right hand side is
>> -# in the mandatory manpath already, but will keep man from statting
>> -# lots of other nearby files and directories.
>> -#
>> -MANPATH_MAP    /bin                    /usr/share/man
>> -MANPATH_MAP    /sbin                   /usr/share/man
>> -MANPATH_MAP    /usr/bin                /usr/share/man
>> -MANPATH_MAP    /usr/sbin               /usr/share/man
>> -MANPATH_MAP    /usr/local/bin          /usr/local/share/man
>> -MANPATH_MAP    /usr/local/sbin         /usr/local/share/man
>> -MANPATH_MAP    /usr/X11R6/bin          /usr/X11R6/man
>> -MANPATH_MAP    /usr/bin/X11            /usr/X11R6/man
>> -MANPATH_MAP    /usr/bin/mh             /usr/share/man
>> -#
>> -# NOAUTOPATH keeps man from automatically adding directories that look
>> like
>> -# manual page directories to the path.
>> -#
>> -#NOAUTOPATH
>> -#
>> -# NOCACHE keeps man from creating cache pages ("cat pages")
>> -# (generally one enables/disable cat page creation by creating/deleting
>> -# the directory they would live in - man never does mkdir)
>> -#
>> -#NOCACHE
>> -#
>> -# Useful paths - note that COL should not be defined when
>> -# NROFF is defined as "groff -Tascii" or "groff -Tlatin1";
>> -# not only is it superfluous, but it actually damages the output.
>> -# For use with utf-8, NROFF should be "nroff -mandoc" without -T option=
.
>> -# (Maybe - but today I need -Tlatin1 to prevent double conversion to
>> utf8.)
>> -#
>> -# If you have a new troff (version 1.18.1?) and its colored output
>> -# causes problems, add the -c option to TROFF, NROFF, JNROFF.
>> -#
>> -TROFF          /usr/bin/groff -Tps -mandoc
>> -NROFF          /usr/bin/nroff -Tlatin1 -mandoc
>> -JNROFF         /usr/bin/groff -Tnippon -mandocj
>> -EQN            /usr/bin/eqn -Tps
>> -NEQN           /usr/bin/eqn -Tlatin1
>> -JNEQN          /usr/bin/eqn -Tnippon
>> -TBL            /usr/bin/tbl
>> -# COL          /usr/bin/col
>> -REFER          /usr/bin/refer
>> -PIC            /usr/bin/pic
>> -VGRIND
>> -GRAP
>> -PAGER          /usr/bin/less -isR
>> -CAT            /bin/cat
>> -#
>> -# The command "man -a xyzzy" will show all man pages for xyzzy.
>> -# When CMP is defined man will try to avoid showing the same
>> -# text twice. (But compressed pages compare unequal.)
>> -#
>> -CMP            /usr/bin/cmp -s
>> -#
>> -# Compress cat pages
>> -#
>> -COMPRESS       /bin/bzip2
>> -COMPRESS_EXT   .bz2
>> -#
>> -# Default manual sections (and order) to search if -S is not specified
>> -# and the MANSECT environment variable is not set.
>> -#
>> -MANSECT                1:1p:8:2:3:3p:4:5:6:7:9:0p:tcl:n:l:p:o
>> -#
>> -# Default options to use when man is invoked without options
>> -# This is mainly for the benefit of those that think -a should be the
>> default
>> -# Note that some systems have /usr/man/allman, causing pages to be show=
n
>> twice.
>> -#
>> -#MANDEFOPTIONS -a
>> -#
>> -# Decompress with given decompressor when input file has given extensio=
n
>> -# The command given must act as a filter.
>> -#
>> -.gz            /bin/gunzip -c
>> -.bz2           /usr/bin/bunzip2 -c
>> -.xz            /usr/bin/unxz -c
>> -.z
>> -.Z             /bin/zcat
>> -.F
>> -.Y
>> diff --git a/meta/recipes-extended/man/man/manpath.5.gz
>> b/meta/recipes-extended/man/man/manpath.5.gz
>> deleted file mode 100644
>> index c012ff89763bb057afaaaed3b616244748354fec..000000000000000000
>> 0000000000000000000000
>> GIT binary patch
>> literal 0
>> HcmV?d00001
>>
>> literal 2133
>> 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
>> L!Vpl2a}xjn5ok8&
>>
>> diff --git a/meta/recipes-extended/man/man_1.6g.bb
>> b/meta/recipes-extended/man/man_1.6g.bb
>> deleted file mode 100644
>> index ff603f842c1..00000000000
>> --- a/meta/recipes-extended/man/man_1.6g.bb
>> +++ /dev/null
>> @@ -1,86 +0,0 @@
>> -SUMMARY =3D "Online documentation tools"
>> -DESCRIPTION =3D "A set of documentation tools: man, apropos and whatis"
>> -SECTION =3D "console/utils"
>> -HOMEPAGE =3D "http://primates.ximian.com/~flucifredi/man"
>> -LICENSE =3D "GPLv2"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166=
c28b"
>> -
>> -PR =3D "r1"
>> -
>> -DEPENDS =3D "groff less"
>> -
>> -def compress_pkg(d):
>> -    if "compress_doc" in (d.getVar("INHERIT") or "").split():
>> -         compress =3D d.getVar("DOC_COMPRESS")
>> -         if compress =3D=3D "gz":
>> -             return "gzip"
>> -         elif compress =3D=3D "bz2":
>> -             return "bzip2"
>> -         elif compress =3D=3D "xz":
>> -             return "xz"
>> -    return ""
>> -
>> -RDEPENDS_${PN} +=3D "${@compress_pkg(d)}"
>> -
>> -SRC_URI =3D "http://pkgs.fedoraproject.org/lookaside/pkgs/man2html/${BP=
}
>> .tar.gz/ba154d5796928b841c9c69f0ae376660/${BP}.tar.gz \
>> -           file://man-1.5k-confpath.patch;striplevel=3D0 \
>> -           file://man-1.5h1-make.patch \
>> -           file://man-1.5k-nonascii.patch \
>> -           file://man-1.6e-security.patch \
>> -           file://man-1.6e-mandirs.patch \
>> -           file://man-1.5m2-bug11621.patch \
>> -           file://man-1.5k-sofix.patch \
>> -           file://man-1.5m2-buildroot.patch \
>> -           file://man-1.6e-ro_usr.patch \
>> -           file://man-1.5i2-newline.patch;striplevel=3D0 \
>> -           file://man-1.5j-utf8.patch \
>> -           file://man-1.5i2-overflow.patch \
>> -           file://man-1.5j-nocache.patch \
>> -           file://man-1.5i2-initial.patch \
>> -           file://man-1.5h1-gencat.patch;striplevel=3D0 \
>> -           file://man-1.5g-nonrootbuild.patch \
>> -           file://man-1.5j-i18n.patch \
>> -           file://man-1.6e-whatis2.patch \
>> -           file://man-1.6e-use_i18n_vars_in_a_std_way.patch \
>> -           file://man-1.5m2-no-color-for-printing.patch \
>> -           file://man-1.5m2-sigpipe.patch \
>> -           file://man-1.6e-i18n_whatis.patch \
>> -           file://man-1.6e-new_sections.patch \
>> -           file://man.1.gz;unpack=3Dfalse \
>> -           file://man.7.gz;unpack=3Dfalse \
>> -           file://man.conf \
>> -           file://manpath.5.gz;unpack=3Dfalse \
>> -           file://man-1.6g-whatis3.patch \
>> -           file://configure_sed.patch \
>> -           file://man-1.6g-parallel.patch \
>> -           file://man-1.6g-compile-warnings.patch \
>> -           file://man-1.6g-configure.patch \
>> -"
>> -
>> -SRC_URI[md5sum] =3D "ba154d5796928b841c9c69f0ae376660"
>> -SRC_URI[sha256sum] =3D "ccdcb8c3f4e0080923d7e818f0e4a
>> 202db26c46415eaef361387c20995b8959f"
>> -
>> -CFLAGS +=3D "-DSYSV"
>> -
>> -do_configure () {
>> -        ${S}/configure -default -confdir /etc +sgid +fhs +lang all
>> -}
>> -
>> -
>> -do_install() {
>> -        oe_runmake install DESTDIR=3D${D}
>> -}
>> -
>> -do_install_append(){
>> -       mkdir -p  ${D}${sysconfdir}
>> -        mkdir -p ${D}${datadir}/man/man5
>> -        mkdir -p ${D}${datadir}/man/man7
>> -       cp ${WORKDIR}/man.conf ${D}${sysconfdir}/man.config
>> -        cp ${WORKDIR}/man.1.gz ${D}${datadir}/man/man1/
>> -        cp ${WORKDIR}/man.7.gz ${D}${datadir}/man/man7/
>> -        cp ${WORKDIR}/manpath.5.gz ${D}${datadir}/man/man5/
>> -}
>> -
>> -
>> -RDEPENDS_${PN} =3D "less groff"
>> -FILES_${PN} +=3D "${datadir}/locale ${sysconfdir}/man.config"
>> --
>> 2.15.1
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

--001a113e919898202e0565bf08ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Easy fix: remember PN is lib32-man-db in these builds, so =
use BPN.=C2=A0 Fixed up locally.<div><br></div><div>Ross</div></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 February 2018 at 2=
0:07, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@inte=
l.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr">Fails in multilib:<br><br>ERRO=
R: lib32-man-db-2.8.1-r0 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- =
package contains symlink .so: lib32-man-db path &#39;/work/x86-pokymllib32-=
linux/<wbr>lib32-man-db/2.8.1-r0/<wbr>packages-split/lib32-man-db/<wbr>usr/=
lib/man-db/libman.so&#39;<br>non -dev/-dbg/nativesdk- package contains syml=
ink .so: lib32-man-db path &#39;/work/x86-pokymllib32-linux/<wbr>lib32-man-=
db/2.8.1-r0/<wbr>packages-split/lib32-man-db/<wbr>usr/lib/man-db/libmandb.s=
o&#39; [dev-so]<div><br></div><div>Ross</div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On 12 February 2018 at 11:05, Alexander K=
anavin <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.inte=
l.com" target=3D"_blank">alexander.kanavin@linux.<wbr>intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Until now oe-core has been usi=
ng a well obsolete implementation of man.<br>
<br>
Man-db on the other hand is used by all modern Linux distros, is actively<b=
r>
maintained, has a standard build system, and does not require 30 patches<br=
>
to build.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com" target=3D"_blank">alexander.kanavin@linux.intel<wbr>.com</a>=
&gt;<br>
---<br>
=C2=A0meta/recipes-extended/man-db/<a href=3D"http://man-db_2.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>man-db_2.8.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 41 ++++++<br>
=C2=A0meta/recipes-extended/man/<wbr>man/configure_sed.patch=C2=A0 |=C2=A0 =
32 -----<br>
=C2=A0.../man/man/man-1.5g-nonrootb<wbr>uild.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 16 ---<br>
=C2=A0.../man/man/man-1.5h1-gencat.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 --<br>
=C2=A0meta/recipes-extended/man/<wbr>man/man-1.5h1-make.patch |=C2=A0 17 --=
-<br>
=C2=A0.../man/man/man-1.5i2-<wbr>initial.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 ---<br>
=C2=A0.../man/man/man-1.5i2-<wbr>newline.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 15 --<br>
=C2=A0.../man/man/man-1.5i2-overflo<wbr>w.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 ---<br>
=C2=A0meta/recipes-extended/man/<wbr>man/man-1.5j-i18n.patch=C2=A0 |=C2=A0 =
16 ---<br>
=C2=A0.../man/man/man-1.5j-nocache.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 ---<br>
=C2=A0meta/recipes-extended/man/<wbr>man/man-1.5j-utf8.patch=C2=A0 |=C2=A0 =
61 --------<br>
=C2=A0.../man/man/man-1.5k-<wbr>confpath.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 15 --<br>
=C2=A0.../man/man/man-1.5k-<wbr>nonascii.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 18 ---<br>
=C2=A0meta/recipes-extended/man/<wbr>man/man-1.5k-sofix.patch |=C2=A0 24 --=
--<br>
=C2=A0.../man/man/man-1.5m2-bug1162<wbr>1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 --<br>
=C2=A0.../man/man/man-1.5m2-buildro<wbr>ot.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 52 -------<br>
=C2=A0.../man/man/man-1.5m2-no-colo<wbr>r-for-printing.patch=C2=A0 |=C2=A0 =
15 --<br>
=C2=A0.../man/man/man-1.5m2-<wbr>sigpipe.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 30 ----<br>
=C2=A0.../man/man/man-1.6e-i18n_wha<wbr>tis.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 145 -------------------<br>
=C2=A0.../man/man/man-1.6e-mandirs.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 31 ----<br>
=C2=A0.../man/man/man-1.6e-new_sect<wbr>ions.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 15 --<br>
=C2=A0.../recipes-extended/man/man/<wbr>man-1.6e-ro_usr.patch |=C2=A0 33 --=
---<br>
=C2=A0.../man/man/man-1.6e-<wbr>security.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 62 --------<br>
=C2=A0.../man/man-1.6e-use_i18n_var<wbr>s_in_a_std_way.patch=C2=A0 | 160 --=
-------------------<br>
=C2=A0.../man/man/man-1.6e-whatis2.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 59 --------<br>
=C2=A0.../man/man/man-1.6g-compile-<wbr>warnings.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 105 --------------<br>
=C2=A0.../man/man/man-1.6g-configur<wbr>e.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 68 ---------<br>
=C2=A0.../man/man/man-1.6g-<wbr>parallel.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 30 ----<br>
=C2=A0.../man/man/man-1.6g-whatis3.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 ---<br>
=C2=A0meta/recipes-extended/man/<wbr>man/man.1.gz=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| Bin 12323 -&gt; 0 bytes<br>
=C2=A0meta/recipes-extended/man/<wbr>man/man.7.gz=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| Bin 6192 -&gt; 0 bytes<br>
=C2=A0meta/recipes-extended/man/<wbr>man/man.conf=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 141 ------------------<br>
=C2=A0meta/recipes-extended/man/<wbr>man/manpath.5.gz=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| Bin 2133 -&gt; 0 bytes<br>
=C2=A0meta/recipes-extended/man/<a href=3D"http://man_1.6g.bb" rel=3D"noref=
errer" target=3D"_blank">man<wbr>_1.6g.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 86 -----------<br>
=C2=A034 files changed, 41 insertions(+), 1346 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/man-db/<a href=3D"http://man=
-db_2.8.1.bb" rel=3D"noreferrer" target=3D"_blank">m<wbr>an-db_2.8.1.bb</a>=
<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>configure_sed.p=
atch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5g-nonroo=
tbuild.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5h1-genca=
t.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5h1-make.=
patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5i2-initi=
al.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5i2-newli=
ne.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5i2-overf=
low.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5j-i18n.p=
atch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5j-nocach=
e.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5j-utf8.p=
atch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5k-confpa=
th.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5k-nonasc=
ii.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5k-sofix.=
patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5m2-bug11=
621.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5m2-build=
root.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5m2-no-co=
lor-for-printin<wbr>g.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.5m2-sigpi=
pe.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.6e-i18n_w=
hatis.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.6e-mandir=
s.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.6e-new_se=
ctions.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.6e-ro_usr=
.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.6e-securi=
ty.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.6e-use_i1=
8n_vars_in_a_st<wbr>d_way.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.6e-whatis=
2.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.6g-compil=
e-warnings.patc<wbr>h<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.6g-config=
ure.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.6g-parall=
el.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man-1.6g-whatis=
3.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man.1.gz<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man.7.gz<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>man.conf<br>
=C2=A0delete mode 100644 meta/recipes-extended/man/man/<wbr>manpath.5.gz<br=
>
=C2=A0delete mode 100644 meta/recipes-extended/man/<a href=3D"http://man_1.=
6g.bb" rel=3D"noreferrer" target=3D"_blank">man_<wbr>1.6g.bb</a><br>
<br>
diff --git a/meta/recipes-extended/man-db<wbr>/<a href=3D"http://man-db_2.8=
.1.bb" rel=3D"noreferrer" target=3D"_blank">man-db_2.8.1.bb</a> b/meta/reci=
pes-extended/man-db<wbr>/<a href=3D"http://man-db_2.8.1.bb" rel=3D"noreferr=
er" target=3D"_blank">man-db_2.8.1.bb</a><br>
new file mode 100644<br>
index 00000000000..4e633acd09e<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/man-db<wbr>/<a href=3D"http://man-db_2.8.1.bb" =
rel=3D"noreferrer" target=3D"_blank">man-db_2.8.1.bb</a><br>
@@ -0,0 +1,41 @@<br>
+SUMMARY =3D &quot;An implementation of the standard Unix documentation sys=
tem accessed using the man command&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://man-db.nongnu.org/" rel=3D"noreferrer=
" target=3D"_blank">http://man-db.nongnu.org/</a>&quot;<br>
+LICENSE =3D &quot;LGPLv2.1 &amp; GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://docs/COPYING.LIB;md5=3Da<wbr>6f89e2100d9=
b6cdffcea4f398e3734<wbr>3 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://docs/COPYING;md5=3Deb723b<wbr>61539feef013de476e68b5c50a&quot;<br>
+<br>
+SRC_URI =3D &quot;${SAVANNAH_NONGNU_MIRROR}/man<wbr>-db/man-db-${PV}.tar.x=
z&quot;<br>
+SRC_URI[md5sum] =3D &quot;51842978e06686286421f9498d100<wbr>9b7&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a6aec641ca3d9942b054cc0e9c3f0<wbr>5cb46a3a992=
bc0006795755e2fed13<wbr>57f3e&quot;<br>
+<br>
+DEPENDS =3D &quot;libpipeline gdbm groff-native less&quot;<br>
+<br>
+# | /usr/src/debug/man-db/2.8.0-r0<wbr>/man-db-2.8.0/src/whatis.c:939<wbr>=
: undefined reference to `_nl_msg_cat_cntr&#39;<br>
+USE_NLS_libc-musl =3D &quot;no&quot;<br>
+<br>
+inherit gettext pkgconfig autotools<br>
+<br>
+EXTRA_OECONF =3D &quot;--with-pager=3Dless --disable-cache-owner&quot;<br>
+<br>
+do_install_append_libc-musl() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${libdir}/charset.alias<br>
+}<br>
+<br>
+FILES_${PN} +=3D &quot;${libdir}/tmpfiles.d&quot;<br>
+<br>
+FILES_${PN}-dev +=3D &quot;${libdir}/${PN}/libman.so ${libdir}/${PN}/libma=
ndb.so&quot;<br>
+<br>
+RPROVIDES_${PN} +=3D &quot; man&quot;<br>
+<br>
+def compress_pkg(d):<br>
+=C2=A0 =C2=A0 if &quot;compress_doc&quot; in (d.getVar(&quot;INHERIT&quot;=
) or &quot;&quot;).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compress =3D d.getVar(&quot;DOC_COMPRESS=
&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if compress =3D=3D &quot;gz&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;gzip&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif compress =3D=3D &quot;bz2&quot;:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;bzip2&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif compress =3D=3D &quot;xz&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;xz&quot;<br>
+=C2=A0 =C2=A0 return &quot;&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;${@compress_pkg(d)}&quot;<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/configure_sed.patch b/meta/=
recipes-extended/man/ma<wbr>n/configure_sed.patch<br>
deleted file mode 100644<br>
index d49e6831d9a..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/configure_sed.patch<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-man: replace &#39;,&#39; with &#39;#&#39;<br>
-<br>
-Sometimes, the parameters of CC/BUILD_CC contains the &#39;,&#39;, which<b=
r>
-cause the sed command failed, so replace the &#39;,&#39; with &#39;#&#39;<=
br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Yue Tao &lt;<a href=3D"mailto:Yue.Tao@windriver.com" target=
=3D"_blank">Yue.Tao@windriver.com</a>&gt;<br>
-Signed-off-by: Wenzong Fan &lt;<a href=3D"mailto:wenzong.fan@windriver.com=
" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;<br>
----<br>
- configure | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/configure b/configure<br>
-index 9f62cf9..9a565ae 100755<br>
---- a/configure<br>
-+++ b/configure<br>
-@@ -1321,9 +1321,9 @@ do<br>
-=C2=A0 =C2=A0echo &quot;Creating $infile from $<a href=3D"http://infile.in=
" rel=3D"noreferrer" target=3D"_blank">infile.in</a>&quot;<br>
-=C2=A0 =C2=A0sed -e &#39;<br>
- s,@version@,$version,<br>
--s,@CC@,$CC,<br>
-+s#@CC@#$CC#<br>
- s,@EXEEXT@,$EXEEXT,<br>
--s,@BUILD_CC@,$BUILD_CC,<br>
-+s#@BUILD_CC@#$BUILD_CC#<br>
- s,@INSTALL@,$INSTALL,<br>
- s,@DEFS@,$DEFS,<br>
- s,@LIBS@,$LIBS,<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5g-nonrootbuild.patch=
 b/meta/recipes-extended/man/ma<wbr>n/man-1.5g-nonrootbuild.patch<br>
deleted file mode 100644<br>
index 6f834bd01bd..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5g-nonrootbuild.patch<br>
+++ /dev/null<br>
@@ -1,16 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
-diff -u -r man-1.5g.old/configure man-1.5g/configure<br>
---- man-1.5g.old/configure=C2=A0 =C2=A0 =C2=A0Wed Apr=C2=A0 7 04:16:05 199=
9<br>
-+++ man-1.5g/configure Mon May 15 15:22:44 2000<br>
-@@ -791,7 +791,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0read mode<br>
-=C2=A0 =C2=A0 =C2=A0if test &quot;$mode&quot; !=3D &quot;&quot;; then man_=
mode=3D$mode; fi<br>
-=C2=A0 =C2=A0fi<br>
--=C2=A0 man_install_flags=3D&quot;-m $man_mode -o $man_user -g $man_group&=
quot;<br>
-+=C2=A0 man_install_flags=3D&quot;&quot;<br>
- fi<br>
-<br>
- # What sections do we anticipate?<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5h1-gencat.patch b/me=
ta/recipes-extended/man/ma<wbr>n/man-1.5h1-gencat.patch<br>
deleted file mode 100644<br>
index 044b14c5099..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5h1-gencat.patch<br>
+++ /dev/null<br>
@@ -1,14 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- gencat/genlib.c=C2=A0 =C2=A0 2006-08-02 20:11:44.000000000 +0200<br>
-+++ gencat/genlib.c.oden=C2=A0 =C2=A0 =C2=A0 =C2=A02008-12-21 19:18:50.000=
000000 +0100<br>
-@@ -47,6 +47,7 @@ up-to-date.=C2=A0 Many thanks.<br>
- 01/14/91=C2=A0 =C2=A04 nazgul=C2=A0 =C2=A0Off by one on number specified =
entries<br>
- */<br>
-<br>
-+#undef _GNU_SOURCE<br>
- #include &lt;stdio.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
- #ifdef SYSV<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5h1-make.patch b/meta=
/recipes-extended/man/ma<wbr>n/man-1.5h1-make.patch<br>
deleted file mode 100644<br>
index 8631eb2c539..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5h1-make.patch<br>
+++ /dev/null<br>
@@ -1,17 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- man-1.5g/man/Makefile.in.mike=C2=A0 =C2=A0 =C2=A0 Fri Apr=C2=A0 9 13:3=
5:54 1999<br>
-+++ man-1.5g/man/Makefile.in=C2=A0 =C2=A0Fri Apr=C2=A0 9 13:36:45 1999<br>
-@@ -1,8 +1,8 @@<br>
- # only executed from a subdir<br>
- MAN1 =3D man whatis apropos<br>
--MAN5 =3D man.conf<br>
-+MAN5 =3D man.config<br>
- MAN8 =3D makewhatis<br>
--ALL =3D man.1 whatis.1 apropos.1 man.conf.5<br>
-+ALL =3D man.1 whatis.1 apropos.1 man.config.5<br>
- MAYBE8 =3D makewhatis<br>
-<br>
- .SUFFIXES: .man .1 .5 .8<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5i2-initial.patch b/m=
eta/recipes-extended/man/ma<wbr>n/man-1.5i2-initial.patch<br>
deleted file mode 100644<br>
index fe56c0706ca..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5i2-initial.patch<br>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- man-1.5i2/src/<a href=3D"http://makewhatis.sh.in">makewhatis.sh.in</a>=
<wbr>itial=C2=A0 =C2=A0 =C2=A0 =C2=A0 Tue Jul=C2=A0 3 15:38:39 2001<br>
-+++ man-1.5i2/src/makewhatis.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 Tue Jul=C2=A0 3=
 15:39:39 2001<br>
-@@ -81,8 +81,10 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;;<br>
-=C2=A0 =C2=A0 =C2=A0-s) setsections=3D1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;;<br>
--=C2=A0 =C2=A0 -u) findarg=3D&quot;-newer /var/cache/man/whatis&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 update=3D1<br>
-+=C2=A0 =C2=A0 -u) if [ -e /var/cache/man/whatis ]; then<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 findarg=3D&quot;-newer /var/cache/man/whatis&=
quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 update=3D1<br>
-+=C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;;<br>
-=C2=A0 =C2=A0 =C2=A0-v) verbose=3D1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;;<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5i2-newline.patch b/m=
eta/recipes-extended/man/ma<wbr>n/man-1.5i2-newline.patch<br>
deleted file mode 100644<br>
index 611df5d2594..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5i2-newline.patch<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- src/man.c=C2=A0 2008-12-21 19:17:31.000000000 +0100<br>
-+++ src/man.c.oden=C2=A0 =C2=A0 =C2=A02008-12-21 19:17:38.000000000 +0100<=
br>
-@@ -391,7 +391,7 @@ again:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0beg++;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 end =3D beg;<br>
--=C2=A0 =C2=A0 =C2=A0while (*end !=3D &#39; &#39; &amp;&amp; *end !=3D &#3=
9;\t&#39; &amp;&amp; *end !=3D &#39;\n&#39; &amp;&amp; *end !=3D &#39;\0&#3=
9;)<br>
-+=C2=A0 =C2=A0 =C2=A0while (*end !=3D &#39; &#39; &amp;&amp; *end !=3D &#3=
9;\t&#39; &amp;&amp; *end !=3D &#39;\n&#39; &amp;&amp; *end !=3D &#39;\0&#3=
9; &amp;&amp; (end-buf)&lt;BUFSIZE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end++;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 /* note that buf is NUL-terminated */<br>
-=C2=A0 =C2=A0 =C2=A0 *end =3D &#39;\0&#39;;<br>
-<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5i2-overflow.patch b/=
meta/recipes-extended/man/ma<wbr>n/man-1.5i2-overflow.patch<br>
deleted file mode 100644<br>
index 52d2881a893..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5i2-overflow.patch<br>
+++ /dev/null<br>
@@ -1,16 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- man-1.5i2/src/man.c.overflow=C2=A0 =C2=A0 =C2=A0 =C2=A0Mon Jun 25 00:0=
1:45 2001<br>
-+++ man-1.5i2/src/man.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 Mon Jun 25 00:01:45 200=
1<br>
-@@ -381,6 +381,9 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcat(name, &quot;/&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcat(name, beg);<br>
-=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0/* If this is too long, bad things have already happe=
ned. *<br>
-+=C2=A0 =C2=A0 =C2=A0 * we should quit IMMEDIATELY.=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 */<br>
-+=C2=A0 =C2=A0 =C2=A0if(strlen(name)&gt;sizeof(ultnam<wbr>e)) _exit(1);<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 goto again;<br>
- }<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5j-i18n.patch b/meta/=
recipes-extended/man/ma<wbr>n/man-1.5j-i18n.patch<br>
deleted file mode 100644<br>
index 2ae09c0ea49..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5j-i18n.patch<br>
+++ /dev/null<br>
@@ -1,16 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- man-1.5j/msgs/inst.sh.i18n Wed Apr 25 10:40:50 2001<br>
-+++ man-1.5j/msgs/inst.sh=C2=A0 =C2=A0 =C2=A0 Wed Apr 25 10:41:17 2001<br>
-@@ -27,8 +27,7 @@<br>
- for j in $M; do<br>
-=C2=A0 =C2=A0if [ -f $j ]; then<br>
-=C2=A0 =C2=A0 =C2=A0i=3D`echo $j | sed -e &#39;s/mess.//; s/.cat//&#39;`<b=
r>
--=C2=A0 =C2=A0 dest=3D`echo $locdir | sed -e &quot;s/%N/man/; s/%L/$i/&quo=
t;`<br>
--=C2=A0 =C2=A0 dest=3D${PREFIX}$dest<br>
-+=C2=A0 =C2=A0 dest=3D${PREFIX}/`echo $locdir | sed -e &quot;s/%N/man/; s/=
%L/$i/&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0echo &quot;mkdir -p `dirname $dest`&quot;<br>
-=C2=A0 =C2=A0 =C2=A0mkdir -p `dirname $dest`;<br>
-=C2=A0 =C2=A0 =C2=A0echo &quot;install -c -m 644 $j $dest&quot;<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5j-nocache.patch b/me=
ta/recipes-extended/man/ma<wbr>n/man-1.5j-nocache.patch<br>
deleted file mode 100644<br>
index 751dddd53b5..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5j-nocache.patch<br>
+++ /dev/null<br>
@@ -1,16 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- man-1.5j/src/<a href=3D"http://man.conf.in" target=3D"_blank">man.conf=
.in</a>.nocac<wbr>he=C2=A0 =C2=A0Thu Nov 22 15:07:12 2001<br>
-+++ man-1.5j/src/<a href=3D"http://man.conf.in" rel=3D"noreferrer" target=
=3D"_blank">man.conf.in</a>=C2=A0 =C2=A0Thu Nov 22 15:07:12 2001<br>
-@@ -81,6 +81,9 @@<br>
- #<br>
- #NOCACHE<br>
- #<br>
-+# NOCACHE keeps man from creating cache pages<br>
-+NOCACHE<br>
-+#<br>
- # Useful paths - note that COL should not be defined when<br>
- # NROFF is defined as &quot;groff -Tascii&quot; or &quot;groff -Tlatin1&q=
uot;;<br>
- # not only is it superfluous, but it actually damages the output.<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5j-utf8.patch b/meta/=
recipes-extended/man/ma<wbr>n/man-1.5j-utf8.patch<br>
deleted file mode 100644<br>
index 33d3e4c9745..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5j-utf8.patch<br>
+++ /dev/null<br>
@@ -1,61 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- man-1.5j/configure.utf8=C2=A0 =C2=A0 Thu Nov 22 15:02:35 2001<br>
-+++ man-1.5j/configure Thu Nov 22 15:03:15 2001<br>
-@@ -408,9 +408,9 @@<br>
-=C2=A0 =C2=A0Fgawk=3D/bin/gawk<br>
-=C2=A0 =C2=A0Fawk=3D/bin/gawk<br>
-=C2=A0 =C2=A0Fmawk=3Dmissing<br>
--=C2=A0 troff=3D&quot;&quot;<br>
--=C2=A0 nroff=3D&quot;&quot;<br>
--=C2=A0 jnroff=3D&quot;&quot;<br>
-+=C2=A0 troff=3D/usr/bin/troff<br>
-+=C2=A0 nroff=3D/usr/bin/nroff<br>
-+=C2=A0 jnroff=3D/usr/bin/nroff<br>
-=C2=A0 =C2=A0eqn=3D&quot;&quot;<br>
-=C2=A0 =C2=A0neqn=3D&quot;&quot;<br>
-=C2=A0 =C2=A0jneqn=3D&quot;&quot;<br>
-@@ -453,6 +453,8 @@<br>
-=C2=A0 =C2=A0 =C2=A0done<br>
-=C2=A0 =C2=A0done<br>
-=C2=A0 =C2=A0Fgroff=3D/usr/bin/groff<br>
-+=C2=A0 Fnroff=3D/usr/bin/nroff<br>
-+=C2=A0 Fjnroff=3D/usr/bin/nroff<br>
-=C2=A0 =C2=A0Fgeqn=3D/usr/bin/geqn<br>
-=C2=A0 =C2=A0Fgtbl=3D/usr/bin/gtbl<br>
-=C2=A0 =C2=A0Fcol=3D/usr/bin/col<br>
-@@ -485,25 +487,25 @@<br>
-=C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0if test $Fnroff =3D &quot;missing&quot;<br>
-=C2=A0 =C2=A0 =C2=A0then<br>
--=C2=A0 =C2=A0 =C2=A0 nroff=3D&quot;nroff -Tlatin1 -mandoc&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 nroff=3D&quot;nroff -Tutf8 -mandoc&quot;<br>
-=C2=A0 =C2=A0 =C2=A0else<br>
--=C2=A0 =C2=A0 =C2=A0 nroff=3D&quot;$Fnroff -Tlatin1 -mandoc&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 nroff=3D&quot;$Fnroff -Tutf8 -mandoc&quot;<br>
-=C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0troff=3D&quot;troff -mandoc&quot;<br>
-=C2=A0 =C2=A0 =C2=A0echo &quot;Warning: could not find groff&quot;<br>
-=C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0if test $Fnroff =3D &quot;missing&quot;<br>
-=C2=A0 =C2=A0 =C2=A0then<br>
--=C2=A0 =C2=A0 =C2=A0 nroff=3D&quot;$Fgroff -Tlatin1 -mandoc&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 nroff=3D&quot;$Fgroff -Tutf8 -mandoc&quot;<br>
-=C2=A0 =C2=A0 =C2=A0else<br>
--=C2=A0 =C2=A0 =C2=A0 nroff=3D&quot;$Fnroff -Tlatin1 -mandoc&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 nroff=3D&quot;$Fnroff -Tutf8 -mandoc&quot;<br>
-=C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0troff=3D&quot;$Fgroff -Tps -mandoc&quot;<br>
--=C2=A0 =C2=A0 jnroff=3D&quot;$Fgroff -Tnippon -mandocj&quot;<br>
-+=C2=A0 =C2=A0 jnroff=3D&quot;$Fjnroff -Tutf8 -mandocj&quot;<br>
-=C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0eqn=3D&quot;$Fgeqn -Tps&quot;<br>
--=C2=A0 neqn=3D&quot;$Fgeqn -Tlatin1&quot;<br>
--=C2=A0 jneqn=3D&quot;$Fgeqn -Tnippon&quot;<br>
-+=C2=A0 neqn=3D&quot;$Fgeqn -Tutf8&quot;<br>
-+=C2=A0 jneqn=3D&quot;$Fgeqn -Tutf8&quot;<br>
-=C2=A0 =C2=A0tbl=3D&quot;$Fgtbl&quot;<br>
-=C2=A0 =C2=A0col=3D&quot;$Fcol&quot;<br>
-=C2=A0 =C2=A0vgrind=3D&quot;$Fvgrind&quot;<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5k-confpath.patch b/m=
eta/recipes-extended/man/ma<wbr>n/man-1.5k-confpath.patch<br>
deleted file mode 100644<br>
index b5746c2df80..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5k-confpath.patch<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- configure=C2=A0 2006-05-01 19:56:14.000000000 +0200<br>
-+++ configure.oden=C2=A0 =C2=A0 =C2=A02008-12-21 19:16:50.000000000 +0100<=
br>
-@@ -198,7 +198,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0confdir=3D&quot;${confprefix}/share/<wbr>misc&quot;<br=
>
-=C2=A0 =C2=A0fi<br>
- fi<br>
--conffilename=3D&quot;man.conf&quot;<br>
-+conffilename=3D&quot;man.config&quot;<br>
-<br>
- if test &quot;$RANDOM&quot; =3D &quot;$RANDOM&quot;; then<br>
-=C2=A0 =C2=A0# Plain old Bourne shell.<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5k-nonascii.patch b/m=
eta/recipes-extended/man/ma<wbr>n/man-1.5k-nonascii.patch<br>
deleted file mode 100644<br>
index d662d9b6a70..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5k-nonascii.patch<br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- ./src/apropos.sh.nonascii=C2=A0 2001-11-23 00:30:42.000000000 +0100<br=
>
-+++ ./src/apropos.sh=C2=A0 =C2=A02002-08-13 15:44:53.000000000 +0200<br>
-@@ -18,9 +18,9 @@<br>
-<br>
- # When man pages in your favorite locale look to grep like binary files<b=
r>
- # (and you use GNU grep) you may want to add the &#39;a&#39; option to *g=
repopt1.<br>
--aproposgrepopt1=3D&#39;i&#39;<br>
-+aproposgrepopt1=3D&#39;ia&#39;<br>
- aproposgrepopt2=3D&#39;&#39;<br>
--whatisgrepopt1=3D&#39;iw&#39;<br>
-+whatisgrepopt1=3D&#39;iwa&#39;<br>
- whatisgrepopt2=3D&#39;^&#39;<br>
- grepopt1=3D$%apropos_or_whatis%g<wbr>repopt1<br>
- grepopt2=3D$%apropos_or_whatis%g<wbr>repopt2<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5k-sofix.patch b/meta=
/recipes-extended/man/ma<wbr>n/man-1.5k-sofix.patch<br>
deleted file mode 100644<br>
index 50b925288ec..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5k-sofix.patch<br>
+++ /dev/null<br>
@@ -1,24 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- man-1.5j/src/man.c.sofix=C2=A0 =C2=A0Thu Nov 22 14:51:44 2001<br>
-+++ man-1.5j/src/man.c Thu Nov 22 14:52:44 2001<br>
-@@ -300,7 +300,7 @@<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 if (strlen(name0) &gt;=3D sizeof(ultname))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return name0;<br>
--=C2=A0 =C2=A0 =C2=A0strcpy(ultname, name0);<br>
-+=C2=A0 =C2=A0 =C2=A0strncpy(ultname, name0, BUFSIZE-32);<br>
-=C2=A0 =C2=A0 =C2=A0 name =3D ultname;<br>
-<br>
- again:<br>
-@@ -332,7 +332,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * .so files - we could glob for all pos=
sible extensions,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * for now: only try .gz<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (fp =3D=3D NULL &amp;&amp; get_expand=
er(&quot;.gz&quot;) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fp =3D=3D NULL &amp;&amp; get_expander(&q=
uot;.gz&quot;) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strlen(name=
)+strlen(&quot;.gz&quot;) &lt; BUFSIZE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strcat(name, &quot;.gz&qu=
ot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fp =3D fopen (name, &quot=
;r&quot;);<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5m2-bug11621.patch b/=
meta/recipes-extended/man/ma<wbr>n/man-1.5m2-bug11621.patch<br>
deleted file mode 100644<br>
index 051299906b8..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5m2-bug11621.patch<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- ./<a href=3D"http://configure.ad" rel=3D"noreferrer" target=3D"_blank"=
>configure.ad</a>=C2=A0 =C2=A0 =C2=A02003-12-11 19:17:10.000000000 +0100<br=
>
-+++ ./configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 2003-12-11 19:17:27.000000000 +=
0100<br>
-@@ -26,7 +26,7 @@<br>
- # (Indeed, -r may cause the terminal to get into funny states.<br>
- # Very inconvenient. For viewing pages in strange locales, set LC_*.)<br>
- #<br>
--DEFAULTLESSOPT=3D&quot;-is&quot;<br>
-+DEFAULTLESSOPT=3D&quot;-isr&quot;<br>
- #<br>
- # Note that not creating any cat directories (/var/cache/man or so)<br>
- # and not making man suid or sgid is recommended.<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5m2-buildroot.patch b=
/meta/recipes-extended/man/ma<wbr>n/man-1.5m2-buildroot.patch<br>
deleted file mode 100644<br>
index bc97f56b9af..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5m2-buildroot.patch<br>
+++ /dev/null<br>
@@ -1,52 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- ./configure.less=C2=A0 =C2=A02003-12-11 19:18:15.000000000 +0100<br>
-+++ ./configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 2003-12-11 19:20:03.000000000 +=
0100<br>
-@@ -401,18 +401,13 @@<br>
-<br>
- if test &quot;$ans&quot; =3D &quot;false&quot;<br>
- then<br>
--=C2=A0 for i in more less cmp cat awk gawk mawk<br>
--=C2=A0 do<br>
--=C2=A0 =C2=A0 eval F$i=3D&quot;missing&quot;<br>
--=C2=A0 =C2=A0 for j in $DEFPATH<br>
--=C2=A0 =C2=A0 do<br>
--=C2=A0 =C2=A0 =C2=A0 if test -f $j/$i<br>
--=C2=A0 =C2=A0 =C2=A0 then<br>
--=C2=A0 =C2=A0 =C2=A0 eval F$i=3D$j/$i<br>
--=C2=A0 =C2=A0 =C2=A0 break<br>
--=C2=A0 =C2=A0 =C2=A0 fi<br>
--=C2=A0 =C2=A0 done<br>
--=C2=A0 done<br>
-+=C2=A0 Fmore=3D/bin/more<br>
-+=C2=A0 Fless=3D/usr/bin/less<br>
-+=C2=A0 Fcmp=3D/usr/bin/cmp<br>
-+=C2=A0 Fcat=3D/bin/cat<br>
-+=C2=A0 Fgawk=3D/bin/gawk<br>
-+=C2=A0 Fawk=3D/bin/gawk<br>
-+=C2=A0 Fmawk=3Dmissing<br>
-=C2=A0 =C2=A0troff=3D&quot;&quot;<br>
-=C2=A0 =C2=A0nroff=3D&quot;&quot;<br>
-=C2=A0 =C2=A0jnroff=3D&quot;&quot;<br>
-@@ -457,6 +452,19 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0done<br>
-=C2=A0 =C2=A0done<br>
-+=C2=A0 Fgroff=3D/usr/bin/groff<br>
-+=C2=A0 Fgeqn=3D/usr/bin/geqn<br>
-+=C2=A0 Fgtbl=3D/usr/bin/gtbl<br>
-+=C2=A0 Fcol=3D/usr/bin/col<br>
-+=C2=A0 Fgrefer=3D/usr/bin/grefer<br>
-+=C2=A0 Fgpic=3D/usr/bin/gpic<br>
-+=C2=A0 Fmore=3D/bin/more<br>
-+=C2=A0 Fless=3D/usr/bin/less<br>
-+=C2=A0 Fcmp=3D/usr/bin/cmp<br>
-+=C2=A0 Fcat=3D/bin/cat<br>
-+=C2=A0 Fgawk=3D/bin/gawk<br>
-+<br>
-+<br>
-=C2=A0 =C2=A0for i in eqn tbl refer pic<br>
-=C2=A0 =C2=A0do<br>
-=C2=A0 =C2=A0 =C2=A0if test `eval echo \\$Fg$i` =3D &quot;missing&quot;<br=
>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5m2-no-color-for-prin=
t<wbr>ing.patch b/meta/recipes-extended/man/ma<wbr>n/man-1.5m2-no-color-for=
-print<wbr>ing.patch<br>
deleted file mode 100644<br>
index c85ff1d8c72..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5m2-no-color-for-print<wbr>i=
ng.patch<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- man-1.5m2/configure.color=C2=A0 2006-09-16 18:27:37.000000000 +0200<br=
>
-+++ man-1.5m2/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 2006-09-16 18:28:44.000=
000000 +0200<br>
-@@ -539,6 +539,8 @@<br>
-=C2=A0 =C2=A0 =C2=A0troff=3D&quot;$troff -c&quot;<br>
-=C2=A0 =C2=A0 =C2=A0nroff=3D&quot;$nroff -c&quot;<br>
-=C2=A0 =C2=A0 =C2=A0jnroff=3D&quot;$jnroff -c&quot;<br>
-+else<br>
-+=C2=A0 =C2=A0 troff=3D&quot;$troff -c&quot;<br>
- fi<br>
-<br>
- if [ x$default =3D x ]; then<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.5m2-sigpipe.patch b/m=
eta/recipes-extended/man/ma<wbr>n/man-1.5m2-sigpipe.patch<br>
deleted file mode 100644<br>
index 8af78eab7b1..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.5m2-sigpipe.patch<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- man-1.5m2/src/util.c_sigpipe=C2=A0 =C2=A0 =C2=A0 =C2=A02006-12-09 13:4=
3:21.000000000 +0100<br>
-+++ man-1.5m2/src/util.c=C2=A0 =C2=A0 =C2=A0 =C2=A02006-12-09 13:53:13.000=
000000 +0100<br>
-@@ -116,11 +116,14 @@<br>
- static int<br>
- system1 (const char *command) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*prev_handler)(int) =3D signal (SIGINT,ca=
tch_int);<br>
-+=C2=A0 =C2=A0 =C2=A0 signal (SIGPIPE,SIG_IGN);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D system(command);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* child terminated with signal? */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (WIFSIGNALED(ret) &amp;&amp;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (WTERMSIG(ret) =3D=3D SIGINT || WTERMS=
IG(ret) =3D=3D SIGQUIT))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (WTERMSIG(ret) =3D=3D SIGINT ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WTERMSIG(ret) =3D=
=3D SIGPIPE ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WTERMSIG(ret) =3D=
=3D SIGQUIT))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* or we caught an interrupt? */<br>
-@@ -128,6 +131,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0signal(SIGINT,prev_handler);<br>
-+=C2=A0 =C2=A0 =C2=A0 signal(SIGPIPE,SIG_DFL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
- }<br>
-<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-i18n_whatis.patch =
b/meta/recipes-extended/man/ma<wbr>n/man-1.6e-i18n_whatis.patch<br>
deleted file mode 100644<br>
index e321325d63f..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-i18n_whatis.patch<br>
+++ /dev/null<br>
@@ -1,145 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
-diff -Naur man-1.6e.orig/src/apropos.sh man-1.6e/src/apropos.sh<br>
---- man-1.6e.orig/src/apropos.sh=C2=A0 =C2=A0 =C2=A0 =C2=A02007-05-18 13:4=
9:31.000000000 -0300<br>
-+++ man-1.6e/src/apropos.sh=C2=A0 =C2=A0 2007-05-18 14:24:33.000000000 -03=
00<br>
-@@ -60,16 +60,56 @@<br>
-=C2=A0 =C2=A0 =C2=A0esac<br>
- done<br>
-<br>
-+# list of languages to look for<br>
-+LANG_LIST=3D`echo $LANGUAGE:$LC_ALL:$LC_MESSAGES<wbr>:$LANG | tr &#39;:&#=
39; &#39; &#39;`<br>
-+DIR_LIST=3D&quot;&quot;<br>
-+for d in /var/cache/man $manpath /usr/lib<br>
-+do<br>
-+=C2=A0 =C2=A0 for l in $LANG_LIST<br>
-+=C2=A0 =C2=A0 do<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -d $d/$l ]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # check that the path is not al=
ready in the list<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! echo &quot;$DIR_LIST&quot;=
 | grep &quot; $d/$l\b&quot; &gt; /dev/null<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DIR_LIST=3D&quot;=
$DIR_LIST $d/$l&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-+=C2=A0 =C2=A0 done<br>
-+=C2=A0 =C2=A0 DIR_LIST=3D&quot;$DIR_LIST $d&quot;<br>
-+=C2=A0 =C2=A0 # check that the path is not already in the list<br>
-+=C2=A0 =C2=A0 if ! echo &quot;$DIR_LIST&quot; | grep &quot; $d\b&quot; &g=
t; /dev/null<br>
-+=C2=A0 =C2=A0 then<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DIR_LIST=3D&quot;$DIR_LIST $d/$l&quot;<br>
-+=C2=A0 =C2=A0 fi<br>
-+done<br>
-+<br>
- while [ &quot;$1&quot; !=3D &quot;&quot; ]<br>
- do<br>
-=C2=A0 =C2=A0 =C2=A0found=3D0<br>
--=C2=A0 =C2=A0 for d in /var/cache/man $manpath /usr/lib<br>
-+=C2=A0 =C2=A0 # in order not to display lines in more than one language f=
or<br>
-+=C2=A0 =C2=A0 # a same man page; we check that a given man page name<br>
-+=C2=A0 =C2=A0 # hasn&#39;t already been displayed<br>
-+=C2=A0 =C2=A0 BAZ=3D&quot;&quot;<br>
-+=C2=A0 =C2=A0 for d in $DIR_LIST<br>
-=C2=A0 =C2=A0 =C2=A0do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f $d/whatis ]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep -&quot;$grepopt1&quot; =
&quot;$grepopt2&quot;&quot;$1&quot; $d/whatis<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if FOO=3D`grep -&quot;$grepopt1=
&quot; &quot;$grepopt2&quot;&quot;$1&quot; $d/whatis`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found=3D1<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the LC_ALL=3DC =
is needed in case the text is<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # in a different =
encoding than the locale<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BAR=3D`echo -e &q=
uot;$FOO&quot; | LC_ALL=3DC sed &#39;s/ - .*$//&#39; | tr &#39; []&#39; &#3=
9;_&#39; | sort -u`<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in $BAR<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
! echo &quot;$BAZ&quot; | grep &quot;$i&quot; &gt; /dev/null<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the=
n<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BAZ=3D&quot;$BAZ $i&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 i=3D&quot;^`echo $i | sed &#39;s:_\+:\\\(\[_ \]\\\|\\\[\\\|\\\]\=
\\)\\\+:g&#39;`<wbr>&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo -e &quot;$FOO&quot; | grep &quot;$i&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 found=3D1<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
- # Some people are satisfied with a single occurrence<br>
- # But it is better to give all<br>
- #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
-diff -Naur man-1.6e.orig/src/makewhatis.s<wbr>h man-1.6e/src/makewhatis.sh=
<br>
---- man-1.6e.orig/src/makewhatis.s<wbr>h=C2=A0 =C2=A0 2007-05-18 13:49:31.=
000000000 -0300<br>
-+++ man-1.6e/src/makewhatis.sh 2007-05-18 13:50:07.000000000 -0300<br>
-@@ -41,12 +41,32 @@<br>
-<br>
- program=3D`basename $0`<br>
-<br>
-+# this allows to define language specific values fro NAME, DESCRIPTION<br=
>
-+# if not defined, using those default values<br>
-+if [ -z &quot;$MAN_NAME&quot; ]<br>
-+then<br>
-+=C2=A0 =C2=A0 =C2=A0 MAN_NAME=3D&quot;=D0=98=D0=9C=D0=95|NOM|JM=C3=89NO|N=
AVN|=CE=9F<wbr>=CE=9D=CE=9F=CE=9C=CE=91|NOMBRE|NIME|IZENA|NIMI|IM<wbr>E|\<b=
r>
-+N=C3=89V|NOME|=E5=90=8D=E5=89=8D|=EC=9D=B4=EB=A6=84|NAAM|NAZWA|NU<wbr>ME|=
=D0=98=D0=9C=D0=AF|MENO|=D0=9D=D0=90=D0=97=D0=92=D0=90|=E5=90=8D=E7=A7=B0|=
=E5=90=8D=E7=A8=B1&quot;<br>
-+fi<br>
-+if [ -z &quot;$MAN_DESCRIPTION&quot; ]<br>
-+then<br>
-+=C2=A0 =C2=A0 =C2=A0 MAN_DESCRIPTION=3D&quot;=D0=9E=D0=9F=D0=98=D0=A1=D0=
=90=D0=9D=D0=98=D0=95|DESC<wbr>RIPCI=C3=93|POPIS|BESKRIVELSE|BESCH<wbr>REIB=
UNG|\<br>
-+=CE=A0=CE=95=CE=A1=CE=99=CE=93=CE=A1=CE=91=CE=A6=CE=97|DESCRIPCI=C3=93N|K=
IRJEL<wbr>DUS|AZALPENA|KUVAUS|OPIS|<wbr>LE=C3=8DR=C3=81S|DESCRIZIONE|\<br>
-+=E8=AA=AC=E6=98=8E|=EC=84=A4=EB=AA=85|BESCHRIJVING|DESCRI=C3=87=C3=83O<wb=
r>|DESCRIERE|=D0=9E=D0=9F=D0=98=D0=A1|=E6=8F=8F=E8=BF=B0&quot;<br>
-+fi<br>
-+# make them into awk regexp<br>
-+MAN_NAME=3D&quot;^(${MAN_NAME})&quot;;<br>
-+MAN_DESCRIPTION=3D&quot;^(${MAN_DES<wbr>CRIPTION})&quot;;<br>
-+<br>
- # In case both /usr/man and /usr/share/man exist, the former is local<br>
- # and should be first.<br>
- # It is a bug to add /var/cache/man to DEFCATPATH.<br>
- dm=3D<br>
- for d in /usr/share/man /usr/man /usr/X11R6/man /usr/local/man<br>
- do<br>
-+=C2=A0 =C2=A0 if [ -n &quot;$LANG&quot; -a -d &quot;$d/$LANG&quot; ]; the=
n<br>
-+=C2=A0 =C2=A0 =C2=A0 if [ x$dm =3D x ]; then dm=3D&quot;$d/$LANG&quot;; e=
lse dm=3D$dm:&quot;$d/$LANG&quot;; fi<br>
-+=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0if [ -d $d ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ x$dm =3D x ]; then dm=3D$d; else dm=3D$dm:=
$d; fi<br>
-=C2=A0 =C2=A0 =C2=A0fi<br>
-@@ -55,6 +75,9 @@<br>
- dc=3D<br>
- for d in /var/cache/man /usr/share/man/preformat /usr/man/preformat /usr/=
share/man /usr/man<br>
- do<br>
-+=C2=A0 =C2=A0 if [ -n &quot;$LANG&quot; -a -d &quot;$d/$LANG&quot; ]; the=
n<br>
-+=C2=A0 =C2=A0 =C2=A0 if [ x$dc =3D x ]; then dm=3D&quot;$d/$LANG&quot;; e=
lse dm=3D$dc:&quot;$d/$LANG&quot;; fi<br>
-+=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0if [ -d $d ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ x$dc =3D x ]; then dc=3D$d; else dc=3D$dc:=
$d; fi<br>
-=C2=A0 =C2=A0 =C2=A0fi<br>
-@@ -194,7 +217,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0section=3D$i<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0curdir=3D$mandir/${pages}$i<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export section verbose curdir<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find $mandir/${pages}$i/. -name &#39;*=
&#39; $findarg0 $findarg -print | $AWK &#39;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find $mandir/${pages}$i/. -name &#39;*=
&#39; $findarg0 $findarg -print | LC_ALL=3DC $AWK -v MAN_NAME=3D&quot;$MAN_=
NAME&quot; -v MAN_DESCRIPTION=3D&quot;$MAN_DESCRIPT<wbr>ION&quot; &#39;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0function readline() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (use_zcat || use_bzcat)=
 {<br>
-@@ -261,13 +284,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(/.\b/, &quot;&=
quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (($1 ~ /^\.[Ss][=
Hh]/ &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0($2 ~ /[Nn][=
Aa][Mm][Ee]/ ||<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$2 ~ /^JM=
=C3=89NO/ || $2 ~ /^NAVN/ || $2 ~ /^NUME/ ||<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$2 ~ /^BEZE=
ICHNUNG/ || $2 ~ /^NOMBRE/ ||<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$2 ~ /^NIMI=
/ || $2 ~ /^NOM/ || $2 ~ /^IME/ ||<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$2 ~ /^N[=
=C3=89E]V/ || $2 ~ /^NAMA/ || $2 ~ /^=CC=BE=EF=BF=BD=C2=B0/ ||<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$2 ~ /^=CC=
=BE=EF=BF=BD=C3=8E/ || $2 ~ /^=EF=BF=BD=CC=B8=C2=A7/ || $2 ~ /^NAZWA/ ||<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$2 ~ /^=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=C3=A5/ || $2 ~=
 /^=EF=BF=BD=EF=BF=BD=EF=BF=BD=C3=86/ || $2 ~ /^=C2=A6W=EF=BF=BD=C3=99/ ||<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$2 ~ /^NOME=
/ || $2 ~ /^NAAM/ || $2 ~ /^=EF=BF=BD=EF=BF=BD=C3=85/)) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$2 ~ MAN_NA=
ME )) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(pages =3D=
=3D &quot;cat&quot; &amp;&amp; $1 ~ /^NAME/)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!=
insh) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0insh =3D 1;<br>
-@@ -278,6 +295,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($1 ~ /^\=
.[Ss][HhYS]/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(page=
s =3D=3D &quot;cat&quot; &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0($1 ~=
 /^S[yYeE]/ || $1 ~ /^DESCRIPTION/ ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$1 ~=
 MAN_DESCRIPTION ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $1 ~=
 /^COMMAND/ || $1 ~ /^OVERVIEW/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $1 ~=
 /^STRUCTURES/ || $1 ~ /^INTRODUCTION/ ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $0 ~=
 /^[^ ]/))) {<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-mandirs.patch b/me=
ta/recipes-extended/man/ma<wbr>n/man-1.6e-mandirs.patch<br>
deleted file mode 100644<br>
index b240064c980..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-mandirs.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- man-1.6e.orig/src/<a href=3D"http://man.conf.in" rel=3D"noreferrer" ta=
rget=3D"_blank">man.conf.in</a>=C2=A0 =C2=A0 =C2=A0 2005-08-20 20:26:06.000=
000000 -0300<br>
-+++ man-1.6e/src/<a href=3D"http://man.conf.in" rel=3D"noreferrer" target=
=3D"_blank">man.conf.in</a>=C2=A0 =C2=A02007-05-18 10:30:29.000000000 -0300=
<br>
-@@ -36,11 +36,12 @@<br>
- #<br>
- # Every automatically generated MANPATH includes these fields<br>
- #<br>
--MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/man<br>
- MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/share/man<br>
-+MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/X11R6/man<br>
- MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/local/man<br>
- MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/local/share/man<br>
--MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/X11R6/man<br>
-+MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/kerberos/man<br>
-+MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/man<br>
- #<br>
- # Uncomment if you want to include one of these by default<br>
- #<br>
-@@ -67,6 +68,9 @@<br>
- MANPATH_MAP=C2=A0 =C2=A0/usr/X11R6/bin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/usr/X11R6/man<br>
- MANPATH_MAP=C2=A0 =C2=A0/usr/bin/X11=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /usr/X11R6/man<br>
- MANPATH_MAP=C2=A0 =C2=A0/usr/bin/mh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/usr/share/man<br>
-+MANPATH_MAP=C2=A0 =C2=A0/usr/kerberos/bin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/usr/kerberos/man<br>
-+MANPATH_MAP=C2=A0 =C2=A0/usr/kerberos/sbin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /usr/kerberos/man<br>
-+<br>
- #<br>
- # NOAUTOPATH keeps man from automatically adding directories that look li=
ke<br>
- # manual page directories to the path.<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-new_sections.patch=
 b/meta/recipes-extended/man/ma<wbr>n/man-1.6e-new_sections.patch<br>
deleted file mode 100644<br>
index fb9773c646e..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-new_sections.patch<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
---- man-1.6e.orig/configure=C2=A0 =C2=A0 2006-05-01 14:56:14.000000000 -03=
00<br>
-+++ man-1.6e/configure 2007-05-18 14:35:43.000000000 -0300<br>
-@@ -960,7 +960,7 @@<br>
-<br>
- # What sections do we anticipate?<br>
-<br>
--tmpsections=3D&quot;1 1p 8 2 3 3p 4 5 6 7 9 0p tcl n l p o&quot;<br>
-+tmpsections=3D&quot;1 1p 8 2 3 3p 3pm 4 5 6 7 9 0p tcl n l p o&quot;<br>
-<br>
- if [ x$default =3D x ]; then<br>
-=C2=A0 =C2=A0echo &quot;&quot;<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-ro_usr.patch b/met=
a/recipes-extended/man/ma<wbr>n/man-1.6e-ro_usr.patch<br>
deleted file mode 100644<br>
index 1d1cb0c724c..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-ro_usr.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
-Index: man-1.6f/src/makewhatis.sh<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- man-1.6f.orig/src/makewhatis.s<wbr>h=C2=A0 =C2=A0 2010-12-29 13:42:34.=
000000000 -0800<br>
-+++ man-1.6f/src/makewhatis.sh 2010-12-29 13:42:35.667428347 -0800<br>
-@@ -124,7 +124,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;;<br>
-=C2=A0 =C2=A0 =C2=A0-s) setsections=3D1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;;<br>
--=C2=A0 =C2=A0 -u) findarg=3D&quot;-ctime 0&quot;<br>
-+=C2=A0 =C2=A0 -u) findarg=3D&quot;-newer /var/cache/man/whatis&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0update=3D1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;;<br>
-=C2=A0 =C2=A0 =C2=A0-v) verbose=3D1<br>
-@@ -165,14 +165,7 @@<br>
- # first truncate all the whatis files that will be created new,<br>
- # then only update - we might visit the same directory twice<br>
- if [ x$update =3D x ]; then<br>
--=C2=A0 =C2=A0for pages in man cat<br>
--=C2=A0 =C2=A0do<br>
--=C2=A0 =C2=A0 =C2=A0 eval path=3D&quot;\$$pages&quot;path<br>
--=C2=A0 =C2=A0 =C2=A0 for mandir in $path<br>
--=C2=A0 =C2=A0 =C2=A0 do<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0cp /dev/null $mandir/whatis<br>
--=C2=A0 =C2=A0 =C2=A0 done<br>
--=C2=A0 =C2=A0done<br>
-+=C2=A0 =C2=A0cp /dev/null /var/cache/man/whatis<br>
- fi<br>
-<br>
- for pages in man cat<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-security.patch b/m=
eta/recipes-extended/man/ma<wbr>n/man-1.6e-security.patch<br>
deleted file mode 100644<br>
index 312a882f063..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-security.patch<br>
+++ /dev/null<br>
@@ -1,62 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
-diff -Naur man-1.6e.orig/src/makewhatis.s<wbr>h man-1.6e/src/makewhatis.sh=
<br>
---- man-1.6e.orig/src/makewhatis.s<wbr>h=C2=A0 =C2=A0 2006-07-19 01:58:08.=
000000000 -0300<br>
-+++ man-1.6e/src/makewhatis.sh 2007-05-18 10:18:31.000000000 -0300<br>
-@@ -45,7 +45,7 @@<br>
- # and should be first.<br>
- # It is a bug to add /var/cache/man to DEFCATPATH.<br>
- dm=3D<br>
--for d in /usr/man /usr/share/man /usr/X11R6/man /usr/local/man<br>
-+for d in /usr/share/man /usr/man /usr/X11R6/man /usr/local/man<br>
- do<br>
-=C2=A0 =C2=A0 =C2=A0if [ -d $d ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ x$dm =3D x ]; then dm=3D$d; else dm=3D$dm:=
$d; fi<br>
-@@ -53,7 +53,7 @@<br>
- done<br>
- DEFMANPATH=3D$dm<br>
- dc=3D<br>
--for d in /usr/man/preformat /usr/man /usr/share/man/preformat /usr/share/=
man<br>
-+for d in /var/cache/man /usr/share/man/preformat /usr/man/preformat /usr/=
share/man /usr/man<br>
- do<br>
-=C2=A0 =C2=A0 =C2=A0if [ -d $d ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ x$dc =3D x ]; then dc=3D$d; else dc=3D$dc:=
$d; fi<br>
-@@ -76,12 +76,12 @@<br>
- # We try here to be careful (and avoid preconstructed symlinks)<br>
- # in case makewhatis is run as root, by creating a subdirectory of /tmp.<=
br>
-<br>
--TMPFILEDIR=3D/tmp/whatis.tmp.d<wbr>ir.$$<br>
--rm -rf $TMPFILEDIR<br>
--if ! mkdir -m 0700 $TMPFILEDIR; then<br>
--=C2=A0 =C2=A0 echo Could not create $TMPFILEDIR<br>
--=C2=A0 =C2=A0 exit 1;<br>
-+TMPFILEDIR=3D`mktemp -d /tmp/makewhatisXXXXXX`<br>
-+if [ $? -ne 0 ]; then<br>
-+=C2=A0 =C2=A0echo &quot;$0: Can&#39;t create temp file, exiting...&quot;<=
br>
-+=C2=A0 =C2=A0exit 1<br>
- fi<br>
-+chmod 0700 $TMPFILEDIR<br>
- TMPFILE=3D$TMPFILEDIR/w<br>
-<br>
- # make sure TMPFILEDIR is deleted if program is killed or terminates<br>
-diff -Naur man-1.6e.orig/src/man.c man-1.6e/src/man.c<br>
---- man-1.6e.orig/src/man.c=C2=A0 =C2=A0 2006-05-01 17:34:22.000000000 -03=
00<br>
-+++ man-1.6e/src/man.c 2007-05-18 10:11:33.000000000 -0300<br>
-@@ -1234,7 +1234,6 @@<br>
- #endif<br>
-<br>
-<br>
--#if 0<br>
-=C2=A0 =C2=A0 =C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* There are no known cases of buffer overflow =
caused by<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 excessively long environment variables.=
 In case you find one,<br>
-@@ -1257,7 +1256,6 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAN_ICONV_PATH, MAN_ICONV_OPT, MAN_ICON=
V_INPUT_CHARSET,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAN_ICONV_OUTPUT_CHARSET, NLSPATH, PATH=
 */<br>
-=C2=A0 =C2=A0 =C2=A0 }<br>
--#endif<br>
-<br>
-<br>
- #ifndef __FreeBSD__<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-use_i18n_vars_in_a=
_<wbr>std_way.patch b/meta/recipes-extended/man/ma<wbr>n/man-1.6e-use_i18n_=
vars_in_a_<wbr>std_way.patch<br>
deleted file mode 100644<br>
index 568f742100c..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-use_i18n_vars_in_a_<wbr>s=
td_way.patch<br>
+++ /dev/null<br>
@@ -1,160 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
-diff -Naur man-1.6e.orig/catopen/catopen.<wbr>c man-1.6e/catopen/catopen.c=
<br>
---- man-1.6e.orig/catopen/catopen.<wbr>c=C2=A0 =C2=A0 2005-08-20 20:26:06.=
000000000 -0300<br>
-+++ man-1.6e/catopen/catopen.c 2007-05-18 11:31:05.000000000 -0300<br>
-@@ -9,22 +9,63 @@<br>
- extern char *index (const char *, int);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* not always in &lt;string.h&gt; */<br>
- extern char *my_malloc(int);=C2=A0 /* in util.c */<br>
-<br>
-+/* if the program has sgid/suid privileges then getenv doesn&#39;t return=
<br>
-+ * NLSPATH; so we set here a good default value.<br>
-+ */<br>
- #ifndef DEFAULT_NLSPATH<br>
- # if __GLIBC__ &gt;=3D 2<br>
--#=C2=A0 define DEFAULT_NLSPATH &quot;/usr/share/locale/%L/%N&quot;<br>
-+#=C2=A0 define DEFAULT_NLSPATH &quot;/usr/share/locale/%L/%N:/usr/<wbr>sh=
are/locale/%l_%t/%N:/usr/sha<wbr>re/locale/%l/%N&quot;<br>
- # else<br>
- #=C2=A0 define DEFAULT_NLSPATH &quot;/usr/lib/locale/%N/%L&quot;<br>
- # endif<br>
- #endif<br>
-<br>
--static nl_catd my_catopenpath(char *name, char *path);<br>
-+static nl_catd my_catopenpath(char *name, char *path, char *lang);<br>
-<br>
- static=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* this source included in gr=
ipes.c */<br>
- nl_catd<br>
- my_catopen(char *name, int oflag) {<br>
--=C2=A0 nl_catd fd;<br>
-+=C2=A0 nl_catd fd =3D (nl_catd) -1;<br>
-+<br>
-+=C2=A0 /* using first the my_catopenpath, which looks with LANGUAGE<br>
-+=C2=A0 =C2=A0* and only if it fails ressort to catopen, it gives better i=
18n<br>
-+=C2=A0 =C2=A0*/<br>
-+=C2=A0 {<br>
-+=C2=A0 =C2=A0 char *nlspath, *lang, *s;<br>
-<br>
--=C2=A0 fd =3D catopen(name, oflag);<br>
-+=C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0* &quot;If NLSPATH does not exist in the environment,=
 or if a<br>
-+=C2=A0 =C2=A0 =C2=A0* message catalog cannot be opened in any of the path=
s specified<br>
-+=C2=A0 =C2=A0 =C2=A0* by NLSPATH, then an implementation defined default =
path is used&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 nlspath =3D getenv(&quot;NLSPATH&quot;);<br>
-+=C2=A0 =C2=A0 if (!nlspath)<br>
-+=C2=A0 =C2=A0 =C2=A0 nlspath =3D DEFAULT_NLSPATH;<br>
-+<br>
-+=C2=A0 =C2=A0 lang =3D getenv(&quot;LANGUAGE&quot;);<br>
-+=C2=A0 =C2=A0 if (!lang)<br>
-+=C2=A0 =C2=A0 =C2=A0 lang =3D getenv(&quot;LC_ALL&quot;);<br>
-+=C2=A0 =C2=A0 if (!lang)<br>
-+=C2=A0 =C2=A0 =C2=A0 lang =3D getenv(&quot;LC_MESSAGES&quot;);<br>
-+=C2=A0 =C2=A0 if (!lang)<br>
-+=C2=A0 =C2=A0 =C2=A0 lang =3D getenv(&quot;LANG&quot;);<br>
-+=C2=A0 =C2=A0 if (!lang)<br>
-+=C2=A0 =C2=A0 =C2=A0 lang =3D &quot;&quot;;<br>
-+<br>
-+=C2=A0 =C2=A0 while(*lang &amp;&amp; (fd =3D=3D (nl_catd) -1)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 s =3D index(lang, &#39;:&#39;);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (s) *s =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D my_catopenpath(name, nlspath, lang);<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 if (s) lang=3Ds+1;<br>
-+=C2=A0 =C2=A0 =C2=A0 else lang =3D &quot;&quot;;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 if (fd =3D=3D (nl_catd) -1)<br>
-+=C2=A0 =C2=A0 =C2=A0 fd =3D my_catopenpath(name, nlspath, &quot;en&quot;)=
;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 /* still not found, use the system catopen */<br>
-+=C2=A0 if (fd =3D=3D (nl_catd) -1)<br>
-+=C2=A0 =C2=A0 fd =3D catopen(name, oflag);<br>
-<br>
-=C2=A0 =C2=A0if (fd =3D=3D (nl_catd) -1 &amp;&amp; oflag) {<br>
-=C2=A0 =C2=A0 =C2=A0oflag =3D 0;<br>
-@@ -32,8 +73,6 @@<br>
-=C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0if (fd =3D=3D (nl_catd) -1) {<br>
--=C2=A0 =C2=A0 char *nlspath;<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0/* The libc catopen fails - let us see if we can do be=
tter */<br>
-=C2=A0 =C2=A0 =C2=A0/* The quotes below are from X/Open, XPG 1987, Vol. 3.=
 */<br>
-<br>
-@@ -58,17 +97,6 @@<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 /*<br>
--=C2=A0 =C2=A0 =C2=A0* &quot;If NLSPATH does not exist in the environment,=
 or if a<br>
--=C2=A0 =C2=A0 =C2=A0* message catalog cannot be opened in any of the path=
s specified<br>
--=C2=A0 =C2=A0 =C2=A0* by NLSPATH, then an implementation defined default =
path is used&quot;<br>
--=C2=A0 =C2=A0 =C2=A0*/<br>
--<br>
--=C2=A0 =C2=A0 nlspath =3D getenv(&quot;NLSPATH&quot;);<br>
--=C2=A0 =C2=A0 if (nlspath)<br>
--=C2=A0 =C2=A0 =C2=A0 fd =3D my_catopenpath(name, nlspath);<br>
--=C2=A0 =C2=A0 if (fd =3D=3D (nl_catd) -1)<br>
--=C2=A0 =C2=A0 =C2=A0 fd =3D my_catopenpath(name, DEFAULT_NLSPATH);<br>
-=C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0return fd;<br>
- }<br>
-@@ -90,15 +118,13 @@<br>
-=C2=A0 *<br>
-=C2=A0 */<br>
- static nl_catd<br>
--my_catopenpath(char *name, char *nlspath) {<br>
--=C2=A0 int fd;<br>
-+my_catopenpath(char *name, char *nlspath, char *lang) {<br>
-=C2=A0 =C2=A0nl_catd cfd =3D (nl_catd) -1;<br>
--=C2=A0 char *path0, *path, *s, *file, *lang, *lang_l, *lang_t, *lang_c;<b=
r>
-+=C2=A0 char *path0, *path, *s, *file, *lang_l, *lang_t, *lang_c;<br>
-=C2=A0 =C2=A0int langsz, namesz, sz, lang_l_sz, lang_t_sz, lang_c_sz;<br>
-<br>
-=C2=A0 =C2=A0namesz =3D strlen(name);<br>
-<br>
--=C2=A0 lang =3D getenv(&quot;LANG&quot;);<br>
-=C2=A0 =C2=A0if (!lang)<br>
-=C2=A0 =C2=A0 =C2=A0lang =3D &quot;&quot;;<br>
-=C2=A0 =C2=A0langsz =3D strlen(lang);<br>
-@@ -194,14 +220,9 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D s+1;<br>
-=C2=A0 =C2=A0 =C2=A0} else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D 0;<br>
--=C2=A0 =C2=A0 fd =3D open(file, O_RDONLY);<br>
--=C2=A0 =C2=A0 if (fd !=3D -1) {<br>
--=C2=A0 =C2=A0 =C2=A0 /* we found the right catalog - but we don&#39;t kno=
w the<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0type of nl_catd, so close it again and ask lib=
c */<br>
--=C2=A0 =C2=A0 =C2=A0 close(fd);<br>
--=C2=A0 =C2=A0 =C2=A0 cfd =3D catopen(file, 0);<br>
--=C2=A0 =C2=A0 =C2=A0 break;<br>
--=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 cfd =3D catopen(file, 0);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (cfd !=3D (nl_catd) -1)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-=C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0free(path0);<br>
-diff -Naur man-1.6e.orig/src/manpath.c man-1.6e/src/manpath.c<br>
---- man-1.6e.orig/src/manpath.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 2006-08-03 18:1=
8:33.000000000 -0300<br>
-+++ man-1.6e/src/manpath.c=C2=A0 =C2=A0 =C2=A02007-05-18 11:02:48.00000000=
0 -0300<br>
-@@ -282,13 +282,14 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We cannot use &q=
uot;lang =3D setlocale(LC_MESSAGES, NULL)&quot; or so:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the return =
value of setlocale is an opaque string. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* POSIX prescribes=
 the order: LC_ALL, LC_MESSAGES, LANG */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if((lang =3D getenv(&quo=
t;LC_ALL&quot;)) !=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* LANGUAGE is GNU/Linux=
 and overrules all */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if((lang =3D getenv(&quo=
t;LANGUAGE&quot;)) !=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0split2(dir, lang, add_to_mandirlist_x, perrs);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if((lang =3D getenv(&quo=
t;LC_MESSAGES&quot;)) !=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if((lang =3D getenv=
(&quot;LC_ALL&quot;)) !=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0split2(dir, lang, add_to_mandirlist_x, perrs);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if((lang =3D getenv(&quo=
t;LANG&quot;)) !=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if((lang =3D getenv=
(&quot;LC_MESSAGES&quot;)) !=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0split2(dir, lang, add_to_mandirlist_x, perrs);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if((lang =3D getenv(&quo=
t;LANGUAGE&quot;)) !=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if((lang =3D getenv=
(&quot;LANG&quot;)) !=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0split2(dir, lang, add_to_mandirlist_x, perrs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_to_mandirlist_x=
(dir, 0, perrs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-whatis2.patch b/me=
ta/recipes-extended/man/ma<wbr>n/man-1.6e-whatis2.patch<br>
deleted file mode 100644<br>
index fc4ed3135dd..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.6e-whatis2.patch<br>
+++ /dev/null<br>
@@ -1,59 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com=
" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
-<br>
-Index: man-1.6f/src/makewhatis.sh<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- man-1.6f.orig/src/makewhatis.s<wbr>h=C2=A0 =C2=A0 2010-12-29 13:51:45.=
000000000 -0800<br>
-+++ man-1.6f/src/makewhatis.sh 2010-12-29 13:59:35.399799412 -0800<br>
-@@ -164,10 +164,15 @@<br>
- fi<br>
- catpath=3D`echo ${catpath} | tr : &#39; &#39;`<br>
-<br>
-+#WHATIS_DIR=3D$DESTDIR/var/cac<wbr>he/man/`echo $here|sed -e &#39;s!.*/ma=
n/!!g&#39;`<br>
-+WHATIS_DIR=3D$DESTDIR/var/cach<wbr>e/man/$LANG<br>
-+[[ -d $WHATIS_DIR ]] || mkdir -p $WHATIS_DIR/<br>
-+<br>
- # first truncate all the whatis files that will be created new,<br>
- # then only update - we might visit the same directory twice<br>
- if [ x$update =3D x ]; then<br>
--=C2=A0 =C2=A0cp /dev/null /var/cache/man/whatis<br>
-+=C2=A0 =C2=A0mkdir -p $WHATIS_DIR/<br>
-+=C2=A0 =C2=A0/bin/echo -n &gt; $WHATIS_DIR/whatis<br>
- fi<br>
-<br>
- for pages in man cat<br>
-@@ -180,13 +185,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;about to enter $mandir&quot; &gt; /d=
ev/stderr<br>
-=C2=A0 =C2=A0 =C2=A0 fi<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0# kludge for Slackware&#39;s /usr/man/preformat<br>
--=C2=A0 =C2=A0 =C2=A0if [ $mandir =3D /usr/man/preformat ]<br>
--=C2=A0 =C2=A0 =C2=A0then<br>
--=C2=A0 =C2=A0 =C2=A0 mandir1=3D/usr/man<br>
--=C2=A0 =C2=A0 =C2=A0else<br>
--=C2=A0 =C2=A0 =C2=A0 mandir1=3D$mandir<br>
--=C2=A0 =C2=A0 =C2=A0fi<br>
-+=C2=A0 =C2=A0 =C2=A0mandir1=3D$WHATIS_DIR<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 # if $mandir is on a readonly partition, and the what=
is file<br>
-=C2=A0 =C2=A0 =C2=A0 # is not a symlink, then let&#39;s skip trying to upd=
ate it<br>
-@@ -207,11 +206,6 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 fi<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0if [ -s ${mandir}/whatis -a $pages =3D man -a x$updat=
e =3D x ]; then<br>
--=C2=A0 =C2=A0 =C2=A0 if [ x$verbose !=3D x ]; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo skipping $mandir - we did it alrea=
dy &gt; /dev/stderr<br>
--=C2=A0 =C2=A0 =C2=A0 fi<br>
--=C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 here=3D`pwd`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd $mandir<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in $sections<br>
-@@ -447,7 +447,6 @@<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod 644 ${mandir1}/whatis<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm $TMPFILE<br>
--=C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 done<br>
- done<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/<a href=3D"http://man-1.6g-=
compile-warnings.pa">man-1.6g-compile-warnings.pa</a><wbr>tch b/meta/recipe=
s-extended/man/ma<wbr>n/<a href=3D"http://man-1.6g-compile-warnings.pa">man=
-1.6g-compile-warnings.pa</a><wbr>tch<br>
deleted file mode 100644<br>
index 4631d2d0635..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/<a href=3D"http://man-1.6g-compile=
-warnings.pa">man-1.6g-compile-warnings.pa</a><wbr>tch<br>
+++ /dev/null<br>
@@ -1,105 +0,0 @@<br>
-Fix a build error when building man.config.5 (a remnant of a long<br>
-ago previous patch). Optimized the manpages Makefile for parallel<br>
-builds. Also, fix compile warnings in a couple other files.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Bill Randle &lt;<a href=3D"mailto:william.c.randle@intel.co=
m" target=3D"_blank">william.c.randle@intel.com</a>&gt;<br>
-<br>
---- man-1.6g/man/Makefile.in.orig=C2=A0 =C2=A0 =C2=A0 2016-03-28 17:31:08.=
723949180 -0700<br>
-+++ man-1.6g/man/Makefile.in=C2=A0 =C2=A02016-03-28 17:46:12.866910386 -07=
00<br>
-@@ -5,6 +5,13 @@<br>
- ALL =3D man.1 whatis.1 apropos.1 man.config.5<br>
- MAYBE8 =3D makewhatis<br>
-<br>
-+SUBDIRS :=3D $(shell echo @languages@)<br>
-+<br>
-+.PHONY: subdirs $(SUBDIRS)<br>
-+<br>
-+man.config.man: man.conf.man<br>
-+=C2=A0 =C2=A0 =C2=A0 @cp $&lt; $@<br>
-+<br>
- .SUFFIXES: .man .1 .5 .8<br>
-<br>
- .man.1:<br>
-@@ -19,11 +26,11 @@<br>
- INSTALL =3D @INSTALL@ -c -m 644<br>
-<br>
- # Where to put the manual pages.<br>
--mandir =3D $(DESTDIR)$(PREFIX)@mandir@$(S<wbr>LANG)<br>
-+mandir :=3D $(DESTDIR)$(PREFIX)@mandir@$(S<wbr>LANG)<br>
-<br>
- all:=C2=A0 $(ALL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in $(MAYBE8); \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do if test -f $$i.man; t=
hen make -f ../Makefile $$i.8; fi; done<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do if test -f $$i.man; t=
hen $(MAKE) -f ../Makefile $$i.8; fi; done<br>
-<br>
- install: $(ALL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(mandir)/man1 $(mandir)/man5 $(mandir=
)/man8<br>
-@@ -38,24 +45,27 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f core *.in *.@man1ext@ *.@man5ext@ *.@man8=
ext@ *~<br>
-<br>
- spotless:<br>
-+=C2=A0 =C2=A0 =C2=A0 rm -f man.config.man<br>
-<br>
- subdirs:<br>
--=C2=A0 =C2=A0 =C2=A0 @for i in @languages@; do if test -d $$i; then echo;=
 \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=3D=3D=3D=3D =
Making the `cat $$i.txt` man pages. =3D=3D=3D=3D&quot;; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd $$i; make -f ../Makef=
ile; cd ..; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else echo &quot;=3D=3D=
=3D=3D No $$i man pages found. =3D=3D=3D=3D&quot;; fi; done<br>
-+subdirs: $(SUBDIRS)<br>
-+$(SUBDIRS):<br>
-+=C2=A0 =C2=A0 =C2=A0 if test -d $@; then echo; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=3D=3D=3D=3D =
Making the `cat $@.txt` man pages. =3D=3D=3D=3D&quot;; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE) -C $@ -f ../Make=
file all; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else echo &quot;=3D=3D=
=3D=3D No $@ man pages found. =3D=3D=3D=3D&quot;; fi<br>
-<br>
- installsubdirs:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@for i in @languages@; do if test -d $$i; then =
echo; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=3D=3D=
=3D=3D Installing the `cat $$i.txt` man pages. =3D=3D=3D=3D&quot;; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd $$i; SLANG=3D/$$=
i; if test $$SLANG =3D /en; then SLANG=3D ; fi; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export SLANG; make -f ..=
/Makefile install; cd ..; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export SLANG; $(MAKE) -f=
 ../Makefile install; cd ..; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else echo &quot;=3D=
=3D=3D=3D No $$i man pages found. =3D=3D=3D=3D&quot;; fi; done<br>
-<br>
- cleansubdirs:<br>
--=C2=A0 =C2=A0 =C2=A0 @for i in ??; do cd $$i; make -f ../Makefile clean; =
cd ..; done<br>
-+=C2=A0 =C2=A0 =C2=A0 @for i in ??; do $(MAKE) -C $$i -f ../Makefile clean=
; done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f core *~<br>
-<br>
- spotlesssubdirs:<br>
--=C2=A0 =C2=A0 =C2=A0 for i in ??; do cd $$i; make -f ../Makefile spotless=
; cd ..; done<br>
-+=C2=A0 =C2=A0 =C2=A0 for i in ??; do $(MAKE) -C $$i -f ../Makefile spotle=
ss; done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f Makefile<br>
-<br>
---- man-1.6g/src/gripes.c.orig 2006-11-21 11:53:44.000000000 -0800<br>
-+++ man-1.6g/src/gripes.c=C2=A0 =C2=A0 =C2=A0 2016-03-30 16:32:31.60110348=
7 -0700<br>
-@@ -7,8 +7,6 @@<br>
-<br>
- extern char *msg[];<br>
-<br>
--static char *mantexts =3D &quot;man&quot;;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* e.g. /usr/lib/locale/%L/<a href=3D"http://man.c=
at" rel=3D"noreferrer" target=3D"_blank">man.cat</a> */<br>
--<br>
- #ifdef NONLS<br>
-<br>
- static char *<br>
-@@ -30,6 +28,8 @@<br>
- #include &lt;nl_types.h&gt;<br>
- #include &quot;../catopen/catopen.c&quot;<br>
-<br>
-+static char *mantexts =3D &quot;man&quot;;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* e.g. /usr/lib/locale/%L/<a href=3D"http://man.c=
at" rel=3D"noreferrer" target=3D"_blank">man.cat</a> */<br>
-+<br>
- nl_catd catfd =3D (nl_catd) -1;<br>
- int cat_is_open =3D 0;<br>
-<br>
---- man-1.6g/src/manfile.c.orig=C2=A0 =C2=A0 =C2=A0 =C2=A0 2005-08-20 16:2=
6:06.000000000 -0700<br>
-+++ man-1.6g/src/manfile.c=C2=A0 =C2=A0 =C2=A02016-03-29 09:10:21.52784128=
5 -0700<br>
-@@ -299,7 +299,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *((*tocat)(const char *man_filename,=
 const char *ext,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int flags))) {<br>
-=C2=A0 =C2=A0 =C2=A0 char **sl;<br>
--=C2=A0 =C2=A0 =C2=A0struct manpage *res;<br>
-+=C2=A0 =C2=A0 =C2=A0struct manpage *res =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 standards =3D (flags &amp; (FHS | FSSTND | DO_HP | DO=
_IRIX));<br>
-=C2=A0 =C2=A0 =C2=A0 to_cat_filename =3D tocat;<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.6g-configure.patch b/=
meta/recipes-extended/man/ma<wbr>n/man-1.6g-configure.patch<br>
deleted file mode 100644<br>
index 106cc987819..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.6g-configure.patch<br>
+++ /dev/null<br>
@@ -1,68 +0,0 @@<br>
-Use BUILD_CC and target include files for configuration tests.<br>
-If cross-compiling, force pathnames for helper programs, since<br>
-autodiscovery by the configure script will not work.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Bill Randle &lt;william.c.randle at <a href=3D"http://intel=
.com" rel=3D"noreferrer" target=3D"_blank">intel.com</a>&gt;<br>
-<br>
---- man-1.6g/configure.orig=C2=A0 =C2=A0 2016-03-28 17:46:12.734910976 -07=
00<br>
-+++ man-1.6g/configure 2016-03-30 21:47:45.110572908 -0700<br>
-@@ -216,7 +216,8 @@<br>
- INCLUDEDIR=3D${INCLUDEDIR-/usr/i<wbr>nclude}<br>
-<br>
- rm -f conftest conftest.c<br>
--compile=3D&quot;$CC $DEFS conftest.c -o conftest $LIBS &gt;/dev/null 2&gt=
;&amp;1&quot;<br>
-+# since we are interested in target feature support, use that sysroot<br>
-+compile=3D&quot;$BUILD_CC -isystem/${PKG_CONFIG_SYSROOT_<wbr>DIR}/usr/inc=
lude $DEFS conftest.c -o conftest $LIBS &gt;/dev/null 2&gt;&amp;1&quot;<br>
-<br>
- # Check for various header files.<br>
-<br>
-@@ -455,19 +456,23 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0done<br>
-=C2=A0 =C2=A0done<br>
--=C2=A0 Fgroff=3D/usr/bin/groff<br>
--=C2=A0 Fnroff=3D/usr/bin/nroff<br>
--=C2=A0 Fjnroff=3D/usr/bin/nroff<br>
--=C2=A0 Fgeqn=3D/usr/bin/geqn<br>
--=C2=A0 Fgtbl=3D/usr/bin/gtbl<br>
--=C2=A0 Fcol=3D/usr/bin/col<br>
--=C2=A0 Fgrefer=3D/usr/bin/grefer<br>
--=C2=A0 Fgpic=3D/usr/bin/gpic<br>
--=C2=A0 Fmore=3D/bin/more<br>
--=C2=A0 Fless=3D/usr/bin/less<br>
--=C2=A0 Fcmp=3D/usr/bin/cmp<br>
--=C2=A0 Fcat=3D/bin/cat<br>
--=C2=A0 Fgawk=3D/bin/gawk<br>
-+=C2=A0 if [ $BUILD_CC !=3D $CC ]; then<br>
-+=C2=A0 =C2=A0 # cross compiling =3D&gt; target fs not available, so force=
 defaults<br>
-+=C2=A0 =C2=A0 Fgroff=3D/usr/bin/groff<br>
-+=C2=A0 =C2=A0 Fnroff=3D/usr/bin/nroff<br>
-+=C2=A0 =C2=A0 Fjnroff=3D/usr/bin/nroff<br>
-+=C2=A0 =C2=A0 Fgeqn=3D/usr/bin/eqn<br>
-+=C2=A0 =C2=A0 Fgneqn=3D/usr/bin/neqn<br>
-+=C2=A0 =C2=A0 Fgtbl=3D/usr/bin/tbl<br>
-+=C2=A0 =C2=A0 Fcol=3D/usr/bin/col<br>
-+=C2=A0 =C2=A0 Fgrefer=3D/usr/bin/refer<br>
-+=C2=A0 =C2=A0 Fgpic=3D/usr/bin/pic<br>
-+=C2=A0 =C2=A0 Fmore=3D/bin/more<br>
-+=C2=A0 =C2=A0 Fless=3D/usr/bin/less<br>
-+=C2=A0 =C2=A0 Fcmp=3D/usr/bin/cmp<br>
-+=C2=A0 =C2=A0 Fcat=3D/bin/cat<br>
-+=C2=A0 =C2=A0 Fgawk=3D/usr/bin/gawk<br>
-+=C2=A0 fi<br>
-<br>
-<br>
-=C2=A0 =C2=A0for i in eqn tbl refer pic<br>
-@@ -507,8 +512,8 @@<br>
-=C2=A0 =C2=A0 =C2=A0jnroff=3D&quot;$Fjnroff -Tutf8 -mandocj&quot;<br>
-=C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0eqn=3D&quot;$Fgeqn -Tps&quot;<br>
--=C2=A0 neqn=3D&quot;$Fgeqn -Tutf8&quot;<br>
--=C2=A0 jneqn=3D&quot;$Fgeqn -Tutf8&quot;<br>
-+=C2=A0 neqn=3D&quot;$Fgneqn -Tutf8&quot;<br>
-+=C2=A0 jneqn=3D&quot;$Fgneqn -Tutf8&quot;<br>
-=C2=A0 =C2=A0tbl=3D&quot;$Fgtbl&quot;<br>
-=C2=A0 =C2=A0col=3D&quot;$Fcol&quot;<br>
-=C2=A0 =C2=A0vgrind=3D&quot;$Fvgrind&quot;<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.6g-parallel.patch b/m=
eta/recipes-extended/man/ma<wbr>n/man-1.6g-parallel.patch<br>
deleted file mode 100644<br>
index 72a88b898a1..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.6g-parallel.patch<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-The Makefile for man has a rule to create two generated targets with<br>
-a program run from the shell. Because the rule was run twice, with<br>
-parallel make, the generated files were being overwritten at the same<br>
-time they were being compiled. This patch forces the rule to be run<br>
-only once.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Bill Randle &lt;william.c.randle at <a href=3D"http://intel=
.com" rel=3D"noreferrer" target=3D"_blank">intel.com</a>&gt;<br>
-<br>
---- man-1.6g/src/Makefile.in.orig=C2=A0 =C2=A0 =C2=A0 2010-12-31 12:28:46.=
000000000 -0800<br>
-+++ man-1.6g/src/Makefile.in=C2=A0 =C2=A02016-03-28 09:09:16.845458798 -07=
00<br>
-@@ -43,8 +43,10 @@<br>
- makemsg:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BUILD_CC) -o makemsg makemsg.c<br>
-<br>
--msg.c gripedefs.h: ../msgs/mess.en makemsg<br>
-+msg.c gripedefs.h: genfiles-stamp<br>
-+genfiles-stamp: ../msgs/mess.en makemsg<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0./makemsg ../msgs/mess.en gripedefs.h msg.c<br>
-+=C2=A0 =C2=A0 =C2=A0 touch genfiles-stamp<br>
-<br>
- # glob.c does not have prototypes<br>
- glob.o: glob.c ndir.h<br>
-@@ -117,4 +119,4 @@<br>
-<br>
- spotless: clean<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f Makefile config.status paths.h version.h =
man.conf<br>
--=C2=A0 =C2=A0 =C2=A0 rm -f gripedefs.h msg.c mess.*.cat<br>
-+=C2=A0 =C2=A0 =C2=A0 rm -f gripedefs.h msg.c mess.*.cat genfiles-stamp<br=
>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man-1.6g-whatis3.patch b/me=
ta/recipes-extended/man/ma<wbr>n/man-1.6g-whatis3.patch<br>
deleted file mode 100644<br>
index 63344568575..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man-1.6g-whatis3.patch<br>
+++ /dev/null<br>
@@ -1,20 +0,0 @@<br>
-Do not use absolute path for awk while getting the path of awk<br>
-when running makewhatis.<br>
-This can avoid errors if path of awk changes.<br>
-<br>
-Upstream-Status: Submitted [man-1.6g]<br>
-<br>
-Signed-off-by: Jian Liu &lt;<a href=3D"mailto:jian.liu@windriver.com" targ=
et=3D"_blank">jian.liu@windriver.com</a>&gt;<br>
-<br>
-diff -Nur man-1.6g.orig/src/makewhatis.s<wbr>h man-1.6g/src/makewhatis.sh<=
br>
---- man-1.6g.orig/src/makewhatis.s<wbr>h=C2=A0 =C2=A0 2015-02-25 16:13:12.=
657611419 +0800<br>
-+++ man-1.6g/src/makewhatis.sh 2015-02-25 16:14:49.334694815 +0800<br>
-@@ -67,7 +67,7 @@<br>
- # but that leads to problems and bugs.<br>
-<br>
- # AWK=3D/usr/bin/gawk<br>
--AWK=3D@awk@<br>
-+AWK=3D`which awk`<br>
-<br>
- # Find a place for our temporary files. If security is not a concern, use=
<br>
- #=C2=A0 =C2=A0 =C2=A0TMPFILE=3D/tmp/whatis$$; TMPFILEDIR=3Dnone<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man.1.gz b/meta/recipes-ext=
ended/man/ma<wbr>n/man.1.gz<br>
deleted file mode 100644<br>
index c368045153406ab730aad35bfc7ffd<wbr>91238bd47d..000000000000000000<wbr=
>0000000000000000000000<br>
GIT binary patch<br>
literal 0<br>
HcmV?d00001<br>
<br>
literal 12323<br>
zcmV+;Fx&lt;}{iwFP!000021Jqk&lt;bK6F<wbr>i{f=3DMJrP^9aQxt7ElVp-fQj#6nX2p`<w=
br>cBpoLc<br>
zx?+%Ql30NNg9bz^&gt;)qeJ=3DRUg8AnEK<wbr>&gt;&amp;FqIsrDPK5$L-tqaqff1lOt0nef=
&lt;<wbr>5?pUik=3D<br>
zO*$&gt;_t;w^(8n-H&amp;d~OzHHM6Fk=3DB6&amp;<wbr>q6eG;0vYV=3D$S?9_M^LYAoT9{3=
`v^3n<wbr>T(}EuI<br>
zi)ZELp~{x4+MGN)HRoS__2(Y_{k&amp;&amp;<wbr>hRH&lt;EC^R{o^W;v$K`{sl`^-m8&gt;=
eDe7<wbr>5d5``+<br>
z;lH2p-!J&amp;@m;CoHm;kcP+q8CN(GUC<wbr>oTsENR!OSyPSJ||wt!aw6txS#6*0x$<wbr>Z=
Q!e&lt;+<br>
zi&lt;&gt;v*g)MBA=3DH_)X&amp;9fOV@G6_x!r|P<wbr>`xQ(4&lt;i_FdqHlituEVt&amp;_=
?dzWhH!tu<wbr>Yt&lt;9`l<br>
zTW7Xey`llU0Jw2BpSA&gt;KF?l1*xt-P<wbr>K$yet5v#%e2_4Q}x=3DEe1x8D*F;;L3}<wbr>=
&gt;a_GX^<br>
zzH6$=3DKJ?RBzqvb=3DbvB@M{L)-s-k5W<wbr>9^yKmR&lt;Fm(4&amp;d$F$!k7N%{V(w^?x(=
@<wbr>I=3D!z-&gt;<br>
z8ghquqnGC9^7&lt;+Pg=3DTVQ@HZ&gt;Kl0`}<wbr>vUh)ac;*5o%vI|?;0x#CQlH=3DK&lt;p=
Koq<wbr>oj|L+?<br>
z3W?8B`3E*&amp;+?)j|=3D|2^T7(O+&gt;Og&gt;_<wbr>#XGwoB6y{AnzKdSWcfNnW^L=3Du*=
O{*d<wbr>+mJTl_<br>
zIQ4KqZ@x9r&lt;9FRDL*5INmvao*S??9<wbr>U%*$E2N6MOCxd&amp;I&lt;HD2LiuRr-H|L&l=
t;&amp;<wbr>Z%|kaS<br>
z?!5bAB+KLCcV1W_&gt;O&amp;35f;jBF&amp;G7v<wbr>re;Vwazp_jFA-o4avV1;EtNGr*B84=
D<wbr>M&amp;dMTx<br>
z*m;-kd~f#WmXkBrOi5VW&amp;db+&amp;RuZG<wbr>`n@ZkP&lt;$AMw+%I&gt;&amp;U;WXY$=
o8v;&amp;B_*<wbr>Oz0Vza<br>
z|DTPkp^CFZBQ|n%(6+tBcPSfp&lt;jBn<wbr>JJ+ysah+cMwO{;S2gaO@gKkY2H$@a(<wbr>mO=
-bM(<br>
z^vKy+dkAH&amp;nV3l0{O6!%DcHOz-Hw_<wbr>~tDtI6vC&amp;&lt;iLx=3DO~&lt;%TxXYaJ=
Mtr%f{<wbr>X_uVbd<br>
z&amp;X##OP4lzAYp)-o18#$OzWsakVPE1<wbr>0dlKJ1-DMbAakI~)E$ngjf6%=3DMi^}<wbr>=
LjETa23<br>
z$RM^Gf4qMFFJ|@r|JD0nLOBO~O$RT<wbr>1yMiBlr2n4H#N~fN0ES&amp;{_y=3DU+52O$<wbr=
>zkpKQe<br>
zF`WIgw&gt;~&gt;t*?ePY!?Uw{Tag#*&gt;&gt;5^<wbr>C{V2--Eqs49dNv%q9uIDB{5a?*p$=
u`<wbr>e$4&lt;e8<br>
z2w&gt;k_rL$EaAgz|o+7`80X7?8GtBlq<wbr>t%4(hF@N~2oc|O8)1XRmqm9BdXc(<wbr>VGz0=
GlqF<br>
zVkQu5O!#aNZ&lt;(Zkw6iR&amp;f$$i@SrDM<wbr>`kPx6!;Ea%60PF%wG8cgEHhKDB0b(y<wb=
r>j!qrIi<br>
zl59bQ+-Gw;?_t?I$KVQYJ^eshd0E~<wbr>WcGV0l)0zm=3D6%vJ~LMM|ARam4=3DUYk_<wbr>*=
AaY8K<br>
zPb-j%6~GD)YSa5P%hPFYW1&lt;|WT9kQ<wbr>SZb=3DCl(4S#RNX{HAB5+Jcq9s@5R_<wbr>GG=
6Te&amp;*i<br>
z2cNxXEL}#n2#@Utn0H51IJ^QD&gt;~7p<wbr>o_y9GLglGaJ@Fq^sa(n2aSx+HWrgL~<wbr>BM=
1#ty<br>
zP*gu`ERPYWf=3D3TfgrZI}+%GWkD8WY<wbr>N&lt;l^+NNp8Tq^NXtwcGk%5Djklb!a&lt;<wb=
r>yaDR;?}<br>
zi;)07n8@6j6E8F_+@z=3DA&amp;Q^uZPm|9<wbr>sUS-oNtseHLkR*W}x*Zgh#%0!&gt;CV##<=
wbr>dQA9xp<br>
zgF0eT;~ExYkt&lt;A^EC!EY_a=3D+sY4Z8<wbr>Sb5hy`$vQYpSA?^I{j!Z+@@QMn9&amp;<wb=
r>I4U+c_pB<br>
zUtGK(9GHB0G5)XQI&amp;(7|Gc9b{V6&amp;{<wbr>4&lt;qcctbvmm`@Njm=3DY}{G-w3pcav=
X9l<wbr>Df;(9C<br>
z&lt;jd0@eOp%LVj&lt;s?@qZ_O@k~qS&gt;#U$<wbr>?N5GlqYI{7EC&lt;+v-vaC;&amp;uP%=
OIF5)W<wbr>`wEzV$<br>
z9XFWiYRm(;Wdkz4N|H+zgdlAo)3Ll<wbr>k22|dHtU&amp;^vg;TW8**=3Dhf(&amp;;T*X$<w=
br>pd%67&lt;nW<br>
zH2U?~?alMSi#NkdGFtj9GGqGWmcRH<wbr>pS3eEL6EhlLj^Fr4!&gt;jR|;mySSc=3D_<wbr>s=
$-|1&gt;N<br>
zyd8!)H$M)Bw&gt;Q^UH)DPBeDLbZzy0x<wbr>QIEpqPqHc%Rh&amp;d-_e5(&amp;{ZpUH#(&g=
t;E_<wbr>#VlJ;=3D<br>
zzw&amp;!tz8SxiO~F_&gt;@72}BT)rCJdd+O<wbr>@LM&amp;YAW&lt;y4x6g7R?27aEYEHiLJ=
Q-s$<wbr>J&gt;VarE<br>
zHOmI7LSkHES`}Z+zG_0ArezMRgQy5<wbr>HbwR3)2niMr8&amp;m8JD^bv}K~|@T&amp;<wbr>=
BMUT!teqY<br>
zu)zkMK&amp;us*@L;a{3B(D@Bl4NfFay$<wbr>bkrwO&gt;$WXRcT^02g^9~QK!oXB$!(&gt;`=
<wbr>y_)(Xd<br>
z($*d*&amp;TXEpvs$deN8&amp;?K)`1muxwLe<wbr>CCf@IcMLb}=3D=3DsX^hHOHB3%2rB=3D=
9{{<wbr>9R){&amp;c)<br>
z6LjYf&gt;7GFH-oW@wJL|GST@i!vm@*&lt;<wbr>_2_DQnS+O}r7Hk|!Np(OqH%+Y|te-p<wbr=
>w_p*W%<br>
zbY^&gt;`mEzgFhU@v+&amp;O&amp;Nr10y#FMw9Q<wbr>Xnu5S9R!LHZ@ELgBV?pAjAOP8n7Xu=
e<wbr>1XOpXk<br>
zf@tPtQ(2J~ro*Ol6&lt;`m9B42N?UK8w<wbr>5Mxu#m9eawi^_ec1RrpVAnIPVA8PT2<wbr>&l=
t;_oc*`<br>
zklFz(QVDD^OC1@Inpc|NXU-opY-58<wbr>lvL9e(91u&amp;q6mSO3Ws%lY(m|zS=3Da+<wbr>=
R*QJ;~N<br>
zYBl1i@oO{L9+O=3D*#|;)?JcD2;cggn<wbr>xNn-yQGIZ)~A+zh`L_O1~gazcIv8-<wbr>QfA{=
hh9<br>
z3{|CHv&amp;a6unaxDfdY?iZIxE`UdH&lt;{<wbr>sOA~1x+zgnhf&amp;Jj=3DZ%sy`RBx?qw=
*)&amp;<wbr>CaEbT6<br>
z%Lt1;C&lt;$vhfcPtkE1+R{2ClOPF9s&amp;<wbr>xR21!O90@Y+eUC{Y-$gpjF~fT!OC0w<wb=
r>SFXgG?<br>
zhG-&amp;jMpI`B(&amp;%Pu@{~!*@R+@3B3_)<wbr>OeUrh`;gC8F){ByG?55@tbkUW&gt;uup=
Y<wbr>y5iba~<br>
zd9q%Yt{%;*Yy;CL7?XoYLhOl(I*Tp<wbr>mG_mV;l|k;?lrEN&lt;G5~4qJ(!q?wc8V<wbr>pe=
8Qm`<br>
z7DNdCXi=3D8^^AG*y?+}^qCZ&gt;IY_c%i<wbr>oj|&amp;pE_{s*0S+Qs@qo7kk-&lt;oRHxf=
zn<wbr>GXq$xD<br>
zof3^2A7+KvE(#S+u&lt;L0;;7S+&gt;lflq<wbr>i%|K!4#ANPL*Pe8oEb&lt;iYFKtN8mDiH<=
wbr>{mf396<br>
zX{@W~c%884DN2o6cq5%PV`gLGeP*{<wbr>ls0eWhi8H=3DBTIvJwhfP++zEW?4Q_a}<wbr>By;=
9t=3D<br>
z2kpCy4CxX!ZtsTfa2G69i)17*0&gt;@m<wbr>dvLbu#cv&lt;oC#k`{gf|S%=3D0O~$$5gjo<w=
br>0lGRf3<br>
zD9a{KE7Q82e)5{$5(`)-*{WJlbp=3D(<wbr>vPjk8#X5YZ)rHIBV(711Y7I^2@uqw$<wbr>b#7=
WI&amp;<br>
zS6SVzwhnYSYgZuV6Njcqu~5i;h)78<wbr>cc^Y|PBUbnpxa`Nl)!XEnZI5SS71_<wbr>WzOf59=
F<br>
z!gW#zOER~nyIbUlnWhq;rd{JlBtr@<wbr>zRL@pv!PZkS);gVs0UGyF{&lt;#-GE^pQ<wbr>Ia=
u{@*<br>
zfuF*$sa&gt;V_85B$|zT8-Gkc4Mop&gt;tv<wbr>;1!(ZA147qzkDx(Dv4bt{v#KmO9H(<wbr>=
b=3DR5&gt;}@<br>
zE=3DXo7T0%&gt;)Yqtr52)_ro&amp;H_ue&gt;5$d<wbr>OZhW@)Gw+j+!$zE3_&amp;2I{0C!=
XLOx)L<wbr>mQr1m`<br>
zc!T2WG31Ud-;+3go{6{z5t2u(n-l`<wbr>VGNCtm&gt;;go@eL2Q8ke_se@o=3D3mAsP;<wbr>=
*$rKTk<br>
z%Tu&gt;H^@cZLD~C1R4%raPl0|{uG36A<wbr>*Y`f%&gt;Eh(K1qE%T)C!Z741)_Kh5LE(<wbr=
>kRM{Mc<br>
z&amp;j+WDGa)ir;&amp;qSac6K3zMl6rqxZjf<wbr>=3DXGMp24kjo;l&amp;CbebuqD{n2^=
=3D<wbr>kPHxnA|G{2&gt;<br>
ziB2ihU&gt;N`--s7$Sl#i(dsoEN7i0W=3D<wbr>#Hl}$Ehqhcv=3D+D&gt;VYFZkiP5A}z0@|E=
<wbr>;Y`EU7<br>
zf`LryeB?V&lt;TPy`Tpq4x9Yc%()ha$D<wbr>?VLl{t0@6T&amp;P)V_GV@?vuH;-~KRz#3<wb=
r>QPA#?J<br>
z)S=3D{-VrwhR?A{aS1vIKApGiUsNg)%<wbr>b3F{LvX=3DR~R+sL*&gt;$rIk;)KldIW;6S<wb=
r>vEEEvA<br>
zS){J!;wTjZ7X(XI=3D{(9V?GVL&gt;sIxU<wbr>I?II)005=3D*(VIAxWJ3=3DyS9a#r)WWnt<=
wbr>=3D3NU&amp;d<br>
z)dBMX^hH})aD}~&lt;U8k(;9R5QKdWvF<wbr>*iRJX3x2B~FD|Sf8063yUx^hu($y(<wbr>t&g=
t;vzhbQ<br>
zDxGH%??uez@WNlTV?*ev(;$z}oa#d<wbr>ejYxh?$Zbzh$dRUOV6quI&amp;G`0L8B8N<wbr>M=
OxRj=3D<br>
zS|nK+PhhWR2;=3Dz|dq6_qstKIgrP|G<wbr>u*z1i$3w7X;bjg6f!P~HXU(cu&lt;5Qym<wbr>=
uNDH_H<br>
z7p_{e%W_ChbIm)D+Ef%-#^S%IN=3DWf<wbr>1I31W2g1P?W=3D=3D~e`zT&lt;;z%B&lt;QDQg=
j*<wbr>{D8Xm1<br>
zgOz1B^xi8|{%|aYfC9&gt;({jS+;NQFE<wbr>S#SDd=3Df&lt;YxWN4~OH_Q&lt;p&lt;4DYdk=
g(<wbr>9x=3DKCS;Z<br>
zbJR0OrvE$ske=3DZq@bDowH@7&amp;KfWqP<wbr>-5J1cd%VI~ihM9|*nRrihSCG??D#<wbr>V=
6vo|Lhl<br>
zT;{Iq(#jiPoB$@=3D=3De!}fL|PCXoOO~<wbr>&lt;vHTq|74Q%#_&lt;Jb@9=3D?f(7J&amp;=
}TqsCQ<wbr>_+zP8c<br>
zA|)Z|(T6{spAWy_hm&gt;Pr^GqZOqAmr<wbr>3lMnPX#u7PhMMhK6?MdhW4hs&lt;Rp|<wbr>6=
7-UrV5R<br>
zCE8rIWh&amp;tlv?+D$VbnC&amp;&gt;~DAbJeVO<wbr>zoPB*679DAF(wsbhIXXR}M1RfslPN=
i<wbr>#x)!9z<br>
zq;XJcZ0;&lt;Ze#xE)$Z}-qDa%gMQ1U(<wbr>Z%qF*_3LtLoQ4)6-oP2(|H+Q&gt;w=3D**=3D=
<wbr>_!ULs`<br>
ztQLVXDW+2%ROOwr7Xha#Ldt?O&gt;?b#<wbr>vK)pZ!o()|{2XQmXm0+BvpTJkNi-D{<wbr>MX=
pok5<br>
zP7|2p;64XhcuYcqobd-$GVVEXLN}o<wbr>#_B6&gt;78!rYVHX{V9P~g?GU$3u5qste<wbr>P|=
CDE!<br>
zH!mohN()Urio0qf!$Sy`R%g1yk%iP<wbr>Y;6ET3=3DJoAp@RK=3Dz{P?r}c|s=3D4hp}<wbr>=
HLq08rn<br>
zyijT;GjT&lt;CbWAXC3wI5GS(_zcFF~S<wbr>;4#KN#TCjJQwT1)pO-tT)zeq*%srgk<wbr>4o=
8M3-<br>
zt;$%TzT@@+dEXE3XHZTs+g4}9$aqX<wbr>IjM0J~y?v)8QgYpr)NmQ;8mnkWf-&lt;@<wbr>Ex=
VGF2<br>
zZeeQM3K@;eGuwE0;srGc^?}Q^tupf<wbr>DSH&amp;{V0H+l`BqJ5w1!o^)p&lt;a`KFo&gt;$=
<wbr>tyj(Vx<br>
zGi)i$pjp5RaI%o^48BGsJkD8r@e7?<wbr>@Y(ch^=3D}MQ3&lt;0AQH9D}oZz_Xt|(olM<wbr>=
zCKBvC<br>
z^O=3DAyHMn&amp;`6nh*s#f~D&lt;+O++avkQ5<wbr>4$6+Qf&amp;DL=3DpEC}PhnI|uk#9IX=
sE5o(<wbr>SN`#6T<br>
zZ2`1E%9k)N5R8J~lI3k(IHLWulB_V<wbr>Rm9kcj8+pP5b|p&gt;%Rvi;3a#hYW3%|=3D<wbr>=
E+gc&lt;k<br>
zB0s-;^J+Zmpu`p&lt;b%eBYBW&lt;=3D(5|f8<wbr>8yb&amp;qy0#Xtrt~o;%WMGRsXK&lt;=
=3D3JG*<wbr>1YZY$!H<br>
z;LU(rZP&gt;(-!E7iyOfb|U?AM!V@pNC<wbr>*42!i}r}&gt;uBoJxTj#Ip9Sc9d+7%_Hz<wbr=
>_i$&gt;E$<br>
ztsYS!k%Z_RoMEB@q#itH&amp;M7!O-qcD<wbr>P&lt;E*TzhO&amp;q+%Pr-zd+kyOSm1-foNL=
B<wbr>va&lt;vx{<br>
z&lt;UDlKz+61YbJ`s`+8(RrVi&amp;#4b-^U<wbr>6E|!&amp;JkGqA9*gHEBj91p)af-O40e9=
9<wbr>)_Gstg<br>
zflaMju_MCfmMJ5Q1PNX{$pkVz2u$Z<wbr>}C1hGRR9Vm@N&amp;yH!j!`&amp;S59M1fDJ(|<w=
br>PJwt75<br>
zf_y}qsac&gt;Xb?BDT5fqqH4J)~&amp;=3DF7A<wbr>T!7zYhT(Y-(k?AMIku4R4)kH~B*&lt;=
<wbr>4HtRu|=3DF<br>
zn2a@!h43^d#e6VY%qQ-%8{YcRFl1;<wbr>oxjNubab8+KxTjzu-hh|R+B)!Ql&gt;W8<wbr>SM=
nPQ_<br>
zN$?as(;^3soI-w8BKW=3DZ1NA-_X&amp;s;<wbr>`q&amp;PjgeS%(Q|B}+gXVf`+P6-`necC~=
<wbr>cz-!9X<br>
zd%ShZ2j%&lt;WDH^JC#=3DOkud(7bz_oDA<wbr>KC(EIeh!5*k#qpZYsfBg~&lt;+fIb*0{<wb=
r>lpZHDCG<br>
zQr?_dsmBjk{v&lt;WwW@%81t)qK{%yi=3D<wbr>O4W;Ke=3DAc4&lt;EYF?He892o_Ub8#nafJ=
<wbr>Dr&amp;2-Y<br>
z6N;_D1!o%qG?F2U?q+RMKtJ=3DGdP?$<wbr>#UYwOmqI8km!X{D6eh9X;8KL3r^XH?<wbr>h|4=
2Ai<br>
zYV(j}*8Mu9Q)FhENa7BIK|hicpK(%<wbr>4s9Pl6Yi5&lt;BJm1{M`Ei%Lq$k&lt;H_{&gt;l<=
wbr>$nW;nL<br>
zdTqOn?8ea^S%Nj4m(FrLu}6IHZ+z&lt;<wbr>WyCh-gD1`}n&lt;kNE+TTZjW=3DUz?D0gBU<w=
br>X(NwKl<br>
zhvQN1w&lt;!6&lt;Qr_bq2&amp;^q4rFm$FkqkQ<wbr>DdyE&amp;z9(fG|8xz&amp;CJ~eWvS=
s=3D=3D(<wbr>0LI5;m12{{<br>
zxq&gt;&lt;tCcP?1?HZmg@m58GfD&lt;)FrF{L<wbr>x)JyZu@FQ|R+KN}3(?oy@^#Bnam$_o<=
wbr>ddrLBy<br>
zaoX4JwFqgO*nIkHu~^s1iG;QCq^2i<wbr>3o3uSpKK)i#uq)K&lt;;yt*hq0M&amp;;I1C^<wb=
r>mVrv*7<br>
zO3g;J#^j*LkmC531&amp;xxmBG%f+h|aM<wbr>&amp;BFlBe{hDc;&lt;92=3DhImkc$pA&lt;=
=3D?HzuK<wbr>eo{+Nk<br>
ziCsy;lbvXQ`PhePY&lt;DP8-8+zo#u26<wbr>^6+S$CMtHMcG`YmdoqZ&amp;GZsXi}PZF4<wb=
r>ZcTx^E<br>
zeVR%a{045{vxN@iLvb61qa$&lt;Ve=3D(w<wbr>49fji6&lt;m}nRh-v6exBv^yUu4V489n&lt=
;<wbr>}I!xa&lt;<br>
zD~^(?JVpjIS|Z`8_`Hh!N+&lt;y@IMDi<wbr>^M}40h@MSaV&lt;m~Z&amp;b31L8T8-n+ODT~=
<wbr>A{fwr3<br>
z@25!3dfdgJp}!KIqG{9ojIhK^=3D~%i<wbr>dE+zOx`mswworzl{YUj^DBF_ic{zWN<wbr>4)S=
Ze4<br>
zUtCBSG1fU$kbovf6*!(GeN4Vk5mJR<wbr>jcUDQM+}One4l;BL#GTfY#p_?boh$~<wbr>?_jk!=
v<br>
zp`Jn8uE|RAHE;&gt;uXlX-pK-&amp;A`aTp@<wbr>Xf+~EB&amp;zu);Rc+2QlT(!LHb%&amp;=
O&amp;W`F<wbr>&lt;2{)~&lt;<br>
zG9Ye;pJ7$uPI|^UJWA@df7QIb;%Og<wbr>FNwzY=3DJ4fqucGOQsR^0mJB&gt;(NLKkP~<wbr>=
M8zyt_<br>
zmZW$WW!tv^Lj1;2oEMXzs&amp;P$jZjEK<wbr>Q$Qo*YN3GN?MCvpLyjy!6`WF6v=3Dw(<wbr>=
UwE4Zz%<br>
z=3D(b_R0lUE|;{{L7Ph(sc&gt;A{^)&lt;P+Z<wbr>eB&gt;A61^!ID&amp;F*NU#m}x7mp1Zh=
P*ho~<wbr>Q^&gt;I(5<br>
z-{I3l{vbq3R&lt;&lt;Q}6h*&lt;(7sUm=3DIP6j<wbr>pWoepLa6o7B^F9fndmejIPC@(qI9W=
w<wbr>qPn1|@<br>
z*`m|~kVP+{586*6E{5+%3(&amp;04gi8h<wbr>f2HfX6b)llZHZ!$aksz1sxyrxHQ&amp;n=3D=
<wbr>=3DdXroA<br>
zbYM(m2u~T`?{^_M&gt;PZfvy#9(L3g`u<wbr>g1disyQO;Y5fle-cM)EyBJ!VPn`+lM<wbr>L7=
Ug#!<br>
zzD1d&lt;1?ttMEtTsPT&lt;WTPtuoo|c%Q*<wbr>sS#3&lt;e+N})km3kT7;;6NDS{B`QnFyX<=
wbr>I6vI=3DZ<br>
zL5zN1e_9!WuDyBAH&gt;qe2mV({3F2U2<wbr>=3D-&gt;rq*UL40wAEe^wE8J5{hgW9NM+)<wb=
r>lvk0Zqp<br>
zE6VEwB}DN&gt;Tc+T+&gt;v(c@EW+vZ+%YW<wbr>m@P$AEwLEyzNPyKwxOz@~;cuz?u-&lt;<w=
br>iW5)$-$<br>
z4~*%Sx@wI%J&amp;2h1;MOQr5TA=3Df2?QO<wbr>L&amp;-^jiBb2({)Vvnu;wajeB##$IiZog=
<wbr>?9m=3DBe<br>
zLk4c7C4R^^f&lt;k3^M?=3D^Y7YX;sN|#L<wbr>}&amp;|7a=3D5fQYq&amp;G`O%&amp;MRY*=
BwOc)+XS^<wbr>pGB34*<br>
zrd~-poR&amp;Cor#=3D8WP$^^G-ulj`5dKH<wbr>Ry^V;Q&amp;&lt;|L;6!N2gE}34acByNBw=
m}<wbr>j`zt$lR<br>
z(=3DXQuPZF|h(Q{9?kf*^3b6m@*`{;x<wbr>-Ig$J}XCF;T2HXEwmLL$v*kVh$JKh5<wbr>b&g=
t;ExhA<br>
zbuA4^`Vr0?0%!VPTTK&gt;2LYs?$T0K0<wbr>qct%jh4@m~Caf+g_-3~~NUPM7T6Ryo<wbr>f1=
mWb`<br>
z6K)Z&amp;wAF{j!85D-6R?mm_lYGcTWaX<wbr>7LwqqHj&amp;;=3D2NE*L!))&amp;KQTXv6&=
lt;;h@w<wbr>=3Dl%Z^S<br>
z%?%Fjf7`p(=3DC+Y5`yIam#fn#Cih?a<wbr>Ue#D7)&lt;cDl)W6Lg4j-5oQF-U?EYzp8<wbr>=
2peatx<br>
zkKg&lt;3z72r(OeNV*TT&gt;p9ARdi=3D-p4t<wbr>o=3D{8LnOJN-}HwZ`K;EZwP!OZW&lt;g=
fk%<wbr>q%{ceV<br>
zd2RF*a&gt;S(9jbIFdcR+t)&gt;{ud^CI&gt;J<wbr>OS^2n{3x0CM3Kq8Y3&lt;K%7(&amp;f=
02QE@E<wbr>l(PTr(<br>
zwtA5lLf!B$VSSI+&amp;?httbK%!E@H-^<wbr>^W+Oe$ymx3VPCU$zY7RYKZbUsDA=3D%p<wbr=
>6&amp;m6*&lt;<br>
zS_Uk0Idgb-6fqvd#9``h!^g&amp;&amp;8Q;c<wbr>^nbOVhF&gt;%4=3D_+kpF-~?MDsRp?v#=
&amp;z@<wbr>WGiRS|<br>
zOk&gt;S&lt;5lkp@;v_Y&gt;NeQWF_fp%B(Q2n<wbr>&lt;BY+gmZsC9?Lx~-VcwIF4(qi*)v`=
<wbr>bz{&lt;}+A6<br>
zz#D@V?=3D251pMcI{qSk5hNPtq5188T<wbr>_OjHW)XkM0I!&gt;bHDUpus*IFxmc?M&lt;`<w=
br>=3D?6&amp;uD<br>
z0i~F+0!#?ujdtHBj*skdSb*kv!5UQ<wbr>1W}A%NsyW}?vquo+C?LLOQ|&gt;b@5$=3D<wbr>F=
EM*2M^<br>
zYJuXGk~n$yj;)1Dj^bt;jHjhA*{!a<wbr>|Ot({`0j`xJ$=3DM_x!dR*rANtHG!#f&amp;<wbr=
>_!ov-$<br>
zE{mLlBFWh?-C&amp;rJpBi2u)%8xMaEkh<wbr>{nRdba$*u|jA&gt;nwcm2}5re@XjvxW~<wbr=
>lhcO)T=3D<br>
z5qwUg&lt;GXWGO&amp;ldm$Mw)6DYA|&lt;HyFH<wbr>A&amp;A}TqmFwCxGEDyqQwL-aoo1W2=
lkoP<wbr>&amp;5XH22<br>
zW^j0}T99poR|;jw*Hh#pO&amp;WS^2Oi0<wbr>VHH4Y=3D%c=3DtjWfz7P`4sdPvP4Ka^<wbr>=
n2A5&gt;Ghsq<br>
zN;fxnTx&amp;S`5UrUVy1^ixdM1CHoFBi<wbr>5`sOj{McB#QMEnLOVv5hmG%Vqo$8&lt;<wbr=
>27sNaN(<br>
z6~`ho2lr@b(MzJIJ`tvcM`*fyru!g<wbr>$=3DPQ}&amp;^DKbfisj08&lt;9ZBVQQxjMulMH<=
wbr>3&gt;ANTA<br>
zuX^84vgVA95Bdc|&lt;nzk{!8jD-rRN6<wbr>V(A2%00+?t{DoYM0^aG3{w&gt;}CQ-<wbr>my=
tj8^QMB<br>
zR+L+jI}I5WG{AmpZ_XWJFruD@=3D=3D{(<wbr>efK|W7CZ}oHV9pR=3Do%s~;vO|iv*q`9<wbr=
>ai}4X^<br>
z@H+Sg-=3D*k}&gt;1gyCf0EeFvMlzQ+|(c<wbr>C`NZ&amp;Xsn3~1W9coU-`2vD&lt;7ekPdh=
qa<wbr>EU$Dj@<br>
zy&lt;Ae&lt;kmDFQ_rtIgygK=3DcLi_wH3ir5<wbr>b$l%56^&gt;p7mi&amp;6vbz~k`uXo9P=
aW{<wbr>qL+mK84Q<br>
z4FVsk%gobLU7Sqk!w|eh^l6wDv7Cj<wbr>op3i4XMOqk&amp;4uME}`yBNPg5^|9g`u!<wbr>J=
C4{j6<br>
zY7uVAF37;+M`*gS{EX}dmRm56#!*l<wbr>#x)SX}M=3DZiMAB&gt;^PA`|efx3Z9Z@T3+<wbr>=
*U=3D6kg<br>
zv`VwaiNm7&lt;HUY|TC2(p@yh~u6;sVM<wbr>w8!P3TA4@I`_p|tuYoa|dBCf}Zr6Df<wbr>d*=
uGmc<br>
zTf(4vPos|QN+0&lt;P^NV821QinzQQBz<wbr>@iQN_48rr4EF3UzBzPOg=3DU{ks9Grq&amp;<=
wbr>uGM^i(<br>
zoxBaUM_qUd1N+$G=3Dp1Nfpvr0*CwZ}<wbr>}DiMXDFF^)l*o7SnVNU4;bRn2qB^Vz<wbr>UMv=
&amp;PL<br>
zhCCJ!&gt;dQI(oL&gt;W{9z$MZF;4YIJK@3<wbr>rg9?c}!GtOm!3$L`z!Jr5m(ui7BdLL<wbr=
>xDroih<br>
za4(xe$k~DA*&amp;H2N@V-vy3pF`YIDKe<wbr>KRKI%Sj3!oRZhtbC#ju%O$=3Dyx#GUN-<wbr=
>wk1!iT<br>
zX*o@2?xJD62?8hyvf&amp;3Ij(z2FNJ@!<wbr>A|4eEs^{Wlkax50#C+k(7parZOYaA1<wbr>(=
UsG!)<br>
ze49j*yx&lt;6EmBogkSCoQ0mDo9jT37k<wbr>(3*3J&amp;g(e(uH^Ewt!dmVxKoHKl#z;~<wb=
r>vdA&gt;9b<br>
zDopjF{?F=3D+?NZ`N?$^zhAYojDdS|^<wbr>!(T%#5Q|kzCPQ!?4yX=3DS)3z`K$f?`s<wbr>X=
m`_Br<br>
z4ry#eaU&gt;xIof6IY|CyH4*ZB?YWn{b<wbr>}3r=3D$p?W)tVVUT&lt;5UVFJUtiCaWt=3Dg%=
<wbr>Iut|Kj<br>
z1pHL2icJo)J=3DTHEoYC`B$(t;feda1<wbr>tIdB$dL|Q9odR-!KXPtA&gt;JqSWE!=3Dm;<wb=
r>xq^~#1<br>
zT-1iY;&lt;75sWfzdiBu(nal2p`QBeNv<wbr>b0TeAy%}cHMrI;cT*i&gt;u)n`dj559Zc<wbr=
>SIi=3D2)<br>
z8O&amp;CDJvcdR8_a^XAZRd=3Dx5zGAMp+j<wbr>QH;DXw#)GAn-xJ^mB_u)3%_w{928*?<wbr=
>3J4vg&gt;<br>
z3Fr7gl($^6W(}+7G$+hP*cpv3+|Fh<wbr>e28c^hK&gt;g=3Dc+iH`RU@4!TR6imTGMjs<wbr>=
I(YelD<br>
z6i~ygSk{e`&lt;wsH&amp;wYz;;IO2b~@Q5o<wbr>8=3DHP&lt;M)4Wetf%P_3{gN@q6Q$E$)4=
&amp;(<wbr>_OVHDB<br>
ztTQi)1R&lt;H#)$-Fd&amp;R1`t&gt;^C&amp;%G$gH<wbr>gW7G@yBHpVn1R9Rlb+-J9Yb-(&=
gt;#8N=3D<wbr>8d9jEt<br>
z{woISo*Cci2I?14U&lt;*DTax?JX!EHF<wbr>&lt;Vjs^)4v&lt;WpEb&lt;5qths6$U@f}*y+=
+<wbr>Tn-u|GT<br>
zP+vJZqJqDsU|gjB6Yk!A2`AiLUGF~<wbr>S;CA?46gGWUq96e~G#;49fo&amp;T;eMeq<wbr>9=
VhqJ=3D<br>
zp)Zg5nDg4%xKoZTo&amp;J5F{VX2vsr&amp;U<wbr>H{*}J?%j2_NS4~-OxPYyz{u}JRS{X?<w=
br>W566tU<br>
z&amp;#Ias&gt;j25*(K&gt;TRWO9M|Q9xBQw5jH<wbr>3br9&lt;soEpAAS{Ob}$BDKr1({ez;=
iq*<wbr>;HuKQ&amp;<br>
zXvw?dVUIs%jOLt|&gt;!~|3qPM_e$ZHU<wbr>std@X(fivDUv_ftQSGzPeXP~bz0Yyo<wbr>eX=
j7#t<br>
z41)5CsMU*ir}(bZd^M|$7)qRm^$4d<wbr>bG6F`NleAHS3Og8!&gt;1hw6Z;$0DLp_<wbr>mQj=
14Ay<br>
z45ptVR9m5R8Zu^7eJ~G8-ccztxa7z<wbr>KDc3~KHd@t0*jXtP$3TqaY)m&amp;<wbr>YB7lI0=
7qO9&amp;<br>
z#lYwZ9;4&lt;SqIVUKh)r^W8YCEhx`=3DN<wbr>aF!6*v;(1nJ%XKnN_~Teaz=3DD(1X~TG<wb=
r>Xs&lt;2xQ<br>
z&gt;`*%3&lt;P07{bG#-j@X0)hQ&amp;cw)&amp;+t5<wbr>b&lt;_%)6uJfCRu&gt;nV5u;(k=
M-waKa(+&lt;<wbr>az$*#yB<br>
zKZ#@f?tvn7fy^VvjGAGnqR{6{)&lt;g&amp;<wbr>{&lt;nHmft0GOtvt!wgN9G1h1@}^|V+B?=
<wbr>SDNK5M<br>
zg{RoAM5IaTP4KbGK0__nA;?T65-J@<wbr>q?3*L36Xw&gt;8&gt;YBR=3DcO5AvmO){z8idC<w=
br>e`W;MW<br>
zKfXJa)R1QA!H&lt;Df^f^S;@3RdWpdk&gt;<wbr>W($taF^Flrq1!}m&gt;J`MNiv`?eGpkNM<=
wbr>@#khjt<br>
zWt~=3Ds_*F~?r*_D+)8i-V_we^3lh?s<wbr>7KP(&amp;UbNKPrviafl?OU&amp;tM=3DFRo-8=
TH<wbr>o^yv@v<br>
z?OSz{{D5DF$EVLnkA7G^rQhgJb}K=3D<wbr>|EzQc)szl@h$Er3Z^=3DWY7(H~KsOO10<wbr>&=
lt;xgZuz<br>
zDiJv}{6wA!S`$&amp;$WN)~r&lt;r%d&amp;d07E<wbr>9`&lt;w$@IN~*mQ46*&amp;!&gt;L=
|#-3)hv=3D^D|<wbr>q%Wy6p<br>
z6BvA-zfc31nOwarc}Po2A)@3W%PHW<wbr>)-GzN6!~T`AKpw_2M2z8gX11PYfmWc<wbr>Xszjv=
$<br>
zWMMVfby_D+1TT6c2j+#y&amp;5oMICQcs<wbr>aYh)z4&lt;ltT%g(Vf3F3YLm0@)DI*<wbr>x=
6CK#P6I`<br>
zEJB+B+0Gt+ATC!u%X0&gt;`U&gt;sY-Vb&amp;E<wbr>ZKGLr-D)iYQgrTzd0onMfyhYx&lt;e=
$HU<wbr>YM0(9w<br>
z1h14cNQkTm7g}BYB#gM+azw~XmPiA<wbr>{7}x&lt;lU7*Mox2NXC%hUH%frSN8h8cW<wbr>$9=
e$gr<br>
zow#qMMg56hhW$j!5~+UKiA~*BX#st<wbr>$AsD+k7pJYHC5p!`s*|jA*RnXIQf?<wbr>k`y&lt=
;sec<br>
zJRfETM~dw5rNx*&gt;Rt2@!t&amp;+XEzc$g<wbr>&lt;&amp;Y^YUi+|Ktvwy}HQ4+`Vn&amp=
;b`G50YP<wbr>^BwP0W<br>
zI=3DtGprTAv}UlKj{4R!Q(20r2uKmLe<wbr>o_D6(%z;}te^8Jnu@7+7P`<wbr>29cp6aIO$A5=
GWb<br>
zUpDdZI-k$6KbOtu=3D&lt;xo7ql@8meN=3D*<wbr>Dgp&amp;N|9u*B7{{tLP)1$pej5dX3V^I=
3<wbr>&amp;?jc@w<br>
zy*|2O^*RlRxE7n0%k_2PwZUBP9P_g<wbr>4I=3DBK0p&lt;qbHVnDy%#P@b)9dy7uj&amp;PT<=
wbr>Bi@*kn<br>
zbU-eT(C#qFjEZ)QYe_3+Kf0&amp;}4a`m<wbr>!H!hu~?i{&gt;wfex`qR{NrEKMzA%yQ&amp;=
K<wbr>@%Q;U{<br>
zl;9!KAD7Zv6WuJCCwDsMuLX6IY@nS<wbr>SRF6jK5@Y%F%6(#7KTmRhkHk+9*O(<wbr>SB5k3&=
gt;n<br>
zhXcsd&lt;uG*itc2ag{_#$DlsOszq!`o<wbr>RWJYL&gt;n03-G4B)31oX^WIu3#Iq{ez4<wbr=
>d*|+XN<br>
z&gt;OB?yb(FJVvPL|Ilct2s0fRAfH`dM<wbr>KA%;pe86}KJU1Oc~mDJwv{rQWF{fDl<wbr>O&=
amp;U!`n<br>
z&gt;2dVKRdg!&amp;ps_C|yBO=3DHL?!{tH0sp<wbr>?XHUfppF%GO2ZD8iIrb_M7cftuKSyd<=
wbr>Q^7ZxD<br>
z;MXm&amp;70zZ7CoVgP%HliGQbr*oMQfq<wbr>P6Kez_DzB5%m)J(_OCOu}CN?VH*~<wbr>ihK=
iQLN(<br>
zMU#Vb0_JL!-&lt;t_I#5Yym@RHm%VaZ|<wbr>MI$Hu+CNM$x8YYB&gt;D;eDa%M}y&amp;7-}*=
<wbr>g@s&amp;A}<br>
zS-3*m7^iVGB`Lb1Ml)9|8|iGqx)xz<wbr>f#s&amp;UK=3D=3DCb@sVF=3Dg2?H=3Du2lyM2zP=
Lb<wbr>58A-y+<br>
z!=3Dj{P`&amp;x@&gt;#zNH&amp;E-C_|-2H?=3DPdJ{<wbr>4Z~$^+trdy`V|_4|*x$C&gt;h=
r^8_d@ug<wbr>|D|&lt;0t<br>
zzvVuR#zjf=3D&lt;%-c-y&amp;Y)*D_k5rcMR4<wbr>g=3Di20OCa_L%ahBPliTI{$Vj;M`<wb=
r>CTty?IjGXh<br>
z%WS?+yWb3AHbef6ol0JjjMA*4zUz=3D<wbr>y_0C=3Dt|9g6oVu}Vykz(s4#e)7U@&amp;Sv<w=
br>}4U%*|<br>
zP!t;3cNX5Kk;!yUZ$a5iViqrHp!-&gt;<wbr>Wh4=3D$D!d-yHv*sQvMN&amp;g~9A&lt;!LV%=
CR<wbr>Z!~W!2<br>
zxaBcJzRl9ZK`~PIjBh&amp;@&amp;}qp^Y7$&amp;<wbr>eRR&amp;xsNGbOiG(Or-N*Dzp-fv=
h4r9di<wbr>oQ=3DM5&lt;<br>
zJGd+ajCze7&lt;Pm4he}euW4+n7;k9cX<wbr>t7Un~jdT0gHA01ig5!~sCjx&gt;7Y&gt;t&am=
p;<wbr>Ubj1e6C<br>
zss}j`K*y?h^sC~SO3&amp;R9Jb4=3DbT$cz<wbr>8i@fRq)_Rw0X6wZ`L;@pcvDNoASvuS<wbr=
>%h`NGa<br>
ziiw&amp;&lt;zuqfJ^`M$((udYo)c=3DkM=3D??S<wbr>dj5d@o^s;kgm4TtbYdliQNJrfj8u@=
q<wbr>f3z5(K<br>
zdF?`J+s{ZA(yPD@ab6V|t?!#)5RIZ<wbr>h$kZj&lt;*t8L&amp;W0yH|(zKG44Jt!%;-N+<wb=
r>nMA5`2<br>
zd+;SbasMDWcrXe?*5_Y4Hp~E}ZRsx<wbr>&gt;GE#vbAKY`gSsxGX+_4q-N-9wH_y}<wbr>t7s=
&lt;~cj<br>
z#hKr`cs|PA`6@HvpjYQ_UW?6Vgs46<wbr>9Aa&amp;Ba1X0~&amp;Q{8QZ-Ne~dne+6an~+<wb=
r>d|&amp;cSje<br>
ze4;E}?4NR?Picd7Q5H&amp;mkxe6%1V97<wbr>n&gt;Dk*4lb!hhG(5K)bw`NqK56qg*55)<wb=
r>FXoL;n<br>
z^rK1)92eRaH|&gt;$!Zg!rcy=3D4UJ^p}n<wbr>!-^e`Zn(d?Z`&amp;Aw^+2zeVZ_ur99iC5<=
wbr>UFSG2-<br>
z85MF4gp2SoHU+I+xPn7rV5DzCaY6S<wbr>S&amp;z=3DxC0X#4of=3DkNKXXvh1Beh)~+#<wbr=
>AEc{e#0X<br>
ziaSxw!e9C&gt;^(pA02lxI&amp;!Dsl18=3D??<wbr>eYZ@OM?vuR}i~e8H?5bYU9d&lt;d`kN=
EJ<wbr>9^7N1T<br>
z_&gt;cU29j#S{5Uma&lt;=3DI_Gf&amp;3PVl^~CT<wbr>XR!HHWRB%HGC~;^}*3G^rnVUgUDq=
!<wbr>8uARK$A<br>
zkhT+uKUs9A-@KM(2oE9#E|}Al_+I)<wbr>lyUvE0T+*TtMO+aC2@1Jmo)VTelUxv<wbr>5Z}_K=
I<br>
zW3P&lt;OJn1w&lt;-?LmmZqwj@&lt;!f})8)c?<wbr>yU_GQ)PhQ0X+z&amp;#wgK&amp;?&am=
p;6HQpk924`<wbr>Z&lt;jk4?<br>
zmY011%NQXRB~M)Ta&gt;R*q=3DB_!6-YVV<wbr>&gt;BYDAZccUlJPWf`Kfl25@m^dVLvZ5^<w=
br>Zf6l6s<br>
zff`6}S$opy!Tsn-gH~&lt;bSlS)M0d5l<wbr>j;kIMA&amp;ht4^w@3v6i@Zr|{LVzzxhUB<wb=
r>C4KFAW<br>
z!8-QdNC1&lt;K1nv3h3P{FI6(E%Jn)Nv<wbr>_*3AjYPGZbLpL=3Dj&gt;{t5VG)Rg5-1d4{<w=
br>#sLDlX<br>
zzmVuGqB7&lt;tV-d*QvhEPhyB=3DwdnfzJ<wbr>^5&lt;R*Vvhp?ZS&amp;RoBCZl!{(SkZz^<=
wbr>opMBsEQ6A<br>
zywCDvlwe&amp;)9bH&lt;Xt+tbcMuK7~DCV}<wbr>xo-I1TjcvK&lt;KyRTH4DDG03W4^(Z^{9=
<wbr>gH}vcm<br>
zmjwvG(WVcioH-yZU4m45CsLE`G1?^<wbr>bY0&amp;C(m`g9KAhpi#!0l&lt;y(y|4J*3mb<wb=
r>*s?B@p<br>
zl;Ga3pZ(au87Q*ANUi*TuKr)i)w|@<wbr>3?FMu}x^9a|*BB(&amp;mP7vn9&lt;;e2$;q!<wb=
r>*tmAJI<br>
zMzWf^JilmO31yQxP28GgyFgyiZ-wy<wbr>&amp;n1-gX3S3hL(d4e&lt;05&gt;$&amp;&gt;e=
Y~eDzAs<wbr>dS|jJu<br>
zYOt0O3PxOS!}Cx$V(dnPFPaqKVp#r<wbr>!;F|h+dm$HIxUB$(v!7h0tBva_T@U=3D<wbr>m`N=
BiD<br>
zbSF2(%S42iF*BsV)|g8c*!CK3_Ivu<wbr>Vvk}vdFmz*i4h45_(cqI^iG&amp;{P_}<wbr>d1n=
hLvm_<br>
z4iOVE&lt;`LfOR`*^q#-N)KHiXdn!&amp;{@<wbr>VKq2B=3Dv+gxiKk@L9UrdC-&lt;SJOc`}=
&amp;O<wbr>o$rR=3D@<br>
z2!fCq&gt;&gt;&gt;@$nk+2=3Dc&lt;;{GEkv$cY#9}<wbr>Cw?hlRw+k`NR9Q&lt;k1-!USu=
=3DI+0MRv2<wbr>&amp;T{&gt;7S<br>
zfu}qI+^G!0lR6N)XE|9(04wpKf0qM<wbr>cwpo-wpUyqcnq(_9S8KWq&gt;&gt;{<wbr>GUq7l=
M@O!1Gq<br>
zy7np(r7z-X#9SdWiV{uh5;Mw4becR<wbr>(Vob;LW(L8oMqRmxZ*6f9wes?|tv;<wbr>MQZ`oj=
c<br>
z&lt;hw=3D~RSS%O%Z4qmV1?#X5*IcK1p`h<wbr>3Asc)|EB(Zs!vpyQEn}V+Xx*u~CZH0<wbr>=
R4IIjz<br>
zDm=3DdPa@N4H!%&lt;{4WO}FGXK!D&gt;e?$A<wbr>S;npoF;|f(&gt;@ZlYsI7eYeS$?c+E{w=
=3D<wbr>$PRlyT<br>
zIMnG^O`KVniec=3DV{no}zd&amp;+BnfqOe<wbr>!`vm9Yy_D|Xr|}Y$(zf=3DGe&gt;pyW_<w=
br>akmJ_vHNi<br>
z&lt;n*PFpYt;`5&gt;m@%U!E|{BQG`e&gt;lj+<wbr>4OokCl&lt;iY9&gt;6PJA@lY3=3Dx4T=
Q9-g#Q-<wbr>;go6)~<br>
zGt!a-vRM?rW~3EofNI%Qu_;T`&amp;2ic<wbr>Qx#_x{*W+Fs%YGv03?Y1OtHg2M0(<wbr>5s#=
tBiNG<br>
z&gt;WDz0hew^B&amp;6QdhWez*8AYl)f?tMt<wbr>NX(s2-kI&amp;9_H_Nx1L&lt;tRan5&gt=
;Ku26wi<wbr>iU}6@f<br>
zz{P1JsQlOy2bf%@Q0cV}+mYE&gt;ywiM<wbr>Esm_9jG49oBui;ig0?{^GC2?q=3DT!<wbr>4e=
-ilJO?<br>
zcp-Q{G;gd9ORal~Y*(d^6sf+eGW6n<wbr>ANm~NKf_iOsl)%Pa7d7T$keLT{;<wbr>FWjL8Rxl=
U<br>
z69|{WT}u02fywT=3DBVj~P_^me9mqzi<wbr>6Eop9`jDNS=3DO4EO*%LXmkmElgsF!k;<wbr>a=
DJr1r<br>
zV+0ol(Q~^MpxKPX0p=3Dy;rNVuz$mb_<wbr>X(qcEV4Mxl%&amp;@&lt;9qgB0E7uzwPZaiRu<=
wbr>Y4xwP(<br>
zq_K5R3l*cV)A-2iY=3Dv?aB+&amp;pv1-C`<wbr>&gt;id&amp;Ocyb&amp;i?(Me3(s|tlV;Z=
RH@gyU{<wbr>tCUIAV<br>
zyCOV^S-EQ$^R)M&gt;+oV{X45!U6^XV@<wbr>zs(*pYMsP2)pN8Cbm%g&gt;XGgvdX&gt;Cm_<=
wbr>CT*NP4<br>
zO(KG=3DVNCP;H^*St&lt;oKAj6CEff4r*r<wbr>jP;y3YAA^JTfqQbmkif&lt;*3KD;p-LBm<w=
br>&amp;70fs`<br>
zcq#X_3BO*3UnSe*4+I^;6%YYeV}rw<wbr>RUp*d+=3D)6iiSFR^Fu59KynVg?Kmu&lt;<wbr>s=
dolMT(<br>
zp8YL4_~Re%jAQu!0ocaz+bX{ll?qJ<wbr>nHoS|||CCon`~i2uZqR`LyvdHRuGbB<wbr>?Z*`K=
*<br>
z*U+C~fX?E&gt;yLhL=3DNAX$yC4Q0O#4}v<wbr>rpQBlwfcHk{(l)MWrBB!3Y34Us9XYj<wbr>=
ic-RLR<br>
zQ82dulGgLGTE)Z77yNWo&lt;X^6`#g_#<wbr>BW{adi4sLY!4m{uqm{m)B&gt;&gt;uz24)22<=
wbr>R{34rH<br>
zYXoc@-nnz&lt;5#Di;#KV^fekiN?QI;i<wbr>$)Xla@I!o4HMv;@So+DifJXgu+s#?8<wbr>)M=
^Ux&lt;<br>
z7&amp;*mhDGa&gt;GHgNe|^g~x!xx%r&gt;Wqdn<wbr>pN~H2YDeq$`&gt;EIiR13?iF9zk7At=
NiC<wbr>2x7b@E<br>
zYdrq*V#S}1=3DGhcFeo|JK{~bB?d{zz<wbr>4imQ~io3mweGuLyv5EmH4RFB;{5V&lt;<wbr>l=
7Lk(Be<br>
zb-`NucMrhu_9er@3fU{3r`t#Ivl0x<wbr>s_(R&amp;%&amp;=3DdYV`@Eq~wva+tj=3DoWq+(=
(<wbr>n&gt;e*xk!<br>
J#~S#D004`l-XQ=3D0<br>
<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man.7.gz b/meta/recipes-ext=
ended/man/ma<wbr>n/man.7.gz<br>
deleted file mode 100644<br>
index e85af82426507521badb6f5c425896<wbr>385f469b5a..000000000000000000<wbr=
>0000000000000000000000<br>
GIT binary patch<br>
literal 0<br>
HcmV?d00001<br>
<br>
literal 6192<br>
zcmV-07|-V)iwFn;UKC3L18re$E;j(<wbr>JTWfFINV5ITU(pcuZlr-MC(b;b*~P?<wbr>(Gu9w=
Z<br>
z49mgnV!hbgl3EgDid5L7W$mxO=3DTvo<wbr>*l;xROT&lt;ic7Q)IKcy1E{xs*9uBp6S0<wbr>=
Cm^Z~{<br>
zSEkEVWnTR7!^si;`N3SLvpZYP&amp;H2c<wbr>@vuU+5HlLff_CB4P*CX@m%DK#y$%<wbr>qsd=
eE!qS<br>
zkLr9ja`Re-&amp;bK&lt;`r*v*dMY$Ystc&lt;^<wbr>M&lt;vR5~Epn53vn*|1xw)wdv$l6m-=
%Wj<wbr>0rqjA|<br>
z=3DH8W4Tcv9=3DD&gt;kX~rdXJ2m3kqxws~z<wbr>cvndO3MG`B=3DVPPqGQKd7b$2ZKToi;u<=
wbr>yozU5o<br>
z&amp;b#s+6!6SuS(t0|#~gFE#~iPVdAdm<wbr>P9IW$|CwZ&gt;(xhn(1`8=3D&amp;;+@dJ=
=3D*<wbr>1Jpd&lt;*&gt;Uv<br>
zTk#d4&lt;MJvkodM@{R$-h0y_8GX7Udn<wbr>eY&amp;n{DW~;CgVaV#r4`hOwKzRlhu{@<wbr=
>Dmk-JtB<br>
zlQhR5QhJ}}^@F){W$rQ&amp;L6%NSTXK&amp;<wbr>eS1!v}kW;oZvz5)4vXq0JvrEX!?#vV<w=
br>u=3Dd+?L<br>
z-K;W@LQz*o#o}mgD&gt;pLc2GiNPS`}s<wbr>A4~+G`UOVtBlpuf&amp;rb?%2mR36vp)1R<wb=
r>x^g&lt;&gt;q<br>
z&amp;JX#E&amp;*pZGIekZNi?Ub?B`&amp;J=3DPIrs<wbr>^VEo#0XSkTkra2_Ja-~c21D?1B=
2vF#<wbr>(&gt;^&amp;p|<br>
zRnCQuw_rAN_mC1O&amp;nTNzpI~F&gt;^-Lx<wbr>R8WQ9(6gt~gI$LokGwe(5G5Ml&amp;!X5=
-<wbr>#F5M84<br>
zAf26Ai@w9&amp;a@l&gt;XDyVg_aI${r^se2<wbr>*cd{&lt;(1q6aYGYon{T_ZClT|j~CY*<w=
br>wr{Hm71w<br>
zca6Y&amp;QI|8YvaWq)?CdTtwwaqR-6LD<wbr>1eyFrs@?^DT&gt;M~l*q|VJRb!JY!F)v=3D<=
wbr>6KL7Ug<br>
z`8V`RFEJ~8(p_*y2R&gt;);hzd;Q7f&gt;?<wbr>ao9E9@U;c3V%?YV|ODfh)_Xq!q|2g=3D<w=
br>@x8~&amp;K<br>
zDaJp4Zo~&amp;-@MDi&gt;`cFExme|dz7XDv<wbr>=3D?UU25U!I&lt;P-w-&gt;PSr%)-=3DC=
|g&gt;_<wbr>opY{o?_J}<br>
z&amp;!3-g@TD!Gpk^{#)!DzD`SEk%c0W-<wbr>o=3Dg?SA{MSbl*G&gt;iZ9Y~yFZjb@3uSx4<=
wbr>ok%82&amp;<br>
zw(?N6A7`Jpa`n^PO;ek&lt;v@ra;qvzi<wbr>oy?l-xt?o|EJq)_2X)fC`t!UcV$aO(<wbr>Kv=
#z0?<br>
zm3ye@C~~)@x*XA&lt;{ph=3D}tv46u^7RM<wbr>vU5BpeiQnjjzvike;7-?TS3dJtF%=3D<wbr=
>FkPA&lt;%c<br>
z*O%uBNSfOtP@a{A=3DR9hXoJxF$m!Xr<wbr>tfB1Mc8BdbY8GLiGSm2!-&gt;t|_-3k*$<wbr>=
0W3xyz<br>
zm)!n&amp;Gy-eyul7c6{O=3D8u2iIfs596K<wbr>M&gt;OVQKN-K=3Dy&gt;~GH}Z?4BzH{*{<=
wbr>VlAG3S)VH~Z<br>
zO$Nu|)oq`dp3VxHS6Eapk(FU6LM=3Dx<wbr>3i$w(+hV#udnnecoh7Cq&gt;p6&lt;JTRn*y<w=
br>&gt;j&lt;oh-<br>
zq6i4^IR!kt7uS$*2kG!=3D^hGI`jU2@<wbr>{%8rbZaYd&amp;C`zq&lt;XY4lY(&amp;79fN?=
h0^<wbr>KCQrDE<br>
z4lhG^g(s#69KubKON%F;i!y=3D#0r9o<wbr>zyN8+EXdFZ+$m+TJkPqiKM&lt;?cN@)<wbr>kO=
nIqN}P<br>
z9V3&lt;rb%at&gt;^lk}^U;*EpSC8Zpgt?v<wbr>&lt;vsc(ciu783nf`YJh;npwm3$~Fr_r^<=
wbr>YO@_40<br>
z&amp;u|rGOF=3DXml=3DyVLfuJC8zj3p4!Jr-<wbr>Y4tfPLNg?aPvV7(2JOr5V9J{NJN69C<w=
br>@|0-;)<br>
z^D&lt;)Cs@P&amp;r%OOO8eOWt1^*MwcLNZ-<wbr>y3h)9yTQF{M&lt;&lt;x?TF;!&amp;tNZ=
nFOnoCk<wbr>CAS^J@<br>
z-823dqOuT3t5y!nEOuPJ#F?N&gt;ttC=3D<wbr>}T3m3u7&amp;rdlc5&amp;5FjkpEzDfa;kO=
eW@<wbr>rHic-H<br>
zyM)nok(P)lTqvCmIJM1erf*&gt;&gt;rBNw<wbr>V@{S)S!Z8IUzrzA5xKY*J+r`=3DF_O=3D<=
wbr>Ih2JO0F<br>
z+;ALzBQpOpTo$dnC+6K)JYh(Pbiul<wbr>N`pWgWNDVT!Y33txKya?f)`19pz1d`<wbr>`B1aA=
c<br>
zLpK*-Ckc!EZRzYOX;janMH9$%?9&gt;5<wbr>f=3D~{ypy`8tTX?Wo_RvB)q&lt;R`jNpTrA<w=
br>+a3Z&gt;n<br>
zzC%2d3+!{2K@Y{na1kr0G&amp;Lay&amp;Jn*<wbr>a&amp;`3uKE-jqTpH*DinhT#2w0@}pUg=
xH<wbr>do93+q<br>
zAv3L)=3DIa+PUOs&lt;0Q2aAiX_9UPU~nQ<wbr>(q!5PeX5(zBc(UkXEo?rZk=3D&amp;;&amp=
;g&gt;5s<wbr>8kOdl)<br>
z*??gq?~vNOsOjXs)DSa}zi42Q!+&lt;C<wbr>yTNUN59qlDLMMu=3D`Z`EjR)EvB&lt;Ortb<w=
br>3zmPRC<br>
zYzm(Q1w`2TYwrB4OgAkg6p+XOdD`f<wbr>yE=3DR)SXj(RUs9qa%OSg7l8(s+&gt;7yvw<wbr>=
`4XKaO<br>
zQ?8VuVMvcOu_(nS*klT0^_lf6EDG=3D<wbr>F!swhJpgC{r!j*^*P*2TNwLs#N-(k-<wbr>lNH=
Inv<br>
z)xK-V^R}21kNV#alCVU{r%Fd#votw<wbr>7wTi|e;IefD9T{oZic}-T7lVXi=3D<wbr>Pe7;n?=
mn}<br>
z_kHW^EQF4|!VD7C;-&amp;?&amp;RZy);)_9*<wbr>7*niiLy@RrPQJ^&gt;{m*x?^W|bykyA5=
&gt;<wbr>0Y6gm(<br>
zy}2@92Ln4x&amp;Wdc#Tk*zN?jS9N!^^E<wbr>WU9s&gt;KaW9?ur0*o|h_i&gt;F7eIiN$^y7=
<wbr>p^hl!;<br>
zqJgY!&amp;?SBS8&gt;FubhNa&amp;iTsp+rQX*9<wbr>m;6O((dlQVImC9u2-dVhPIPY|S&gt=
;Er9<wbr>)9;z(1<br>
zW3SH=3Dx%G!cugAYNFg@UPa+XZitOxu<wbr>N(aB{P*zX96u{PhWDG@-)o6&gt;<wbr>5UPk9c=
FvoN5j<br>
z(gYWhHP#!^l=3DPvEAwxJu)ta9_d`gH<wbr>l9Pevh3R?#j_iEi)x=3DzFW{;sHl0{e=3D<wbr=
>XU@MNG<br>
z&amp;@l;~mQcq9?|j&lt;{SBn4*ttQhz&lt;Q|p<wbr>^t$y7MVO*FyA)_{}4tbQk?fTC&gt;x=
WpA<wbr>HGBOl&lt;<br>
zAQgPbBgc-Zvg|O93a**b8KzQs$wS&amp;<wbr>9QdHyRwiI=3Dha6kzR!&gt;v-90!Q20NmTu<=
wbr>=3D@SkFp<br>
z`KiDT?zQPgJ$i!j4qPT18d+@vx&gt;Kb<wbr>DfL&lt;WhcDSd^mMM4|?zu|3+I&gt;9G22BA<=
wbr>$6ayBj<br>
zPNnxzmU*eE5Z|9vv_jt#e|83_zm=3DI<wbr>(90bevHlksDVS|wC7E;FW`YteMo+0}<wbr>uHe=
ht(<br>
ztJ{&lt;qo64-OCNs;bh&amp;5CA&lt;~!i@JQUj<wbr>MvW(cv1XiIc$l-Qj1HFs0dnZ*L(&am=
p;<wbr>4K;aB&gt;gC<br>
zq@kAur%_M*&lt;&gt;7-KQqZiHxI`k9e!dG<wbr>3KLQ;%9)u6z+&gt;+QWMZkqDUL|2}mSzf<=
wbr>Sy*wj6<br>
zQpK}@nYfOFsT-}MYCtiWZD`pD8dc9<wbr>&amp;HNmEa!Ggg`i#WDfsrtvo3MOeNs*;<wbr>xO=
Xg^tq<br>
z17xw73mbw^4S$js`B9u&lt;&amp;`v=3D{T;&amp;5<wbr>oc+9v^NuX3IhG5Grcn)&amp;xKO=
cR=3D{0h5<wbr>+%{tpP<br>
zkFBa`B*B~x*;Y-I2AR3sze*}#AQ0u<wbr>kTrTxBxArVT)p@GkBhj~go0L!qp2$<wbr>k&lt;{=
4)zi<br>
zlF?%}pZ?ovnUF3(pqFUzor`-dikmj<wbr>r^i*x)gG%YDk$g{r=3D@08*=3DJ2}{<wbr>il1mu=
ZopFd<br>
ziju9=3DEE&lt;6_bT{t&amp;|M?cJ@QFcUd$M1<wbr>LTNP~k+GP+8l&lt;5*)0~E%p`|V=3DJ=
61p(<wbr>bq`hP!<br>
zDNPyQS?fDW@YKYJz@p=3D#3Qtw}gPYN<wbr>kTt8g|lkj36717}D=3Du-r815r;d@L*<wbr>gp=
QcTlo<br>
z*(1ZDUuoT3BO}&amp;OgSjP*LDfh^v*0p<wbr>It@F;MwyB{0`rLHI4-9-Rf__RY0&gt;nW<wb=
r>AINr5Z<br>
zBc&amp;}}T!Xfs-k@&gt;hsZq7yi68IL#g*=3D<wbr>nYC@|6;;XC)mGD43&gt;9-j}&lt;3@u=
&amp;)7Ka<wbr>ys&gt;hqj<br>
z$P@fS&gt;vJNKmm`7dfYLJ`l47kt2Zs{<wbr>nC#;Xj`U9CCAGowo{MjggX_ishrGz^<wbr>Hw=
RTB;<br>
zdN|Oha8mKau4@G%%*CSe_}ZlANs93<wbr>hWC)+e*H$$M9f~IDBrNTOhc23u=3D<wbr>j7gqAI=
j3Z<br>
zhzuYPtwco@lu0Q_&amp;D)UEmL-~+&amp;eTb<wbr>DO)|V&gt;Ka&gt;x;Ya+p_02V9sNW^Is=
RVx~<wbr>COpHBR<br>
zYn&gt;O{Jb;9x%^mylo{S7dwXE&lt;GXqUD<wbr>G7~}pj&amp;zaU)=3DD2*OJ5UsjOik5JYa=
^~<wbr>dtxaEt<br>
z4oCxcq%60Vln*(TkIbp65iI8Qdg{u<wbr>@lwG(_Dxk(?b&gt;LHCdFqrFbJJ2pY&gt;|w<wbr=
>S@Rr4F<br>
zJSc7MGeuT0&amp;j|Ue-_zQg-!r&amp;9J-un<wbr>guc7X7GA&gt;X%VJK5?rN%&lt;tz__A0=
8H(<wbr>A-)qV}7<br>
zcY&amp;;~lr4Fm=3D68*M=3D)XfsTbEk&gt;DfS8<wbr>~T0mr#VKjizL0)o9ry+LLkjqF;(M(=
<wbr>kT+!20Q<br>
z4aiwxn`-fPyOq-NeyNYOMHigImm2&lt;<wbr>oLq}`i;$}SP%=3DN%;^vI=3Dsx_%E4*JY-<wb=
r>RU}w_I<br>
zmGlxG4AQwjVl{-BPuFA9$IAn;Yra2<wbr>Bbme0i*Ju=3D94E~DuWv8UZt}`W%(SN#<wbr>LyL=
oCW<br>
zmN~&gt;~wzgzm|0|0-OP9M+GqsDG%lE4<wbr>2p+pmviXJd9DPzJuCbx^TA77h`&gt;+^<wbr>=
SiVU_T9<br>
zF$ULian}1Qevv!&lt;`Q!2Hzv_s&lt;Bz`&lt;<wbr>q{G$IhckmrN5i7tPfmX-=3DMK)+Z7~j=
O<wbr>Rp6O{3<br>
zg_hPJddt;EKwnaGw_=3DM-z^MsE##1#<wbr>G+pv|mg|)|o6(rWG--^sSZ}io&gt;iJed<wbr>=
(LnID$<br>
z?R1&amp;bq4ES-Q-_ch^qJvSOp@SoQc(p<wbr>?l9rkX1n4JaM7xm1&gt;!AO(l*UyjgJbG<wb=
r>l1+eH0<br>
z(_913$)V80U=3Dr{W-FihVA%Q}U*McU<wbr>}+V4}R+*L7pi@EYPeVc3w(#l-$h@R_<wbr>Ebt=
x3P<br>
z8wL}2KMXbjp@a~v3ZrTd5XOxfgnBF<wbr>GexG_CxBR!|bOAs8jQV8UgJl&amp;#<wbr>DvIXC=
=3D$n)!<br>
z#knvm6~$Zp_oowcd)v&lt;}?wuOB@q#x<wbr>&gt;E7vb|+@E&lt;$rWaVo?QQ;#(ej^&lt;+)=
8+<wbr>^W%W^b<br>
z0hfI$bJ?7P^H@tBY2~n3R9kH#SaXN<wbr>UVy*s7iHSp6Rn_M7_?Qzd^O{GP$5`<wbr>giA3pI=
&amp;<br>
z@w1yDbL&lt;7L()+C!7k&amp;|6e8;2pNu2j<wbr>xQM2fa;L{_&lt;1ho7wE3GcuP7&amp;RC=
zTO6<wbr>d)CU|v<br>
zs6G6Bul~$;(xT`=3DxyBgRX~i`U09`m<wbr>t%ZiyEmIYhZ)(#{tubYq^i=3DmyMBg$!<wbr>s=
i&gt;)Z;<br>
zB$Pgd&lt;9~rSmOkbDXI)5nNKQjSRJ=3D_<wbr>6%w?I)9l`biXl8(Udy`yCdQ{n|5B4i<wbr>=
LDSj(F<br>
zhm+#L*RGRS3|=3DKXSrFv2SE1NL2Ul+<wbr>)?&gt;SN?M&lt;)f1J8E|b1hvtHoibL^RZN}<w=
br>GBpduX<br>
z|I72y*Z2R~TwJX|(l)85;iN!&lt;Ske#<wbr>ZvOS4lMNjHYQYOS6P2+h1d?ZjV@9B+<wbr>DQ=
SM!}<br>
zrJJVgbJLy=3D#}mC(2&amp;o;ceNgj(-2&gt;_<wbr>0y05Mw^(C8x6lG0z&gt;uHg}+VLQam?=
Uo<wbr>`C-3e_<br>
zlds1?{hPHEH=3DPv4S}MFBhh$%p_XO#<wbr>dM+o!1vlbbO=3DW%HHCAkhQBTtXT01?T<wbr>A=
VP!(m<br>
zLFTVB7FL#QNSLj1Eiy#mh@nbkdwfi<wbr>tvVv-*Z^)XAJv9erAR#gdO)~BIBl`<wbr>rxIl){=
4<br>
zZc~_*441aZ3F&amp;a9mYQl^qZR=3D7j5e;<wbr>-4|`vv*crIF?mJ&gt;e?tu+i?fc1A4rn%<=
wbr>om-xW9<br>
zrF*Lip|-;&gt;pGg~7=3D%`}z&amp;uf{fjz`Q<wbr>*XNL*~Y7*9ncrGR&amp;6=3DdW_L$d^=
%RA`A<wbr>_P+L*u<br>
zYMSv&gt;MRmDT7zz#x;8@RK%uNH6eUmI<wbr>n$lVr4vm&amp;e4In6wia#WW`HXhVk&amp;<w=
br>i1b$5hgaB<br>
z6(Z(8t77w#pc}=3Dwf?B!&lt;FWe&amp;fFK4|<wbr>l*&lt;!%Mv|``EcT`4Q;M8TQyVr8&lt=
;G~k+<wbr>k&amp;^tvH<br>
zJ1HyrM7pvfY*hrM2Vh}x2zhX-F2VJ<wbr>9G&gt;NNG_zU^y#dH%d%5VV}r5E$&amp;!<wbr>i=
Ni&amp;g^M&amp;k<br>
z!XE0yB8?YSxLEDtm}R`k!$of6MWmB<wbr>QI{7MGY~rK{^x-11TE)4l(r9G)<wbr>JN3xIz%s8=
I<br>
zqR3NZ&gt;-@}ac+8HRB&lt;HbiUy)aPL#l4<wbr>9&lt;tHIa9R!$9^~{~_MYmm~J-TF*oShM<=
wbr>5SRc!&amp;<br>
zg2EDVaqAGsK89nzINL7pT5FdH&amp;Fz6<wbr>n?8AeGz&lt;k$IRcQV}ybJEn(`8x&gt;BP(%=
<wbr>lp9N{$<br>
zy8msij+(1cbJc6E{-?S6&gt;Y=3D^tKeRu<wbr>(*MIuZT;}cFygOvU%Xl7&amp;pL}-c4Gwl<=
wbr>fdL&gt;IM<br>
zh9KcGorROrw}r&amp;PnCdq*p{58gg&lt;x3<wbr>zbd&amp;V;%wVHkOSDfpQil&amp;qrA8N=
mdw9X<wbr>)g(fJ=3D<br>
z+0B6GN|MhgqPJ&gt;}KxAj8Pb(NCO+`l<wbr>P?77x$&lt;3Poisnn|JnL&lt;-fw+SXd`%e3<=
wbr>ivsAcO<br>
z&gt;ZlpJvz@q+#Ixfq#M4lUeq`gL&lt;Xm7<wbr>%v%pa2Q+~nBAZfb=3DHdcBd0t4_sGfCH<w=
br>Sx3t}N<br>
z`!&gt;cls%N*&amp;tJ5uXJ&amp;FGI`aB+d1aCV<wbr>Sg`?=3DuW(*_n4M&amp;S%&gt;RP5=
`bL1fMwr{^<wbr>w{6{K5<br>
z_?ycQ&gt;-SrhVM2VRQ&gt;^iUGVFh#{Wu{<wbr>zi(YWQPmKjC$UKz(!@G+riM33m+R#}<wbr=
>x5Ixe+<br>
zCwSJVCJOapXikRa&lt;&lt;NXRG}l8j9-6b<wbr>ExsoQ}H@}9eYui!KxF;c#7p*G$(0eo<wbr=
>1cu1WG<br>
z7fndUDt3i(N{&lt;0pI=3Dhn{iS;9P`ywX<wbr>=3DhdhWUgq6PPg6Q}o5htiVyBC2j(sJG<wb=
r>D@kSVk<br>
z$HncGJE^cE&gt;&lt;p94&gt;9Dm;wKchHy3C&gt;<wbr>Ddcw+PT;&gt;?z{8-{uTyxR-z2s4=
s5@wD<wbr>^l5(o-<br>
zr3iju-i_a%Po$P}T&gt;J9a!xOq=3D$pMb<wbr>dKfXHtr(uS299kP=3Do+m&gt;w&lt;FR&am=
p;UXlv)<wbr>k8xrDq<br>
z$xaU%VRCKP9|guV2H^l)e!3p}LCg~<wbr>+XHF}gUB5~MH7Obp%ar39X~;NPRqIT<wbr>fK6v8=
1<br>
zck)!#rO;YyhPGe2!nQD8$y+gAX^C*<wbr>VUqoQkkw*E&amp;PG97mSfS~3j*p`1#Km!<wbr>4=
ZJjhO<br>
zHR-$2ax^qQc9K)=3Dtk0z#i4D2~Iq=3DS<wbr>TBp0+qpy}ZX;hp9&amp;6%0Q6Mx+$bQg9n<w=
br>SqS$Ci<br>
zo6xY%yAs@3D4^GE4k;3zMs8PZ1g3X<wbr>xgCUQELQ%IrlIn5j782NQ`p*WjR^<wbr>JA6euJQ=
O<br>
zZ1BtW6xZPNBX&lt;7Gm63kfTfyE;F`?d<wbr>a1eG-j1ppG9ISiuz&lt;Dg3nInB?P?~ng<wbr=
>&gt;`CbVo<br>
z`vj%*2a0ct*|aF`NHmtrTt*a9FX59<wbr>aA2H?Y$(!*w(Xx$hmo+_11;%=3D<wbr>zVjSGXrJ=
hme<br>
zhi!TEXU`Dt&gt;CyID3KEs5^tCl@NiEn<wbr>ICShIVZUwWBRTDi-(CVmbdik~Pf7r?<wbr>)t=
=3DiZ_<br>
zg&lt;l;sYPPOzDpiL-t+gGP(9{zjRlb@<wbr>`fV^w-Cv`IPohttB&gt;gOoAh;6KGmrCq<wbr=
>UX`!5)<br>
zy0l+lz!;^R7p0nnumUdTnaWW4&gt;PtU<wbr>^xXjEAjNc&amp;$u3-kOe+i1C&lt;hmieJ^5=
=3D<wbr>hAWVH&lt;<br>
z+%-*WzN6}1`?X%uAGpMQ$?0Z7X=3Dj-<wbr>bDs^sbl1)16{4Nvep6cAG63DOf`#!l<wbr>}B2=
Aym<br>
zE%?f_Pd}@xye!&amp;Ny%6BF6HeL-r4N*<wbr>w6Est@bZIl=3Du28q|a1bE@ZI9Wy^vED<wbr=
>@=3DLbL1<br>
ziNmN7D98?|zt!_wfk#&gt;-vAN1xaNRJ<wbr>G9`RCRM#!b~)I{Kxd^T3h&amp;R}9v#<wbr>m=
Uw1SgMdb<br>
zH!_d}j(qHI2ZRc(HS8Dktixgx!U@T<wbr>}oPD$vkkHyFu(bo_=3DBXVf@yjx;j5MO<wbr>+7f=
LWR<br>
z4%9k~o(kzpTB&lt;GfRW}KBZc5)DH6ro<wbr>SNZ~Q)F0{op;Z{mJRkKs`rsTKRS#<wbr>5nPt=
4hLb<br>
zPEAu3G*Ij!)OIhl77@BSgZHj^*rcB<wbr>?5cly5lK`5LjQ@@K3gLTGub{J#PFX1<wbr>1&gt;=
rXcq<br>
zAK7Ng-&gt;k&gt;*^zWs99rcT4DfUgqB2WM<wbr>G=3Dh;u6XS^O^^9N&gt;IYICwPj~<wbr>d=
jv3fmq=3Db?M8G<br>
zgKrHFKkw&lt;zLDK~;3SS}cI9z*s_dmX<wbr>PVxC{vw=3D$Wnwl2M+E&lt;xLU`1Mm&gt;%tn=
i<wbr>OKAOAk<br>
zT&lt;Xx^(2uSt&gt;r2dibn)@mn~(bCWB5i<wbr>ZUt|KM&lt;_Am+p5Wp?_@s!v#`h_^kK@-<=
wbr>pPklN!<br>
zjKD|GqI?6$((671QRo@ly7PE|qnNH<wbr>YIX^eA-%mdF9{0-*JI5N$PkP_(j|<wbr>OOUM*k~=
*<br>
zTrqsqmAf~FgudIm73#&gt;t!&gt;-!l-ZvY<wbr>&lt;_nVLJKVDtLFK%KW+^{bODi^*KF)<wb=
r>v3aFQW&gt;|<br>
zMiP-Wq*&gt;MDK&gt;@+U(~Z}Bs&amp;TC=3DPes%<wbr>S7vT$+X}v^z4)JKglLLUA&lt;N(R=
ZNdwk<wbr>!+%RxF<br>
OO8yVmcsMtKI{*OKZ6#&gt;{<br>
<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/man.conf b/meta/recipes-ext=
ended/man/ma<wbr>n/man.conf<br>
deleted file mode 100644<br>
index fc10be2758d..00000000000<br>
--- a/meta/recipes-extended/man/ma<wbr>n/man.conf<br>
+++ /dev/null<br>
@@ -1,141 +0,0 @@<br>
-#<br>
-# Generated automatically from <a href=3D"http://man.conf.in" rel=3D"noref=
errer" target=3D"_blank">man.conf.in</a> by the<br>
-# configure script.<br>
-#<br>
-# man.conf from man-1.5p<br>
-#<br>
-# For more information about this file, see the man pages man(1)<br>
-# and man.conf(5).<br>
-#<br>
-# This file is read by man to configure the default manpath (also used<br>
-# when MANPATH contains an empty substring), to find out where the cat<br>
-# pages corresponding to given man pages should be stored,<br>
-# and to map each PATH element to a manpath element.<br>
-# It may also record the pathname of the man binary. [This is unused.]<br>
-# The format is:<br>
-#<br>
-# MANBIN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pathname<br=
>
-# MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 manpath_element =
[corresponding_catdir]<br>
-# MANPATH_MAP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path_element=C2=A0 =C2=A0 =
manpath_element<br>
-#<br>
-# If no catdir is given, it is assumed to be equal to the mandir<br>
-# (so that this dir has both man1 etc. and cat1 etc. subdirs).<br>
-# This is the traditional Unix setup.<br>
-# Certain versions of the FSSTND recommend putting formatted versions<br>
-# of /usr/.../man/manx/page.x into /var/catman/.../catx/page.x.<br>
-# The keyword FSSTND will cause this behaviour.<br>
-# Certain versions of the FHS recommend putting formatted versions of<br>
-# /usr/.../share/man/[locale/]ma<wbr>nx/page.x into<br>
-# /var/cache/man/.../[locale/]ca<wbr>tx/page.x.<br>
-# The keyword FHS will cause this behaviour (and overrides FSSTND).<br>
-# Explicitly given catdirs override.<br>
-#<br>
-# FSSTND<br>
-FHS<br>
-#<br>
-# This file is also read by man in order to find how to call nroff, less, =
etc.,<br>
-# and to determine the correspondence between extensions and decompressors=
.<br>
-#<br>
-# MANBIN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/local/=
bin/man<br>
-#<br>
-# Every automatically generated MANPATH includes these fields<br>
-#<br>
-MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/man<br>
-MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/share/man<br>
-MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/local/man<br>
-MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/local/share/man<br>
-MANPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/X11R6/man<br>
-#<br>
-# Uncomment if you want to include one of these by default<br>
-#<br>
-# MANPATH=C2=A0 =C2=A0 =C2=A0 /opt/*/man<br>
-# MANPATH=C2=A0 =C2=A0 =C2=A0 /usr/lib/*/man<br>
-# MANPATH=C2=A0 =C2=A0 =C2=A0 /usr/share/*/man<br>
-# MANPATH=C2=A0 =C2=A0 =C2=A0 /usr/kerberos/man<br>
-#<br>
-# Set up PATH to MANPATH mapping<br>
-#<br>
-# If people ask for &quot;man foo&quot; and have &quot;/dir/bin/foo&quot; =
in their PATH<br>
-# and the docs are found in &quot;/dir/man&quot;, then no mapping is requi=
red.<br>
-#<br>
-# The below mappings are superfluous when the right hand side is<br>
-# in the mandatory manpath already, but will keep man from statting<br>
-# lots of other nearby files and directories.<br>
-#<br>
-MANPATH_MAP=C2=A0 =C2=A0 /bin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /usr/share/man<br>
-MANPATH_MAP=C2=A0 =C2=A0 /sbin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/share/man<br>
-MANPATH_MAP=C2=A0 =C2=A0 /usr/bin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /usr/share/man<br>
-MANPATH_MAP=C2=A0 =C2=A0 /usr/sbin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/usr/share/man<br>
-MANPATH_MAP=C2=A0 =C2=A0 /usr/local/bin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/usr/local/share/man<br>
-MANPATH_MAP=C2=A0 =C2=A0 /usr/local/sbin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/usr/local/share/man<br>
-MANPATH_MAP=C2=A0 =C2=A0 /usr/X11R6/bin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/usr/X11R6/man<br>
-MANPATH_MAP=C2=A0 =C2=A0 /usr/bin/X11=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /usr/X11R6/man<br>
-MANPATH_MAP=C2=A0 =C2=A0 /usr/bin/mh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/usr/share/man<br>
-#<br>
-# NOAUTOPATH keeps man from automatically adding directories that look lik=
e<br>
-# manual page directories to the path.<br>
-#<br>
-#NOAUTOPATH<br>
-#<br>
-# NOCACHE keeps man from creating cache pages (&quot;cat pages&quot;)<br>
-# (generally one enables/disable cat page creation by creating/deleting<br=
>
-# the directory they would live in - man never does mkdir)<br>
-#<br>
-#NOCACHE<br>
-#<br>
-# Useful paths - note that COL should not be defined when<br>
-# NROFF is defined as &quot;groff -Tascii&quot; or &quot;groff -Tlatin1&qu=
ot;;<br>
-# not only is it superfluous, but it actually damages the output.<br>
-# For use with utf-8, NROFF should be &quot;nroff -mandoc&quot; without -T=
 option.<br>
-# (Maybe - but today I need -Tlatin1 to prevent double conversion to utf8.=
)<br>
-#<br>
-# If you have a new troff (version 1.18.1?) and its colored output<br>
-# causes problems, add the -c option to TROFF, NROFF, JNROFF.<br>
-#<br>
-TROFF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/groff -Tps -mandoc<br>
-NROFF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/nroff -Tlatin1 -mandoc<br=
>
-JNROFF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/bin/groff -Tnippon -mandocj<b=
r>
-EQN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/eqn -Tps<br>
-NEQN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/bin/eqn -Tlatin1<br>
-JNEQN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/eqn -Tnippon<br>
-TBL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/tbl<br>
-# COL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/col<br>
-REFER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/refer<br>
-PIC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/pic<br>
-VGRIND<br>
-GRAP<br>
-PAGER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/less -isR<br>
-CAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /bin/cat<br>
-#<br>
-# The command &quot;man -a xyzzy&quot; will show all man pages for xyzzy.<=
br>
-# When CMP is defined man will try to avoid showing the same<br>
-# text twice. (But compressed pages compare unequal.)<br>
-#<br>
-CMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/cmp -s<br>
-#<br>
-# Compress cat pages<br>
-#<br>
-COMPRESS=C2=A0 =C2=A0 =C2=A0 =C2=A0/bin/bzip2<br>
-COMPRESS_EXT=C2=A0 =C2=A0.bz2<br>
-#<br>
-# Default manual sections (and order) to search if -S is not specified<br>
-# and the MANSECT environment variable is not set.<br>
-#<br>
-MANSECT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1:1p:8:2:3:=
3p:4:5:6:7:9:0p:tcl<wbr>:n:l:p:o<br>
-#<br>
-# Default options to use when man is invoked without options<br>
-# This is mainly for the benefit of those that think -a should be the defa=
ult<br>
-# Note that some systems have /usr/man/allman, causing pages to be shown t=
wice.<br>
-#<br>
-#MANDEFOPTIONS -a<br>
-#<br>
-# Decompress with given decompressor when input file has given extension<b=
r>
-# The command given must act as a filter.<br>
-#<br>
-.gz=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /bin/gunzip -c<br>
-.bz2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/bin/bunzip2 -c<br>
-.xz=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/unxz -c<br>
-.z<br>
-.Z=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/bin/zcat<br>
-.F<br>
-.Y<br>
diff --git a/meta/recipes-extended/man/ma<wbr>n/manpath.5.gz b/meta/recipes=
-extended/man/ma<wbr>n/manpath.5.gz<br>
deleted file mode 100644<br>
index c012ff89763bb057afaaaed3b61624<wbr>4748354fec..000000000000000000<wbr=
>0000000000000000000000<br>
GIT binary patch<br>
literal 0<br>
HcmV?d00001<br>
<br>
literal 2133<br>
zcmV-b2&amp;(rViwFP!000021HD&amp;WZ`(K<wbr>)eb=3DwJ$Sg21;3#oBZIkZH=3DBufJ#t=
C8<wbr>&lt;onpM`<br>
z(h_BJD^UU|#r2{;e$OQ-$##;#JPpv<wbr>;t|(sKd(OEZjOPb*D&gt;PMNDJd%r{}<wbr>rO9G=
NXDW<br>
zsSvsn^(szEov9_Iq85~?Tt@NyfdA;<wbr>StTsk1S2Z184rp|C_S=3Dv@-_VT_vXJy<wbr>8rY=
|ao<br>
z(KMz*{uK|N+4t(?WHjW@ckc5P%em6<wbr>@Mbx&amp;`ad+6)vVlh%N|mjRS~Rt!MyJv<wbr>^=
S8Hhs<br>
z+xmSo`Aj!bOCxf+Zx*&gt;qoPkd&amp;k=3DjZ<wbr>UmTV;xl_{AL4&amp;p5w7G2)me;rS5@=
BkP<wbr>jWg#uC<br>
zRlVXDoB`l*lrDM))V6z5?72&amp;7dUZy<wbr>l*Y8ix-oGBv&amp;F##gLJkICa1#eS{v~<wb=
r>B&gt;8)M`q<br>
z7D?QEACNN=3D#T9&amp;=3DeWcs-$^ALL-_XI<wbr>UlhMi1$*ZH$+XMV3eiOgL_pz*#&lt;6V=
B<wbr>&gt;#`Ggi<br>
z&amp;Tp@yut4*pJw~6|78u3WtLy3I!}xw<wbr>SzMDj|o__N0HAZm29w}w1u|RLJX@$}<wbr>N=
YbPVX<br>
zlB-%t8`UMCw$i$Hjs3MXXbBFP2EeO<wbr>A4hgR*ovK8D(Dh0st8H`9N`Xd`;<wbr>LFlsYhXa=
a<br>
zNZz=3D&gt;r;*s1I#xHfmIZBZ5jw?t5&amp;Td<wbr>~$8-Vuj7;j%@Ul1ILSgw^eyo=3DSUtF=
9<wbr>vj-s(g<br>
zPU=3DTxN?k}@)1xp-EEu(i3;IXPRRmB<wbr>(4sX&amp;8Sy&gt;O=3DHl;lQj2v*Rh0-{SRR!=
<wbr>Ta$HrRa<br>
zd8A7)_9%@}DNNL{qvylj!|nOZF_V&gt;<wbr>fUar|wXgEiNn~GxvCJAdw*ZGDJWVzG<wbr>|p=
}mKq<br>
z?xXl(Oux{ab&lt;IIU7rD^i35kZCB_~m<wbr>d)L6)+(wYrB;S21dUn2Ht59(mW0}N&lt;<wbr=
>OBh$D$<br>
z2Z&amp;sq&amp;+Z&lt;+ert6+Z^{2AbLr0i&lt;WFX<wbr>F0UV&gt;$%b*jA%R~tzHYA$5WF=
QlfBf6z<wbr>aZ#c8Z<br>
zfnAji00~gXKucMNDPt7&amp;DxKs_3iie<wbr>iblh0O6wr?IYznU5!|iRK|56a3o|-<wbr>DS=
&lt;$Qwv<br>
zcAYFlRRLqD&gt;jRLNB3Z$gos*)hY;;$<wbr>gIDLM#TPA798}^-PX%cBFS@phdZJ!*<wbr>Xo=
M#uz<br>
z(1i~%8}Avyqlfv=3DKjuGq4SeiCkUh}<wbr>+=3DfD4yy)KDEvcH_FZK1M5r=3DzmsJaHV<wbr=
>YSCY4_<br>
zq%wUrQeYRRI8#}1j^92BxG+`1KqXB<wbr>s40BynrKtsiQW=3DXG2f93Eni`c-Wy+-<wbr>y#g=
KhE<br>
z#G$&amp;yJk*k&gt;wJ&amp;-uYq7p^ok;lIl{81<wbr>p+H&lt;ut4tocYsyoo^)6%z7$GDaz=
3D;<wbr>6#y?@?+<br>
zcL=3DbH{PwV@^key*vzV7r!)ARzFCD-<wbr>vHMVi!`&amp;!^3_C1#6#;Fq7#+|a8JHvM<wbr=
>QI4_Z6<br>
z{48Rhx|e&lt;*jUL{HG~&lt;HGjIsxy&amp;Xfh<wbr>%=3Ds9~%*z6mZM6aUY7c!?;R(KY;tB=
pv<wbr>NmlCl@<br>
z{L}fkC+3L93G6NlRoAShXtuS}Ihl*<wbr>Z=3Dft{I9xDpn1m)kg46gT7YM@piWm(-<wbr>G;p=
i#C<br>
zn)fFHoOFr93V&gt;o;g9ye?CMb7$gFch<wbr>1G-~_Rrn9zjC;Q~!$Z--fp`&gt;yFx*w&amp;=
<wbr>_`wPrF<br>
zy7@sLrqkKvDq&gt;u|%gq|IhpP$yX%`Z<wbr>(()K{$=3DOSkR@K_`@Yo&amp;7l0Db0uRyP`<=
wbr>w%{Rl~<br>
zzm}{_0T25C*a3(s&gt;Sf32FDazEufZ%<wbr>)kz;madq{sS&gt;HI8g^7W&amp;aT&amp;K8W=
+c&lt;?<wbr>WN_^1d<br>
z)6@}-?A+he%k(&amp;v-&gt;$CX)6+L+Bi7-<wbr>$ebS+Q^&lt;X5pFY&lt;KbzJsg)9g=3DN=
rSS&amp;i<wbr>k9`&amp;&amp;^<br>
zC(K$qHo4yAYfZB_&gt;bY~+mabm(51ov<wbr>o9FrxFBFb3I5AL0{;)#{ZQc@b`0rqP<wbr>I*=
B1Li<br>
zq#*xXll&amp;oy%8zDz@(x^Ekw-;i{cwx<wbr>jaQVeHcy;|@Jh?^(glgt2#YR3?^;<wbr>4NK=
M1``6<br>
z%rR2Pvax$ruN{}{KT);3I&lt;ZSMdHq~<wbr>@%(`Ku+xOC}X`*h}&lt;W3;F)=3DsVcFh!K<w=
br>k7JC-z<br>
zJ&amp;OI7td&gt;SrUBRjsISqzRU9A&lt;=3DS{Jo<wbr>2%f?SVuDP&lt;0t-Y?XPOmR{fOdT=
{8(R&gt;<wbr>D$oPNp<br>
z{3riI@=3DgB)$6jX;-A+pgrnZ`3WF?D<wbr>-3zr{KQ4W2n&lt;eUhOgz}*tabVE#Q_%g<wbr>=
a+J&gt;tv<br>
zCdT`F=3DV`37C|IHqY0Bx8UegJ^!p-D<wbr>2I-|GrE{ZdScdy+ZI8wlds&amp;e^)6YSv<wbr=
>&lt;zx1%J<br>
zU_LNn@!L+&lt;aFY8X7X}_Iz3J^n0l{P<wbr>0hP37O;KIXiHUxeJ&gt;eHxL4LDJQRrq0<wbr=
>1;5K0d<br>
zcTpQ@yX#Tw3U(}HUSdQ8(@t6&gt;vy79<wbr>kE8Jl=3D-QZH{s=3Dt&lt;g=3D8``u+&amp;2=
|Z;<wbr>LeZEOUn}o<br>
zzrN;a1aE?NRN9@89P@EBZK-xnZdnM<wbr>_w|&amp;~pdjCbe_69wi1?Jv1kmyjx%a{&amp;<w=
br>E3&lt;Q{q<br>
z&lt;M?3U(d@~Yx`7D8MHOZ&lt;uKb}WgD29<wbr>WXtNS8c1*^e^LA(+PcF}AU&amp;dE%)?<w=
br>cf%UbQzT<br>
zzM3m;sO~8vm-8IMvyw|V|9BYnLxE$<wbr>98D$-Wnek9%Tx2ZT!+?8#$E2sH*Djr<wbr>&amp;=
Y|rw)<br>
z|8=3D*P?kMy3c=3Dn82T#Ec}Cun{2KWWM<wbr>#?VT?2wb)p8!1t{&gt;++9T&lt;QBbqXvdCE=
<wbr>+Lgq_h<br>
zQipt4_R*DlX!xG*#1#g}cFGRo^Ea;<wbr>`zi^Rtc_j4Gjio5mtgbCZ_}Y5$utP@<wbr>+1x@Z=
Q<br>
z&amp;o4h-hfzKkOB7XH`A}xv9_~tqqe0{<wbr>*MTdENL-(NU+zb6p`Qr1&lt;6q8Dj8C+|<wb=
r>)iHHTR<br>
z)UN#a&gt;obd;FCBhp;;R4#7wg8Fm-|e<wbr>wfUMEJSRi9kX_aXS52xWAzQO}1G+V9<wbr>-z=
LNbP<br>
L!Vpl2a}xjn5ok8&amp;<br>
<br>
diff --git a/meta/recipes-extended/man/<a href=3D"http://man_1.6g.bb" rel=
=3D"noreferrer" target=3D"_blank">ma<wbr>n_1.6g.bb</a> b/meta/recipes-exten=
ded/man/<a href=3D"http://man_1.6g.bb" rel=3D"noreferrer" target=3D"_blank"=
>ma<wbr>n_1.6g.bb</a><br>
deleted file mode 100644<br>
index ff603f842c1..00000000000<br>
--- a/meta/recipes-extended/man/<a href=3D"http://man_1.6g.bb" rel=3D"noref=
errer" target=3D"_blank">ma<wbr>n_1.6g.bb</a><br>
+++ /dev/null<br>
@@ -1,86 +0,0 @@<br>
-SUMMARY =3D &quot;Online documentation tools&quot;<br>
-DESCRIPTION =3D &quot;A set of documentation tools: man, apropos and whati=
s&quot;<br>
-SECTION =3D &quot;console/utils&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://primates.ximian.com/~flucifredi/man" =
rel=3D"noreferrer" target=3D"_blank">http://primates.ximian.com/~f<wbr>luci=
fredi/man</a>&quot;<br>
-LICENSE =3D &quot;GPLv2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D8ca43cbc84<wbr>2c2336e8359=
26c2166c28b&quot;<br>
-<br>
-PR =3D &quot;r1&quot;<br>
-<br>
-DEPENDS =3D &quot;groff less&quot;<br>
-<br>
-def compress_pkg(d):<br>
-=C2=A0 =C2=A0 if &quot;compress_doc&quot; in (d.getVar(&quot;INHERIT&quot;=
) or &quot;&quot;).split():<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compress =3D d.getVar(&quot;DOC_COMPRESS=
&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if compress =3D=3D &quot;gz&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;gzip&quot;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif compress =3D=3D &quot;bz2&quot;:<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;bzip2&quot;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif compress =3D=3D &quot;xz&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;xz&quot;<br>
-=C2=A0 =C2=A0 return &quot;&quot;<br>
-<br>
-RDEPENDS_${PN} +=3D &quot;${@compress_pkg(d)}&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://pkgs.fedoraproject.org/lookaside/pkgs/=
man2html/$%7BBP%7D.tar.gz/ba154d5796928b841c9c69f0ae376660/$%7BBP%7D.tar.gz=
" rel=3D"noreferrer" target=3D"_blank">http://pkgs.fedoraproject.org<wbr>/l=
ookaside/pkgs/man2html/${BP}<wbr>.tar.gz/ba154d5796928b841c9c69<wbr>f0ae376=
660/${BP}.tar.gz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5k-confpath.patc<wbr=
>h;striplevel=3D0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5h1-make.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5k-nonascii.<wbr>pat=
ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.6e-security.<wbr>pat=
ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.6e-mandirs.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5m2-bug11621.pat<wbr=
>ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5k-sofix.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http://man-1.5m=
2-buildroot.pa">man-1.5m2-buildroot.pa</a><wbr>tch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.6e-ro_usr.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5i2-newline.patc<wbr=
>h;striplevel=3D0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5j-utf8.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5i2-overflow.pat<wbr=
>ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5j-nocache.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5i2-initial.<wbr>pat=
ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5h1-gencat.<wbr>patc=
h;striplevel=3D0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5g-nonrootbuild.<wbr=
>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5j-i18n.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.6e-whatis2.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.6e-use_i18n_<wbr>var=
s_in_a_std_way.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5m2-no-color-<wbr>fo=
r-printing.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.5m2-sigpipe.<wbr>pat=
ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.6e-i18n_whatis.p<wbr=
>atch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.6e-new_sections.<wbr=
>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man.1.gz;unpack=3Dfalse \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man.7.gz;unpack=3Dfalse \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man.conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://manpath.5.gz;unpack=3Dfa<w=
br>lse \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.6g-whatis3.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure_sed.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.6g-parallel.<wbr>pat=
ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.6g-compile-warni<wbr=
>ngs.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://man-1.6g-configure.pat<wbr=
>ch \<br>
-&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;ba154d5796928b841c9c69f0ae376<wbr>660&quot;<br>
-SRC_URI[sha256sum] =3D &quot;ccdcb8c3f4e0080923d7e818f0e4a<wbr>202db26c464=
15eaef361387c20995b<wbr>8959f&quot;<br>
-<br>
-CFLAGS +=3D &quot;-DSYSV&quot;<br>
-<br>
-do_configure () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/configure -default -confdir /etc +sgid +f=
hs +lang all<br>
-}<br>
-<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D}<br>
-}<br>
-<br>
-do_install_append(){<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p=C2=A0 ${D}${sysconfdir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${datadir}/man/man5<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${datadir}/man/man7<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/man.conf ${D}${sysconfdir}/man.co=
nfig<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/man.1.gz ${D}${datadir}/man/man1=
/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/man.7.gz ${D}${datadir}/man/man7=
/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/manpath.5.gz ${D}${datadir}/man/=
man5/<br>
-}<br>
-<br>
-<br>
-RDEPENDS_${PN} =3D &quot;less groff&quot;<br>
-FILES_${PN} +=3D &quot;${datadir}/locale ${sysconfdir}/man.config&quot;<sp=
an class=3D"HOEnZb"><font color=3D"#888888"><br>
<span class=3D"m_-7403159725381652752HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
</font></span><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></font></span></blockquote></div><br></div>
</blockquote></div><br></div>

--001a113e919898202e0565bf08ff--
