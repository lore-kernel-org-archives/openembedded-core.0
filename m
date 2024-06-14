Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DFBC27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 22:57:51 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.176.1718405869743515960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jun 2024 15:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fLjT74Mt;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-24c9f892aeaso1305816fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 15:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718405869; x=1719010669; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIVMt5gxLKeprZWZtQJjY6ypO+c8fnrVFHYI1iVV3v0=;
        b=fLjT74MthLQ9jmeddvaJ0vk1uor0ZIHMDbGkIVLxcsXVlFwip6KsTypxnS8x6yTLSZ
         jLa0grsW5TOjChdGoC93LAVXKqlNsS3w/sOIgrYamVu3/FC286QHcSiTu4ZOo6T5ykl4
         HGsXv29qz0x2XpbxlO+k0CGZ97bN8XCnJy7OxMUjnYDQyno6oovr2wLfZURN7Bshjv4w
         gRxEqTHWWesAJ72D5PAYa2JbGgsC+7V2AnC3MZFEY5eF8u2PzoKcqTMwH1jWXOQqasNi
         C3VEc7s5wXlAu2YQbLr9DwynwDfpk7OlkWBOBx7EPecfBA6Tqk3Gh8Qoj2JGNPhW5JQp
         Kk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718405869; x=1719010669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIVMt5gxLKeprZWZtQJjY6ypO+c8fnrVFHYI1iVV3v0=;
        b=nZvWuvATmBzqudV0QIrC2ZBOrnZNxymRUZnBZEUgpXJTp438ZnqvInkAWrMl4Lw1/S
         bH2AVhCk8VcclLa9ddRX1HPyChGBsY6miybR/MHo9vZEb6ymHxN5TK724/ms7rYjXziP
         K+MGMTAixSEktEwLDkAiacTvyMB5JpC4CRFdfynCrTlHJ8Z8J51wXR3ykLcDiFizaTmm
         1W2+NGJzuW17Ing/zFBDovxvpSRsQ0eeDs9oypr9AxHIWk8b0OsOhFf03RuoB6c6krAY
         9P32DSmohwM/P2ApOFR2+Wz9rMklFuX2oXx0TmXgR1YNWL76kN22Xsh1StFeuNUONYrk
         iq/w==
X-Gm-Message-State: AOJu0YwQsmI2PKy2aM8Adc83rNKJhgm+AWeVxgWqnJh99Jgt90ETAF/Y
	8fecoZaU3tGGl2BZCGsrAtozuBD8EeyNl0Bf9Cr9VcXN7ehFEQbqCbE+h5mL4DBdAKS2A1ae3ps
	ZZwsljl4Hq3Aw+s747Y57IsA/FHgcPbze
X-Google-Smtp-Source: AGHT+IG5WtGbyep+MaKhGDUwY0kdkSIHDICR+4lMOafMlTk6MnfJreWRV0usY0952hQ2zggJ5eq80uBRzUC8C8fCfZk=
X-Received: by 2002:a05:6870:a552:b0:24c:a395:1957 with SMTP id
 586e51a60fabf-25842982dadmr5204571fac.26.1718405868768; Fri, 14 Jun 2024
 15:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240606122013.145187-1-Qi.Chen@windriver.com> <20240606122013.145187-2-Qi.Chen@windriver.com>
In-Reply-To: <20240606122013.145187-2-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jun 2024 15:57:22 -0700
Message-ID: <CAMKF1so7WataSnd5UAWVLD0mbjnSXeCseaEg_Qs95Kxuqu-4qA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] findutils: upgrade from 4.9.0 to 4.10.0
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 22:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200660

This fails ptests with qemux86_64/musl

bitbake core-image-ptest-findutils
results in

-find: invalid user name or UID argument to -user: '4294967296'
+find: invalid user name or UID argument to -user: =E2=80=984294967296=E2=
=80=99
--- exp
+++ err
@@ -1 +1 @@
-find: invalid group name or GID argument to -group: '4294967296'
+find: invalid group name or GID argument to -group: =E2=80=984294967296=E2=
=80=99
FAIL: tests/find/user-group-max.sh


On Thu, Jun 6, 2024 at 5:20=E2=80=AFAM Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> autoconf-2.73.patch is dropped as it's not needed any more.
>
> The run-ptest script is fixed. Instead copying function definitions
> from init.cfg file, we should just install init.cfg file in the ptest
> package. The coreutils-getlimits is added as a runtime dependency of
> the ptest package because the getlimits command is needed.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-extended/findutils/findutils.inc |  1 -
>  .../findutils/findutils/autoconf-2.73.patch   | 24 ----------------
>  .../findutils/findutils/run-ptest             | 28 -------------------
>  ...findutils_4.9.0.bb =3D> findutils_4.10.0.bb} |  6 ++--
>  4 files changed, 3 insertions(+), 56 deletions(-)
>  delete mode 100644 meta/recipes-extended/findutils/findutils/autoconf-2.=
73.patch
>  rename meta/recipes-extended/findutils/{findutils_4.9.0.bb =3D> findutil=
s_4.10.0.bb} (78%)
>
> diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes=
-extended/findutils/findutils.inc
> index 03cf2a8d72..ddcc05750b 100644
> --- a/meta/recipes-extended/findutils/findutils.inc
> +++ b/meta/recipes-extended/findutils/findutils.inc
> @@ -7,7 +7,6 @@ BUGTRACKER =3D "http://savannah.gnu.org/bugs/?group=3Dfin=
dutils"
>  SECTION =3D "console/utils"
>
>  SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.xz \
> -          file://autoconf-2.73.patch \
>            file://run-ptest \
>            "
>
> diff --git a/meta/recipes-extended/findutils/findutils/autoconf-2.73.patc=
h b/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
> deleted file mode 100644
> index 63728b5f91..0000000000
> --- a/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -The gnulib largefile macro needs updating to work with autoconf 2.73. Ra=
ther
> -than the full code:
> -
> -https://git.savannah.gnu.org/cgit/gnulib.git/commit/m4/largefile.m4?id=
=3Df91f633858cf132e50924224c50d6264a92caabb
> -
> -Just tweak the exiting code to work with 2.73. The next findutils upgrad=
e should
> -update to new gnulib
> -
> -Upstream-Status: Inappropriate
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> -Index: findutils-4.9.0/gl/m4/largefile.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- findutils-4.9.0.orig/gl/m4/largefile.m4
> -+++ findutils-4.9.0/gl/m4/largefile.m4
> -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> - # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69:
> - # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5=
,
> - # or configures them incorrectly in some cases.
> --m4_version_prereq([2.70], [], [
> -+m4_version_prereq([2.73], [], [
> -
> - # _AC_SYS_LARGEFILE_TEST_INCLUDES
> - # -------------------------------
> diff --git a/meta/recipes-extended/findutils/findutils/run-ptest b/meta/r=
ecipes-extended/findutils/findutils/run-ptest
> index ec71583c51..3dec117067 100644
> --- a/meta/recipes-extended/findutils/findutils/run-ptest
> +++ b/meta/recipes-extended/findutils/findutils/run-ptest
> @@ -10,34 +10,6 @@ export built_programs=3D"find xargs locate updatedb"
>  # this gets substituted by sed during build
>  export VERSION=3D"__run_ptest_version__"
>
> -# define missing functions for tests/init.sh
> -fu_path_prepend_ () {
> -       path_prepend_ $@
> -}
> -
> -print_ver_ () {
> -       :
> -}
> -
> -skip_if_root_ () {
> -       [ $(id -u) =3D 0 ] && exit 77;
> -}
> -
> -require_root_ () {
> -       [ $(id -u) =3D 0 ] || exit 77;
> -}
> -
> -expensive_ () {
> -       :
> -}
> -
> -export -f fu_path_prepend_
> -export -f print_ver_
> -export -f skip_if_root_
> -export -f require_root_
> -export -f expensive_
> -
> -
>  for f in tests/*/*.sh; do
>         bash $f ;
>         case $? in
> diff --git a/meta/recipes-extended/findutils/findutils_4.9.0.bb b/meta/re=
cipes-extended/findutils/findutils_4.10.0.bb
> similarity index 78%
> rename from meta/recipes-extended/findutils/findutils_4.9.0.bb
> rename to meta/recipes-extended/findutils/findutils_4.10.0.bb
> index 074817df27..57f77de16f 100644
> --- a/meta/recipes-extended/findutils/findutils_4.9.0.bb
> +++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af=
26da5dc08a4e440464"
>
>  DEPENDS =3D "bison-native"
>
> -SRC_URI[sha256sum] =3D "a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d5475=
73cb08065fd462fe"
> +SRC_URI[sha256sum] =3D "1387e0b67ff247d2abde998f90dfbf70c1491391a59ddfec=
b8ae698789f0a4f5"
>
>  PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux"
>  # http://savannah.gnu.org/bugs/?27299
> @@ -15,13 +15,13 @@ CACHED_CONFIGUREVARS +=3D "gl_cv_func_wcwidth_works=
=3Dyes"
>  EXTRA_OECONF +=3D "ac_cv_path_SORT=3D${bindir}/sort"
>
>  # need od from coreutils for -t option
> -RDEPENDS:${PN}-ptest +=3D "bash sed grep coreutils"
> +RDEPENDS:${PN}-ptest +=3D "bash sed grep coreutils coreutils-getlimits"
>
>  do_install_ptest:class-target() {
>         mkdir -p ${D}${PTEST_PATH}/tests/
> +       cp ${S}/init.cfg ${D}${PTEST_PATH}
>         cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
>
>         # substitute value in run-ptest with actual version
>         sed -i -e 's/__run_ptest_version__/${PV}/' ${D}${PTEST_PATH}/run-=
ptest
> -
>  }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200399): https://lists.openembedded.org/g/openembedde=
d-core/message/200399
> Mute This Topic: https://lists.openembedded.org/mt/106521747/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

