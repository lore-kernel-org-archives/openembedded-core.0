Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id E8773788BC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 06:07:18 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id 125-v6so6200235vke.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 23:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=isU4uIMwZpQ/FxIzcw2SW+Cfxfp15VtxicNAcGgMEss=;
	b=X7jo/5L0RvE/MRrQ+hNEsUnz82btFOuWx9MONVG1L0WEoF4DiorX0Rl1dvObcffHNs
	gDAbCYZQaZ7MzC+DjYTlcwOAdeu5+RaomYv2Rw4dOBaR2T8TFRSPXWy+AB2WmV5VNcNt
	wkvKAPjPJaWXw+g1xPnGKIcgGUFMR82EFoz55IvG5sTEICI7/eFbdTvav+Y3cS+6baKg
	9817EMTc7ppJZJPmsNrcOoLU2bFyFjO05jGX4UW8iC4CkjLeXFIH5rAzQjRufSMUJCwT
	0X4qqKGG2c+OvUXoEV+/JVRBqR2BzyfNQuLtmE6LyX7/S4DG9Vmf5XesA9zfzCmPZ0c6
	Y+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=isU4uIMwZpQ/FxIzcw2SW+Cfxfp15VtxicNAcGgMEss=;
	b=jhAMsyMhYXyYXAjotAf7LgqkqH8L62Q9fnaBePakgC/qSOjZHbukwd9FYlztiUihcg
	u92iKeSGU3VimUvGB8DZY3jswgMN/ln1zO6vt8q6IQMHREfiwORbd5DpIboUDboaR8X9
	4RSVGpcgy2oNQGP0TJr+aetHgZd/DlZPmjJxlq+fqZFPu5SuXZpes20u47x1dGmdRs4G
	bgf6v2ZX0t4dd7SHze7MFTcQVCsR749dPbr139msX02aAzfDqmbic0KLacz9Ma+Zkd5O
	JgoEt1tGL5R5bW1493Mta28qwSr/Tyvhx4+aSa4NWABcdFHBLQuPqHJXj5y8IWpVucOl
	HY8A==
X-Gm-Message-State: APt69E0gF39nqfPXTArBCwWl1iAkl2hdnh7Uz6jpFKLknc/SOrA1YoJ/
	VAyoHXIKyRMUwoTwJcBe1aXwqqsRdkkJVPuM41XuBg==
X-Google-Smtp-Source: AAOMgpd/MiypuFL62C0PymSowijRs2+BZ+hdu/z3UkiVbnwdgi4wxCO1aHijZbb4DACSJXtPNAqT80q8/yHDF9425vE=
X-Received: by 2002:a1f:5244:: with SMTP id
	g65-v6mr4981447vkb.28.1530857239520; 
	Thu, 05 Jul 2018 23:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1530591075.git.liezhi.yang@windriver.com>
	<8f4139268beb2ae8229344acf481631425b81675.1530591075.git.liezhi.yang@windriver.com>
In-Reply-To: <8f4139268beb2ae8229344acf481631425b81675.1530591075.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jul 2018 23:06:16 -0700
Message-ID: <CAMKF1spaMzOO62=ibAoL+ZKVuiRkUyfu+BosOJTHoxR1ZYpZQA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] automake: 1.15.1 -> 1.16.1
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
X-List-Received-Date: Fri, 06 Jul 2018 06:07:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this is regressing following recipes in meta-openembedded

http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes=
-support/ntop/ntop_5.0.1.bb?h=3Dmaster
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extende=
d/sblim-sfcb/sblim-sfcb_1.4.9.bb?h=3Dmaster


On Mon, Jul 2, 2018 at 9:02 PM Robert Yang <liezhi.yang@windriver.com> wrot=
e:
>
> * Refreshed the following patches:
>   - 0001-automake-Add-default-libtool_tag-to-cppasm.patch
>   - automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
>   - buildtest.patch
>   - new_rt_path_for_test-driver.patch
>   - performance.patch
>   - python-libdir.patch
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...utomake-Add-default-libtool_tag-to-cppasm.patch | 18 +++---
>  ...tion-in-shebangs-with-modern-use-warnings.patch | 68 +++++-----------=
------
>  .../automake/automake/buildtest.patch              | 20 +++++--
>  .../automake/new_rt_path_for_test-driver.patch     | 22 +++++--
>  .../automake/automake/performance.patch            | 19 ++++--
>  .../automake/automake/python-libdir.patch          | 19 +++---
>  .../{automake_1.15.1.bb =3D> automake_1.16.1.bb}     |  4 +-
>  7 files changed, 82 insertions(+), 88 deletions(-)
>  rename meta/recipes-devtools/automake/{automake_1.15.1.bb =3D> automake_=
1.16.1.bb} (89%)
>
> diff --git a/meta/recipes-devtools/automake/automake/0001-automake-Add-de=
fault-libtool_tag-to-cppasm.patch b/meta/recipes-devtools/automake/automake=
/0001-automake-Add-default-libtool_tag-to-cppasm.patch
> index 1221f13..deb1d03 100644
> --- a/meta/recipes-devtools/automake/automake/0001-automake-Add-default-l=
ibtool_tag-to-cppasm.patch
> +++ b/meta/recipes-devtools/automake/automake/0001-automake-Add-default-l=
ibtool_tag-to-cppasm.patch
> @@ -1,4 +1,4 @@
> -From 25a8ac30486798d23f516722d73eb622e6264f28 Mon Sep 17 00:00:00 2001
> +From b3c6e1971786cd93a2e3017c92bfbfe96baaf2f7 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 26 Jul 2017 11:19:56 -0700
>  Subject: [PATCH] automake: Add default libtool_tag to cppasm.
> @@ -6,19 +6,19 @@ Subject: [PATCH] automake: Add default libtool_tag to c=
ppasm.
>      * bin/automake.in (register_language): Define default libtool tag to=
 be CC
>      since CPPASCOMPILE is using CC to call assembler
>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
>  Upstream-Status: Submitted
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> +---
>   bin/automake.in | 1 +
>   1 file changed, 1 insertion(+)
>
> -Index: automake-1.15.1/bin/automake.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- automake-1.15.1.orig/bin/automake.in
> -+++ automake-1.15.1/bin/automake.in
> -@@ -831,6 +831,7 @@ register_language ('name' =3D> 'cppasm',
> -                  'compiler' =3D> 'CPPASCOMPILE',
> +diff --git a/bin/automake.in b/bin/automake.in
> +index 3a66965..08ba09a 100644
> +--- a/bin/automake.in
> ++++ b/bin/automake.in
> +@@ -898,6 +898,7 @@ register_language ('name' =3D> 'cppasm',
> +                    'libtool_tag' =3D> 'CC',
>                    'compile_flag' =3D> '-c',
>                    'output_flag' =3D> '-o',
>  +                 'libtool_tag' =3D> 'CC',
> diff --git a/meta/recipes-devtools/automake/automake/automake-replace-w-o=
ption-in-shebangs-with-modern-use-warnings.patch b/meta/recipes-devtools/au=
tomake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warni=
ngs.patch
> index 96b5a3d..1592c02 100644
> --- a/meta/recipes-devtools/automake/automake/automake-replace-w-option-i=
n-shebangs-with-modern-use-warnings.patch
> +++ b/meta/recipes-devtools/automake/automake/automake-replace-w-option-i=
n-shebangs-with-modern-use-warnings.patch
> @@ -1,4 +1,4 @@
> -From 41e06b7a354774913dcd2e32a35440e407843357 Mon Sep 17 00:00:00 2001
> +From 081385f4d4bba367afad3bff1fa034f5263305e6 Mon Sep 17 00:00:00 2001
>  From: Serhii Popovych <spopovyc@cisco.com>
>  Date: Wed, 10 Feb 2016 17:07:32 +0000
>  Subject: [PATCH] perl: Replace -w option in shebangs with modern "use
> @@ -15,24 +15,24 @@ line and add "use warnings" statement.
>
>  Upstream-Status: Pending
>  Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +
>  ---
> - bin/aclocal.in     | 3 ++-
> - bin/automake.in    | 3 ++-
> - t/wrap/aclocal.in  | 3 ++-
> - t/wrap/automake.in | 3 ++-
> - 4 files changed, 8 insertions(+), 4 deletions(-)
> + bin/aclocal.in  | 3 ++-
> + bin/automake.in | 3 ++-
> + 2 files changed, 4 insertions(+), 2 deletions(-)
>
> -Index: automake-1.15.1/bin/aclocal.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- automake-1.15.1.orig/bin/aclocal.in
> -+++ automake-1.15.1/bin/aclocal.in
> +diff --git a/bin/aclocal.in b/bin/aclocal.in
> +index b3715d9..461d453 100644
> +--- a/bin/aclocal.in
> ++++ b/bin/aclocal.in
>  @@ -1,4 +1,4 @@
>  -#!@PERL@ -w
>  +#!@PERL@
>   # -*- perl -*-
>   # @configure_input@
>
> -@@ -33,6 +33,7 @@ BEGIN
> +@@ -32,6 +32,7 @@ BEGIN
>   }
>
>   use strict;
> @@ -40,17 +40,17 @@ Index: automake-1.15.1/bin/aclocal.in
>
>   use Automake::Config;
>   use Automake::General;
> -Index: automake-1.15.1/bin/automake.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- automake-1.15.1.orig/bin/automake.in
> -+++ automake-1.15.1/bin/automake.in
> +diff --git a/bin/automake.in b/bin/automake.in
> +index 8377d20..3a66965 100644
> +--- a/bin/automake.in
> ++++ b/bin/automake.in
>  @@ -1,4 +1,4 @@
>  -#!@PERL@ -w
>  +#!@PERL@
>   # -*- perl -*-
>   # @configure_input@
>
> -@@ -28,6 +28,7 @@ eval 'case $# in 0) exec @PERL@ -S "$0";
> +@@ -28,6 +28,7 @@ eval 'case $# in 0) exec @PERL@ -S "$0";; *) exec @PER=
L@ -S "$0" "$@";; esac'
>   package Automake;
>
>   use strict;
> @@ -58,39 +58,3 @@ Index: automake-1.15.1/bin/automake.in
>
>   BEGIN
>   {
> -Index: automake-1.15.1/t/wrap/aclocal.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- automake-1.15.1.orig/t/wrap/aclocal.in
> -+++ automake-1.15.1/t/wrap/aclocal.in
> -@@ -1,4 +1,4 @@
> --#!@PERL@ -w
> -+#!@PERL@
> - # @configure_input@
> -
> - # Copyright (C) 2012-2017 Free Software Foundation, Inc.
> -@@ -19,6 +19,7 @@
> - BEGIN
> - {
> -   use strict;
> -+  use warnings;
> -   @Aclocal::perl_libdirs =3D ('@abs_top_srcdir@/lib');
> -   unshift @Aclocal::perl_libdirs, '@abs_top_builddir@/lib'
> -     if '@srcdir@' ne '.';
> -Index: automake-1.15.1/t/wrap/automake.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- automake-1.15.1.orig/t/wrap/automake.in
> -+++ automake-1.15.1/t/wrap/automake.in
> -@@ -1,4 +1,4 @@
> --#!@PERL@ -w
> -+#!@PERL@
> - # @configure_input@
> -
> - # Copyright (C) 2012-2017 Free Software Foundation, Inc.
> -@@ -19,6 +19,7 @@
> - BEGIN
> - {
> -   use strict;
> -+  use warnings;
> -   @Automake::perl_libdirs =3D ('@abs_top_srcdir@/lib');
> -   unshift @Automake::perl_libdirs, '@abs_top_builddir@/lib'
> -     if '@srcdir@' ne '.';
> diff --git a/meta/recipes-devtools/automake/automake/buildtest.patch b/me=
ta/recipes-devtools/automake/automake/buildtest.patch
> index c32cd1f..b88b9e8 100644
> --- a/meta/recipes-devtools/automake/automake/buildtest.patch
> +++ b/meta/recipes-devtools/automake/automake/buildtest.patch
> @@ -1,13 +1,25 @@
> +From a860b28069785aa5bf2fa9b671287de9af5004ff Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Stenberg?=3D <bjst@enea.com>
> +Date: Wed, 19 Dec 2012 17:18:27 +0100
> +Subject: [PATCH] Add a new distro feature "ptest".
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
>  Split "check-TESTS" into a buildtest and runtest target, so that they ca=
n
>  be run separately.
>
>  Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
>  Upstream-Status: Pending
>
> -Index: automake-1.15.1/lib/am/check.am
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- automake-1.15.1.orig/lib/am/check.am
> -+++ automake-1.15.1/lib/am/check.am
> +---
> + lib/am/check.am | 11 +++++++++--
> + 1 file changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/am/check.am b/lib/am/check.am
> +index e0db651..de137fa 100644
> +--- a/lib/am/check.am
> ++++ b/lib/am/check.am
>  @@ -41,7 +41,7 @@ am__tty_colors =3D { \
>     fi; \
>   }
> diff --git a/meta/recipes-devtools/automake/automake/new_rt_path_for_test=
-driver.patch b/meta/recipes-devtools/automake/automake/new_rt_path_for_tes=
t-driver.patch
> index 2c6594f..1f71722 100644
> --- a/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver=
.patch
> +++ b/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver=
.patch
> @@ -1,22 +1,32 @@
> -Set relative to top_builddir path in Makefile to access test-driver
> +From f78dfa39139d528c94d72f27994f337f2fd3b6bd Mon Sep 17 00:00:00 2001
> +From: Adrian Calianu <adrian.calianu@enea.com>
> +Date: Thu, 25 Feb 2016 16:08:04 +0100
> +Subject: [PATCH] Set relative to top_builddir path in Makefile to access
> + test-driver
>
>  Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
>  Upstream-Status: Pending
>  Bug-Report: http://debbugs.gnu.org/cgi/bugreport.cgi?bug=3D19042
>
> +---
> + bin/automake.in | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/bin/automake.in b/bin/automake.in
> +index a52a489..8377d20 100644
>  --- a/bin/automake.in
>  +++ b/bin/automake.in
> -@@ -272,6 +272,9 @@
> +@@ -324,6 +324,9 @@ my $config_aux_dir_set_in_configure_ac =3D 0;
>   # $AM_CONFIG_AUX_DIR is prefixed with $(top_srcdir), so it can be used
>   # in Makefiles.
>   my $am_config_aux_dir =3D '';
>  +# Directory used at runtime like running test-driver that should not
>  +# depend on $(top_srcdir)
>  +my $am_config_rt_aux_dir =3D '';
> -
> +
>   # Directory to search for AC_LIBSOURCE files, as set by AC_CONFIG_LIBOB=
J_DIR
>   # in configure.ac.
> -@@ -4700,7 +4703,7 @@
> +@@ -4854,7 +4857,7 @@ sub handle_per_suffix_test
>       {
>         require_conf_file ("parallel-tests", FOREIGN, 'test-driver');
>         define_variable ("${pfx}LOG_DRIVER",
> @@ -25,7 +35,7 @@ Bug-Report: http://debbugs.gnu.org/cgi/bugreport.cgi?bu=
g=3D19042
>                          INTERNAL);
>       }
>     my $driver =3D '$(' . $pfx . 'LOG_DRIVER)';
> -@@ -7284,6 +7287,10 @@
> +@@ -7440,6 +7443,10 @@ sub locate_aux_dir ()
>     $am_config_aux_dir =3D
>       '$(top_srcdir)' . ($config_aux_dir eq '.' ? "" : "/$config_aux_dir"=
);
>     $am_config_aux_dir =3D~ s,/*$,,;
> @@ -34,3 +44,5 @@ Bug-Report: http://debbugs.gnu.org/cgi/bugreport.cgi?bu=
g=3D19042
>  +    '$(top_builddir)' . ($config_aux_dir eq '.' ? "" : "/$config_aux_di=
r");
>  +  $am_config_rt_aux_dir =3D~ s,/*$,,;
>   }
> +
> +
> diff --git a/meta/recipes-devtools/automake/automake/performance.patch b/=
meta/recipes-devtools/automake/automake/performance.patch
> index 3e6d569..a8ba659 100644
> --- a/meta/recipes-devtools/automake/automake/performance.patch
> +++ b/meta/recipes-devtools/automake/automake/performance.patch
> @@ -1,15 +1,24 @@
> +From cd47c328cb53546891bb3dc7c9b2c54ed01cc6d1 Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Mon, 7 Dec 2015 18:28:05 +0000
> +Subject: [PATCH] automake: Remove delays in configure scripts using auto=
make
> +
>  By default automake puts "sleep 1" into the start of configure scripts
> -which adds pointless delays to them. Rather than do this, lets just assu=
me
> +which adds pointless delays to them. Rather than do this, lets just assu=
me
>  our systems are sane.
>
>  RP
>  2015/12/7
>  Upstream-Status: Inappropriate
>
> -Index: automake-1.15/m4/sanity.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- automake-1.15.orig/m4/sanity.m4
> -+++ automake-1.15/m4/sanity.m4
> +---
> + m4/sanity.m4 | 55 -----------------------------------------------------=
--
> + 1 file changed, 55 deletions(-)
> +
> +diff --git a/m4/sanity.m4 b/m4/sanity.m4
> +index eaac218..bfdfe88 100644
> +--- a/m4/sanity.m4
> ++++ b/m4/sanity.m4
>  @@ -23,60 +23,5 @@ case $srcdir in
>       AC_MSG_ERROR([unsafe srcdir value: '$srcdir']);;
>   esac
> diff --git a/meta/recipes-devtools/automake/automake/python-libdir.patch =
b/meta/recipes-devtools/automake/automake/python-libdir.patch
> index 2a48b13..ee1f725 100644
> --- a/meta/recipes-devtools/automake/automake/python-libdir.patch
> +++ b/meta/recipes-devtools/automake/automake/python-libdir.patch
> @@ -1,7 +1,7 @@
> -From 472a3d36c97ef7535f05d6c185edcbc22b0074c4 Mon Sep 17 00:00:00 2001
> +From a80dacd5124d0713cf2c986b28d736e78dc6b0ca Mon Sep 17 00:00:00 2001
>  From: Kumar Gala <galak@kernel.crashing.org>
>  Date: Thu, 11 Aug 2011 01:26:33 -0500
> -Subject: [PATCH 1/4] automake: Update for python.m4 to respect libdir
> +Subject: [PATCH] automake: Update for python.m4 to respect libdir
>
>  Upstream-Status: Inappropriate [embedded specific]
>
> @@ -17,10 +17,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   1 file changed, 7 insertions(+), 20 deletions(-)
>
>  diff --git a/m4/python.m4 b/m4/python.m4
> -index 5b2c695..ed19261 100644
> +index 63c0a0e..7bbd2d2 100644
>  --- a/m4/python.m4
>  +++ b/m4/python.m4
> -@@ -91,12 +91,13 @@ AC_DEFUN([AM_PATH_PYTHON],
> +@@ -94,12 +94,13 @@ AC_DEFUN([AM_PATH_PYTHON],
>       [am_cv_python_version=3D`$PYTHON -c "import sys; sys.stdout.write(s=
ys.version[[:3]])"`])
>     AC_SUBST([PYTHON_VERSION], [$am_cv_python_version])
>
> @@ -36,7 +36,7 @@ index 5b2c695..ed19261 100644
>     AC_SUBST([PYTHON_EXEC_PREFIX], ['${exec_prefix}'])
>
>     dnl At times (like when building shared libraries) you may want
> -@@ -141,14 +142,7 @@ except ImportError:
> +@@ -144,14 +145,7 @@ except ImportError:
>        else
>          am_py_prefix=3D$prefix
>        fi
> @@ -52,7 +52,7 @@ index 5b2c695..ed19261 100644
>        case $am_cv_python_pythondir in
>        $am_py_prefix*)
>          am__strip_prefix=3D`echo "$am_py_prefix" | sed 's|.|.|g'`
> -@@ -158,7 +152,7 @@ sys.stdout.write(sitedir)"`
> +@@ -161,7 +155,7 @@ sys.stdout.write(sitedir)"`
>          case $am_py_prefix in
>            /usr|/System*) ;;
>            *)
> @@ -61,7 +61,7 @@ index 5b2c695..ed19261 100644
>           ;;
>          esac
>          ;;
> -@@ -183,14 +177,7 @@ sys.stdout.write(sitedir)"`
> +@@ -186,14 +180,7 @@ sys.stdout.write(sitedir)"`
>        else
>          am_py_exec_prefix=3D$exec_prefix
>        fi
> @@ -77,7 +77,7 @@ index 5b2c695..ed19261 100644
>        case $am_cv_python_pyexecdir in
>        $am_py_exec_prefix*)
>          am__strip_prefix=3D`echo "$am_py_exec_prefix" | sed 's|.|.|g'`
> -@@ -200,7 +187,7 @@ sys.stdout.write(sitedir)"`
> +@@ -203,7 +190,7 @@ sys.stdout.write(sitedir)"`
>          case $am_py_exec_prefix in
>            /usr|/System*) ;;
>            *)
> @@ -86,6 +86,3 @@ index 5b2c695..ed19261 100644
>            ;;
>          esac
>          ;;
> ---
> -2.8.1
> -
> diff --git a/meta/recipes-devtools/automake/automake_1.15.1.bb b/meta/rec=
ipes-devtools/automake/automake_1.16.1.bb
> similarity index 89%
> rename from meta/recipes-devtools/automake/automake_1.15.1.bb
> rename to meta/recipes-devtools/automake/automake_1.16.1.bb
> index 4f9b616..c64ee44 100644
> --- a/meta/recipes-devtools/automake/automake_1.15.1.bb
> +++ b/meta/recipes-devtools/automake/automake_1.16.1.bb
> @@ -27,8 +27,8 @@ SRC_URI +=3D "file://python-libdir.patch \
>              file://0001-automake-Add-default-libtool_tag-to-cppasm.patch=
 \
>              "
>
> -SRC_URI[md5sum] =3D "95df3f2d6eb8f81e70b8cb63a93c8853"
> -SRC_URI[sha256sum] =3D "988e32527abe052307d21c8ca000aa238b914df363a617e3=
8f4fb89f5abf6260"
> +SRC_URI[md5sum] =3D "83cc2463a4080efd46a72ba2c9f6b8f5"
> +SRC_URI[sha256sum] =3D "608a97523f97db32f1f5d5615c98ca69326ced2054c9f82e=
65bade7fc4c9dea8"
>
>  PERL =3D "${USRBINPATH}/perl"
>  PERL_class-native =3D "${USRBINPATH}/env perl"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

