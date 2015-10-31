Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 871F6759B4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Oct 2015 23:45:16 +0000 (UTC)
Received: by ioll68 with SMTP id l68so113955977iol.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Oct 2015 16:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cU2qRhz5SMGdNmoSznNPmg1LUsNZvjDkemq6JxPoLsA=;
	b=SMcOWR+tvou8gOeQ7sBeCzk1E2V2rVKiklRmfJ0ZzdTEVnYTQJuYnBvkYKc37WwZSG
	KaDVJXN3pqdwvPHmiqDXGl8L7bnm3W1MKuFuo3BYfWgdP3jSaQ1o8zgA5LAHZMclvoFq
	Gj4bti0U3xD/k/yev8Wr86eyB41oxkYUl8R40084+boZVBhloksAR4vEMGts2KZC4w9N
	ebNaiEH0+K4m6F61Fbap6u3wVk1b4J7SYsONWJ5Su0rII/7jeBic671Jzg4RvvHUoZhu
	E8Gnhe5ca5VH4siFgVBiZ1mh0J9aXMnZw5tR1DSWbag1NntgOyP2A5SYTv1usb+0cXKw
	VtjQ==
MIME-Version: 1.0
X-Received: by 10.107.137.66 with SMTP id l63mr16239900iod.112.1446335116855; 
	Sat, 31 Oct 2015 16:45:16 -0700 (PDT)
Received: by 10.107.38.133 with HTTP; Sat, 31 Oct 2015 16:45:16 -0700 (PDT)
Received: by 10.107.38.133 with HTTP; Sat, 31 Oct 2015 16:45:16 -0700 (PDT)
In-Reply-To: <1446329656-21330-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1446329656-21330-1-git-send-email-ed.bartosh@linux.intel.com>
Date: Sat, 31 Oct 2015 16:45:16 -0700
Message-ID: <CAMKF1srj2xDX_v4YYQ3q5XzO2UedvLLpxbhxYbExP2ufcEZx1A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus: upgrade to 1.10.2
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
X-List-Received-Date: Sat, 31 Oct 2015 23:45:22 -0000
Content-Type: multipart/alternative; boundary=001a113ed43cddd19405236f221b

--001a113ed43cddd19405236f221b
Content-Type: text/plain; charset=UTF-8

On Oct 31, 2015 3:15 PM, "Ed Bartosh" <ed.bartosh@linux.intel.com> wrote:
>
> This upgrade should fix qemu build failure on Ubuntu 1.5.10

Typo

> caused by system pulseaudio requirement for newer libdbus.
>
> qemu-native build with old dbus breaks on configure step
> with a lot of errors similar to this:
> libpulsecommon-6.0.so: undefined reference to
> `dbus_watch_get_enabled@LIBDBUS_1_3'

It's a Dbus ABI issue. It is better to have pulseaudio-native to solve the
underlying issue. Upgrade while fine in itself is really hiding the
underlying issue
>
> [YOCTO #8553]
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  .../{dbus-test_1.8.20.bb => dbus-test_1.10.2.bb}    |  4 ++--
>  meta/recipes-core/dbus/dbus.inc                     |  6 ++++--
>  meta/recipes-core/dbus/dbus/python-config.patch     | 21
++++++---------------
>  meta/recipes-core/dbus/dbus_1.10.2.bb               |  4 ++++
>  meta/recipes-core/dbus/dbus_1.8.20.bb               |  4 ----
>  5 files changed, 16 insertions(+), 23 deletions(-)
>  rename meta/recipes-core/dbus/{dbus-test_1.8.20.bb => dbus-test_1.10.2.bb}
(93%)
>  create mode 100644 meta/recipes-core/dbus/dbus_1.10.2.bb
>  delete mode 100644 meta/recipes-core/dbus/dbus_1.8.20.bb
>
> diff --git a/meta/recipes-core/dbus/dbus-test_1.8.20.bb
b/meta/recipes-core/dbus/dbus-test_1.10.2.bb
> similarity index 93%
> rename from meta/recipes-core/dbus/dbus-test_1.8.20.bb
> rename to meta/recipes-core/dbus/dbus-test_1.10.2.bb
> index 704070b..1e05f54 100644
> --- a/meta/recipes-core/dbus/dbus-test_1.8.20.bb
> +++ b/meta/recipes-core/dbus/dbus-test_1.10.2.bb
> @@ -18,8 +18,8 @@ SRC_URI = "
http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>             file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
>             "
>
> -SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
> -SRC_URI[sha256sum] =
"5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
> +SRC_URI[md5sum] = "2428919cc77b8d0028d65ee4d5dbef31"
> +SRC_URI[sha256sum] =
"aef3f49595df09b0824433ee993cda748ede93693a719a831562ae1616b6bb9e"
>
>  S="${WORKDIR}/dbus-${PV}"
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
> diff --git a/meta/recipes-core/dbus/dbus.inc
b/meta/recipes-core/dbus/dbus.inc
> index 3971081..bfb7bee 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -55,9 +55,12 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
>                 ${bindir}/dbus-monitor \
>                 ${bindir}/dbus-launch \
>                 ${bindir}/dbus-run-session \
> +               ${bindir}/dbus-test-tool \
> +               ${bindir}/dbus-update-activation-environment \
>                 ${libexecdir}/dbus* \
>                 ${sysconfdir} \
>                 ${localstatedir} \
> +               ${datadir}/dbus-1 \
>                 ${datadir}/dbus-1/services \
>                 ${datadir}/dbus-1/system-services \
>                 ${systemd_unitdir}/system/"
> @@ -83,8 +86,7 @@ EXTRA_OECONF = "--disable-tests \
>                  --disable-xml-docs \
>                  --disable-doxygen-docs \
>                  --disable-libaudit \
> -                --disable-systemd \
> -                --without-dbus-glib"
> +                --disable-systemd"
>
>  EXTRA_OECONF_append_class-native = " --disable-selinux"
>
> diff --git a/meta/recipes-core/dbus/dbus/python-config.patch
b/meta/recipes-core/dbus/dbus/python-config.patch
> index 2944002..c8393e5 100644
> --- a/meta/recipes-core/dbus/dbus/python-config.patch
> +++ b/meta/recipes-core/dbus/dbus/python-config.patch
> @@ -1,24 +1,15 @@
> -When building the dbus-ptest package, we have to enable python.  However
> -checking if the host-system python has the necessary library isn't
useful.
> -
> -Disable the python module check for cross compiling.
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> -
> ---- dbus-1.6.8/configure.ac.orig       2013-07-11 14:15:58.834554799
-0500
> -+++ dbus-1.6.8/configure.ac    2013-07-11 14:14:40.969554848 -0500
> -@@ -257,13 +257,6 @@
> +--- dbus-1.10.2/configure.ac.orig      2015-10-31 21:19:38.046633745
+0200
> ++++ dbus-1.10.2/configure.ac   2015-10-31 21:38:57.080231733 +0200
> +@@ -279,13 +279,6 @@
>     # full test coverage is required, Python is a hard dependency
> -   AC_MSG_NOTICE([Full test coverage (--enable-tests=yes) requires
Python, dbus-python, pygobject])
> +   AC_MSG_NOTICE([Full test coverage (--enable-tests=yes) requires
Python, dbus-python, pygi])
>     AM_PATH_PYTHON([2.6])
>  -  AC_MSG_CHECKING([for Python modules for full test coverage])
> --  if "$PYTHON" -c "import dbus, gobject, dbus.mainloop.glib"; then
> +-  if "$PYTHON" -c "import dbus, gi.repository.GObject,
dbus.mainloop.glib"; then
>  -    AC_MSG_RESULT([yes])
>  -  else
>  -    AC_MSG_RESULT([no])
> --    AC_MSG_ERROR([cannot import dbus, gobject, dbus.mainloop.glib
Python modules])
> +-    AC_MSG_ERROR([cannot import dbus, gi.repository.GObject,
dbus.mainloop.glib Python modules])
>  -  fi
>   else
>     # --enable-tests not given: do not abort if Python is missing
> diff --git a/meta/recipes-core/dbus/dbus_1.10.2.bb
b/meta/recipes-core/dbus/dbus_1.10.2.bb
> new file mode 100644
> index 0000000..03a7877
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus_1.10.2.bb
> @@ -0,0 +1,4 @@
> +include dbus.inc
> +
> +SRC_URI[md5sum] = "2428919cc77b8d0028d65ee4d5dbef31"
> +SRC_URI[sha256sum] =
"aef3f49595df09b0824433ee993cda748ede93693a719a831562ae1616b6bb9e"
> diff --git a/meta/recipes-core/dbus/dbus_1.8.20.bb
b/meta/recipes-core/dbus/dbus_1.8.20.bb
> deleted file mode 100644
> index a8f2094..0000000
> --- a/meta/recipes-core/dbus/dbus_1.8.20.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -include dbus.inc
> -
> -SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
> -SRC_URI[sha256sum] =
"5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a113ed43cddd19405236f221b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Oct 31, 2015 3:15 PM, &quot;Ed Bartosh&quot; &lt;<a href=3D"mailto:ed.ba=
rtosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This upgrade should fix qemu build failure on Ubuntu 1.5.10</p>
<p dir=3D"ltr">Typo</p>
<p dir=3D"ltr">&gt; caused by system pulseaudio requirement for newer libdb=
us.<br>
&gt;<br>
&gt; qemu-native build with old dbus breaks on configure step<br>
&gt; with a lot of errors similar to this:<br>
&gt; <a href=3D"http://libpulsecommon-6.0.so">libpulsecommon-6.0.so</a>: un=
defined reference to<br>
&gt; `dbus_watch_get_enabled@LIBDBUS_1_3&#39;</p>
<p dir=3D"ltr">It&#39;s a Dbus ABI issue. It is better to have pulseaudio-n=
ative to solve the underlying issue. Upgrade while fine in itself is really=
 hiding the underlying issue<br>
&gt;<br>
&gt; [YOCTO #8553]<br>
&gt;<br>
&gt; Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel=
.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../{<a href=3D"http://dbus-test_1.8.20.bb">dbus-test_1.8.20.bb<=
/a> =3D&gt; <a href=3D"http://dbus-test_1.10.2.bb">dbus-test_1.10.2.bb</a>}=
=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt; =C2=A0meta/recipes-core/dbus/dbus.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++--<br>
&gt; =C2=A0meta/recipes-core/dbus/dbus/python-config.patch=C2=A0 =C2=A0 =C2=
=A0| 21 ++++++---------------<br>
&gt; =C2=A0meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.2.bb">dbus_1.=
10.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4=
 ++++<br>
&gt; =C2=A0meta/recipes-core/dbus/<a href=3D"http://dbus_1.8.20.bb">dbus_1.=
8.20.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4=
 ----<br>
&gt; =C2=A05 files changed, 16 insertions(+), 23 deletions(-)<br>
&gt; =C2=A0rename meta/recipes-core/dbus/{<a href=3D"http://dbus-test_1.8.2=
0.bb">dbus-test_1.8.20.bb</a> =3D&gt; <a href=3D"http://dbus-test_1.10.2.bb=
">dbus-test_1.10.2.bb</a>} (93%)<br>
&gt; =C2=A0create mode 100644 meta/recipes-core/dbus/<a href=3D"http://dbus=
_1.10.2.bb">dbus_1.10.2.bb</a><br>
&gt; =C2=A0delete mode 100644 meta/recipes-core/dbus/<a href=3D"http://dbus=
_1.8.20.bb">dbus_1.8.20.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.8.20=
.bb">dbus-test_1.8.20.bb</a> b/meta/recipes-core/dbus/<a href=3D"http://dbu=
s-test_1.10.2.bb">dbus-test_1.10.2.bb</a><br>
&gt; similarity index 93%<br>
&gt; rename from meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.8.20.=
bb">dbus-test_1.8.20.bb</a><br>
&gt; rename to meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.10.2.bb=
">dbus-test_1.10.2.bb</a><br>
&gt; index 704070b..1e05f54 100644<br>
&gt; --- a/meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.8.20.bb">db=
us-test_1.8.20.bb</a><br>
&gt; +++ b/meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.10.2.bb">db=
us-test_1.10.2.bb</a><br>
&gt; @@ -18,8 +18,8 @@ SRC_URI =3D &quot;<a href=3D"http://dbus.freedesktop=
.org/releases/dbus/dbus-${PV}.tar.gz">http://dbus.freedesktop.org/releases/=
dbus/dbus-${PV}.tar.gz</a> \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://clear-guid_from_serve=
r-if-send_negotiate_unix_f.patch \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;b49890bbabedab3a1c3f4f73c7ff8b2b&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;5c4fbf4c64621c96e871da91d2b729a5b00536e1=
16d3c4612a469d924b1b703a&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;2428919cc77b8d0028d65ee4d5dbef31&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;aef3f49595df09b0824433ee993cda748ede9369=
3a719a831562ae1616b6bb9e&quot;<br>
&gt;<br>
&gt; =C2=A0S=3D&quot;${WORKDIR}/dbus-${PV}&quot;<br>
&gt; =C2=A0FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/dbus:&quot;<br>
&gt; diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/=
dbus.inc<br>
&gt; index 3971081..bfb7bee 100644<br>
&gt; --- a/meta/recipes-core/dbus/dbus.inc<br>
&gt; +++ b/meta/recipes-core/dbus/dbus.inc<br>
&gt; @@ -55,9 +55,12 @@ FILES_${PN} =3D &quot;${bindir}/dbus-daemon* \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/dbus=
-monitor \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/dbus=
-launch \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/dbus=
-run-session \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus=
-test-tool \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus=
-update-activation-environment \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libexecdir}/=
dbus* \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir} =
\<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${localstatedi=
r} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbu=
s-1 \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/dbu=
s-1/services \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/dbu=
s-1/system-services \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_unit=
dir}/system/&quot;<br>
&gt; @@ -83,8 +86,7 @@ EXTRA_OECONF =3D &quot;--disable-tests \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disabl=
e-xml-docs \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disabl=
e-doxygen-docs \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disabl=
e-libaudit \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-sys=
temd \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-dbu=
s-glib&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-sys=
temd&quot;<br>
&gt;<br>
&gt; =C2=A0EXTRA_OECONF_append_class-native =3D &quot; --disable-selinux&qu=
ot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/dbus/dbus/python-config.patch b/meta/re=
cipes-core/dbus/dbus/python-config.patch<br>
&gt; index 2944002..c8393e5 100644<br>
&gt; --- a/meta/recipes-core/dbus/dbus/python-config.patch<br>
&gt; +++ b/meta/recipes-core/dbus/dbus/python-config.patch<br>
&gt; @@ -1,24 +1,15 @@<br>
&gt; -When building the dbus-ptest package, we have to enable python.=C2=A0=
 However<br>
&gt; -checking if the host-system python has the necessary library isn&#39;=
t useful.<br>
&gt; -<br>
&gt; -Disable the python module check for cross compiling.<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [oe specific]<br>
&gt; -<br>
&gt; -Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.=
com">mark.hatle@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; ---- dbus-1.6.8/configure.ac.orig=C2=A0 =C2=A0 =C2=A0 =C2=A02013-07-11=
 14:15:58.834554799 -0500<br>
&gt; -+++ dbus-1.6.8/<a href=3D"http://configure.ac">configure.ac</a>=C2=A0=
 =C2=A0 2013-07-11 14:14:40.969554848 -0500<br>
&gt; -@@ -257,13 +257,6 @@<br>
&gt; +--- dbus-1.10.2/configure.ac.orig=C2=A0 =C2=A0 =C2=A0 2015-10-31 21:1=
9:38.046633745 +0200<br>
&gt; ++++ dbus-1.10.2/<a href=3D"http://configure.ac">configure.ac</a>=C2=
=A0 =C2=A02015-10-31 21:38:57.080231733 +0200<br>
&gt; +@@ -279,13 +279,6 @@<br>
&gt; =C2=A0 =C2=A0 # full test coverage is required, Python is a hard depen=
dency<br>
&gt; -=C2=A0 =C2=A0AC_MSG_NOTICE([Full test coverage (--enable-tests=3Dyes)=
 requires Python, dbus-python, pygobject])<br>
&gt; +=C2=A0 =C2=A0AC_MSG_NOTICE([Full test coverage (--enable-tests=3Dyes)=
 requires Python, dbus-python, pygi])<br>
&gt; =C2=A0 =C2=A0 AM_PATH_PYTHON([2.6])<br>
&gt; =C2=A0-=C2=A0 AC_MSG_CHECKING([for Python modules for full test covera=
ge])<br>
&gt; --=C2=A0 if &quot;$PYTHON&quot; -c &quot;import dbus, gobject, dbus.ma=
inloop.glib&quot;; then<br>
&gt; +-=C2=A0 if &quot;$PYTHON&quot; -c &quot;import dbus, gi.repository.GO=
bject, dbus.mainloop.glib&quot;; then<br>
&gt; =C2=A0-=C2=A0 =C2=A0 AC_MSG_RESULT([yes])<br>
&gt; =C2=A0-=C2=A0 else<br>
&gt; =C2=A0-=C2=A0 =C2=A0 AC_MSG_RESULT([no])<br>
&gt; --=C2=A0 =C2=A0 AC_MSG_ERROR([cannot import dbus, gobject, dbus.mainlo=
op.glib Python modules])<br>
&gt; +-=C2=A0 =C2=A0 AC_MSG_ERROR([cannot import dbus, gi.repository.GObjec=
t, dbus.mainloop.glib Python modules])<br>
&gt; =C2=A0-=C2=A0 fi<br>
&gt; =C2=A0 else<br>
&gt; =C2=A0 =C2=A0 # --enable-tests not given: do not abort if Python is mi=
ssing<br>
&gt; diff --git a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.2.bb">=
dbus_1.10.2.bb</a> b/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.2.b=
b">dbus_1.10.2.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..03a7877<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.2.bb">dbus_1.=
10.2.bb</a><br>
&gt; @@ -0,0 +1,4 @@<br>
&gt; +include dbus.inc<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;2428919cc77b8d0028d65ee4d5dbef31&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;aef3f49595df09b0824433ee993cda748ede9369=
3a719a831562ae1616b6bb9e&quot;<br>
&gt; diff --git a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.8.20.bb">=
dbus_1.8.20.bb</a> b/meta/recipes-core/dbus/<a href=3D"http://dbus_1.8.20.b=
b">dbus_1.8.20.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index a8f2094..0000000<br>
&gt; --- a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.8.20.bb">dbus_1.=
8.20.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,4 +0,0 @@<br>
&gt; -include dbus.inc<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;b49890bbabedab3a1c3f4f73c7ff8b2b&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;5c4fbf4c64621c96e871da91d2b729a5b00536e1=
16d3c4612a469d924b1b703a&quot;<br>
&gt; --<br>
&gt; 2.1.4<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a113ed43cddd19405236f221b--
