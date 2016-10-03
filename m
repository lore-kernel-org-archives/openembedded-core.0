Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id B8A8D719CD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 16:25:15 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 10so1453052ual.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 09:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UzkgnZfW8rjcHv/52D14FXtZOPFM8BdLPjhRvRSKHRk=;
	b=YiDuWrz6fmRE+CPo09ILIG6N/i8+sxtmfm+HupdXeBANmQmQns6mNrP7P0TbuKx6i8
	jj8U/489z+PORKPZNmvoTJ4u/+wKLb7BO64CdCT8muYTJaGI4IXsjK0ys+5veoqRMS78
	Sn957NW/OG0D9UqdGQ08W3tOB3+f7P6nXuc2ZMWmGUOd5vkdoa7X6umkBdVBbFcog1Lv
	VEDia24/cV8iZYHrTWJrQaJw5ThUD59sKgiObhP64bk0hGNU4F8LjGFJatXfJmZ9FIQx
	oLh21J2Tj2l21rWnCb9DaEJclERuILvYdXPgrckqj/bINVnwnI9vGbS8v4I6Eur2qo9S
	Yu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UzkgnZfW8rjcHv/52D14FXtZOPFM8BdLPjhRvRSKHRk=;
	b=ikSnVPd+vlwG5B6eoPvz/u/r/nN6M0LXKTVw/qbY69NaJIec9ubUaYKuWYajVe79Bh
	9c8DJmqZFFodK1TMiXSZ+0oAjJPRv6fJR5ZAR49hfh/tcEERz473Me84lYNJYvkAR/VJ
	A4J2InCzGt7fK0yA/ZZRAxQqKKkyb+GbKOE6JOSzXuXcB/Ads2zxwuT7eShPozUHnK8v
	sz2nP2r/MFO+dNJ9oAztXU3OzZNaz0cJV6S1gO73Kcx8W+p96hMnZBYSkBep+YxQ0HcV
	ux/8PmMv6f5SXuZYLAgclNRf4J0tlA7FfIoQC4YYihajPr2O/KukNgM8iiI0G/cHphUn
	m3jA==
X-Gm-Message-State: AA6/9Rm8TB3mLX3KeEBohmDnPqdQK1OZrDYPxt6lNZNgbzpfCclQbHTZ/EHbJ7aeE8/sDAw1RJk9X4pMbV6ZMg==
X-Received: by 10.176.67.199 with SMTP id l65mr5143555ual.107.1475511916652;
	Mon, 03 Oct 2016 09:25:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Mon, 3 Oct 2016 09:25:16 -0700 (PDT)
Received: by 10.176.86.206 with HTTP; Mon, 3 Oct 2016 09:25:16 -0700 (PDT)
In-Reply-To: <1475504192-17738-4-git-send-email-ross.burton@intel.com>
References: <1475504192-17738-1-git-send-email-ross.burton@intel.com>
	<1475504192-17738-4-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Oct 2016 09:25:16 -0700
Message-ID: <CAMKF1sqepbTsaDoDai_K=X0DaWBadVvkc29bKx8_v8RttatDew@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] binutils: apply RPATH fixes from our libtool patches
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
X-List-Received-Date: Mon, 03 Oct 2016 16:25:16 -0000
Content-Type: multipart/alternative; boundary=001a114d826aa76c17053df863ca

--001a114d826aa76c17053df863ca
Content-Type: text/plain; charset=UTF-8

This looks fine

On Oct 3, 2016 7:17 AM, "Ross Burton" <ross.burton@intel.com> wrote:

> We don't autoreconf/libtoolize binutils as it has very strict
> requirements, so
> extend our patching of the stock libtool to include two fixes to RPATH
> behaviour, as part of the solution to ensure that native binaries don't
> have
> RPATHs pointing at the host system's /usr/lib.
>
> This generally doesn't cause a problem but it can cause some binaries
> (such as
> ar) to abort on startup:
>
> ./x86_64-pokysdk-linux-ar: relocation error: /usr/lib/libc.so.6: symbol
> _dl_starting_up, version GLIBC_PRIVATE not defined in file ld-linux.so.2
> with
> link time reference
>
> The situation here is that ar is built and as it links to the host
> libc/loader
> has an RPATH for /usr/lib.  If tmp is wiped and then binutils is installed
> from
> sstate relocation occurs and the loader changed to the sysroot, but there
> remains a RPATH for /usr/lib.  This means that the sysroot loader is used
> with
> the host libc, which can be incompatible.  By telling libtool that the host
> library paths are in the default search path, and ensuring that all default
> search paths are not added as RPATHs by libtool, the result is a binary
> that
> links to what it should be linking to and nothing else.
>
> [ YOCTO #9287 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.27.inc   |   1 +
>  .../binutils/0014-libtool-remove-rpath.patch       | 100
> +++++++++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0014-
> libtool-remove-rpath.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc
> b/meta/recipes-devtools/binutils/binutils-2.27.inc
> index 9cc57fc..03b7bed 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.27.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
> @@ -33,6 +33,7 @@ SRC_URI = "\
>       file://0011-Change-default-emulation-for-mips64-linux.patch \
>       file://0012-Add-support-for-Netlogic-XLP.patch \
>       file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> \
> +     file://0014-libtool-remove-rpath.patch \
>  "
>  S  = "${WORKDIR}/git"
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0014-libtool-remove-rpath.patch
> b/meta/recipes-devtools/binutils/binutils/0014-libtool-remove-rpath.patch
> new file mode 100644
> index 0000000..d56948f
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0014-
> libtool-remove-rpath.patch
> @@ -0,0 +1,100 @@
> +Apply these patches from our libtool patches as not only are redundant
> RPATHs a
> +waste of space but they can cause incorrect linking when native packages
> are
> +restored from sstate.
> +
> +fix-rpath.patch:
> +We don't want to add RPATHS which match default linker
> +search paths, they're a waste of space. This patch
> +filters libtools list and removes the ones we don't need.
> +
> +norm-rpath.patch:
> +Libtool may be passed link paths of the form "/usr/lib/../lib", which
> +fool its detection code into thinking it should be included as an
> +RPATH in the generated binary.  Normalize before comparision.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +diff --git a/ltmain.sh b/ltmain.sh
> +index 683317c..860a16a 100644
> +--- a/ltmain.sh
> ++++ b/ltmain.sh
> +@@ -8053,8 +8053,14 @@ EOF
> +                 esac
> +               fi
> +             else
> +-              eval flag=\"$hardcode_libdir_flag_spec\"
> +-              func_append dep_rpath " $flag"
> ++                # We only want to hardcode in an rpath if it isn't in the
> ++                # default dlsearch path.
> ++              case " $sys_lib_dlsearch_path " in
> ++              *" $libdir "*) ;;
> ++              *) eval flag=\"$hardcode_libdir_flag_spec\"
> ++                   func_append dep_rpath " $flag"
> ++                   ;;
> ++              esac
> +             fi
> +           elif test -n "$runpath_var"; then
> +             case "$perm_rpath " in
> +@@ -8790,8 +8796,14 @@ EOF
> +             esac
> +           fi
> +         else
> +-          eval flag=\"$hardcode_libdir_flag_spec\"
> +-          func_append rpath " $flag"
> ++            # We only want to hardcode in an rpath if it isn't in the
> ++            # default dlsearch path.
> ++          case " $sys_lib_dlsearch_path " in
> ++          *" $libdir "*) ;;
> ++          *) eval flag=\"$hardcode_libdir_flag_spec\"
> ++               rpath+=" $flag"
> ++               ;;
> ++          esac
> +         fi
> +       elif test -n "$runpath_var"; then
> +         case "$perm_rpath " in
> +@@ -8841,8 +8853,14 @@ EOF
> +             esac
> +           fi
> +         else
> +-          eval flag=\"$hardcode_libdir_flag_spec\"
> +-          func_append rpath " $flag"
> ++            # We only want to hardcode in an rpath if it isn't in the
> ++            # default dlsearch path.
> ++          case " $sys_lib_dlsearch_path " in
> ++          *" $libdir "*) ;;
> ++          *) eval flag=\"$hardcode_libdir_flag_spec\"
> ++               func_append rpath " $flag"
> ++               ;;
> ++          esac
> +         fi
> +       elif test -n "$runpath_var"; then
> +         case "$finalize_perm_rpath " in
> +diff --git a/ltmain.sh b/ltmain.sh
> +index 683317c..860a16a 100644
> +--- a/ltmain.sh
> ++++ b/ltmain.sh
> +@@ -8055,8 +8055,10 @@ EOF
> +             else
> +                 # We only want to hardcode in an rpath if it isn't in the
> +                 # default dlsearch path.
> ++                func_normal_abspath "$libdir"
> ++                libdir_norm=$func_normal_abspath_result
> +               case " $sys_lib_dlsearch_path " in
> +-              *" $libdir "*) ;;
> ++              *" $libdir_norm "*) ;;
> +               *) eval flag=\"$hardcode_libdir_flag_spec\"
> +                    func_append dep_rpath " $flag"
> +                    ;;
> +@@ -8798,8 +8800,10 @@ EOF
> +         else
> +             # We only want to hardcode in an rpath if it isn't in the
> +             # default dlsearch path.
> ++            func_normal_abspath "$libdir"
> ++            libdir_norm=$func_normal_abspath_result
> +           case " $sys_lib_dlsearch_path " in
> +-          *" $libdir "*) ;;
> ++          *" $libdir_norm "*) ;;
> +           *) eval flag=\"$hardcode_libdir_flag_spec\"
> +                rpath+=" $flag"
> +                ;;
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114d826aa76c17053df863ca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">This looks fine</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Oct 3, 2016 7:=
17 AM, &quot;Ross Burton&quot; &lt;<a href=3D"mailto:ross.burton@intel.com"=
>ross.burton@intel.com</a>&gt; wrote:<br type=3D"attribution"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">We don&#39;t autoreconf/libtoolize binutils as it has ver=
y strict requirements, so<br>
extend our patching of the stock libtool to include two fixes to RPATH<br>
behaviour, as part of the solution to ensure that native binaries don&#39;t=
 have<br>
RPATHs pointing at the host system&#39;s /usr/lib.<br>
<br>
This generally doesn&#39;t cause a problem but it can cause some binaries (=
such as<br>
ar) to abort on startup:<br>
<br>
./x86_64-pokysdk-linux-ar: relocation error: /usr/lib/libc.so.6: symbol<br>
_dl_starting_up, version GLIBC_PRIVATE not defined in file ld-linux.so.2 wi=
th<br>
link time reference<br>
<br>
The situation here is that ar is built and as it links to the host libc/loa=
der<br>
has an RPATH for /usr/lib.=C2=A0 If tmp is wiped and then binutils is insta=
lled from<br>
sstate relocation occurs and the loader changed to the sysroot, but there<b=
r>
remains a RPATH for /usr/lib.=C2=A0 This means that the sysroot loader is u=
sed with<br>
the host libc, which can be incompatible.=C2=A0 By telling libtool that the=
 host<br>
library paths are in the default search path, and ensuring that all default=
<br>
search paths are not added as RPATHs by libtool, the result is a binary tha=
t<br>
links to what it should be linking to and nothing else.<br>
<br>
[ YOCTO #9287 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/<wbr>binutils/binutils-2.27.inc=C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0.../binutils/0014-libtool-<wbr>remove-rpath.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 100 +++++++++++++++++++++<br>
=C2=A02 files changed, 101 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/<wbr>binutils/binutils/0014-=
<wbr>libtool-remove-rpath.patch<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils-2.27.inc b/meta/r=
ecipes-devtools/<wbr>binutils/binutils-2.27.inc<br>
index 9cc57fc..03b7bed 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils-2.27.inc<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils-2.27.inc<br>
@@ -33,6 +33,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 file://0011-Change-default-<wbr>emulation-for-mips64-l=
inux.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://0012-Add-support-for-<wbr>Netlogic-XLP.patch \<=
br>
=C2=A0 =C2=A0 =C2=A0 file://0013-fix-the-incorrect-<wbr>assembling-for-ppc-=
wait-<wbr>mnemonic.patch \<br>
+=C2=A0 =C2=A0 =C2=A0file://0014-libtool-remove-<wbr>rpath.patch \<br>
=C2=A0&quot;<br>
=C2=A0S=C2=A0 =3D &quot;${WORKDIR}/git&quot;<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0014-<wbr>libtool=
-remove-rpath.patch b/meta/recipes-devtools/<wbr>binutils/binutils/0014-<wb=
r>libtool-remove-rpath.patch<br>
new file mode 100644<br>
index 0000000..d56948f<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0014-<wbr>libtool-remove=
-rpath.patch<br>
@@ -0,0 +1,100 @@<br>
+Apply these patches from our libtool patches as not only are redundant RPA=
THs a<br>
+waste of space but they can cause incorrect linking when native packages a=
re<br>
+restored from sstate.<br>
+<br>
+fix-rpath.patch:<br>
+We don&#39;t want to add RPATHS which match default linker<br>
+search paths, they&#39;re a waste of space. This patch<br>
+filters libtools list and removes the ones we don&#39;t need.<br>
+<br>
+norm-rpath.patch:<br>
+Libtool may be passed link paths of the form &quot;/usr/lib/../lib&quot;, =
which<br>
+fool its detection code into thinking it should be included as an<br>
+RPATH in the generated binary.=C2=A0 Normalize before comparision.<br>
+<br>
+Upstream-Status: Inappropriate<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt;<br>
+<br>
+diff --git a/ltmain.sh b/ltmain.sh<br>
+index 683317c..860a16a 100644<br>
+--- a/ltmain.sh<br>
++++ b/ltmain.sh<br>
+@@ -8053,8 +8053,14 @@ EOF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval flag=3D\&quot;$hard=
code_libdir_flag_<wbr>spec\&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func_append dep_rpath &q=
uot; $flag&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We only want to=
 hardcode in an rpath if it isn&#39;t in the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # default dlsearc=
h path.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot; $sys_lib_dls=
earch_path &quot; in<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *&quot; $libdir &quot;*)=
 ;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) eval flag=3D\&quot;$h=
ardcode_libdir_flag_<wbr>spec\&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func=
_append dep_rpath &quot; $flag&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif test -n &quot;$runpath_var&q=
uot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$perm_rpath &qu=
ot; in<br>
+@@ -8790,8 +8796,14 @@ EOF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval flag=3D\&quot;$hardcode_libdir_fl=
ag_<wbr>spec\&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func_append rpath &quot; $flag&quot;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We only want to hardcode in a=
n rpath if it isn&#39;t in the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # default dlsearch path.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot; $sys_lib_dlsearch_path &qu=
ot; in<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *&quot; $libdir &quot;*) ;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) eval flag=3D\&quot;$hardcode_libdir=
_flag_<wbr>spec\&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpath+=3D&quot; $f=
lag&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0elif test -n &quot;$runpath_var&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$perm_rpath &quot; in<br>
+@@ -8841,8 +8853,14 @@ EOF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval flag=3D\&quot;$hardcode_libdir_fl=
ag_<wbr>spec\&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func_append rpath &quot; $flag&quot;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We only want to hardcode in a=
n rpath if it isn&#39;t in the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # default dlsearch path.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot; $sys_lib_dlsearch_path &qu=
ot; in<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *&quot; $libdir &quot;*) ;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) eval flag=3D\&quot;$hardcode_libdir=
_flag_<wbr>spec\&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func_append rpath =
&quot; $flag&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0elif test -n &quot;$runpath_var&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$finalize_perm_rpath &quot; i=
n<br>
+diff --git a/ltmain.sh b/ltmain.sh<br>
+index 683317c..860a16a 100644<br>
+--- a/ltmain.sh<br>
++++ b/ltmain.sh<br>
+@@ -8055,8 +8055,10 @@ EOF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We only wa=
nt to hardcode in an rpath if it isn&#39;t in the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# default dl=
search path.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func_normal_abspa=
th &quot;$libdir&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir_norm=3D$fu=
nc_normal_<wbr>abspath_result<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot; $sys_li=
b_dlsearch_path &quot; in<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *&quot; $libdir &quot;*)=
 ;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *&quot; $libdir_norm &qu=
ot;*) ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*) eval flag=3D\&qu=
ot;$hardcode_libdir_flag_<wbr>spec\&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func=
_append dep_rpath &quot; $flag&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<b=
r>
+@@ -8798,8 +8800,10 @@ EOF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We only want to hardcode=
 in an rpath if it isn&#39;t in the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# default dlsearch path.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func_normal_abspath &quot;$libd=
ir&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir_norm=3D$func_normal_<wbr=
>abspath_result<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot; $sys_lib_dlsearch_pat=
h &quot; in<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *&quot; $libdir &quot;*) ;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *&quot; $libdir_norm &quot;*) ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*) eval flag=3D\&quot;$hardcode_l=
ibdir_flag_<wbr>spec\&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpath+=3D&quot; $f=
lag&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
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
</blockquote></div></div>

--001a114d826aa76c17053df863ca--
