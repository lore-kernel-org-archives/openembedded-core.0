Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 24852747F9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 18:35:37 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r191so4869343wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 11:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ksmr3YPR9IfzrzkQfauV+fO/0UPbhkvS13p2jmNd2cM=;
	b=fmnObmAH7g2BHt/2+yXZ9yxg5F70vUfXyrqEV1ES3YD1cDg/QBiW0pPJRjNVdRdSBb
	0PflUOiZYlEBEQBAP4F4oJDHJ76wvKKxLHTS4rqUe4ZYJEslo6E0zqYJJ2MSNr3lfuBq
	TKWf+t1BunFmyPrwCmeT99Z8MSpqdG4Z7D+Em7A4b1PyLJ86I5C/zz54VM5TaLcvaoHE
	XoISAK+X0SqfLvIHfKy5b9CydMizEhg82HBrGL6yt18FwOw1A2yjYtQbsKXg6qbWHCxG
	v63v7j2S5P7EJb5khGggjtQmBr6NFn/YPCKuYmiSpdcyTT4Cqxe32D/xzaNRJICvpIek
	H0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ksmr3YPR9IfzrzkQfauV+fO/0UPbhkvS13p2jmNd2cM=;
	b=KuJ1Dyeb5jVDdQU4lgpW10K55bNx20ypgLQQZHJtEJTAFLgr8yhkxowV0ydwQTKSrq
	rCs0mRrco6RIge16NZ62FUKYJr9QozaICZUpZUAt4HPMGA7Q9n+SZCUqbqltNjI+QPj0
	Y2tq3oYVFT4ucV9CWwvZ8x2tLkwvTK08w1zrpSMXDZqHywngzlkdSQjqBYprAQOucyJf
	+SQ7KFGFja06bVIaVhNKt4YLgxipGdWLAP322xxPGkgEl9RNxpUcjCTlFp3HkLQPgcLG
	i3j9n97eglobAi0EL56boa00WwKqJq+K5SKJ8nm/2mfxWt7qdxyH79KObdHy+a1kDarJ
	3olg==
X-Gm-Message-State: ALQs6tCcLwD9naa6x5RlHFrkPGk2eS36ZEDPJVF0NszdBkQYmYmEfWl9
	sDnF5nX4QeD6ne9N/ILHPNLG0YKOr2MH+8JQT3U=
X-Google-Smtp-Source: AIpwx48z5jAzAb08nMmDd/KkfZIMjqxGqCzBO1mZqdMV7o25uyUryJvMqC8LbvFp6Qc+rERvAOduzZ6Ru45vc/UH0gI=
X-Received: by 10.28.15.15 with SMTP id 15mr2445299wmp.60.1522780538469; Tue,
	03 Apr 2018 11:35:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Tue, 3 Apr 2018 11:35:37 -0700 (PDT)
In-Reply-To: <4ead7c624b44292b85b21d82a731e1af0378d819.1522399417.git.hongxu.jia@windriver.com>
References: <cover.1522399417.git.hongxu.jia@windriver.com>
	<4ead7c624b44292b85b21d82a731e1af0378d819.1522399417.git.hongxu.jia@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Apr 2018 20:35:37 +0200
Message-ID: <CA+chaQcySp4rBQaSHJ1NRFQa05uKZkP6QOuSnDH0BYuCOaEHzA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 4/7] libgpg-error: 1.27 -> 1.28
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
X-List-Received-Date: Tue, 03 Apr 2018 18:35:38 -0000
Content-Type: multipart/alternative; boundary="001a1145aa221102000568f5f9e1"

--001a1145aa221102000568f5f9e1
Content-Type: text/plain; charset="UTF-8"

This seems to cause:

| ../../libgpg-error-1.28/src/logging.c: In function '_gpgrt_log_printhex':
| ../../libgpg-error-1.28/src/logging.c:1153:49: error: incompatible type
for argument 4 of '_gpgrt_logv_printhex'
|      _gpgrt_logv_printhex (buffer, length, NULL, NULL);
|                                                  ^~~~
| ../../libgpg-error-1.28/src/logging.c:1097:1: note: expected 'va_list
{aka __va_list}' but argument is of type 'void *'
|  _gpgrt_logv_printhex (const void *buffer, size_t length,
|  ^~~~~~~~~~~~~~~~~~~~
| make[3]: *** [libgpg_error_la-logging.lo] Error 1

which looks the same as:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=893370


On Fri, Mar 30, 2018 at 10:52 AM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> - Rebase pkgconfig.patch
>
> License-Update: copyright years
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../libgpg-error/libgpg-error/pkgconfig.patch      | 67
> +++++++++++++---------
>  .../{libgpg-error_1.27.bb => libgpg-error_1.28.bb} |  6 +-
>  2 files changed, 44 insertions(+), 29 deletions(-)
>  rename meta/recipes-support/libgpg-error/{libgpg-error_1.27.bb =>
> libgpg-error_1.28.bb} (88%)
>
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
> b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
> index 9ffeedb..3066613 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
> +++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
> @@ -1,15 +1,26 @@
> -
> -#
> -# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
> -#
> +From ec309e20b5a27d42a5fb915c328d61e924ab5f19 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 29 Mar 2018 15:12:17 +0800
> +Subject: [PATCH] support pkgconfig
>
>  Upstream-Status: Pending
>
> -Index: libgpg-error-1.17/configure.ac
> -===================================================================
> ---- libgpg-error-1.17.orig/configure.ac
> -+++ libgpg-error-1.17/configure.ac
> -@@ -529,6 +529,7 @@ AC_CONFIG_FILES([src/Makefile tests/Make
> +Rebase to 1.28
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + configure.ac        |  1 +
> + src/Makefile.am     |  4 ++-
> + src/gpg-error.m4    | 71 +++---------------------------
> -----------------------
> + src/gpg-error.pc.in | 11 +++++++++
> + 4 files changed, 18 insertions(+), 69 deletions(-)
> + create mode 100644 src/gpg-error.pc.in
> +
> +diff --git a/configure.ac b/configure.ac
> +index aca9300..f7794e9 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -621,6 +621,7 @@ AC_CONFIG_FILES([src/Makefile tests/Makefile])
>   AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpg-error.asd])
>   AC_CONFIG_FILES([src/versioninfo.rc src/gpg-error.w32-manifest])
>   AC_CONFIG_FILES([src/gpg-error-config], [chmod +x src/gpg-error-config])
> @@ -17,33 +28,33 @@ Index: libgpg-error-1.17/configure.ac
>
>   AC_OUTPUT
>
> -Index: libgpg-error-1.17/src/Makefile.am
> -===================================================================
> ---- libgpg-error-1.17.orig/src/Makefile.am
> -+++ libgpg-error-1.17/src/Makefile.am
> -@@ -75,6 +75,8 @@ nodist_include_HEADERS = gpg-error.h
> - bin_SCRIPTS = gpg-error-config
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 268c2ab..95f8459 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -87,6 +87,8 @@ bin_SCRIPTS = gpg-error-config
> + nodist_bin_SCRIPTS = gpgrt-config
>   m4datadir = $(datadir)/aclocal
> - m4data_DATA = gpg-error.m4
> + m4data_DATA = gpg-error.m4 gpgrt.m4
>  +pkgconfigdir = $(libdir)/pkgconfig
>  +pkgconfig_DATA = gpg-error.pc
>
>   EXTRA_DIST = mkstrtable.awk err-sources.h.in err-codes.h.in \
>         mkerrnos.awk errnos.in README \
> -@@ -82,7 +84,7 @@ EXTRA_DIST = mkstrtable.awk err-sources.
> +@@ -94,7 +96,7 @@ EXTRA_DIST = mkstrtable.awk err-sources.h.in
> err-codes.h.in \
>         mkheader.c gpg-error.h.in mkw32errmap.c w32-add.h w32ce-add.h \
> -       err-sources.h err-codes.h gpg-error-config.in gpg-error.m4 \
> +       err-sources.h err-codes.h gpg-error-config.in gpg-error.m4
> gpgrt.m4 \
>         gpg-error.vers gpg-error.def.in \
>  -        versioninfo.rc.in gpg-error.w32-manifest.in \
>  +        versioninfo.rc.in gpg-error.w32-manifest.in gpg-error.pc \
>         $(lock_obj_pub)
>
>   BUILT_SOURCES = err-sources.h err-codes.h code-to-errno.h
> code-from-errno.h \
> -Index: libgpg-error-1.17/src/gpg-error.m4
> -===================================================================
> ---- libgpg-error-1.17.orig/src/gpg-error.m4
> -+++ libgpg-error-1.17/src/gpg-error.m4
> -@@ -26,73 +26,13 @@ dnl is added to the gpg_config_script_wa
> +diff --git a/src/gpg-error.m4 b/src/gpg-error.m4
> +index 60c88d8..2ef7e3e 100644
> +--- a/src/gpg-error.m4
> ++++ b/src/gpg-error.m4
> +@@ -26,73 +26,13 @@ dnl is added to the gpg_config_script_warn variable.
>   dnl
>   AC_DEFUN([AM_PATH_GPG_ERROR],
>   [ AC_REQUIRE([AC_CANONICAL_HOST])
> @@ -132,10 +143,11 @@ Index: libgpg-error-1.17/src/gpg-error.m4
>       ifelse([$3], , :, [$3])
>     fi
>     AC_SUBST(GPG_ERROR_CFLAGS)
> -Index: libgpg-error-1.17/src/gpg-error.pc.in
> -===================================================================
> +diff --git a/src/gpg-error.pc.in b/src/gpg-error.pc.in
> +new file mode 100644
> +index 0000000..bc0b174
>  --- /dev/null
> -+++ libgpg-error-1.17/src/gpg-error.pc.in
> ++++ b/src/gpg-error.pc.in
>  @@ -0,0 +1,11 @@
>  +prefix=@prefix@
>  +exec_prefix=@exec_prefix@
> @@ -148,3 +160,6 @@ Index: libgpg-error-1.17/src/gpg-error.pc.in
>  +Version: @VERSION@
>  +Libs: -L${libdir} -lgpg-error
>  +Cflags: -I${includedir}
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
> b/meta/recipes-support/libgpg-error/libgpg-error_1.28.bb
> similarity index 88%
> rename from meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
> rename to meta/recipes-support/libgpg-error/libgpg-error_1.28.bb
> index b74f079..2be297d 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.28.bb
> @@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
>  LICENSE = "GPLv2+ & LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                      file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1
> \
> -                    file://src/gpg-error.h.in;endline=23;md5=
> beae1e44d8d5c265d194760276033a7c \
> +                    file://src/gpg-error.h.in;endline=23;md5=
> fc7423b56d5f7163a9a2acf9fe2f8d6b \
>                      file://src/init.c;endline=20;md5=
> 872b2389fe9bae7ffb80d2b91225afbc"
>
>
> @@ -16,8 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2
> \
>             file://pkgconfig.patch \
>           "
>
> -SRC_URI[md5sum] = "5217ef3e76a7275a2a3b569a12ddc989"
> -SRC_URI[sha256sum] = "4f93aac6fecb7da2b92871bb9ee330
> 32be6a87b174f54abf8ddf0911a22d29d2"
> +SRC_URI[md5sum] = "2b072f6194eb22d48cd4c7c77e59b5af"
> +SRC_URI[sha256sum] = "3edb957744905412f30de3e25da186
> 82cbe509541e18cd3b8f9df695a075da49"
>
>  BINCONFIG = "${bindir}/gpg-error-config"
>
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1145aa221102000568f5f9e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems to cause:<div><br></div><div><div>| ../../libgp=
g-error-1.28/src/logging.c: In function &#39;_gpgrt_log_printhex&#39;:</div=
><div>| ../../libgpg-error-1.28/src/logging.c:1153:49: error: incompatible =
type for argument 4 of &#39;_gpgrt_logv_printhex&#39;</div><div>|=C2=A0 =C2=
=A0 =C2=A0 _gpgrt_logv_printhex (buffer, length, NULL, NULL);</div><div>|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~</div><div>| ../../libgpg-error-1.28/src/lo=
gging.c:1097:1: note: expected &#39;va_list {aka __va_list}&#39; but argume=
nt is of type &#39;void *&#39;</div><div>|=C2=A0 _gpgrt_logv_printhex (cons=
t void *buffer, size_t length,</div><div>|=C2=A0 ^~~~~~~~~~~~~~~~~~~~</div>=
<div>| make[3]: *** [libgpg_error_la-logging.lo] Error 1</div></div><div><b=
r></div><div>which looks the same as:</div><div><a href=3D"https://bugs.deb=
ian.org/cgi-bin/bugreport.cgi?bug=3D893370">https://bugs.debian.org/cgi-bin=
/bugreport.cgi?bug=3D893370</a><br></div><div><br></div></div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Mar 30, 2018 at 10:52 =
AM, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mailto:hongxu.jia@windriver=
.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">- Rebase pkgconfig.patch<br>
<br>
License-Update: copyright years<br>
<span class=3D""><br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
---<br>
</span>=C2=A0.../libgpg-error/libgpg-error/<wbr>pkgconfig.patch=C2=A0 =C2=
=A0 =C2=A0 | 67 +++++++++++++---------<br>
=C2=A0.../{<a href=3D"http://libgpg-error_1.27.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libgpg-error_1.27.bb</a> =3D&gt; <a href=3D"http://libgpg-erro=
r_1.28.bb" rel=3D"noreferrer" target=3D"_blank">libgpg-error_1.28.bb</a>} |=
=C2=A0 6 +-<br>
=C2=A02 files changed, 44 insertions(+), 29 deletions(-)<br>
=C2=A0rename meta/recipes-support/libgpg-<wbr>error/{<a href=3D"http://libg=
pg-error_1.27.bb" rel=3D"noreferrer" target=3D"_blank">libgpg-error_1.27.bb=
</a> =3D&gt; <a href=3D"http://libgpg-error_1.28.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libgpg-error_1.28.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-support/libgpg-<wbr>error/libgpg-error/pkgconfig.=
<wbr>patch b/meta/recipes-support/libgpg-<wbr>error/libgpg-error/pkgconfig.=
<wbr>patch<br>
<span class=3D"">index 9ffeedb..3066613 100644<br>
--- a/meta/recipes-support/libgpg-<wbr>error/libgpg-error/pkgconfig.<wbr>pa=
tch<br>
</span>+++ b/meta/recipes-support/libgpg-<wbr>error/libgpg-error/pkgconfig.=
<wbr>patch<br>
<div><div class=3D"h5">@@ -1,15 +1,26 @@<br>
-<br>
-#<br>
-# Patch managed by <a href=3D"http://www.mn-logistik.de/unsupported/pxa250=
/patcher" rel=3D"noreferrer" target=3D"_blank">http://www.mn-logistik.de/<w=
br>unsupported/pxa250/patcher</a><br>
-#<br>
+From ec309e20b5a27d42a5fb915c328d61<wbr>e924ab5f19 Mon Sep 17 00:00:00 200=
1<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
+Date: Thu, 29 Mar 2018 15:12:17 +0800<br>
+Subject: [PATCH] support pkgconfig<br>
<br>
=C2=A0Upstream-Status: Pending<br>
<br>
-Index: libgpg-error-1.17/<a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libgpg-error-1.17.orig/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configu<wbr>re.ac</a><br>
-+++ libgpg-error-1.17/<a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
-@@ -529,6 +529,7 @@ AC_CONFIG_FILES([src/Makefile tests/Make<br>
+Rebase to 1.28<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
+ src/Makefile.am=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++-<br>
+ src/gpg-error.m4=C2=A0 =C2=A0 | 71 +++---------------------------<wbr>---=
--------------------<br>
+ src/<a href=3D"http://gpg-error.pc.in" rel=3D"noreferrer" target=3D"_blan=
k">gpg-error.pc.in</a> | 11 +++++++++<br>
+ 4 files changed, 18 insertions(+), 69 deletions(-)<br>
+ create mode 100644 src/<a href=3D"http://gpg-error.pc.in" rel=3D"noreferr=
er" target=3D"_blank">gpg-error.pc.in</a><br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index aca9300..f7794e9 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -621,6 +621,7 @@ AC_CONFIG_FILES([src/Makefile tests/Makefile])<br>
=C2=A0 AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpg-error.as=
d])<br>
=C2=A0 AC_CONFIG_FILES([src/<wbr>versioninfo.rc src/gpg-error.w32-manifest]=
)<br>
=C2=A0 AC_CONFIG_FILES([src/gpg-<wbr>error-config], [chmod +x src/gpg-error=
-config])<br>
@@ -17,33 +28,33 @@ Index: libgpg-error-1.17/<a href=3D"http://configure.ac=
" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
<br>
=C2=A0 AC_OUTPUT<br>
<br>
-Index: libgpg-error-1.17/src/<wbr>Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libgpg-error-1.17.orig/src/<wbr>Makefile.am<br>
-+++ libgpg-error-1.17/src/<wbr>Makefile.am<br>
-@@ -75,6 +75,8 @@ nodist_include_HEADERS =3D gpg-error.h<br>
- bin_SCRIPTS =3D gpg-error-config<br>
+diff --git a/src/Makefile.am b/src/Makefile.am<br>
+index 268c2ab..95f8459 100644<br>
+--- a/src/Makefile.am<br>
++++ b/src/Makefile.am<br>
+@@ -87,6 +87,8 @@ bin_SCRIPTS =3D gpg-error-config<br>
+ nodist_bin_SCRIPTS =3D gpgrt-config<br>
=C2=A0 m4datadir =3D $(datadir)/aclocal<br>
- m4data_DATA =3D gpg-error.m4<br>
+ m4data_DATA =3D gpg-error.m4 gpgrt.m4<br>
=C2=A0+pkgconfigdir =3D $(libdir)/pkgconfig<br>
=C2=A0+pkgconfig_DATA =3D gpg-error.pc<br>
<br>
=C2=A0 EXTRA_DIST =3D mkstrtable.awk <a href=3D"http://err-sources.h.in" re=
l=3D"noreferrer" target=3D"_blank">err-sources.h.in</a> <a href=3D"http://e=
rr-codes.h.in" rel=3D"noreferrer" target=3D"_blank">err-codes.h.in</a> \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkerrnos.awk <a href=3D"http://errnos.in" rel=
=3D"noreferrer" target=3D"_blank">errnos.in</a> README \<br>
-@@ -82,7 +84,7 @@ EXTRA_DIST =3D mkstrtable.awk err-sources.<br>
+@@ -94,7 +96,7 @@ EXTRA_DIST =3D mkstrtable.awk <a href=3D"http://err-sour=
ces.h.in" rel=3D"noreferrer" target=3D"_blank">err-sources.h.in</a> <a href=
=3D"http://err-codes.h.in" rel=3D"noreferrer" target=3D"_blank">err-codes.h=
.in</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkheader.c <a href=3D"http://gpg-error.h.in" re=
l=3D"noreferrer" target=3D"_blank">gpg-error.h.in</a> mkw32errmap.c w32-add=
.h w32ce-add.h \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err-sources.h err-codes.h <a href=3D"http://gpg=
-error-config.in" rel=3D"noreferrer" target=3D"_blank">gpg-error-config.in<=
/a> gpg-error.m4 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err-sources.h err-codes.h <a href=3D"http://gpg=
-error-config.in" rel=3D"noreferrer" target=3D"_blank">gpg-error-config.in<=
/a> gpg-error.m4 gpgrt.m4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpg-error.vers <a href=3D"http://gpg-error.def.=
in" rel=3D"noreferrer" target=3D"_blank">gpg-error.def.in</a> \<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://versioninfo.rc.in" rel=
=3D"noreferrer" target=3D"_blank">versioninfo.rc.in</a> <a href=3D"http://g=
pg-error.w32-manifest.in" rel=3D"noreferrer" target=3D"_blank">gpg-error.w3=
2-manifest.in</a> \<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://versioninfo.rc.in" rel=
=3D"noreferrer" target=3D"_blank">versioninfo.rc.in</a> <a href=3D"http://g=
pg-error.w32-manifest.in" rel=3D"noreferrer" target=3D"_blank">gpg-error.w3=
2-manifest.in</a> gpg-error.pc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(lock_obj_pub)<br>
<br>
=C2=A0 BUILT_SOURCES =3D err-sources.h err-codes.h code-to-errno.h code-fro=
m-errno.h \<br>
-Index: libgpg-error-1.17/src/gpg-<wbr>error.m4<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libgpg-error-1.17.orig/src/<wbr>gpg-error.m4<br>
-+++ libgpg-error-1.17/src/gpg-<wbr>error.m4<br>
-@@ -26,73 +26,13 @@ dnl is added to the gpg_config_script_wa<br>
+diff --git a/src/gpg-error.m4 b/src/gpg-error.m4<br>
+index 60c88d8..2ef7e3e 100644<br>
+--- a/src/gpg-error.m4<br>
++++ b/src/gpg-error.m4<br>
+@@ -26,73 +26,13 @@ dnl is added to the gpg_config_script_warn variable.<b=
r>
=C2=A0 dnl<br>
=C2=A0 AC_DEFUN([AM_PATH_GPG_ERROR],<br>
=C2=A0 [ AC_REQUIRE([AC_CANONICAL_HOST]<wbr>)<br>
@@ -132,10 +143,11 @@ Index: libgpg-error-1.17/src/gpg-<wbr>error.m4<br>
=C2=A0 =C2=A0 =C2=A0 ifelse([$3], , :, [$3])<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 AC_SUBST(GPG_ERROR_CFLAGS)<br>
-Index: libgpg-error-1.17/src/<a href=3D"http://gpg-error.pc.in" rel=3D"nor=
eferrer" target=3D"_blank">gpg-<wbr>error.pc.in</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+diff --git a/src/<a href=3D"http://gpg-error.pc.in" rel=3D"noreferrer" tar=
get=3D"_blank">gpg-error.pc.in</a> b/src/<a href=3D"http://gpg-error.pc.in"=
 rel=3D"noreferrer" target=3D"_blank">gpg-error.pc.in</a><br>
+new file mode 100644<br>
+index 0000000..bc0b174<br>
=C2=A0--- /dev/null<br>
-+++ libgpg-error-1.17/src/<a href=3D"http://gpg-error.pc.in" rel=3D"norefe=
rrer" target=3D"_blank">gpg-<wbr>error.pc.in</a><br>
++++ b/src/<a href=3D"http://gpg-error.pc.in" rel=3D"noreferrer" target=3D"=
_blank">gpg-error.pc.in</a><br>
=C2=A0@@ -0,0 +1,11 @@<br>
=C2=A0+prefix=3D@prefix@<br>
=C2=A0+exec_prefix=3D@exec_prefix@<br>
@@ -148,3 +160,6 @@ Index: libgpg-error-1.17/src/<a href=3D"http://gpg-erro=
r.pc.in" rel=3D"noreferrer" target=3D"_blank">gpg-<wbr>error.pc.in</a><br>
=C2=A0+Version: @VERSION@<br>
=C2=A0+Libs: -L${libdir} -lgpg-error<br>
=C2=A0+Cflags: -I${includedir}<br>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-support/libgpg-<wbr>error/<a href=3D"http://libgp=
g-error_1.27.bb" rel=3D"noreferrer" target=3D"_blank">libgpg-error_1.27.bb<=
/a> b/meta/recipes-support/libgpg-<wbr>error/<a href=3D"http://libgpg-error=
_1.28.bb" rel=3D"noreferrer" target=3D"_blank">libgpg-error_1.28.bb</a><br>
</div></div>similarity index 88%<br>
<span class=3D"">rename from meta/recipes-support/libgpg-<wbr>error/<a href=
=3D"http://libgpg-error_1.27.bb" rel=3D"noreferrer" target=3D"_blank">libgp=
g-error_1.27.bb</a><br>
rename to meta/recipes-support/libgpg-<wbr>error/<a href=3D"http://libgpg-e=
rror_1.28.bb" rel=3D"noreferrer" target=3D"_blank">libgpg-error_1.28.bb</a>=
<br>
</span>index b74f079..2be297d 100644<br>
<span class=3D"">--- a/meta/recipes-support/libgpg-<wbr>error/<a href=3D"ht=
tp://libgpg-error_1.27.bb" rel=3D"noreferrer" target=3D"_blank">libgpg-erro=
r_1.27.bb</a><br>
+++ b/meta/recipes-support/libgpg-<wbr>error/<a href=3D"http://libgpg-error=
_1.28.bb" rel=3D"noreferrer" target=3D"_blank">libgpg-error_1.28.bb</a><br>
@@ -5,7 +5,7 @@ BUGTRACKER =3D &quot;<a href=3D"https://bugs.g10code.com/gn=
upg/index" rel=3D"noreferrer" target=3D"_blank">https://bugs.g10code.com/<w=
br>gnupg/index</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2+ &amp; LGPLv2.1+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>59530bdf33659b29=
e73d4adb9f9f65<wbr>52 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://COPYING.LIB;md5=3D<wbr>2d5025d4aa3495befef8f17206a5b0<wbr>a1 \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/<a href=3D"http://gpg-error.h.in" rel=3D"noreferrer" target=3D"_blan=
k">gpg-error.h.in</a>;<wbr>endline=3D23;md5=3D<wbr>beae1e44d8d5c265d1947602=
76033a<wbr>7c \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/<a href=3D"http://gpg-error.h.in" rel=3D"noreferrer" target=3D"_blan=
k">gpg-error.h.in</a>;<wbr>endline=3D23;md5=3D<wbr>fc7423b56d5f7163a9a2acf9=
fe2f8d<wbr>6b \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://src/init.c;endline=3D20;<wbr>md5=3D<wbr>872b2389fe9bae7ffb80d2b91=
225af<wbr>bc&quot;<br>
<br>
<br>
</span>@@ -16,8 +16,8 @@ SRC_URI =3D &quot;${GNUPG_MIRROR}/libgpg-error/<wb=
r>libgpg-error-${PV}.tar.bz2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://pkgconfig.patch \<br>
<div class=3D"HOEnZb"><div class=3D"h5">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>5217ef3e76a7275a2a3b569a12ddc9<wbr>89&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>4f93aac6fecb7da2b92871bb9ee330<wbr>32be6=
a87b174f54abf8ddf0911a22d<wbr>29d2&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>2b072f6194eb22d48cd4c7c77e59b5<wbr>af&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>3edb957744905412f30de3e25da186<wbr>82cbe=
509541e18cd3b8f9df695a075<wbr>da49&quot;<br>
<br>
=C2=A0BINCONFIG =3D &quot;${bindir}/gpg-error-config&quot;<br>
<br>
--<br>
2.8.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1145aa221102000568f5f9e1--
