Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 47B507881E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 14:23:16 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id c80so1967849itb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Feb 2018 06:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4vsIVBEYmgbjKM6I0rn5UDvG8O0kSyD/QOazGqtxR2M=;
	b=1u/wz1uWsb0MjSGHeppI/OftbLpWnqK7zK7zL5/l7DbEDdhSfhHS2L7z2Zc4P7P2WR
	TFbS4SL4lQYg92TvmnT9uBU5k0rSOU0RC8uJCeZKrjkWW9SIxi7Af9VsGvEBs/AY/ELF
	TLCQIeHPevRAiLAz9MD8ogx7B/cdV29jKtMnclYbIKW8VICp3v+47xwjwr/rqU8lL9Sg
	B1x7zYBj7+AFtV17RDjPEABAmkLiRxaBvzwFHagBuN7XAwuYjDO5sag6X1FFlOVnfcF3
	jYGioJrIaM6cblxfwvc42hZVue99qEb4AYz217MsvgwMrbwxGCA60hvsVLm89sQ6f7Xb
	Im7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4vsIVBEYmgbjKM6I0rn5UDvG8O0kSyD/QOazGqtxR2M=;
	b=m3v3oQxsjZwuReyund/bLUF9+Oj32/iGMmjSb2UasUBzR3xdl8BccrYvkfWr83GkEO
	A3fhwuPiQNcp8kbfwtIl/FbJrgtBgeT+UC5ZzjA0mqXVJQFM8o5Bz9HLCjEjkejPdlEk
	lU7cZqNzIEmNnPlUpmR2wULXoVcUr2uwqmmpnkN7I8aNpwWGQWgq1Nbc+Yjg3Xf/fOlZ
	z7PU8ryphlqgZwYGxBrVZnlP7LLC6hxo5kVTCKrdMuujFzCgApLBI0sas5halgUcHHsT
	EMEidDLwZKmWX1GdrYDgIjf4mk5GIB9VPSg+CqpQg6N+XtiXa2RXga4MdiryL0RVynPT
	i01A==
X-Gm-Message-State: AKwxytfn5brUx4fN9BVA3ADDVKAg1xHHcErTGk5gsILBwZlSvRJ8Crvx
	Due1yvfZAW8F62do1E716JPdw2lTcWLQNf5jn5LPvA==
X-Google-Smtp-Source: AH8x224WloPu2q2G+8GkXEOJ/d4iN5UIDoyOB6HFMGZi/vIfDhNskk2oYJRC8BU3qvGdMITaahkTXxQg8f5W0waOn4M=
X-Received: by 10.36.215.69 with SMTP id y66mr45504338itg.10.1517581398146;
	Fri, 02 Feb 2018 06:23:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 2 Feb 2018 06:22:57 -0800 (PST)
In-Reply-To: <1517562371-140308-1-git-send-email-hongxu.jia@windriver.com>
References: <CAJTo0LZ_Q0KGZFg1u-Noky+hhz1yDfU6axX9ZdA1Rj07fQW8ng@mail.gmail.com>
	<1517562371-140308-1-git-send-email-hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Feb 2018 14:22:57 +0000
Message-ID: <CAJTo0LZAWX7zRtSOWa2cNecwi+Tn+PGHXEivVcAUNTtf1KCRJw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] apr: 1.6.2 -> 1.6.3
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
X-List-Received-Date: Fri, 02 Feb 2018 14:23:17 -0000
Content-Type: multipart/alternative; boundary="94eb2c0afc4427981a05643b7406"

--94eb2c0afc4427981a05643b7406
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, that.  Thanks very much!

Ross

On 2 February 2018 at 09:06, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> 1. Improve inappropriate patches:
> - Drop inappropriate configure_fixes.patch
>   Use setting variable ac_cv_file__dev_zero and
>   ac_cv_sizeof_struct_iovec to replace
>
> - Drop cleanup.patch
>   Aassign variable libtool at ./buildconf executing and
>   use 0001-build-buildcheck.sh-improve-libtool-detection.patch
>   to replace. Submitted it to upstream.
>
> - Rename configfix.patch to
>   0002-apr-Remove-workdir-path-references-from-installed-ap.patch
>   Add its original comments and author, explain why it is inappropriate
>
> - Drop upgrade-and-fix-1.5.1.patch
>   Use 0003-Makefile.in-configure.in-support-cross-compiling.patch
>   to replace. And submitted it to upstream.
>
> 2. Fix build path issue to improve reproducibility
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...d-buildcheck.sh-improve-libtool-detection.patch | 32 ++++++++++
>  ...orkdir-path-references-from-installed-ap.patch} | 33 +++++++++--
>  ....in-configure.in-support-cross-compiling.patch} | 52 +++++++++++-----=
-
>  ...> 0004-Fix-packet-discards-HTTP-redirect.patch} | 15 +++--
>  ...-fix-LTFLAGS-to-make-it-work-with-ccache.patch} | 12 ++--
>  ...t-size-doesn-t-match-in-glibc-when-cross.patch} | 16 ++---
>  ...ink-libapr-against-phtread-to-make-gold-.patch} | 12 ++--
>  meta/recipes-support/apr/apr/cleanup.patch         | 43 --------------
>  meta/recipes-support/apr/apr/configure_fixes.patch | 68
> ----------------------
>  .../apr/{apr_1.6.2.bb =3D> apr_1.6.3.bb}             | 27 +++++----
>  10 files changed, 140 insertions(+), 170 deletions(-)
>  create mode 100644 meta/recipes-support/apr/apr/0001-build-buildcheck.sh=
-
> improve-libtool-detection.patch
>  rename meta/recipes-support/apr/apr/{configfix.patch =3D>
> 0002-apr-Remove-workdir-path-references-from-installed-ap.patch} (67%)
>  rename meta/recipes-support/apr/apr/{upgrade-and-fix-1.5.1.patch =3D>
> 0003-Makefile.in-configure.in-support-cross-compiling.patch} (40%)
>  rename meta/recipes-support/apr/apr/{Fix-packet-discards-HTTP-redirect.p=
atch
> =3D> 0004-Fix-packet-discards-HTTP-redirect.patch} (71%)
>  rename meta/recipes-support/apr/apr/{configure.in-fix-LTFLAGS-to-make-it=
-work-with-ccache.patch
> =3D> 0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch} (78=
%)
>  rename meta/recipes-support/apr/apr/{0001-apr-fix-off_t-size-doesn-
> t-match-in-glibc-when-cross.patch =3D> 0006-apr-fix-off_t-size-doesn-
> t-match-in-glibc-when-cross.patch} (85%)
>  rename meta/recipes-support/apr/apr/{0002-explicitly-link-libapr-
> against-phtread-to-make-gold-.patch =3D> 0007-explicitly-link-libapr-
> against-phtread-to-make-gold-.patch} (90%)
>  delete mode 100644 meta/recipes-support/apr/apr/cleanup.patch
>  delete mode 100644 meta/recipes-support/apr/apr/configure_fixes.patch
>  rename meta/recipes-support/apr/{apr_1.6.2.bb =3D> apr_1.6.3.bb} (77%)
>
> diff --git a/meta/recipes-support/apr/apr/0001-build-buildcheck.sh-
> improve-libtool-detection.patch b/meta/recipes-support/apr/
> apr/0001-build-buildcheck.sh-improve-libtool-detection.patch
> new file mode 100644
> index 0000000..097c195
> --- /dev/null
> +++ b/meta/recipes-support/apr/apr/0001-build-buildcheck.sh-
> improve-libtool-detection.patch
> @@ -0,0 +1,32 @@
> +From 4efdc06fb17b8a00a9eca923caa176be741d1e04 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 1 Feb 2018 14:56:13 +0800
> +Subject: [PATCH 1/7] build/buildcheck.sh: improve libtool detection
> +
> +Support customize libtool by variable assigning, it is helpful
> +for cross compileing (such as libtool=3Daarch64-linux-libtool)
> +
> +Upstream-Status: Submitted [https://github.com/apache/apr/pull/8]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + build/buildcheck.sh | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/build/buildcheck.sh b/build/buildcheck.sh
> +index ab5df44..f191a41 100755
> +--- a/build/buildcheck.sh
> ++++ b/build/buildcheck.sh
> +@@ -40,7 +40,9 @@ fi
> + # output is multiline from 1.5 onwards
> +
> + # Require libtool 1.4 or newer
> +-libtool=3D`build/PrintPath glibtool1 glibtool libtool libtool15 libtool=
14`
> ++if test -z "$libtool"; then
> ++  libtool=3D`build/PrintPath glibtool1 glibtool libtool libtool15
> libtool14`
> ++fi
> + lt_pversion=3D`$libtool --version 2>/dev/null|sed -e
> 's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
> + if test -z "$lt_pversion"; then
> +   echo "buildconf: libtool not found."
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-support/apr/apr/configfix.patch
> b/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-
> path-references-from-installed-ap.patch
> similarity index 67%
> rename from meta/recipes-support/apr/apr/configfix.patch
> rename to meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-
> references-from-installed-ap.patch
> index 605c4f6..72e706f 100644
> --- a/meta/recipes-support/apr/apr/configfix.patch
> +++ b/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-
> path-references-from-installed-ap.patch
> @@ -1,10 +1,28 @@
> +From 5925b20da8bbc34d9bf5a5dca123ef38864d43c6 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 30 Jan 2018 09:39:06 +0800
> +Subject: [PATCH 2/7] apr: Remove workdir path references from installed
> apr
> + files
> +
>  Upstream-Status: Inappropriate [configuration]
>
> -Index: apr-1.3.3/apr-config.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- apr-1.3.3.orig/apr-config.in       2009-01-12 15:16:31.000000000
> +0000
> -+++ apr-1.3.3/apr-config.in    2009-01-12 15:19:25.000000000 +0000
> -@@ -152,14 +152,7 @@
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +The generated `apr-1-config' is used by other recipes at build time or
> +packages at target run time, the workdir path caused confusion.
> +
> +Rebase to 1.6.3
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + apr-config.in | 26 ++------------------------
> + 1 file changed, 2 insertions(+), 24 deletions(-)
> +
> +diff --git a/apr-config.in b/apr-config.in
> +index 84b4073..bbbf651 100644
> +--- a/apr-config.in
> ++++ b/apr-config.in
> +@@ -152,14 +152,7 @@ while test $# -gt 0; do
>       flags=3D"$flags $LDFLAGS"
>       ;;
>       --includes)
> @@ -19,7 +37,7 @@ Index: apr-1.3.3/apr-config.in
>       ;;
>       --srcdir)
>       echo $APR_SOURCE_DIR
> -@@ -181,29 +167,14 @@
> +@@ -181,29 +174,14 @@ while test $# -gt 0; do
>       exit 0
>       ;;
>       --link-ld)
> @@ -51,3 +69,6 @@ Index: apr-1.3.3/apr-config.in
>       ;;
>       --shlib-path-var)
>       echo "$SHLIBPATH_VAR"
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
> b/meta/recipes-support/apr/apr/0003-Makefile.in-
> configure.in-support-cross-compiling.patch
> similarity index 40%
> rename from meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
> rename to meta/recipes-support/apr/apr/0003-Makefile.in-configure.in-
> support-cross-compiling.patch
> index 16499f5..4dd53bd 100644
> --- a/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
> +++ b/meta/recipes-support/apr/apr/0003-Makefile.in-
> configure.in-support-cross-compiling.patch
> @@ -1,45 +1,63 @@
> -Makefile.in: fix cross compiling failed
> +From d5028c10f156c224475b340cfb1ba025d6797243 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Fri, 2 Feb 2018 15:51:42 +0800
> +Subject: [PATCH 3/7] Makefile.in/configure.in: support cross compiling
>
> -The tools/gen_test_char was invoked at build time,
> -and it didn't work for the cross compiling, so we
> -compile it with $BUILD_CC.
> +While cross compiling, the tools/gen_test_char could not
> +be executed at build time, use AX_PROG_CC_FOR_BUILD to
> +build native tools/gen_test_char
>
> -Remove the 'tools' dir creation, it always existed.
> -And it caused gen_test_char unexpected rebuilt at
> -do_install time.
> -
> -Upstream-Status: Inappropriate [oe specific]
> +Upstream-Status: Submitted [https://github.com/apache/apr/pull/8]
>
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
> - Makefile.in | 10 ++--------
> - 1 file changed, 2 insertions(+), 8 deletions(-)
> + Makefile.in  | 10 +++-------
> + configure.in |  3 +++
> + 2 files changed, 6 insertions(+), 7 deletions(-)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index a2a5194..5fe028f 100644
> +index 5fb760e..8675f90 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -46,7 +46,6 @@ LT_VERSION =3D @LT_VERSION@
> +@@ -46,7 +46,7 @@ LT_VERSION =3D @LT_VERSION@
>
>   CLEAN_TARGETS =3D apr-config.out apr.exp exports.c export_vars.c
> .make.dirs \
>         build/apr_rules.out tools/gen_test_char@EXEEXT@ \
>  -      tools/gen_test_char.o tools/gen_test_char.lo \
> ++      tools/gen_test_char.o \
>         include/private/apr_escape_test_char.h
>   DISTCLEAN_TARGETS =3D config.cache config.log config.status \
>         include/apr.h include/arch/unix/apr_private.h \
> -@@ -129,13 +128,8 @@ check: $(TARGET_LIB)
> +@@ -131,13 +131,9 @@ check: $(TARGET_LIB)
>   etags:
>         etags `find . -name '*.[ch]'`
>
>  -OBJECTS_gen_test_char =3D tools/gen_test_char.lo $(LOCAL_LIBS)
>  -tools/gen_test_char.lo: tools/gen_test_char.c
> --      $(APR_MKDIR) tools
> ++tools/gen_test_char@EXEEXT@: tools/gen_test_char.c
> +       $(APR_MKDIR) tools
>  -      $(LT_COMPILE)
>  -
>  -tools/gen_test_char@EXEEXT@: $(OBJECTS_gen_test_char)
>  -      $(LINK_PROG) $(OBJECTS_gen_test_char) $(ALL_LIBS)
> -+tools/gen_test_char@EXEEXT@: tools/gen_test_char.c
> -+      $(BUILD_CC) $(CFLAGS_FOR_BUILD) $< -o $@
> ++      $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $< -o $@
>
>   include/private/apr_escape_test_char.h: tools/gen_test_char@EXEEXT@
>         $(APR_MKDIR) include/private
> +diff --git a/configure.in b/configure.in
> +index 719f331..361120f 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -183,6 +183,9 @@ dnl can only be used once within a configure script,
> so this prevents a
> + dnl preload section from invoking the macro to get compiler info.
> + AC_PROG_CC
> +
> ++dnl Check build CC for gen_test_char compiling which is executed at
> build time.
> ++AX_PROG_CC_FOR_BUILD
> ++
> + dnl AC_PROG_SED is only avaliable in recent autoconf versions.
> + dnl Use AC_CHECK_PROG instead if AC_PROG_SED is not present.
> + ifdef([AC_PROG_SED],
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redire=
ct.patch
> b/meta/recipes-support/apr/apr/0004-Fix-packet-discards-
> HTTP-redirect.patch
> similarity index 71%
> rename from meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-
> redirect.patch
> rename to meta/recipes-support/apr/apr/0004-Fix-packet-discards-HTTP-
> redirect.patch
> index 6805b8b..30fc07d 100644
> --- a/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patc=
h
> +++ b/meta/recipes-support/apr/apr/0004-Fix-packet-discards-
> HTTP-redirect.patch
> @@ -1,4 +1,7 @@
> -Fix packet discards HTTP redirect.
> +From 7925eb1766a00ccee05c6e80b1d34f163a04b7b1 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 30 Jan 2018 09:43:34 +0800
> +Subject: [PATCH 4/7] Fix packet discards HTTP redirect.
>
>  Disconnect the connection by poll() timeout.
>  If timeout=3D0 and apr_wait_for_io_or_timeout()=3DAPR_TIMEUP then
> @@ -8,12 +11,16 @@ Upstream-Status: Pending
>
>  Signed-off-by: Noriaki Yoshitane <yoshitane.nrs@cnt.ncos.nec.co.jp>
>  Signed-off-by: Li Wang <li.wang@windriver.com>
> +
> +Rebase to 1.6.3
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
> - network_io/unix/sendrecv.c |    4 ++++
> + network_io/unix/sendrecv.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
>  diff --git a/network_io/unix/sendrecv.c b/network_io/unix/sendrecv.c
> -index c133a26..e8faf15 100644
> +index 4c0e0a6..1bdafba 100644
>  --- a/network_io/unix/sendrecv.c
>  +++ b/network_io/unix/sendrecv.c
>  @@ -85,6 +85,10 @@ apr_status_t apr_socket_recv(apr_socket_t *sock, char
> *buf, apr_size_t *len)
> @@ -28,5 +35,5 @@ index c133a26..e8faf15 100644
>               *len =3D 0;
>               return arv;
>  --
> -1.7.9.5
> +1.8.3.1
>
> diff --git a/meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-
> to-make-it-work-with-ccache.patch b/meta/recipes-support/apr/
> apr/0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
> similarity index 78%
> rename from meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-
> make-it-work-with-ccache.patch
> rename to meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-
> to-make-it-work-with-ccache.patch
> index 7521eeb..02634e6 100644
> --- a/meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-
> to-make-it-work-with-ccache.patch
> +++ b/meta/recipes-support/apr/apr/0005-configure.in-fix-
> LTFLAGS-to-make-it-work-with-ccache.patch
> @@ -1,7 +1,7 @@
> -From d439093aa07a486f559206ac9e5808a6a18218cd Mon Sep 17 00:00:00 2001
> +From 2e66cece0c3adff92733332111204ddc1d730a07 Mon Sep 17 00:00:00 2001
>  From: Robert Yang <liezhi.yang@windriver.com>
>  Date: Thu, 19 Nov 2015 18:25:38 -0800
> -Subject: [PATCH] configure.in: fix LTFLAGS to make it work with ccache
> +Subject: [PATCH 5/7] configure.in: fix LTFLAGS to make it work with
> ccache
>
>  When ccache is enabled, libtool requires --tag=3DCC when use ccache,
>  otherwise when building apr-util with ccache enabled:
> @@ -15,14 +15,14 @@ Upstream-Status: Pending
>
>  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>  ---
> - configure.in |    2 +-
> + configure.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/configure.in b/configure.in
> -index 5a4a988..9d57ae6 100644
> +index 361120f..3b10422 100644
>  --- a/configure.in
>  +++ b/configure.in
> -@@ -246,7 +246,7 @@ case $host in
> +@@ -249,7 +249,7 @@ case $host in
>       ;;
>   *)
>       if test "x$LTFLAGS" =3D "x"; then
> @@ -32,5 +32,5 @@ index 5a4a988..9d57ae6 100644
>       if test "$experimental_libtool" =3D "yes"; then
>           # Use a custom-made libtool replacement
>  --
> -1.7.9.5
> +1.8.3.1
>
> diff --git a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-
> doesn-t-match-in-glibc-when-cross.patch b/meta/recipes-support/apr/
> apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
> similarity index 85%
> rename from meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-
> t-match-in-glibc-when-cross.patch
> rename to meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-
> t-match-in-glibc-when-cross.patch
> index c5e92ac..5f5e7ea 100644
> --- a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-
> doesn-t-match-in-glibc-when-cross.patch
> +++ b/meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-
> doesn-t-match-in-glibc-when-cross.patch
> @@ -1,7 +1,7 @@
> -From f26e8b88d2c90ed7eb9d4e276412b0923c23d10f Mon Sep 17 00:00:00 2001
> +From f4d6e45ed5d2ccffd1af4c2ccdf7099ba0dce137 Mon Sep 17 00:00:00 2001
>  From: Dengke Du <dengke.du@windriver.com>
>  Date: Wed, 14 Dec 2016 18:13:08 +0800
> -Subject: [PATCH] apr: fix off_t size doesn't match in glibc when cross
> +Subject: [PATCH 6/7] apr: fix off_t size doesn't match in glibc when cro=
ss
>   compiling
>
>  In configure.in, it contains the following:
> @@ -34,10 +34,10 @@ Upstream-Status: Pending
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
>  diff --git a/configure.in b/configure.in
> -index 9d57ae6..5b19940 100644
> +index 3b10422..a227e72 100644
>  --- a/configure.in
>  +++ b/configure.in
> -@@ -1681,7 +1681,7 @@ else
> +@@ -1769,7 +1769,7 @@ else
>       socklen_t_value=3D"int"
>   fi
>
> @@ -46,7 +46,7 @@ index 9d57ae6..5b19940 100644
>
>   if test "$ac_cv_sizeof_pid_t" =3D "$ac_cv_sizeof_short"; then
>       pid_t_fmt=3D'#define APR_PID_T_FMT "hd"'
> -@@ -1750,7 +1750,7 @@ APR_CHECK_TYPES_COMPATIBLE(ssize_t, long,
> [ssize_t_fmt=3D"ld"])
> +@@ -1838,7 +1838,7 @@ APR_CHECK_TYPES_COMPATIBLE(ssize_t, long,
> [ssize_t_fmt=3D"ld"])
>   APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned int, [size_t_fmt=3D"u"])
>   APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned long, [size_t_fmt=3D"lu"])
>
> @@ -55,7 +55,7 @@ index 9d57ae6..5b19940 100644
>
>   AC_MSG_CHECKING([which format to use for apr_ssize_t])
>   if test -n "$ssize_t_fmt"; then
> -@@ -1767,7 +1767,7 @@ fi
> +@@ -1855,7 +1855,7 @@ fi
>
>   ssize_t_fmt=3D"#define APR_SSIZE_T_FMT \"$ssize_t_fmt\""
>
> @@ -64,7 +64,7 @@ index 9d57ae6..5b19940 100644
>
>   AC_MSG_CHECKING([which format to use for apr_size_t])
>   if test -n "$size_t_fmt"; then
> -@@ -1784,7 +1784,7 @@ fi
> +@@ -1872,7 +1872,7 @@ fi
>
>   size_t_fmt=3D"#define APR_SIZE_T_FMT \"$size_t_fmt\""
>
> @@ -74,5 +74,5 @@ index 9d57ae6..5b19940 100644
>   if test "${ac_cv_sizeof_off_t}${apr_cv_use_lfs64}" =3D "4yes"; then
>       # Enable LFS
>  --
> -2.7.4
> +1.8.3.1
>
> diff --git a/meta/recipes-support/apr/apr/0002-explicitly-link-
> libapr-against-phtread-to-make-gold-.patch b/meta/recipes-support/apr/
> apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch
> similarity index 90%
> rename from meta/recipes-support/apr/apr/0002-explicitly-link-libapr-
> against-phtread-to-make-gold-.patch
> rename to meta/recipes-support/apr/apr/0007-explicitly-link-libapr-
> against-phtread-to-make-gold-.patch
> index 7d0dddc..8760b01 100644
> --- a/meta/recipes-support/apr/apr/0002-explicitly-link-
> libapr-against-phtread-to-make-gold-.patch
> +++ b/meta/recipes-support/apr/apr/0007-explicitly-link-
> libapr-against-phtread-to-make-gold-.patch
> @@ -1,8 +1,8 @@
> -From 94d1ca0266a0f9c0446f1299b54f752e87b8a695 Mon Sep 17 00:00:00 2001
> +From c6afc4a4a766478cb6aa6b43a50051881b6318d7 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
>  Date: Fri, 3 Mar 2017 22:24:17 +0100
> -Subject: [PATCH] explicitly link libapr against phtread to make gold
> happy on
> - test
> +Subject: [PATCH 7/7] explicitly link libapr against phtread to make gold
> happy
> + on test
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> @@ -34,10 +34,10 @@ Signed-off-by: Andreas M=C3=BCller <
> schnitzeltony@googlemail.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/configure.in b/configure.in
> -index 5b19940..cdf4d58 100644
> +index a227e72..cbc0f90 100644
>  --- a/configure.in
>  +++ b/configure.in
> -@@ -766,6 +766,7 @@ else
> +@@ -784,6 +784,7 @@ else
>             APR_PTHREADS_CHECK_RESTORE ] )
>       fi
>       if test "$pthreadh" =3D "1"; then
> @@ -46,5 +46,5 @@ index 5b19940..cdf4d58 100644
>           APR_CHECK_PTHREAD_ATTR_GETDETACHSTATE_ONE_ARG
>           APR_CHECK_PTHREAD_RECURSIVE_MUTEX
>  --
> -2.9.3
> +1.8.3.1
>
> diff --git a/meta/recipes-support/apr/apr/cleanup.patch
> b/meta/recipes-support/apr/apr/cleanup.patch
> deleted file mode 100644
> index b6784e0..0000000
> --- a/meta/recipes-support/apr/apr/cleanup.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: apr-1.4.2/build/buildcheck.sh
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- apr-1.4.2.orig/build/buildcheck.sh 2009-11-13 08:27:16.000000000
> +0800
> -+++ apr-1.4.2/build/buildcheck.sh      2010-11-26 15:44:00.000000000 +08=
00
> -@@ -32,35 +32,4 @@
> - echo "buildconf: autoconf version $ac_version (ok)"
> - fi
> -
> --# Sample libtool --version outputs:
> --# ltmain.sh (GNU libtool) 1.3.3 (1.385.2.181 1999/07/02 15:49:11)
> --# ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a
> --# output is multiline from 1.5 onwards
> --
> --# Require libtool 1.4 or newer
> --libtool=3D`build/PrintPath glibtool1 glibtool libtool libtool15 libtool=
14`
> --lt_pversion=3D`$libtool --version 2>/dev/null|sed -e
> 's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
> --if test -z "$lt_pversion"; then
> --echo "buildconf: libtool not found."
> --echo "           You need libtool version 1.4 or newer installed"
> --echo "           to build APR from SVN."
> --exit 1
> --fi
> --lt_version=3D`echo $lt_pversion|sed -e 's/\([a-z]*\)$/.\1/'`
> --IFS=3D.; set $lt_version; IFS=3D' '
> --lt_status=3D"good"
> --if test "$1" =3D "1"; then
> --   if test "$2" -lt "4"; then
> --      lt_status=3D"bad"
> --   fi
> --fi
> --if test $lt_status =3D "good"; then
> --   echo "buildconf: libtool version $lt_pversion (ok)"
> --   exit 0
> --fi
> --
> --echo "buildconf: libtool version $lt_pversion found."
> --echo "           You need libtool version 1.4 or newer installed"
> --echo "           to build APR from SVN."
> --
> --exit 1
> -+exit 0
> diff --git a/meta/recipes-support/apr/apr/configure_fixes.patch
> b/meta/recipes-support/apr/apr/configure_fixes.patch
> deleted file mode 100644
> index 0514000..0000000
> --- a/meta/recipes-support/apr/apr/configure_fixes.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: apr-1.3.3/configure.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- apr-1.3.3.orig/configure.in
> -+++ apr-1.3.3/configure.in
> -@@ -794,39 +794,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm
> -                 create_area])
> -
> - APR_CHECK_DEFINE(MAP_ANON, sys/mman.h)
> --AC_CHECK_FILE(/dev/zero)
> --
> --# Not all systems can mmap /dev/zero (such as HP-UX).  Check for that.
> --if test "$ac_cv_func_mmap" =3D "yes" &&
> --   test "$ac_cv_file__dev_zero" =3D "yes"; then
> --    AC_MSG_CHECKING(for mmap that can map /dev/zero)
> --    AC_TRY_RUN([
> --#include <sys/types.h>
> --#include <sys/stat.h>
> --#include <fcntl.h>
> --#ifdef HAVE_SYS_MMAN_H
> --#include <sys/mman.h>
> --#endif
> --    int main()
> --    {
> --        int fd;
> --        void *m;
> --        fd =3D open("/dev/zero", O_RDWR);
> --        if (fd < 0) {
> --            return 1;
> --        }
> --        m =3D mmap(0, sizeof(void*), PROT_READ|PROT_WRITE, MAP_SHARED, =
fd,
> 0);
> --        if (m =3D=3D (void *)-1) {  /* aka MAP_FAILED */
> --            return 2;
> --        }
> --        if (munmap(m, sizeof(void*)) < 0) {
> --            return 3;
> --        }
> --        return 0;
> --    }], [], [ac_cv_file__dev_zero=3Dno], [ac_cv_file__dev_zero=3Dno])
> --
> --    AC_MSG_RESULT($ac_cv_file__dev_zero)
> --fi
> -
> - # Now we determine which one is our anonymous shmem preference.
> - haveshmgetanon=3D"0"
> -@@ -1518,13 +1485,14 @@ else
> -     bigendian=3D0
> - fi
> -
> --APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>
> --#include <sys/uio.h>],struct iovec,0)
> --if test "$ac_cv_sizeof_struct_iovec" =3D "0"; then
> --    have_iovec=3D0
> --else
> --    have_iovec=3D1
> --fi
> -+#APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>
> -+##include <sys/uio.h>],struct iovec,0)
> -+#if test "$ac_cv_sizeof_struct_iovec" =3D "0"; then
> -+#    have_iovec=3D0
> -+#else
> -+#    have_iovec=3D1
> -+#fi
> -+have_iovec=3D1
> -
> - AC_SUBST(voidp_size)
> - AC_SUBST(short_value)
> diff --git a/meta/recipes-support/apr/apr_1.6.2.bb
> b/meta/recipes-support/apr/apr_1.6.3.bb
> similarity index 77%
> rename from meta/recipes-support/apr/apr_1.6.2.bb
> rename to meta/recipes-support/apr/apr_1.6.3.bb
> index e2eed53..87b8787 100644
> --- a/meta/recipes-support/apr/apr_1.6.2.bb
> +++ b/meta/recipes-support/apr/apr_1.6.3.bb
> @@ -10,19 +10,18 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D
> 4dfd4cd216828c8cae5de5a12f3844c8 \
>  BBCLASSEXTEND =3D "native nativesdk"
>
>  SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
> -           file://configure_fixes.patch \
> -           file://cleanup.patch \
> -           file://configfix.patch \
>             file://run-ptest \
> -           file://upgrade-and-fix-1.5.1.patch \
> -           file://Fix-packet-discards-HTTP-redirect.patch \
> -           file://configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.p=
atch
> \
> -           file://0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cr=
oss.patch
> \
> -           file://0002-explicitly-link-libapr-against-phtread-to-make-go=
ld-.patch
> \
> +           file://0001-build-buildcheck.sh-improve-libtool-detection.pat=
ch
> \
> +           file://0002-apr-Remove-workdir-path-references-from-installed=
-ap.patch
> \
> +           file://0003-Makefile.in-configure.in-support-cross-compiling.=
patch
> \
> +           file://0004-Fix-packet-discards-HTTP-redirect.patch \
> +           file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-cca=
che.patch
> \
> +           file://0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cr=
oss.patch
> \
> +           file://0007-explicitly-link-libapr-against-phtread-to-make-go=
ld-.patch
> \
>  "
>
> -SRC_URI[md5sum] =3D "e81a851967c79b5ce9bfbc909e4bf735"
> -SRC_URI[sha256sum] =3D "09109cea377bab0028bba19a92b5b0
> e89603df9eab05c0f7dbd4dd83d48dcebd"
> +SRC_URI[md5sum] =3D "12f2a349483ad6f12db49ba01fbfdbfa"
> +SRC_URI[sha256sum] =3D "131f06d16d7aabd097fa992a33eec2
> b6af3962f93e6d570a9bd4d85e95993172"
>
>  inherit autotools-brokensep lib_package binconfig multilib_header ptest
>
> @@ -35,6 +34,9 @@ CACHED_CONFIGUREVARS +=3D "apr_cv_mutex_recursive=3Dyes=
"
>  #
>  CACHED_CONFIGUREVARS +=3D "ac_cv_header_netinet_sctp_h=3Dno
> ac_cv_header_netinet_sctp_uio_h=3Dno"
>
> +CACHED_CONFIGUREVARS +=3D "ac_cv_sizeof_struct_iovec=3Dyes"
> +CACHED_CONFIGUREVARS +=3D "ac_cv_file__dev_zero=3Dyes"
> +
>  # Otherwise libtool fails to compile apr-utils
>  # x86_64-linux-libtool: compile: unable to infer tagged configuration
>  # x86_64-linux-libtool:   error: specify a tag with '--tag'
> @@ -50,7 +52,7 @@ do_configure_prepend() {
>         export GREP=3D"grep"
>
>         cd ${S}
> -       ./buildconf
> +       libtool=3D'${HOST_SYS}-libtool' ./buildconf
>  }
>
>  FILES_${PN}-dev +=3D "${libdir}/apr.exp ${datadir}/build-1/*"
> @@ -69,7 +71,8 @@ do_install_append() {
>  }
>
>  do_install_append_class-target() {
> -       sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${datadir}/build-1/apr_
> rules.mk
> +       sed -i -e 's,${DEBUG_PREFIX_MAP},,g' \
> +              -e 's,${STAGING_DIR_HOST},,g' ${D}${datadir}/build-1/apr_
> rules.mk
>         sed -i -e 's,${STAGING_DIR_HOST},,g' \
>                -e 's,APR_SOURCE_DIR=3D.*,APR_SOURCE_DIR=3D,g' \
>                -e 's,APR_BUILD_DIR=3D.*,APR_BUILD_DIR=3D,g'
> ${D}${bindir}/apr-1-config
> --
> 2.8.1
>
>

--94eb2c0afc4427981a05643b7406
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, that.=C2=A0 Thanks very much!<div><br></div><div>Ross=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 2 =
February 2018 at 09:06, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mailto:=
hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">1. Improve inappropriate =
patches:<br>
- Drop inappropriate configure_fixes.patch<br>
=C2=A0 Use setting variable ac_cv_file__dev_zero and<br>
=C2=A0 ac_cv_sizeof_struct_iovec to replace<br>
<br>
- Drop cleanup.patch<br>
=C2=A0 Aassign variable libtool at ./buildconf executing and<br>
=C2=A0 use 0001-build-buildcheck.sh-<wbr>improve-libtool-detection.<wbr>pat=
ch<br>
=C2=A0 to replace. Submitted it to upstream.<br>
<br>
- Rename configfix.patch to<br>
=C2=A0 0002-apr-Remove-workdir-path-<wbr>references-from-installed-ap.<wbr>=
patch<br>
=C2=A0 Add its original comments and author, explain why it is inappropriat=
e<br>
<br>
- Drop upgrade-and-fix-1.5.1.patch<br>
=C2=A0 Use 0003-Makefile.in-configure.in-<wbr>support-cross-compiling.patch=
<br>
=C2=A0 to replace. And submitted it to upstream.<br>
<br>
2. Fix build path issue to improve reproducibility<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0...d-buildcheck.sh-improve-<wbr>libtool-detection.patch | 32 ++++++++=
++<br>
=C2=A0...orkdir-path-references-<wbr>from-installed-ap.patch} | 33 ++++++++=
+--<br>
=C2=A0....in-configure.in-support-<wbr>cross-compiling.patch} | 52 ++++++++=
+++------<br>
=C2=A0...&gt; 0004-Fix-packet-discards-HTTP-<wbr>redirect.patch} | 15 +++--=
<br>
=C2=A0...-fix-LTFLAGS-to-make-it-<wbr>work-with-ccache.patch} | 12 ++--<br>
=C2=A0...t-size-doesn-t-match-in-<wbr>glibc-when-cross.patch} | 16 ++---<br=
>
=C2=A0...ink-libapr-against-phtread-<wbr>to-make-gold-.patch} | 12 ++--<br>
=C2=A0meta/recipes-support/apr/apr/<wbr>cleanup.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 43 --------------<br>
=C2=A0meta/recipes-support/apr/apr/<wbr>configure_fixes.patch | 68 --------=
--------------<br>
=C2=A0.../apr/{<a href=3D"http://apr_1.6.2.bb" rel=3D"noreferrer" target=3D=
"_blank">apr_1.6.2.bb</a> =3D&gt; <a href=3D"http://apr_1.6.3.bb" rel=3D"no=
referrer" target=3D"_blank">apr_1.6.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 27 +++++----<br>
=C2=A010 files changed, 140 insertions(+), 170 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-support/apr/apr/<wbr>0001-build-build=
check.sh-<wbr>improve-libtool-detection.<wbr>patch<br>
=C2=A0rename meta/recipes-support/apr/apr/{<wbr>configfix.patch =3D&gt; 000=
2-apr-Remove-workdir-path-<wbr>references-from-installed-ap.<wbr>patch} (67=
%)<br>
=C2=A0rename meta/recipes-support/apr/apr/{<wbr>upgrade-and-fix-1.5.1.patch=
 =3D&gt; 0003-Makefile.in-configure.in-<wbr>support-cross-compiling.patch} =
(40%)<br>
=C2=A0rename meta/recipes-support/apr/apr/{<wbr>Fix-packet-discards-HTTP-<w=
br>redirect.patch =3D&gt; 0004-Fix-packet-discards-HTTP-<wbr>redirect.patch=
} (71%)<br>
=C2=A0rename meta/recipes-support/apr/apr/{<wbr>configure.in-fix-LTFLAGS-to=
-<wbr>make-it-work-with-ccache.patch =3D&gt; 0005-configure.in-fix-LTFLAGS-=
<wbr>to-make-it-work-with-ccache.<wbr>patch} (78%)<br>
=C2=A0rename meta/recipes-support/apr/apr/{<wbr>0001-apr-fix-off_t-size-doe=
sn-<wbr>t-match-in-glibc-when-cross.<wbr>patch =3D&gt; 0006-apr-fix-off_t-s=
ize-doesn-<wbr>t-match-in-glibc-when-cross.<wbr>patch} (85%)<br>
=C2=A0rename meta/recipes-support/apr/apr/{<wbr>0002-explicitly-link-libapr=
-<wbr>against-phtread-to-make-gold-.<wbr>patch =3D&gt; 0007-explicitly-link=
-libapr-<wbr>against-phtread-to-make-gold-.<wbr>patch} (90%)<br>
=C2=A0delete mode 100644 meta/recipes-support/apr/apr/<wbr>cleanup.patch<br=
>
=C2=A0delete mode 100644 meta/recipes-support/apr/apr/<wbr>configure_fixes.=
patch<br>
=C2=A0rename meta/recipes-support/apr/{<a href=3D"http://apr_1.6.2.bb" rel=
=3D"noreferrer" target=3D"_blank">apr_<wbr>1.6.2.bb</a> =3D&gt; <a href=3D"=
http://apr_1.6.3.bb" rel=3D"noreferrer" target=3D"_blank">apr_1.6.3.bb</a>}=
 (77%)<br>
<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/0001-build-buildcheck.sh-<wb=
r>improve-libtool-detection.<wbr>patch b/meta/recipes-support/apr/<wbr>apr/=
0001-build-buildcheck.sh-<wbr>improve-libtool-detection.<wbr>patch<br>
new file mode 100644<br>
index 0000000..097c195<br>
--- /dev/null<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0001-build-buildcheck.sh-<wbr>impro=
ve-libtool-detection.<wbr>patch<br>
@@ -0,0 +1,32 @@<br>
+From 4efdc06fb17b8a00a9eca923caa176<wbr>be741d1e04 Mon Sep 17 00:00:00 200=
1<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
+Date: Thu, 1 Feb 2018 14:56:13 +0800<br>
+Subject: [PATCH 1/7] build/buildcheck.sh: improve libtool detection<br>
+<br>
+Support customize libtool by variable assigning, it is helpful<br>
+for cross compileing (such as libtool=3Daarch64-linux-libtool)<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/apache/apr/pull/=
8" rel=3D"noreferrer" target=3D"_blank">https://github.com/apache/<wbr>apr/=
pull/8</a>]<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ build/buildcheck.sh | 4 +++-<br>
+ 1 file changed, 3 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/build/buildcheck.sh b/build/buildcheck.sh<br>
+index ab5df44..f191a41 100755<br>
+--- a/build/buildcheck.sh<br>
++++ b/build/buildcheck.sh<br>
+@@ -40,7 +40,9 @@ fi<br>
+ # output is multiline from 1.5 onwards<br>
+<br>
+ # Require libtool 1.4 or newer<br>
+-libtool=3D`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14=
`<br>
++if test -z &quot;$libtool&quot;; then<br>
++=C2=A0 libtool=3D`build/PrintPath glibtool1 glibtool libtool libtool15 li=
btool14`<br>
++fi<br>
+ lt_pversion=3D`$libtool --version 2&gt;/dev/null|sed -e &#39;s/([^)]*)//g=
;s/^[^0-9]*//;s/[<wbr>- ].*//g;q&#39;`<br>
+ if test -z &quot;$lt_pversion&quot;; then<br>
+=C2=A0 =C2=A0echo &quot;buildconf: libtool not found.&quot;<br>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/configfix.patch b/meta/recip=
es-support/apr/<wbr>apr/0002-apr-Remove-workdir-<wbr>path-references-from-<=
wbr>installed-ap.patch<br>
similarity index 67%<br>
rename from meta/recipes-support/apr/apr/<wbr>configfix.patch<br>
rename to meta/recipes-support/apr/apr/<wbr>0002-apr-Remove-workdir-path-<w=
br>references-from-installed-ap.<wbr>patch<br>
index 605c4f6..72e706f 100644<br>
--- a/meta/recipes-support/apr/<wbr>apr/configfix.patch<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0002-apr-Remove-workdir-<wbr>path-r=
eferences-from-<wbr>installed-ap.patch<br>
@@ -1,10 +1,28 @@<br>
+From 5925b20da8bbc34d9bf5a5dca123ef<wbr>38864d43c6 Mon Sep 17 00:00:00 200=
1<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
+Date: Tue, 30 Jan 2018 09:39:06 +0800<br>
+Subject: [PATCH 2/7] apr: Remove workdir path references from installed ap=
r<br>
+ files<br>
+<br>
=C2=A0Upstream-Status: Inappropriate [configuration]<br>
<br>
-Index: apr-1.3.3/<a href=3D"http://apr-config.in" rel=3D"noreferrer" targe=
t=3D"_blank">apr-config.in</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- apr-1.3.3.orig/<a href=3D"http://apr-config.in" rel=3D"noreferrer" tar=
get=3D"_blank">apr-config.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A02009-01-12 15:16=
:31.000000000 +0000<br>
-+++ apr-1.3.3/<a href=3D"http://apr-config.in" rel=3D"noreferrer" target=
=3D"_blank">apr-config.in</a>=C2=A0 =C2=A0 2009-01-12 15:19:25.000000000 +0=
000<br>
-@@ -152,14 +152,7 @@<br>
+Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
+<br>
+The generated `apr-1-config&#39; is used by other recipes at build time or=
<br>
+packages at target run time, the workdir path caused confusion.<br>
+<br>
+Rebase to 1.6.3<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://apr-config.in" rel=3D"noreferrer" target=3D"_blank">apr=
-config.in</a> | 26 ++------------------------<br>
+ 1 file changed, 2 insertions(+), 24 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://apr-config.in" rel=3D"noreferrer" target=3D=
"_blank">apr-config.in</a> b/<a href=3D"http://apr-config.in" rel=3D"norefe=
rrer" target=3D"_blank">apr-config.in</a><br>
+index 84b4073..bbbf651 100644<br>
+--- a/<a href=3D"http://apr-config.in" rel=3D"noreferrer" target=3D"_blank=
">apr-config.in</a><br>
++++ b/<a href=3D"http://apr-config.in" rel=3D"noreferrer" target=3D"_blank=
">apr-config.in</a><br>
+@@ -152,14 +152,7 @@ while test $# -gt 0; do<br>
=C2=A0 =C2=A0 =C2=A0 flags=3D&quot;$flags $LDFLAGS&quot;<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 --includes)<br>
@@ -19,7 +37,7 @@ Index: apr-1.3.3/<a href=3D"http://apr-config.in" rel=3D"=
noreferrer" target=3D"_blank">apr-config.in</a><br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 --srcdir)<br>
=C2=A0 =C2=A0 =C2=A0 echo $APR_SOURCE_DIR<br>
-@@ -181,29 +167,14 @@<br>
+@@ -181,29 +174,14 @@ while test $# -gt 0; do<br>
=C2=A0 =C2=A0 =C2=A0 exit 0<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 --link-ld)<br>
@@ -51,3 +69,6 @@ Index: apr-1.3.3/<a href=3D"http://apr-config.in" rel=3D"=
noreferrer" target=3D"_blank">apr-config.in</a><br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 --shlib-path-var)<br>
=C2=A0 =C2=A0 =C2=A0 echo &quot;$SHLIBPATH_VAR&quot;<br>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/upgrade-and-fix-1.5.1.<wbr>p=
atch b/meta/recipes-support/apr/<wbr>apr/0003-Makefile.in-<wbr>configure.in=
-support-cross-<wbr>compiling.patch<br>
similarity index 40%<br>
rename from meta/recipes-support/apr/apr/<wbr>upgrade-and-fix-1.5.1.patch<b=
r>
rename to meta/recipes-support/apr/apr/<wbr>0003-Makefile.in-configure.in-<=
wbr>support-cross-compiling.patch<br>
index 16499f5..4dd53bd 100644<br>
--- a/meta/recipes-support/apr/<wbr>apr/upgrade-and-fix-1.5.1.<wbr>patch<br=
>
+++ b/meta/recipes-support/apr/<wbr>apr/0003-Makefile.in-<wbr>configure.in-=
support-cross-<wbr>compiling.patch<br>
@@ -1,45 +1,63 @@<br>
-Makefile.in: fix cross compiling failed<br>
+From d5028c10f156c224475b340cfb1ba0<wbr>25d6797243 Mon Sep 17 00:00:00 200=
1<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
+Date: Fri, 2 Feb 2018 15:51:42 +0800<br>
+Subject: [PATCH 3/7] Makefile.in/<a href=3D"http://configure.in" rel=3D"no=
referrer" target=3D"_blank">configure.in</a>: support cross compiling<br>
<br>
-The tools/gen_test_char was invoked at build time,<br>
-and it didn&#39;t work for the cross compiling, so we<br>
-compile it with $BUILD_CC.<br>
+While cross compiling, the tools/gen_test_char could not<br>
+be executed at build time, use AX_PROG_CC_FOR_BUILD to<br>
+build native tools/gen_test_char<br>
<br>
-Remove the &#39;tools&#39; dir creation, it always existed.<br>
-And it caused gen_test_char unexpected rebuilt at<br>
-do_install time.<br>
-<br>
-Upstream-Status: Inappropriate [oe specific]<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/apache/apr/pull/=
8" rel=3D"noreferrer" target=3D"_blank">https://github.com/apache/<wbr>apr/=
pull/8</a>]<br>
<br>
=C2=A0Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.=
com">hongxu.jia@windriver.com</a>&gt;<br>
=C2=A0---<br>
- Makefile.in | 10 ++--------<br>
- 1 file changed, 2 insertions(+), 8 deletions(-)<br>
+ Makefile.in=C2=A0 | 10 +++-------<br>
+ <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> |=C2=A0 3 +++<br>
+ 2 files changed, 6 insertions(+), 7 deletions(-)<br>
<br>
=C2=A0diff --git a/Makefile.in b/Makefile.in<br>
-index a2a5194..5fe028f 100644<br>
+index 5fb760e..8675f90 100644<br>
=C2=A0--- a/Makefile.in<br>
=C2=A0+++ b/Makefile.in<br>
-@@ -46,7 +46,6 @@ LT_VERSION =3D @LT_VERSION@<br>
+@@ -46,7 +46,7 @@ LT_VERSION =3D @LT_VERSION@<br>
<br>
=C2=A0 CLEAN_TARGETS =3D apr-config.out apr.exp exports.c export_vars.c .ma=
ke.dirs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 build/apr_rules.out tools/gen_test_char@EXEEXT@=
 \<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 tools/gen_test_char.o tools/gen_test_char.lo \<=
br>
++=C2=A0 =C2=A0 =C2=A0 tools/gen_test_char.o \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 include/private/apr_escape_<wbr>test_char.h<br>
=C2=A0 DISTCLEAN_TARGETS =3D config.cache config.log config.status \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 include/apr.h include/arch/unix/apr_private.<wb=
r>h \<br>
-@@ -129,13 +128,8 @@ check: $(TARGET_LIB)<br>
+@@ -131,13 +131,9 @@ check: $(TARGET_LIB)<br>
=C2=A0 etags:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 etags `find . -name &#39;*.[ch]&#39;`<br>
<br>
=C2=A0-OBJECTS_gen_test_char =3D tools/gen_test_char.lo $(LOCAL_LIBS)<br>
=C2=A0-tools/gen_test_char.lo: tools/gen_test_char.c<br>
--=C2=A0 =C2=A0 =C2=A0 $(APR_MKDIR) tools<br>
++tools/gen_test_char@EXEEXT@: tools/gen_test_char.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(APR_MKDIR) tools<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 $(LT_COMPILE)<br>
=C2=A0-<br>
=C2=A0-tools/gen_test_char@EXEEXT@: $(OBJECTS_gen_test_char)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 $(LINK_PROG) $(OBJECTS_gen_test_char) $(ALL_LIB=
S)<br>
-+tools/gen_test_char@EXEEXT@: tools/gen_test_char.c<br>
-+=C2=A0 =C2=A0 =C2=A0 $(BUILD_CC) $(CFLAGS_FOR_BUILD) $&lt; -o $@<br>
++=C2=A0 =C2=A0 =C2=A0 $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $&lt; -o $@<br>
<br>
=C2=A0 include/private/apr_escape_<wbr>test_char.h: tools/gen_test_char@EXE=
EXT@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(APR_MKDIR) include/private<br>
+diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"=
_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"noreferre=
r" target=3D"_blank">configure.in</a><br>
+index 719f331..361120f 100644<br>
+--- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
++++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
+@@ -183,6 +183,9 @@ dnl can only be used once within a configure script, s=
o this prevents a<br>
+ dnl preload section from invoking the macro to get compiler info.<br>
+ AC_PROG_CC<br>
+<br>
++dnl Check build CC for gen_test_char compiling which is executed at build=
 time.<br>
++AX_PROG_CC_FOR_BUILD<br>
++<br>
+ dnl AC_PROG_SED is only avaliable in recent autoconf versions.<br>
+ dnl Use AC_CHECK_PROG instead if AC_PROG_SED is not present.<br>
+ ifdef([AC_PROG_SED],<br>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/Fix-packet-discards-HTTP-<wb=
r>redirect.patch b/meta/recipes-support/apr/<wbr>apr/0004-Fix-packet-discar=
ds-<wbr>HTTP-redirect.patch<br>
similarity index 71%<br>
rename from meta/recipes-support/apr/apr/<wbr>Fix-packet-discards-HTTP-<wbr=
>redirect.patch<br>
rename to meta/recipes-support/apr/apr/<wbr>0004-Fix-packet-discards-HTTP-<=
wbr>redirect.patch<br>
index 6805b8b..30fc07d 100644<br>
--- a/meta/recipes-support/apr/<wbr>apr/Fix-packet-discards-HTTP-<wbr>redir=
ect.patch<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0004-Fix-packet-discards-<wbr>HTTP-=
redirect.patch<br>
@@ -1,4 +1,7 @@<br>
-Fix packet discards HTTP redirect.<br>
+From 7925eb1766a00ccee05c6e80b1d34f<wbr>163a04b7b1 Mon Sep 17 00:00:00 200=
1<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
+Date: Tue, 30 Jan 2018 09:43:34 +0800<br>
+Subject: [PATCH 4/7] Fix packet discards HTTP redirect.<br>
<br>
=C2=A0Disconnect the connection by poll() timeout.<br>
=C2=A0If timeout=3D0 and apr_wait_for_io_or_timeout()=3D<wbr>APR_TIMEUP the=
n<br>
@@ -8,12 +11,16 @@ Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Noriaki Yoshitane &lt;<a href=3D"mailto:yoshitane.nrs@=
cnt.ncos.nec.co.jp">yoshitane.nrs@cnt.ncos.nec.<wbr>co.jp</a>&gt;<br>
=C2=A0Signed-off-by: Li Wang &lt;<a href=3D"mailto:li.wang@windriver.com">l=
i.wang@windriver.com</a>&gt;<br>
+<br>
+Rebase to 1.6.3<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
=C2=A0---<br>
- network_io/unix/sendrecv.c |=C2=A0 =C2=A0 4 ++++<br>
+ network_io/unix/sendrecv.c | 4 ++++<br>
=C2=A0 1 file changed, 4 insertions(+)<br>
<br>
=C2=A0diff --git a/network_io/unix/sendrecv.c b/network_io/unix/sendrecv.c<=
br>
-index c133a26..e8faf15 100644<br>
+index 4c0e0a6..1bdafba 100644<br>
=C2=A0--- a/network_io/unix/sendrecv.c<br>
=C2=A0+++ b/network_io/unix/sendrecv.c<br>
=C2=A0@@ -85,6 +85,10 @@ apr_status_t apr_socket_recv(apr_socket_t *sock, c=
har *buf, apr_size_t *len)<br>
@@ -28,5 +35,5 @@ index c133a26..e8faf15 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *len =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return arv;<br>
=C2=A0--<br>
-1.7.9.5<br>
+1.8.3.1<br>
<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/configure.in-fix-LTFLAGS-<wb=
r>to-make-it-work-with-ccache.<wbr>patch b/meta/recipes-support/apr/<wbr>ap=
r/0005-configure.in-fix-<wbr>LTFLAGS-to-make-it-work-with-<wbr>ccache.patch=
<br>
similarity index 78%<br>
rename from meta/recipes-support/apr/apr/<wbr>configure.in-fix-LTFLAGS-to-<=
wbr>make-it-work-with-ccache.patch<br>
rename to meta/recipes-support/apr/apr/<wbr>0005-configure.in-fix-LTFLAGS-<=
wbr>to-make-it-work-with-ccache.<wbr>patch<br>
index 7521eeb..02634e6 100644<br>
--- a/meta/recipes-support/apr/<wbr>apr/configure.in-fix-LTFLAGS-<wbr>to-ma=
ke-it-work-with-ccache.<wbr>patch<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0005-configure.in-fix-<wbr>LTFLAGS-=
to-make-it-work-with-<wbr>ccache.patch<br>
@@ -1,7 +1,7 @@<br>
-From d439093aa07a486f559206ac9e5808<wbr>a6a18218cd Mon Sep 17 00:00:00 200=
1<br>
+From 2e66cece0c3adff92733332111204d<wbr>dc1d730a07 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com">li=
ezhi.yang@windriver.com</a>&gt;<br>
=C2=A0Date: Thu, 19 Nov 2015 18:25:38 -0800<br>
-Subject: [PATCH] <a href=3D"http://configure.in" rel=3D"noreferrer" target=
=3D"_blank">configure.in</a>: fix LTFLAGS to make it work with ccache<br>
+Subject: [PATCH 5/7] <a href=3D"http://configure.in" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.in</a>: fix LTFLAGS to make it work with ccache<b=
r>
<br>
=C2=A0When ccache is enabled, libtool requires --tag=3DCC when use ccache,<=
br>
=C2=A0otherwise when building apr-util with ccache enabled:<br>
@@ -15,14 +15,14 @@ Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windrive=
r.com">liezhi.yang@windriver.com</a>&gt;<br>
=C2=A0---<br>
- <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> |=C2=A0 =C2=A0 2 +-<br>
+ <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" targe=
t=3D"_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"nore=
ferrer" target=3D"_blank">configure.in</a><br>
-index 5a4a988..9d57ae6 100644<br>
+index 361120f..3b10422 100644<br>
=C2=A0--- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
=C2=A0+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
-@@ -246,7 +246,7 @@ case $host in<br>
+@@ -249,7 +249,7 @@ case $host in<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 *)<br>
=C2=A0 =C2=A0 =C2=A0 if test &quot;x$LTFLAGS&quot; =3D &quot;x&quot;; then<=
br>
@@ -32,5 +32,5 @@ index 5a4a988..9d57ae6 100644<br>
=C2=A0 =C2=A0 =C2=A0 if test &quot;$experimental_libtool&quot; =3D &quot;ye=
s&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use a custom-made libtool replacement<=
br>
=C2=A0--<br>
-1.7.9.5<br>
+1.8.3.1<br>
<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/0001-apr-fix-off_t-size-<wbr=
>doesn-t-match-in-glibc-when-<wbr>cross.patch b/meta/recipes-support/apr/<w=
br>apr/0006-apr-fix-off_t-size-<wbr>doesn-t-match-in-glibc-when-<wbr>cross.=
patch<br>
similarity index 85%<br>
rename from meta/recipes-support/apr/apr/<wbr>0001-apr-fix-off_t-size-doesn=
-<wbr>t-match-in-glibc-when-cross.<wbr>patch<br>
rename to meta/recipes-support/apr/apr/<wbr>0006-apr-fix-off_t-size-doesn-<=
wbr>t-match-in-glibc-when-cross.<wbr>patch<br>
index c5e92ac..5f5e7ea 100644<br>
--- a/meta/recipes-support/apr/<wbr>apr/0001-apr-fix-off_t-size-<wbr>doesn-=
t-match-in-glibc-when-<wbr>cross.patch<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0006-apr-fix-off_t-size-<wbr>doesn-=
t-match-in-glibc-when-<wbr>cross.patch<br>
@@ -1,7 +1,7 @@<br>
-From f26e8b88d2c90ed7eb9d4e276412b0<wbr>923c23d10f Mon Sep 17 00:00:00 200=
1<br>
+From f4d6e45ed5d2ccffd1af4c2ccdf709<wbr>9ba0dce137 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke=
.du@windriver.com</a>&gt;<br>
=C2=A0Date: Wed, 14 Dec 2016 18:13:08 +0800<br>
-Subject: [PATCH] apr: fix off_t size doesn&#39;t match in glibc when cross=
<br>
+Subject: [PATCH 6/7] apr: fix off_t size doesn&#39;t match in glibc when c=
ross<br>
=C2=A0 compiling<br>
<br>
=C2=A0In <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blan=
k">configure.in</a>, it contains the following:<br>
@@ -34,10 +34,10 @@ Upstream-Status: Pending<br>
=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" targe=
t=3D"_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"nore=
ferrer" target=3D"_blank">configure.in</a><br>
-index 9d57ae6..5b19940 100644<br>
+index 3b10422..a227e72 100644<br>
=C2=A0--- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
=C2=A0+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
-@@ -1681,7 +1681,7 @@ else<br>
+@@ -1769,7 +1769,7 @@ else<br>
=C2=A0 =C2=A0 =C2=A0 socklen_t_value=3D&quot;int&quot;<br>
=C2=A0 fi<br>
<br>
@@ -46,7 +46,7 @@ index 9d57ae6..5b19940 100644<br>
<br>
=C2=A0 if test &quot;$ac_cv_sizeof_pid_t&quot; =3D &quot;$ac_cv_sizeof_shor=
t&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 pid_t_fmt=3D&#39;#define APR_PID_T_FMT &quot;hd&quot;&=
#39;<br>
-@@ -1750,7 +1750,7 @@ APR_CHECK_TYPES_COMPATIBLE(<wbr>ssize_t, long, [ssiz=
e_t_fmt=3D&quot;ld&quot;])<br>
+@@ -1838,7 +1838,7 @@ APR_CHECK_TYPES_COMPATIBLE(<wbr>ssize_t, long, [ssiz=
e_t_fmt=3D&quot;ld&quot;])<br>
=C2=A0 APR_CHECK_TYPES_COMPATIBLE(<wbr>size_t, unsigned int, [size_t_fmt=3D=
&quot;u&quot;])<br>
=C2=A0 APR_CHECK_TYPES_COMPATIBLE(<wbr>size_t, unsigned long, [size_t_fmt=
=3D&quot;lu&quot;])<br>
<br>
@@ -55,7 +55,7 @@ index 9d57ae6..5b19940 100644<br>
<br>
=C2=A0 AC_MSG_CHECKING([which format to use for apr_ssize_t])<br>
=C2=A0 if test -n &quot;$ssize_t_fmt&quot;; then<br>
-@@ -1767,7 +1767,7 @@ fi<br>
+@@ -1855,7 +1855,7 @@ fi<br>
<br>
=C2=A0 ssize_t_fmt=3D&quot;#define APR_SSIZE_T_FMT \&quot;$ssize_t_fmt\&quo=
t;&quot;<br>
<br>
@@ -64,7 +64,7 @@ index 9d57ae6..5b19940 100644<br>
<br>
=C2=A0 AC_MSG_CHECKING([which format to use for apr_size_t])<br>
=C2=A0 if test -n &quot;$size_t_fmt&quot;; then<br>
-@@ -1784,7 +1784,7 @@ fi<br>
+@@ -1872,7 +1872,7 @@ fi<br>
<br>
=C2=A0 size_t_fmt=3D&quot;#define APR_SIZE_T_FMT \&quot;$size_t_fmt\&quot;&=
quot;<br>
<br>
@@ -74,5 +74,5 @@ index 9d57ae6..5b19940 100644<br>
=C2=A0 if test &quot;${ac_cv_sizeof_off_t}${apr_<wbr>cv_use_lfs64}&quot; =
=3D &quot;4yes&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 # Enable LFS<br>
=C2=A0--<br>
-2.7.4<br>
+1.8.3.1<br>
<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/0002-explicitly-link-<wbr>li=
bapr-against-phtread-to-<wbr>make-gold-.patch b/meta/recipes-support/apr/<w=
br>apr/0007-explicitly-link-<wbr>libapr-against-phtread-to-<wbr>make-gold-.=
patch<br>
similarity index 90%<br>
rename from meta/recipes-support/apr/apr/<wbr>0002-explicitly-link-libapr-<=
wbr>against-phtread-to-make-gold-.<wbr>patch<br>
rename to meta/recipes-support/apr/apr/<wbr>0007-explicitly-link-libapr-<wb=
r>against-phtread-to-make-gold-.<wbr>patch<br>
index 7d0dddc..8760b01 100644<br>
--- a/meta/recipes-support/apr/<wbr>apr/0002-explicitly-link-<wbr>libapr-ag=
ainst-phtread-to-<wbr>make-gold-.patch<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0007-explicitly-link-<wbr>libapr-ag=
ainst-phtread-to-<wbr>make-gold-.patch<br>
@@ -1,8 +1,8 @@<br>
-From 94d1ca0266a0f9c0446f1299b54f75<wbr>2e87b8a695 Mon Sep 17 00:00:00 200=
1<br>
+From c6afc4a4a766478cb6aa6b43a50051<wbr>881b6318d7 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3D<wbr>BCller?=3D &lt;<a href=3D=
"mailto:schnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<=
br>
=C2=A0Date: Fri, 3 Mar 2017 22:24:17 +0100<br>
-Subject: [PATCH] explicitly link libapr against phtread to make gold happy=
 on<br>
- test<br>
+Subject: [PATCH 7/7] explicitly link libapr against phtread to make gold h=
appy<br>
+ on test<br>
=C2=A0MIME-Version: 1.0<br>
=C2=A0Content-Type: text/plain; charset=3DUTF-8<br>
=C2=A0Content-Transfer-Encoding: 8bit<br>
@@ -34,10 +34,10 @@ Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailt=
o:schnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" targe=
t=3D"_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"nore=
ferrer" target=3D"_blank">configure.in</a><br>
-index 5b19940..cdf4d58 100644<br>
+index a227e72..cbc0f90 100644<br>
=C2=A0--- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
=C2=A0+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
-@@ -766,6 +766,7 @@ else<br>
+@@ -784,6 +784,7 @@ else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APR_PTHREADS_CHECK_RESTORE ] )<br=
>
=C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 if test &quot;$pthreadh&quot; =3D &quot;1&quot;; then<=
br>
@@ -46,5 +46,5 @@ index 5b19940..cdf4d58 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APR_CHECK_PTHREAD_ATTR_<wbr>GETDETACHSTA=
TE_ONE_ARG<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APR_CHECK_PTHREAD_RECURSIVE_<wbr>MUTEX<b=
r>
=C2=A0--<br>
-2.9.3<br>
+1.8.3.1<br>
<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/cleanup.patch b/meta/recipes=
-support/apr/<wbr>apr/cleanup.patch<br>
deleted file mode 100644<br>
index b6784e0..0000000<br>
--- a/meta/recipes-support/apr/<wbr>apr/cleanup.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-Index: apr-1.4.2/build/buildcheck.sh<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- apr-1.4.2.orig/build/<wbr>buildcheck.sh 2009-11-13 08:27:16.000000000 =
+0800<br>
-+++ apr-1.4.2/build/buildcheck.sh=C2=A0 =C2=A0 =C2=A0 2010-11-26 15:44:00.=
000000000 +0800<br>
-@@ -32,35 +32,4 @@<br>
- echo &quot;buildconf: autoconf version $ac_version (ok)&quot;<br>
- fi<br>
-<br>
--# Sample libtool --version outputs:<br>
--# ltmain.sh (GNU libtool) 1.3.3 (1.385.2.181 1999/07/02 15:49:11)<br>
--# ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a<br>
--# output is multiline from 1.5 onwards<br>
--<br>
--# Require libtool 1.4 or newer<br>
--libtool=3D`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14=
`<br>
--lt_pversion=3D`$libtool --version 2&gt;/dev/null|sed -e &#39;s/([^)]*)//g=
;s/^[^0-9]*//;s/[<wbr>- ].*//g;q&#39;`<br>
--if test -z &quot;$lt_pversion&quot;; then<br>
--echo &quot;buildconf: libtool not found.&quot;<br>
--echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0You need libtool vers=
ion 1.4 or newer installed&quot;<br>
--echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to build APR from SVN=
.&quot;<br>
--exit 1<br>
--fi<br>
--lt_version=3D`echo $lt_pversion|sed -e &#39;s/\([a-z]*\)$/.\1/&#39;`<br>
--IFS=3D.; set $lt_version; IFS=3D&#39; &#39;<br>
--lt_status=3D&quot;good&quot;<br>
--if test &quot;$1&quot; =3D &quot;1&quot;; then<br>
--=C2=A0 =C2=A0if test &quot;$2&quot; -lt &quot;4&quot;; then<br>
--=C2=A0 =C2=A0 =C2=A0 lt_status=3D&quot;bad&quot;<br>
--=C2=A0 =C2=A0fi<br>
--fi<br>
--if test $lt_status =3D &quot;good&quot;; then<br>
--=C2=A0 =C2=A0echo &quot;buildconf: libtool version $lt_pversion (ok)&quot=
;<br>
--=C2=A0 =C2=A0exit 0<br>
--fi<br>
--<br>
--echo &quot;buildconf: libtool version $lt_pversion found.&quot;<br>
--echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0You need libtool vers=
ion 1.4 or newer installed&quot;<br>
--echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to build APR from SVN=
.&quot;<br>
--<br>
--exit 1<br>
-+exit 0<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/configure_fixes.patch b/meta=
/recipes-support/apr/<wbr>apr/configure_fixes.patch<br>
deleted file mode 100644<br>
index 0514000..0000000<br>
--- a/meta/recipes-support/apr/<wbr>apr/configure_fixes.patch<br>
+++ /dev/null<br>
@@ -1,68 +0,0 @@<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-Index: apr-1.3.3/<a href=3D"http://configure.in" rel=3D"noreferrer" target=
=3D"_blank">configure.in</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- apr-1.3.3.orig/<a href=3D"http://configure.in" rel=3D"noreferrer" targ=
et=3D"_blank">configure.in</a><br>
-+++ apr-1.3.3/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D=
"_blank">configure.in</a><br>
-@@ -794,39 +794,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_area]=
)<br>
-<br>
- APR_CHECK_DEFINE(MAP_ANON, sys/mman.h)<br>
--AC_CHECK_FILE(/dev/zero)<br>
--<br>
--# Not all systems can mmap /dev/zero (such as HP-UX).=C2=A0 Check for tha=
t.<br>
--if test &quot;$ac_cv_func_mmap&quot; =3D &quot;yes&quot; &amp;&amp;<br>
--=C2=A0 =C2=A0test &quot;$ac_cv_file__dev_zero&quot; =3D &quot;yes&quot;; =
then<br>
--=C2=A0 =C2=A0 AC_MSG_CHECKING(for mmap that can map /dev/zero)<br>
--=C2=A0 =C2=A0 AC_TRY_RUN([<br>
--#include &lt;sys/types.h&gt;<br>
--#include &lt;sys/stat.h&gt;<br>
--#include &lt;fcntl.h&gt;<br>
--#ifdef HAVE_SYS_MMAN_H<br>
--#include &lt;sys/mman.h&gt;<br>
--#endif<br>
--=C2=A0 =C2=A0 int main()<br>
--=C2=A0 =C2=A0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *m;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D open(&quot;/dev/zero&quot;, O_RDWR);<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D mmap(0, sizeof(void*), PROT_READ|PROT_W=
RITE, MAP_SHARED, fd, 0);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (m =3D=3D (void *)-1) {=C2=A0 /* aka MAP_F=
AILED */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 2;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (munmap(m, sizeof(void*)) &lt; 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 3;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
--=C2=A0 =C2=A0 }], [], [ac_cv_file__dev_zero=3Dno], [ac_cv_file__dev_zero=
=3Dno])<br>
--<br>
--=C2=A0 =C2=A0 AC_MSG_RESULT($ac_cv_file__<wbr>dev_zero)<br>
--fi<br>
-<br>
- # Now we determine which one is our anonymous shmem preference.<br>
- haveshmgetanon=3D&quot;0&quot;<br>
-@@ -1518,13 +1485,14 @@ else<br>
-=C2=A0 =C2=A0 =C2=A0bigendian=3D0<br>
- fi<br>
-<br>
--APR_CHECK_SIZEOF_EXTENDED([#<wbr>include &lt;sys/types.h&gt;<br>
--#include &lt;sys/uio.h&gt;],struct iovec,0)<br>
--if test &quot;$ac_cv_sizeof_struct_iovec&quot; =3D &quot;0&quot;; then<br=
>
--=C2=A0 =C2=A0 have_iovec=3D0<br>
--else<br>
--=C2=A0 =C2=A0 have_iovec=3D1<br>
--fi<br>
-+#APR_CHECK_SIZEOF_EXTENDED([<wbr>#include &lt;sys/types.h&gt;<br>
-+##include &lt;sys/uio.h&gt;],struct iovec,0)<br>
-+#if test &quot;$ac_cv_sizeof_struct_iovec&quot; =3D &quot;0&quot;; then<b=
r>
-+#=C2=A0 =C2=A0 have_iovec=3D0<br>
-+#else<br>
-+#=C2=A0 =C2=A0 have_iovec=3D1<br>
-+#fi<br>
-+have_iovec=3D1<br>
-<br>
- AC_SUBST(voidp_size)<br>
- AC_SUBST(short_value)<br>
diff --git a/meta/recipes-support/apr/<a href=3D"http://apr_1.6.2.bb" rel=
=3D"noreferrer" target=3D"_blank">apr<wbr>_1.6.2.bb</a> b/meta/recipes-supp=
ort/apr/<a href=3D"http://apr_1.6.3.bb" rel=3D"noreferrer" target=3D"_blank=
">apr<wbr>_1.6.3.bb</a><br>
similarity index 77%<br>
rename from meta/recipes-support/apr/<a href=3D"http://apr_1.6.2.bb" rel=3D=
"noreferrer" target=3D"_blank">apr_<wbr>1.6.2.bb</a><br>
rename to meta/recipes-support/apr/<a href=3D"http://apr_1.6.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">apr_<wbr>1.6.3.bb</a><br>
index e2eed53..87b8787 100644<br>
--- a/meta/recipes-support/apr/<a href=3D"http://apr_1.6.2.bb" rel=3D"noref=
errer" target=3D"_blank">apr<wbr>_1.6.2.bb</a><br>
+++ b/meta/recipes-support/apr/<a href=3D"http://apr_1.6.3.bb" rel=3D"noref=
errer" target=3D"_blank">apr<wbr>_1.6.3.bb</a><br>
@@ -10,19 +10,18 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>4d=
fd4cd216828c8cae5de5a12f3844<wbr>c8 \<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${APACHE_MIRROR}/apr/${BPN}-$<wbr>{PV}.tar.bz2 \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure_fixes.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cleanup.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configfix.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://upgrade-and-fix-1.5.1.<wbr=
>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Fix-packet-discards-<wbr>H=
TTP-redirect.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure.in-fix-<wbr>LTFL=
AGS-to-make-it-work-with-<wbr>ccache.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-apr-fix-off_t-<wbr>si=
ze-doesn-t-match-in-glibc-<wbr>when-cross.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-explicitly-link-<wbr>=
libapr-against-phtread-to-<wbr>make-gold-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-buildcheck.<wbr=
>sh-improve-libtool-detection.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-apr-Remove-<wbr>workd=
ir-path-references-from-<wbr>installed-ap.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Makefile.in-<wbr>conf=
igure.in-support-cross-<wbr>compiling.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Fix-packet-<wbr>disca=
rds-HTTP-redirect.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-configure.in-fix-<wbr=
>LTFLAGS-to-make-it-work-with-<wbr>ccache.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-apr-fix-off_t-<wbr>si=
ze-doesn-t-match-in-glibc-<wbr>when-cross.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-explicitly-link-<wbr>=
libapr-against-phtread-to-<wbr>make-gold-.patch \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>e81a851967c79b5ce9bfbc909e4bf7<wbr>35&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>09109cea377bab0028bba19a92b5b0<wbr>e8960=
3df9eab05c0f7dbd4dd83d48d<wbr>cebd&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>12f2a349483ad6f12db49ba01fbfdb<wbr>fa&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>131f06d16d7aabd097fa992a33eec2<wbr>b6af3=
962f93e6d570a9bd4d85e9599<wbr>3172&quot;<br>
<br>
=C2=A0inherit autotools-brokensep lib_package binconfig multilib_header pte=
st<br>
<br>
@@ -35,6 +34,9 @@ CACHED_CONFIGUREVARS +=3D &quot;apr_cv_mutex_recursive=3D=
yes&quot;<br>
=C2=A0#<br>
=C2=A0CACHED_CONFIGUREVARS +=3D &quot;ac_cv_header_netinet_sctp_h=3D<wbr>no=
 ac_cv_header_netinet_sctp_uio_<wbr>h=3Dno&quot;<br>
<br>
+CACHED_CONFIGUREVARS +=3D &quot;ac_cv_sizeof_struct_iovec=3D<wbr>yes&quot;=
<br>
+CACHED_CONFIGUREVARS +=3D &quot;ac_cv_file__dev_zero=3Dyes&quot;<br>
+<br>
=C2=A0# Otherwise libtool fails to compile apr-utils<br>
=C2=A0# x86_64-linux-libtool: compile: unable to infer tagged configuration=
<br>
=C2=A0# x86_64-linux-libtool:=C2=A0 =C2=A0error: specify a tag with &#39;--=
tag&#39;<br>
@@ -50,7 +52,7 @@ do_configure_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GREP=3D&quot;grep&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0./buildconf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libtool=3D&#39;${HOST_SYS}-libtool&#39; ./build=
conf<br>
=C2=A0}<br>
<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/apr.exp ${datadir}/build-1/*&quo=
t;<br>
@@ -69,7 +71,8 @@ do_install_append() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append_class-<wbr>target() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,${STAGING_DIR_HOST},,g&#39; ${=
D}${datadir}/build-1/<a href=3D"http://apr_rules.mk" rel=3D"noreferrer" tar=
get=3D"_blank">apr_<wbr>rules.mk</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,${DEBUG_PREFIX_MAP},,g&#39; \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,${STAGING_DIR_H=
OST},,g&#39; ${D}${datadir}/build-1/<a href=3D"http://apr_rules.mk" rel=3D"=
noreferrer" target=3D"_blank">apr_<wbr>rules.mk</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s,${STAGING_DIR_HOST},,g&#39; \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,APR_SOURCE=
_DIR=3D.*,APR_<wbr>SOURCE_DIR=3D,g&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,APR_BUILD_=
DIR=3D.*,APR_BUILD_<wbr>DIR=3D,g&#39; ${D}${bindir}/apr-1-config<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c0afc4427981a05643b7406--
