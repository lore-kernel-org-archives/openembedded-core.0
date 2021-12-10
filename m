Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7644FC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 15:17:38 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.8631.1639149457516878090
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xrr21rmL;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id f20so8663005qtb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8HJpcxONuV9V7gxHY8QiHIYIV2HDA779GYrn9PQg+4A=;
        b=Xrr21rmL34oEgr88nF8Rmmfhlmlyxi5mzGdIFcbxw0vW0k4EHlOYzuRzZ9BLI6HGES
         0zfBg7vKJc8t/gPUds04Xev3RV/bfXGAKywFYy5wKphuAPOBCzE/w1lhlJBwLlurjuMB
         ZQ0qqyuGOziXDuCu6AJETIx5/glhMHF35NPkvgqNYNpSp+uJCcGLIcJYfUbQ83tmosbK
         r2ErU/06XnD+uUoBtTVpiRwRVaR5xahTd430DTuPw2ApoGUq/fyUvrVpzTzBRkxXC4IJ
         yA4G53t3mLPcl2GPgNZqUFZf9R+7ZvnN0TCNRohLck+W++pzIfHyACP/mYt8xXwWbGGh
         GZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8HJpcxONuV9V7gxHY8QiHIYIV2HDA779GYrn9PQg+4A=;
        b=N9GvF6anIe43UBITbM3J6Fu6iNrK0siY+IVbd9leBKEgCR6AtVWvj9o4nESJVW8JF5
         uDy7hpIfoFzoXSyETcapigUW8ewwQ22cvRegStFvpXiJN+9XiExxOEUjakKu7Cz9skR/
         mX/il+uqFSld0x/hsXg1Xtoa8eakPbFHO5y861oQZyWNFMcFMHSBs2kp9/8Fy2RuuZze
         ohzIC/4TChsWrvLRx7nyZ8EElVu7k72/wwunETxdKqXajZj6+2qeLOYlknGmAI1fV1tA
         pULnqWKg12WcCMWCqJGb7PeDm7Sktkvjvf1vCMcKjItid2uFOnjW2w1cTWJaI1DIW9wu
         HG9w==
X-Gm-Message-State: AOAM533rQVYICdGwhyxnQ4DZ1QAWsoQV6tWkFLWirSEfYHXC+kOPma3L
	UWhN3DgPyI6ZaEX6x1aZZRcKCde/T1emGajOb0xNcXAdUpg=
X-Google-Smtp-Source: 
 ABdhPJznTc97dXD/Nl70KipbL/jJYIpiYVJuPTsPFufvrkYFwatIqqv1x7QDlzoCaENZnjwFd8uHvIL784eJajZK17U=
X-Received: by 2002:ac8:7f4d:: with SMTP id
 g13mr27707620qtk.215.1639149456478;
 Fri, 10 Dec 2021 07:17:36 -0800 (PST)
MIME-Version: 1.0
References: <20211210142242.2698587-1-ross.burton@arm.com>
In-Reply-To: <20211210142242.2698587-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Dec 2021 07:17:25 -0800
Message-ID: 
 <CAMKF1sq5CJqTmkQS6dZcqHaxsGO5OgD0vUFRci13hnvb-aQmfA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 01/10] libtool: don't prefix the installed
 binary
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000016554e05d2cc390c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 15:17:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159544

--00000000000016554e05d2cc390c
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 10, 2021 at 6:22 AM Ross Burton <ross@burtonini.com> wrote:

> Typically libtool installs the binary to 'libtool' in the source tree,
> but we've got patches to rename this to ${host_sys}-libtool. As this
> isn't standard any upstream that don't respect the LIBTOOL variable need
> to be told explicitly where libtool is, which is a long-term maintenance
> burden for us on top of the initial libtool patches.
>
> The reasoning for this renaming appears to stem from the design to be
> sure that we're using our new/patched libtool and not the host's binary.
> However, now that we have HOSTTOOLS, there's no way to run the host
> libtool so this argument is moot.
>
> This patch removes the libtool renaming, follow-up patches remove the
> required modifications from the rest of the recipes.
>

Does it mean that it can now run original libtool script accidentally which
is pregenerated part of package which may be not what we want


> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../libtool/libtool-cross_2.4.6.bb            | 11 ++-
>  .../libtool/libtool-native_2.4.6.bb           |  4 +-
>  .../libtool/libtool/prefix.patch              | 98 -------------------
>  .../libtool/nativesdk-libtool_2.4.6.bb        |  6 +-
>  4 files changed, 11 insertions(+), 108 deletions(-)
>  delete mode 100644 meta/recipes-devtools/libtool/libtool/prefix.patch
>
> diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
> b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
> index 4a43867b3ec..4448373afc4 100644
> --- a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
> +++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
> @@ -1,7 +1,7 @@
>  require libtool-${PV}.inc
>
>  PACKAGES = ""
> -SRC_URI += "file://prefix.patch"
> +#SRC_URI += "file://prefix.patch"
>  SRC_URI += "file://fixinstall.patch"
>
>  datadir = "${STAGING_DIR_TARGET}${target_datadir}"
> @@ -22,15 +22,16 @@ do_configure:prepend () {
>  # Find references to LTCC="ccache xxx-gcc" and CC="ccache xxx-gcc"
>  #
>  do_install () {
> +       ln -s false ${D}
>         install -d ${D}${bindir_crossscripts}/
> -       install -m 0755 ${HOST_SYS}-libtool
> ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
> +       install -m 0755 libtool ${D}${bindir_crossscripts}/libtool
>         sed -e 's@^\(predep_objects="\).*@\1"@' \
>             -e 's@^\(postdep_objects="\).*@\1"@' \
>             -e 's@^CC="ccache.@CC="@' \
>             -e 's@^LTCC="ccache.@LTCC="@' \
> -           -i ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
> -       sed -i '/^archive_cmds=/s/\-nostdlib//g'
> ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
> -       sed -i '/^archive_expsym_cmds=/s/\-nostdlib//g'
> ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
> +           -i ${D}${bindir_crossscripts}/libtool
> +       sed -i '/^archive_cmds=/s/\-nostdlib//g'
> ${D}${bindir_crossscripts}/libtool
> +       sed -i '/^archive_expsym_cmds=/s/\-nostdlib//g'
> ${D}${bindir_crossscripts}/libtool
>         GREP='/bin/grep' SED='sed' ${S}/build-aux/inline-source libtoolize
> > ${D}${bindir_crossscripts}/libtoolize
>         chmod 0755 ${D}${bindir_crossscripts}/libtoolize
>         install -d ${D}${target_datadir}/libtool/build-aux/
> diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
> b/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
> index 3b20ce3e69f..c68527f2609 100644
> --- a/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
> +++ b/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
> @@ -2,7 +2,7 @@ require libtool-${PV}.inc
>
>  DEPENDS = ""
>
> -SRC_URI += "file://prefix.patch"
> +#SRC_URI += "file://prefix.patch"
>
>  inherit native
>
> @@ -18,5 +18,5 @@ do_configure:prepend () {
>  do_install () {
>         autotools_do_install
>         install -d ${D}${bindir}/
> -       install -m 0755 ${HOST_SYS}-libtool
> ${D}${bindir}/${HOST_SYS}-libtool
> +       install -m 0755 libtool ${D}${bindir}/libtool
>  }
> diff --git a/meta/recipes-devtools/libtool/libtool/prefix.patch
> b/meta/recipes-devtools/libtool/libtool/prefix.patch
> deleted file mode 100644
> index a73df2e4a7a..00000000000
> --- a/meta/recipes-devtools/libtool/libtool/prefix.patch
> +++ /dev/null
> @@ -1,98 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Renames "libtool" -> "${TARGET_PREFIX}libtool" which makes sure
> -it can't be confused with the host libtool.
> -
> -Originally by: RP
> -
> -Updated: Date: 2010/06/28
> -Nitin A Kamble <nitin.a.kamble@intel.com>
> -
> -It also adjusts libtool so that the header at the script is used for
> -script execution and not thevalue of $SHELL. This is because many
> -Makefiles change $SHELL so dash can get used to execute what is
> -otherwise configured as a bash shell script. Since we don't need to
> -execute scipts this way on any system I'm aware of us building upon,
> -the simplest fix is just to remove $SHELL.
> -
> -Updated: Date: 2011/11/09
> -RP
> -
> -Updated by: Robert Yang <liezhi.yang@windriver.com>
> -
> -diff --git a/Makefile.am b/Makefile.am
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -31,7 +31,7 @@ SUBDIRS                      = .
> - DIST_SUBDIRS          = $(SUBDIRS)
> - EXTRA_DIST            =
> -
> --BUILT_SOURCES         = libtool libtoolize
> -+BUILT_SOURCES         = $(host_alias)-libtool libtoolize
> -
> - CLEANFILES            =
> - MOSTLYCLEANFILES      =
> -@@ -67,7 +67,7 @@ build_scripts        =
> $(srcdir)/$(aux_dir)/announce-gen \
> -
> - EXTRA_DIST     += bootstrap bootstrap.conf $(build_scripts) cfg.mk
> maint.mk \
> -                 GNUmakefile
> --CLEANFILES     += libtool libtoolize
> -+CLEANFILES     += $(host_alias)-libtool libtoolize
> -
> - ## If a file is named several times below, and especially if it
> - ## is a distributed file created during Libtool bootstrap, we
> -@@ -276,7 +276,7 @@ configure_edit = $(bootstrap_edit) \
> -       -e 's|@srcdir\@|$(srcdir)|g'
> -
> - # The libtool distributor and the standalone libtool script.
> --bin_SCRIPTS = libtool
> -+bin_SCRIPTS = $(host_alias)-libtool
> -
> - libtoolize: $(libtoolize_in) $(config_status)
> -       $(AM_V_at)rm -f '$@'
> -@@ -287,7 +287,7 @@ libtoolize: $(libtoolize_in) $(config_status)
> - # We used to do this with a 'stamp-vcl' file, but non-gmake builds
> - # would rerun configure on every invocation, so now we manually
> - # check the version numbers from the build rule when necessary.
> --libtool: $(ltmain_sh) $(config_status) $(dotversion)
> -+$(host_alias)-libtool: $(ltmain_sh) $(config_status) $(dotversion)
> -       @$(rebuild); \
> -       if test -f '$@'; then \
> -         eval `'$(SED)' -n '/^package_revision=/p' '$@'`; \
> -@@ -731,12 +731,12 @@ TESTS_ENVIRONMENT = MAKE="$(MAKE)" CC="$(CC)"
> CFLAGS="$(CFLAGS)" \
> -
> - BUILDCHECK_ENVIRONMENT = _lt_pkgdatadir="$(abs_top_srcdir)" \
> -       LIBTOOLIZE="$(abs_top_builddir)/libtoolize" \
> --      LIBTOOL="$(abs_top_builddir)/libtool" \
> -+      LIBTOOL="$(abs_top_builddir)/$(host_alias)-libtool" \
> -       tst_aclocaldir="$(abs_top_srcdir)/m4"
> -
> - INSTALLCHECK_ENVIRONMENT = \
> -       LIBTOOLIZE="$(bindir)/`echo libtoolize |$(SED)
> '$(program_transform_name)'`" \
> --      LIBTOOL="$(bindir)/`echo libtool |$(SED)
> '$(program_transform_name)'`" \
> -+      LIBTOOL="$(bindir)/`echo $(host_alias)-libtool |$(SED)
> '$(program_transform_name)'`" \
> -       LTDLINCL="-I$(includedir)" \
> -       LIBLTDL="$(libdir)/libltdl.la" \
> -       tst_aclocaldir="$(aclocaldir)"
> -diff --git a/m4/libtool.m4 b/m4/libtool.m4
> ---- a/m4/libtool.m4
> -+++ b/m4/libtool.m4
> -@@ -86,7 +86,8 @@ _LT_SET_OPTIONS([$0], [$1])
> - LIBTOOL_DEPS=$ltmain
> -
> - # Always use our own libtool.
> --LIBTOOL='$(SHELL) $(top_builddir)/libtool'
> -+LIBTOOL='$(top_builddir)'
> -+LIBTOOL="$LIBTOOL/${host_alias}-libtool"
> - AC_SUBST(LIBTOOL)dnl
> -
> - _LT_SETUP
> -@@ -199,7 +200,7 @@ aix3*)
> - esac
> -
> - # Global variables:
> --ofile=libtool
> -+ofile=${host_alias}-libtool
> - can_build_shared=yes
> -
> - # All known linkers require a '.a' archive for static linking (except
> MSVC,
> diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb
> b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb
> index e3ad6721fdf..cede2092db0 100644
> --- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb
> +++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb
> @@ -2,7 +2,7 @@ require libtool-${PV}.inc
>
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/libtool:"
>
> -SRC_URI += "file://prefix.patch"
> +#SRC_URI += "file://prefix.patch"
>  SRC_URI += "file://fixinstall.patch"
>
>  inherit nativesdk
> @@ -20,12 +20,12 @@ do_configure:prepend () {
>  do_install () {
>         autotools_do_install
>         install -d ${D}${bindir}/
> -       install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/
> +       install -m 0755 libtool ${D}${bindir}/
>  }
>
>  SYSROOT_PREPROCESS_FUNCS += "libtoolnativesdk_sysroot_preprocess"
>
>  libtoolnativesdk_sysroot_preprocess () {
>         install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> -       install -m 755 ${D}${bindir}/${HOST_SYS}-libtool
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/${HOST_SYS}-libtool
> +       install -m 755 ${D}${bindir}/libtool
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/libtool
>  }
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159530):
> https://lists.openembedded.org/g/openembedded-core/message/159530
> Mute This Topic: https://lists.openembedded.org/mt/87636630/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000016554e05d2cc390c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Dec 10, 2021 at 6:22 AM Ross Burton &lt;<a href=3D"=
mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Typically libtool installs the binary to &#39;lib=
tool&#39; in the source tree,<br>
but we&#39;ve got patches to rename this to ${host_sys}-libtool. As this<br=
>
isn&#39;t standard any upstream that don&#39;t respect the LIBTOOL variable=
 need<br>
to be told explicitly where libtool is, which is a long-term maintenance<br=
>
burden for us on top of the initial libtool patches.<br>
<br>
The reasoning for this renaming appears to stem from the design to be<br>
sure that we&#39;re using our new/patched libtool and not the host&#39;s bi=
nary.<br>
However, now that we have HOSTTOOLS, there&#39;s no way to run the host<br>
libtool so this argument is moot.<br>
<br>
This patch removes the libtool renaming, follow-up patches remove the<br>
required modifications from the rest of the recipes.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Does it mean tha=
t it can now run original libtool script accidentally which is pregenerated=
 part of package which may be not what we want=C2=A0</div><div dir=3D"auto"=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0.../libtool/<a href=3D"http://libtool-cross_2.4.6.bb" rel=3D"noreferr=
er" target=3D"_blank">libtool-cross_2.4.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 11 ++-<br>
=C2=A0.../libtool/<a href=3D"http://libtool-native_2.4.6.bb" rel=3D"norefer=
rer" target=3D"_blank">libtool-native_2.4.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A0.../libtool/libtool/prefix.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 98 -------------------<br>
=C2=A0.../libtool/<a href=3D"http://nativesdk-libtool_2.4.6.bb" rel=3D"nore=
ferrer" target=3D"_blank">nativesdk-libtool_2.4.6.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 6 +-<br>
=C2=A04 files changed, 11 insertions(+), 108 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/libtool/libtool/prefix.patch=
<br>
<br>
diff --git a/meta/recipes-devtools/libtool/<a href=3D"http://libtool-cross_=
2.4.6.bb" rel=3D"noreferrer" target=3D"_blank">libtool-cross_2.4.6.bb</a> b=
/meta/recipes-devtools/libtool/<a href=3D"http://libtool-cross_2.4.6.bb" re=
l=3D"noreferrer" target=3D"_blank">libtool-cross_2.4.6.bb</a><br>
index 4a43867b3ec..4448373afc4 100644<br>
--- a/meta/recipes-devtools/libtool/<a href=3D"http://libtool-cross_2.4.6.b=
b" rel=3D"noreferrer" target=3D"_blank">libtool-cross_2.4.6.bb</a><br>
+++ b/meta/recipes-devtools/libtool/<a href=3D"http://libtool-cross_2.4.6.b=
b" rel=3D"noreferrer" target=3D"_blank">libtool-cross_2.4.6.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0require libtool-${PV}.inc<br>
<br>
=C2=A0PACKAGES =3D &quot;&quot;<br>
-SRC_URI +=3D &quot;file://prefix.patch&quot;<br>
+#SRC_URI +=3D &quot;file://prefix.patch&quot;<br>
=C2=A0SRC_URI +=3D &quot;file://fixinstall.patch&quot;<br>
<br>
=C2=A0datadir =3D &quot;${STAGING_DIR_TARGET}${target_datadir}&quot;<br>
@@ -22,15 +22,16 @@ do_configure:prepend () {<br>
=C2=A0# Find references to LTCC=3D&quot;ccache xxx-gcc&quot; and CC=3D&quot=
;ccache xxx-gcc&quot;<br>
=C2=A0#<br>
=C2=A0do_install () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s false ${D}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir_crossscripts}/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${HOST_SYS}-libtool ${D}${bindi=
r_crossscripts}/${HOST_SYS}-libtool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 libtool ${D}${bindir_crossscrip=
ts}/libtool<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &#39;s@^\(predep_objects=3D&quot;\).*@\1=
&quot;@&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@^\(postdep_objects=3D&q=
uot;\).*@\1&quot;@&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@^CC=3D&quot;ccache.@CC=
=3D&quot;@&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@^LTCC=3D&quot;ccache.@L=
TCC=3D&quot;@&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i ${D}${bindir_crossscripts}/${H=
OST_SYS}-libtool<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;/^archive_cmds=3D/s/\-nostdlib//g&#=
39; ${D}${bindir_crossscripts}/${HOST_SYS}-libtool<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;/^archive_expsym_cmds=3D/s/\-nostdl=
ib//g&#39; ${D}${bindir_crossscripts}/${HOST_SYS}-libtool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i ${D}${bindir_crossscripts}/lib=
tool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;/^archive_cmds=3D/s/\-nostdlib//g&#=
39; ${D}${bindir_crossscripts}/libtool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;/^archive_expsym_cmds=3D/s/\-nostdl=
ib//g&#39; ${D}${bindir_crossscripts}/libtool<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GREP=3D&#39;/bin/grep&#39; SED=3D&#39;sed&#39; =
${S}/build-aux/inline-source libtoolize &gt; ${D}${bindir_crossscripts}/lib=
toolize<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod 0755 ${D}${bindir_crossscripts}/libtooliz=
e<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${target_datadir}/libtool/build-=
aux/<br>
diff --git a/meta/recipes-devtools/libtool/<a href=3D"http://libtool-native=
_2.4.6.bb" rel=3D"noreferrer" target=3D"_blank">libtool-native_2.4.6.bb</a>=
 b/meta/recipes-devtools/libtool/<a href=3D"http://libtool-native_2.4.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">libtool-native_2.4.6.bb</a><br>
index 3b20ce3e69f..c68527f2609 100644<br>
--- a/meta/recipes-devtools/libtool/<a href=3D"http://libtool-native_2.4.6.=
bb" rel=3D"noreferrer" target=3D"_blank">libtool-native_2.4.6.bb</a><br>
+++ b/meta/recipes-devtools/libtool/<a href=3D"http://libtool-native_2.4.6.=
bb" rel=3D"noreferrer" target=3D"_blank">libtool-native_2.4.6.bb</a><br>
@@ -2,7 +2,7 @@ require libtool-${PV}.inc<br>
<br>
=C2=A0DEPENDS =3D &quot;&quot;<br>
<br>
-SRC_URI +=3D &quot;file://prefix.patch&quot;<br>
+#SRC_URI +=3D &quot;file://prefix.patch&quot;<br>
<br>
=C2=A0inherit native<br>
<br>
@@ -18,5 +18,5 @@ do_configure:prepend () {<br>
=C2=A0do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 autotools_do_install<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${HOST_SYS}-libtool ${D}${bindi=
r}/${HOST_SYS}-libtool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 libtool ${D}${bindir}/libtool<b=
r>
=C2=A0}<br>
diff --git a/meta/recipes-devtools/libtool/libtool/prefix.patch b/meta/reci=
pes-devtools/libtool/libtool/prefix.patch<br>
deleted file mode 100644<br>
index a73df2e4a7a..00000000000<br>
--- a/meta/recipes-devtools/libtool/libtool/prefix.patch<br>
+++ /dev/null<br>
@@ -1,98 +0,0 @@<br>
-Upstream-Status: Inappropriate [embedded specific]<br>
-<br>
-Renames &quot;libtool&quot; -&gt; &quot;${TARGET_PREFIX}libtool&quot; whic=
h makes sure<br>
-it can&#39;t be confused with the host libtool.<br>
-<br>
-Originally by: RP<br>
-<br>
-Updated: Date: 2010/06/28<br>
-Nitin A Kamble &lt;<a href=3D"mailto:nitin.a.kamble@intel.com" target=3D"_=
blank">nitin.a.kamble@intel.com</a>&gt;<br>
-<br>
-It also adjusts libtool so that the header at the script is used for <br>
-script execution and not thevalue of $SHELL. This is because many <br>
-Makefiles change $SHELL so dash can get used to execute what is <br>
-otherwise configured as a bash shell script. Since we don&#39;t need to <b=
r>
-execute scipts this way on any system I&#39;m aware of us building upon, <=
br>
-the simplest fix is just to remove $SHELL.<br>
-<br>
-Updated: Date: 2011/11/09<br>
-RP<br>
-<br>
-Updated by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com" t=
arget=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
-<br>
-diff --git a/Makefile.am b/Makefile.am<br>
---- a/Makefile.am<br>
-+++ b/Makefile.am<br>
-@@ -31,7 +31,7 @@ SUBDIRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D .<br>
- DIST_SUBDIRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D $(SUBDIRS)<br>
- EXTRA_DIST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
- <br>
--BUILT_SOURCES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D libtool libtoolize<br>
-+BUILT_SOURCES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(host_alias)-libtool =
libtoolize<br>
- <br>
- CLEANFILES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
- MOSTLYCLEANFILES=C2=A0 =C2=A0 =C2=A0 =3D<br>
-@@ -67,7 +67,7 @@ build_scripts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D $(srcdir)/$=
(aux_dir)/announce-gen \<br>
- <br>
- EXTRA_DIST=C2=A0 =C2=A0 =C2=A0+=3D bootstrap bootstrap.conf $(build_scrip=
ts) <a href=3D"http://cfg.mk" rel=3D"noreferrer" target=3D"_blank">cfg.mk</=
a> <a href=3D"http://maint.mk" rel=3D"noreferrer" target=3D"_blank">maint.m=
k</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GNUmakefile<=
br>
--CLEANFILES=C2=A0 =C2=A0 =C2=A0+=3D libtool libtoolize<br>
-+CLEANFILES=C2=A0 =C2=A0 =C2=A0+=3D $(host_alias)-libtool libtoolize<br>
- <br>
- ## If a file is named several times below, and especially if it<br>
- ## is a distributed file created during Libtool bootstrap, we<br>
-@@ -276,7 +276,7 @@ configure_edit =3D $(bootstrap_edit) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|@srcdir\@|$(srcdir)|g&#39;<br>
- <br>
- # The libtool distributor and the standalone libtool script.<br>
--bin_SCRIPTS =3D libtool<br>
-+bin_SCRIPTS =3D $(host_alias)-libtool<br>
- <br>
- libtoolize: $(libtoolize_in) $(config_status)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AM_V_at)rm -f &#39;$@&#39;<br>
-@@ -287,7 +287,7 @@ libtoolize: $(libtoolize_in) $(config_status)<br>
- # We used to do this with a &#39;stamp-vcl&#39; file, but non-gmake build=
s<br>
- # would rerun configure on every invocation, so now we manually<br>
- # check the version numbers from the build rule when necessary.<br>
--libtool: $(ltmain_sh) $(config_status) $(dotversion)<br>
-+$(host_alias)-libtool: $(ltmain_sh) $(config_status) $(dotversion)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(rebuild); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test -f &#39;$@&#39;; then \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval `&#39;$(SED)&#39; -n &#39;/^package=
_revision=3D/p&#39; &#39;$@&#39;`; \<br>
-@@ -731,12 +731,12 @@ TESTS_ENVIRONMENT =3D MAKE=3D&quot;$(MAKE)&quot; CC=
=3D&quot;$(CC)&quot; CFLAGS=3D&quot;$(CFLAGS)&quot; \<br>
- <br>
- BUILDCHECK_ENVIRONMENT =3D _lt_pkgdatadir=3D&quot;$(abs_top_srcdir)&quot;=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LIBTOOLIZE=3D&quot;$(abs_top_builddir)/libtooli=
ze&quot; \<br>
--=C2=A0 =C2=A0 =C2=A0 LIBTOOL=3D&quot;$(abs_top_builddir)/libtool&quot; \<=
br>
-+=C2=A0 =C2=A0 =C2=A0 LIBTOOL=3D&quot;$(abs_top_builddir)/$(host_alias)-li=
btool&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_aclocaldir=3D&quot;$(abs_top_srcdir)/m4&quo=
t;<br>
- <br>
- INSTALLCHECK_ENVIRONMENT =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LIBTOOLIZE=3D&quot;$(bindir)/`echo libtoolize |=
$(SED) &#39;$(program_transform_name)&#39;`&quot; \<br>
--=C2=A0 =C2=A0 =C2=A0 LIBTOOL=3D&quot;$(bindir)/`echo libtool |$(SED) &#39=
;$(program_transform_name)&#39;`&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 LIBTOOL=3D&quot;$(bindir)/`echo $(host_alias)-libtoo=
l |$(SED) &#39;$(program_transform_name)&#39;`&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LTDLINCL=3D&quot;-I$(includedir)&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LIBLTDL=3D&quot;$(libdir)/<a href=3D"http://lib=
ltdl.la" rel=3D"noreferrer" target=3D"_blank">libltdl.la</a>&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_aclocaldir=3D&quot;$(aclocaldir)&quot;<br>
-diff --git a/m4/libtool.m4 b/m4/libtool.m4<br>
---- a/m4/libtool.m4<br>
-+++ b/m4/libtool.m4<br>
-@@ -86,7 +86,8 @@ _LT_SET_OPTIONS([$0], [$1])<br>
- LIBTOOL_DEPS=3D$ltmain<br>
- <br>
- # Always use our own libtool.<br>
--LIBTOOL=3D&#39;$(SHELL) $(top_builddir)/libtool&#39;<br>
-+LIBTOOL=3D&#39;$(top_builddir)&#39;<br>
-+LIBTOOL=3D&quot;$LIBTOOL/${host_alias}-libtool&quot;<br>
- AC_SUBST(LIBTOOL)dnl<br>
- <br>
- _LT_SETUP<br>
-@@ -199,7 +200,7 @@ aix3*)<br>
- esac<br>
- <br>
- # Global variables:<br>
--ofile=3Dlibtool<br>
-+ofile=3D${host_alias}-libtool<br>
- can_build_shared=3Dyes<br>
- <br>
- # All known linkers require a &#39;.a&#39; archive for static linking (ex=
cept MSVC,<br>
diff --git a/meta/recipes-devtools/libtool/<a href=3D"http://nativesdk-libt=
ool_2.4.6.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-libtool_2.4.6.=
bb</a> b/meta/recipes-devtools/libtool/<a href=3D"http://nativesdk-libtool_=
2.4.6.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-libtool_2.4.6.bb</=
a><br>
index e3ad6721fdf..cede2092db0 100644<br>
--- a/meta/recipes-devtools/libtool/<a href=3D"http://nativesdk-libtool_2.4=
.6.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-libtool_2.4.6.bb</a><=
br>
+++ b/meta/recipes-devtools/libtool/<a href=3D"http://nativesdk-libtool_2.4=
.6.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-libtool_2.4.6.bb</a><=
br>
@@ -2,7 +2,7 @@ require libtool-${PV}.inc<br>
<br>
=C2=A0FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/libtool:&quot;<br>
<br>
-SRC_URI +=3D &quot;file://prefix.patch&quot;<br>
+#SRC_URI +=3D &quot;file://prefix.patch&quot;<br>
=C2=A0SRC_URI +=3D &quot;file://fixinstall.patch&quot;<br>
<br>
=C2=A0inherit nativesdk<br>
@@ -20,12 +20,12 @@ do_configure:prepend () {<br>
=C2=A0do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 autotools_do_install<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${HOST_SYS}-libtool ${D}${bindi=
r}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 libtool ${D}${bindir}/<br>
=C2=A0}<br>
<br>
=C2=A0SYSROOT_PREPROCESS_FUNCS +=3D &quot;libtoolnativesdk_sysroot_preproce=
ss&quot;<br>
<br>
=C2=A0libtoolnativesdk_sysroot_preprocess () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${SYSROOT_DESTDIR}${bindir_crossscri=
pts}/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${D}${bindir}/${HOST_SYS}-libtoo=
l ${SYSROOT_DESTDIR}${bindir_crossscripts}/${HOST_SYS}-libtool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${D}${bindir}/libtool ${SYSROOT_=
DESTDIR}${bindir_crossscripts}/libtool<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159530): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159530" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159530</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87636630/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87636630/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000016554e05d2cc390c--

