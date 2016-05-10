Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF9B6E687
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 00:07:00 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id y69so80831833pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 17:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=ID1i0g4twI9cSJLfSl3KLuELIbRCnyGslXHfMVXbI8s=;
	b=F6AYfEK5nO8vpV7zfHqcY6wplc1fbfFQ4xL3v/LX+49RYKGlbDYkz/0rafnit8MePS
	VtBlZE8yeBVWK1+MwKo0LGGD+E55zPcz1Q19XcBbaOOiCwRRFN57Ka01htJSnYhw59t7
	Q+K27Dx3PApmXIG/BCJ7W4UTAqzaxwXuPVsVEpMyTwiU0lYIEp41YqpdtRrkyGNH3lJ3
	Q9aHpQyoZr5CrAbGDHRveoVkHiUQiihOF1d+53kt1Zih1CO5xNtE2S9oLLw5ok8c8d4B
	RRkgUH+NZ/ZMT/9Ck/UaxPKJGx8YyIkLEUhfmybrr3Wd1MGx6pA5n3hXNrmypXYFyIb2
	cmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ID1i0g4twI9cSJLfSl3KLuELIbRCnyGslXHfMVXbI8s=;
	b=Hd3oVrHnoSp/HitgyPl9mfoAehC7OKZ8hgVXnRbgnIubJRJaTI8Nj+Q0cIgOdocjwJ
	7ui6IVG34ZdzplRD93gF8MbcfXx6VEr/9/YlqIgHYWnrtW3OCKCTWtcPEX1VD8bucqzd
	jwyohBEk/FzsPyOSB5gnt9oljji0M2bGzCarvTDnlNT8td2yYSsNDB+fatACwzh2HnFi
	wkaE6GL+7CK6mGxKHjg6MnQ5mocy9qOAwuXkwq8ChfDJPV/n5Rh0EZ1SbtFXZqtb/XGE
	zoJAZBQgz/JgSFRjpx+o4cDiykmgDjgcaNsmBpuKVYZiqmYv9K2VDKvoG4waetNPRZVU
	HGng==
X-Gm-Message-State: AOPr4FWeCabHt2TWUzJ3WKQDrIF2jUq9a+2lI/Jzo2q7GB/9uMs2W4njeWrsxzw8loAfQg==
X-Received: by 10.98.38.196 with SMTP id m187mr18271841pfm.57.1462838820885;
	Mon, 09 May 2016 17:07:00 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:1462:b3e2:90da:dbff?
	([2601:646:8800:5a9a:1462:b3e2:90da:dbff])
	by smtp.gmail.com with ESMTPSA id
	h1sm43049159pfh.49.2016.05.09.17.06.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2016 17:06:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1462828461-8181-1-git-send-email-danismostlikely@gmail.com>
Date: Mon, 9 May 2016 17:07:08 -0700
Message-Id: <AE0EAA49-80DD-46C2-8228-ACABB9EF4977@gmail.com>
References: <1462828461-8181-1-git-send-email-danismostlikely@gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][krogoth][PATCH] gcc: backport gperf fixes
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
X-List-Received-Date: Tue, 10 May 2016 00:07:00 -0000
X-Groupsio-MsgNum: 81776
Content-Type: multipart/signed;
	boundary="Apple-Mail=_677DBF95-D757-45F0-9CF8-B698E7B34D7D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_677DBF95-D757-45F0-9CF8-B698E7B34D7D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 9, 2016, at 2:14 PM, Dan McGregor <danismostlikely@gmail.com> =
wrote:
>=20
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>=20
> gperf was being used in a way that generated files don't conform to
> the language standard. Backport the fix from upstream.
>=20
> This is required to build these GCC versions when the host compiler
> is GCC 6.
>=20

this is ok for krogoth. Although for master most likely we will remove =
gcc 4.9

> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
> meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
> .../gcc/gcc-4.9/0075-remove-prototypes-cfns.patch  | 153 =
+++++++++++++++++++++
> meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
> .../gcc/gcc-5.3/0059-remove-prototypes-cfns.patch  | 153 =
+++++++++++++++++++++
> 4 files changed, 308 insertions(+)
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.9/0075-remove-prototypes-cfns.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-5.3/0059-remove-prototypes-cfns.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc =
b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 7e03f31..2be0599 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -90,6 +90,7 @@ SRC_URI =3D "\
>     file://0072-support-ffile-prefix-map.patch \
>     =
file://0073-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
>     file://0074-fdebug-prefix-map-support-to-remap-relative-path.patch =
\
> +    file://0075-remove-prototypes-cfns.patch \
> "
> SRC_URI[md5sum] =3D "6f831b4d251872736e8e9cc09746f327"
> SRC_URI[sha256sum] =3D =
"2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.9/0075-remove-prototypes-cfns.patch =
b/meta/recipes-devtools/gcc/gcc-4.9/0075-remove-prototypes-cfns.patch
> new file mode 100644
> index 0000000..2954f2e
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.9/0075-remove-prototypes-cfns.patch
> @@ -0,0 +1,153 @@
> +Upstream-Status: backport
> +
> +=46rom 8c3fa311caa86f61b4e28d1563d1110b44340fb2 Mon Sep 17 00:00:00 =
2001
> +From: edlinger <edlinger@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Thu, 25 Feb 2016 15:36:41 +0000
> +Subject: [PATCH] 2016-02-25  Bernd Edlinger  =
<bernd.edlinger@hotmail.de>
> +
> +        Backported from mainline
> +        2016-02-19  Jakub Jelinek  <jakub@redhat.com>
> +                    Bernd Edlinger  <bernd.edlinger@hotmail.de>
> +
> +        * Make-lang.in: Invoke gperf with -L C++.
> +        * cfns.gperf: Remove prototypes for hash and libc_name_p
> +        inlines.
> +        * cfns.h: Regenerated.
> +        * except.c (nothrow_libfn_p): Adjust.
> +
> +
> +---
> + gcc/cp/Make-lang.in |  2 +-
> + gcc/cp/cfns.gperf   | 10 ++--------
> + gcc/cp/cfns.h       | 41 ++++++++++++++---------------------------
> + gcc/cp/except.c     |  3 ++-
> + 5 files changed, 31 insertions(+), 37 deletions(-)
> +
> +diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
> +index bd1c1d7..a0ea0d4 100644
> +--- a/gcc/cp/Make-lang.in
> ++++ b/gcc/cp/Make-lang.in
> +@@ -111,7 +111,7 @@ else
> + # deleting the $(srcdir)/cp/cfns.h file.
> + $(srcdir)/cp/cfns.h:
> + endif
> +-	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L ANSI-C \
> ++	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L C++ \
> + 		$(srcdir)/cp/cfns.gperf --output-file =
$(srcdir)/cp/cfns.h
> +
> + #
> +diff --git a/gcc/cp/cfns.gperf b/gcc/cp/cfns.gperf
> +index 05ca753..d9b16b8 100644
> +--- a/gcc/cp/cfns.gperf
> ++++ b/gcc/cp/cfns.gperf
> +@@ -1,3 +1,5 @@
> ++%language=3DC++
> ++%define class-name libc_name
> + %{
> + /* Copyright (C) 2000-2014 Free Software Foundation, Inc.
> +
> +@@ -16,14 +18,6 @@ for more details.
> + You should have received a copy of the GNU General Public License
> + along with GCC; see the file COPYING3.  If not see
> + <http://www.gnu.org/licenses/>.  */
> +-#ifdef __GNUC__
> +-__inline
> +-#endif
> +-static unsigned int hash (const char *, unsigned int);
> +-#ifdef __GNUC__
> +-__inline
> +-#endif
> +-const char * libc_name_p (const char *, unsigned int);
> + %}
> + %%
> + # The standard C library functions, for feeding to gperf; the result =
is used
> +diff --git a/gcc/cp/cfns.h b/gcc/cp/cfns.h
> +index c845ddf..65801d1 100644
> +--- a/gcc/cp/cfns.h
> ++++ b/gcc/cp/cfns.h
> +@@ -1,5 +1,5 @@
> +-/* ANSI-C code produced by gperf version 3.0.3 */
> +-/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L =
ANSI-C cfns.gperf  */
> ++/* C++ code produced by gperf version 3.0.4 */
> ++/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L =
C++ --output-file cfns.h cfns.gperf  */
> +
> + #if !((' ' =3D=3D 32) && ('!' =3D=3D 33) && ('"' =3D=3D 34) && ('#' =
=3D=3D 35) \
> +       && ('%' =3D=3D 37) && ('&' =3D=3D 38) && ('\'' =3D=3D 39) && =
('(' =3D=3D 40) \
> +@@ -28,7 +28,7 @@
> + #error "gperf generated tables don't work with this execution =
character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
> + #endif
> +
> +-#line 1 "cfns.gperf"
> ++#line 3 "cfns.gperf"
> +
> + /* Copyright (C) 2000-2014 Free Software Foundation, Inc.
> +
> +@@ -47,25 +47,18 @@ for more details.
> + You should have received a copy of the GNU General Public License
> + along with GCC; see the file COPYING3.  If not see
> + <http://www.gnu.org/licenses/>.  */
> +-#ifdef __GNUC__
> +-__inline
> +-#endif
> +-static unsigned int hash (const char *, unsigned int);
> +-#ifdef __GNUC__
> +-__inline
> +-#endif
> +-const char * libc_name_p (const char *, unsigned int);
> + /* maximum key range =3D 391, duplicates =3D 0 */
> +
> +-#ifdef __GNUC__
> +-__inline
> +-#else
> +-#ifdef __cplusplus
> +-inline
> +-#endif
> +-#endif
> +-static unsigned int
> +-hash (register const char *str, register unsigned int len)
> ++class libc_name
> ++{
> ++private:
> ++  static inline unsigned int hash (const char *str, unsigned int =
len);
> ++public:
> ++  static const char *libc_name_p (const char *str, unsigned int =
len);
> ++};
> ++
> ++inline unsigned int
> ++libc_name::hash (register const char *str, register unsigned int =
len)
> + {
> +   static const unsigned short asso_values[] =3D
> +     {
> +@@ -122,14 +115,8 @@ hash (register const char *str, register =
unsigned int len)
> +   return hval + asso_values[(unsigned char)str[len - 1]];
> + }
> +
> +-#ifdef __GNUC__
> +-__inline
> +-#ifdef __GNUC_STDC_INLINE__
> +-__attribute__ ((__gnu_inline__))
> +-#endif
> +-#endif
> + const char *
> +-libc_name_p (register const char *str, register unsigned int len)
> ++libc_name::libc_name_p (register const char *str, register unsigned =
int len)
> + {
> +   enum
> +     {
> +diff --git a/gcc/cp/except.c b/gcc/cp/except.c
> +index 221971a..32340f5 100644
> +--- a/gcc/cp/except.c
> ++++ b/gcc/cp/except.c
> +@@ -1030,7 +1030,8 @@ nothrow_libfn_p (const_tree fn)
> +      unless the system headers are playing rename tricks, and if
> +      they are, we don't want to be confused by them.  */
> +   id =3D DECL_NAME (fn);
> +-  return !!libc_name_p (IDENTIFIER_POINTER (id), IDENTIFIER_LENGTH =
(id));
> ++  return !!libc_name::libc_name_p (IDENTIFIER_POINTER (id),
> ++				   IDENTIFIER_LENGTH (id));
> + }
> +
> + /* Returns nonzero if an exception of type FROM will be caught by a
> +--
> +2.8.2
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc =
b/meta/recipes-devtools/gcc/gcc-5.3.inc
> index 9808be1..3da7e54 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
> @@ -88,6 +88,7 @@ SRC_URI =3D "\
>            =
file://0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch \
>            file://0057-unwind-fix-for-musl.patch \
>            =
file://0058-fdebug-prefix-map-support-to-remap-relative-path.patch \
> +           file://0059-remove-prototypes-cfns.patch \
> "
>=20
> BACKPORTS =3D ""
> diff --git =
a/meta/recipes-devtools/gcc/gcc-5.3/0059-remove-prototypes-cfns.patch =
b/meta/recipes-devtools/gcc/gcc-5.3/0059-remove-prototypes-cfns.patch
> new file mode 100644
> index 0000000..2452b6f
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-5.3/0059-remove-prototypes-cfns.patch
> @@ -0,0 +1,153 @@
> +Upstream-Status: backport
> +
> +=46rom 1e5f1089dec3af328fd03125d6778f666d0bd4e4 Mon Sep 17 00:00:00 =
2001
> +From: edlinger <edlinger@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Thu, 25 Feb 2016 15:33:50 +0000
> +Subject: [PATCH] 2016-02-25  Bernd Edlinger  =
<bernd.edlinger@hotmail.de>
> +
> +        Backported from mainline
> +        2016-02-19  Jakub Jelinek  <jakub@redhat.com>
> +                    Bernd Edlinger  <bernd.edlinger@hotmail.de>
> +
> +        * Make-lang.in: Invoke gperf with -L C++.
> +        * cfns.gperf: Remove prototypes for hash and libc_name_p
> +        inlines.
> +        * cfns.h: Regenerated.
> +        * except.c (nothrow_libfn_p): Adjust.
> +
> +
> +---
> + gcc/cp/Make-lang.in |  2 +-
> + gcc/cp/cfns.gperf   | 10 ++--------
> + gcc/cp/cfns.h       | 41 ++++++++++++++---------------------------
> + gcc/cp/except.c     |  3 ++-
> + 5 files changed, 31 insertions(+), 37 deletions(-)
> +
> +diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
> +index e98beb1..b09fb02 100644
> +--- a/gcc/cp/Make-lang.in
> ++++ b/gcc/cp/Make-lang.in
> +@@ -111,7 +111,7 @@ else
> + # deleting the $(srcdir)/cp/cfns.h file.
> + $(srcdir)/cp/cfns.h:
> + endif
> +-	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L ANSI-C \
> ++	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L C++ \
> + 		$(srcdir)/cp/cfns.gperf --output-file =
$(srcdir)/cp/cfns.h
> +
> + #
> +diff --git a/gcc/cp/cfns.gperf b/gcc/cp/cfns.gperf
> +index 68acd3d..214ecf6 100644
> +--- a/gcc/cp/cfns.gperf
> ++++ b/gcc/cp/cfns.gperf
> +@@ -1,3 +1,5 @@
> ++%language=3DC++
> ++%define class-name libc_name
> + %{
> + /* Copyright (C) 2000-2015 Free Software Foundation, Inc.
> +
> +@@ -16,14 +18,6 @@ for more details.
> + You should have received a copy of the GNU General Public License
> + along with GCC; see the file COPYING3.  If not see
> + <http://www.gnu.org/licenses/>.  */
> +-#ifdef __GNUC__
> +-__inline
> +-#endif
> +-static unsigned int hash (const char *, unsigned int);
> +-#ifdef __GNUC__
> +-__inline
> +-#endif
> +-const char * libc_name_p (const char *, unsigned int);
> + %}
> + %%
> + # The standard C library functions, for feeding to gperf; the result =
is used
> +diff --git a/gcc/cp/cfns.h b/gcc/cp/cfns.h
> +index 1c6665d..596f413 100644
> +--- a/gcc/cp/cfns.h
> ++++ b/gcc/cp/cfns.h
> +@@ -1,5 +1,5 @@
> +-/* ANSI-C code produced by gperf version 3.0.3 */
> +-/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L =
ANSI-C cfns.gperf  */
> ++/* C++ code produced by gperf version 3.0.4 */
> ++/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L =
C++ --output-file cfns.h cfns.gperf  */
> +
> + #if !((' ' =3D=3D 32) && ('!' =3D=3D 33) && ('"' =3D=3D 34) && ('#' =
=3D=3D 35) \
> +       && ('%' =3D=3D 37) && ('&' =3D=3D 38) && ('\'' =3D=3D 39) && =
('(' =3D=3D 40) \
> +@@ -28,7 +28,7 @@
> + #error "gperf generated tables don't work with this execution =
character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
> + #endif
> +
> +-#line 1 "cfns.gperf"
> ++#line 3 "cfns.gperf"
> +
> + /* Copyright (C) 2000-2015 Free Software Foundation, Inc.
> +
> +@@ -47,25 +47,18 @@ for more details.
> + You should have received a copy of the GNU General Public License
> + along with GCC; see the file COPYING3.  If not see
> + <http://www.gnu.org/licenses/>.  */
> +-#ifdef __GNUC__
> +-__inline
> +-#endif
> +-static unsigned int hash (const char *, unsigned int);
> +-#ifdef __GNUC__
> +-__inline
> +-#endif
> +-const char * libc_name_p (const char *, unsigned int);
> + /* maximum key range =3D 391, duplicates =3D 0 */
> +
> +-#ifdef __GNUC__
> +-__inline
> +-#else
> +-#ifdef __cplusplus
> +-inline
> +-#endif
> +-#endif
> +-static unsigned int
> +-hash (register const char *str, register unsigned int len)
> ++class libc_name
> ++{
> ++private:
> ++  static inline unsigned int hash (const char *str, unsigned int =
len);
> ++public:
> ++  static const char *libc_name_p (const char *str, unsigned int =
len);
> ++};
> ++
> ++inline unsigned int
> ++libc_name::hash (register const char *str, register unsigned int =
len)
> + {
> +   static const unsigned short asso_values[] =3D
> +     {
> +@@ -122,14 +115,8 @@ hash (register const char *str, register =
unsigned int len)
> +   return hval + asso_values[(unsigned char)str[len - 1]];
> + }
> +
> +-#ifdef __GNUC__
> +-__inline
> +-#ifdef __GNUC_STDC_INLINE__
> +-__attribute__ ((__gnu_inline__))
> +-#endif
> +-#endif
> + const char *
> +-libc_name_p (register const char *str, register unsigned int len)
> ++libc_name::libc_name_p (register const char *str, register unsigned =
int len)
> + {
> +   enum
> +     {
> +diff --git a/gcc/cp/except.c b/gcc/cp/except.c
> +index 3ff1ce6..2f2e396 100644
> +--- a/gcc/cp/except.c
> ++++ b/gcc/cp/except.c
> +@@ -1040,7 +1040,8 @@ nothrow_libfn_p (const_tree fn)
> +      unless the system headers are playing rename tricks, and if
> +      they are, we don't want to be confused by them.  */
> +   id =3D DECL_NAME (fn);
> +-  return !!libc_name_p (IDENTIFIER_POINTER (id), IDENTIFIER_LENGTH =
(id));
> ++  return !!libc_name::libc_name_p (IDENTIFIER_POINTER (id),
> ++				   IDENTIFIER_LENGTH (id));
> + }
> +
> + /* Returns nonzero if an exception of type FROM will be caught by a
> +--
> +2.8.2
> +
> --
> 2.8.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_677DBF95-D757-45F0-9CF8-B698E7B34D7D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcxJjAACgkQuwUzVZGdMxRqRwCdF/q8B7U5qdIFQh+aH3zqflT6
UfIAn0pcdX+iCe1Z8lwpXRMmBR0BXCYc
=QnB/
-----END PGP SIGNATURE-----

--Apple-Mail=_677DBF95-D757-45F0-9CF8-B698E7B34D7D--
