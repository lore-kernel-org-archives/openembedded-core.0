Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4FBEE600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 23:52:28 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id z135so8758405iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 15:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=c+v6XQWA95aAimm9klk+cB+lZaMKXssC0uWaIe7CYHE=;
	b=jmAOrfTr5EzcKdHpMoZLB6St4x1qcXfdyb/0Y4alOs+NNWE9WEf7mwghQt8DmUq3y+
	QeTeFh5PJtknxamjWlPrq6fO2J6ZHSbC5ufIDvJfhxGohD4JUnR86b1Z1qXD8Txqd2gp
	Orrouc8NEb86/cXpXO1MtLXh9cN9tdxDIiJZ7PJca2Gx6okNT1WN0shbp9h21ri4zFg1
	LtwiONQ755trB1S8v/caG0uUgnyWI3x/ksHv+Wrli2/wyQ71TAdGUjbBJtk8gJOTvwu7
	0EfEcWvFEwKEQu2iOsw+gvBH/iK3jp36ZumAH3m3GE4qrAUB1n7g+p0Z6pZjrUxHm6+i
	0afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=c+v6XQWA95aAimm9klk+cB+lZaMKXssC0uWaIe7CYHE=;
	b=kC7QUOiHkVqLfSGmPTdPMoBlMYqYA6dWixcWnuZior2rTxQO04SfuJKcO+8X7u+zlo
	bZwwEhVsx4f20hzrwoEZj52rxkhyB0jzrpvk044SmK5c4ODm/wRpalI+jxJVFjNILdDB
	L7HQVJqZClRAtqm/3pr3vcdSBc0RPSgtpz+NKsqAmj++osUwQ/LECKxYECs2voYPg0tL
	OdC1FZS7b4T7WaY5Ya9/71IxzkBOq79DVqHzzf+U7xo+h6muT/XKNmj453f5PA8Wib9H
	U0Sc+pePbELX+6k2Incf4mY8BB95l6qtLzYk2c/DMRiOBdZ1t7tVn3xaf+8xE7ffZJFk
	Q5wg==
X-Gm-Message-State: AG10YOSpUgOFKeJGtAcz9Sitty/vc0U/v/uhb/OnDZEMVKxs+zO2syRdjiIentzSzCiP7LWex4klnWx+sE8qaw==
X-Received: by 10.107.29.209 with SMTP id d200mr194428iod.27.1455666749566;
	Tue, 16 Feb 2016 15:52:29 -0800 (PST)
MIME-Version: 1.0
References: <1455666592.28376.31.camel@linuxfoundation.org>
In-Reply-To: <1455666592.28376.31.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 16 Feb 2016 23:52:19 +0000
Message-ID: <CABcZANku1BbE61_CF5vduOwLjnoutDaeqPQEFdbrLOFCNiHfTg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rng-tools: Fix underquoted m4 and libgcrypt floating dependency
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
X-List-Received-Date: Tue, 16 Feb 2016 23:52:29 -0000
Content-Type: multipart/alternative; boundary=001a11408e9e84f741052bebd340

--001a11408e9e84f741052bebd340
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 16, 2016 at 4:50 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The underquoted m4 caused build failures if libgcrypt wasn't present. The
> floating
> dependency on libgcrypt was just plain incorrect, particularly given the
> incorrect
> libgcrypt RDEPENDS. Change to use PACKAGECONFIG an default to on.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/underquote.patch
> b/meta/recipes-support/rng-tools/rng-tools/underquote.patch
> new file mode 100644
> index 0000000..1422571
> --- /dev/null
> +++ b/meta/recipes-support/rng-tools/rng-tools/underquote.patch
> @@ -0,0 +1,31 @@
> +Fix underquoted m4 entry. This causes a failure if gcrypt isn't present:
> +
> +| configure: libgcrypt support disabled
> +| ../rng-tools-5/configure: line 4345: ac_fn_c_try_link: command not found
> +| configure: error: in
> `/media/build1/poky/build/tmp/work/i586-poky-linux/rng-tools/5-r0/build':
> +
> +RP
> +2016/2/16
> +
> +Index: rng-tools-5/configure.ac
> +===================================================================
> +--- rng-tools-5.orig/configure.ac
> ++++ rng-tools-5/configure.ac
> +@@ -71,7 +71,7 @@ AS_IF(
> +       [test "x$with_libgcrypt" != "xno"],
> +       [
> +               AC_CHECK_HEADER([gcrypt.h],
> +-                      AC_CHECK_LIB(
> ++                      [AC_CHECK_LIB(
> +                               [gcrypt],
> +                               [gcry_check_version], ,
> +                               [
> +@@ -80,7 +80,7 @@ AS_IF(
> +                                               AC_MSG_NOTICE([libgcrypt
> support disabled])
> +                                       fi
> +                               ]
> +-                      ),
> ++                      )],
> +                       [if test "x$with_libgcrypt" != "xcheck"; then
> +                               AC_MSG_FAILURE([libgcrypt headers not
> found]); else
> +                               AC_MSG_NOTICE([libgcrypt support disabled])
> diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb
> b/meta/recipes-support/rng-tools/rng-tools_5.bb
> index 9a19d1c..bc67990 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_5.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=0b6f033afe6db235e559456585dc8cdc"
>  SRC_URI = "
> http://heanet.dl.sourceforge.net/sourceforge/gkernel/${BP}.tar.gz \
>             file://0001-If-the-libc-is-lacking-argp-use-libargp.patch \
>
> file://0002-Add-argument-to-control-the-libargp-dependency.patch \
> +           file://underquote.patch \
>             file://init \
>             file://default"
>
> @@ -20,12 +21,11 @@ python () {
>
>  inherit autotools update-rc.d
>
> -PACKAGECONFIG = ""
> +PACKAGECONFIG = "libgcrypt"
>  PACKAGECONFIG_libc-musl = "libargp"
>  PACKAGECONFIG_libc-uclibc = "libargp"
>

I'm not sure how well musl/uclibc support libgcrypt, but this does end up
not including gcrypt support for those libcs, unless we switch it to
_append_libc-.

--001a11408e9e84f741052bebd340
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, Feb 16, 2016 at 4:50 PM Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">The underquoted m4 caused build fail=
ures if libgcrypt wasn&#39;t present. The floating<br>
dependency on libgcrypt was just plain incorrect, particularly given the in=
correct<br>
libgcrypt RDEPENDS. Change to use PACKAGECONFIG an default to on.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
<br>
diff --git a/meta/recipes-support/rng-tools/rng-tools/underquote.patch b/me=
ta/recipes-support/rng-tools/rng-tools/underquote.patch<br>
new file mode 100644<br>
index 0000000..1422571<br>
--- /dev/null<br>
+++ b/meta/recipes-support/rng-tools/rng-tools/underquote.patch<br>
@@ -0,0 +1,31 @@<br>
+Fix underquoted m4 entry. This causes a failure if gcrypt isn&#39;t presen=
t:<br>
+<br>
+| configure: libgcrypt support disabled<br>
+| ../rng-tools-5/configure: line 4345: ac_fn_c_try_link: command not found=
<br>
+| configure: error: in `/media/build1/poky/build/tmp/work/i586-poky-linux/=
rng-tools/5-r0/build&#39;:<br>
+<br>
+RP<br>
+2016/2/16<br>
+<br>
+Index: rng-tools-5/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- rng-tools-5.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.ac</a><br>
++++ rng-tools-5/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
+@@ -71,7 +71,7 @@ AS_IF(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[test &quot;x$with_libgcrypt&quot; !=3D &quot;x=
no&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_HEADER([gc=
rypt.h],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AC_CHECK_LIB(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 [AC_CHECK_LIB(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gcrypt],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[gcry_check_version], ,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[<br>
+@@ -80,7 +80,7 @@ AS_IF(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0AC_MSG_NOTICE([libgcrypt support disabled])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 )],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[if test &quot;x$with_libgcrypt&quot; !=3D &quot;xcheck&quot;; th=
en<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_FAILURE([libgcrypt headers not=
 found]); else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_NOTICE([libgcrypt support disa=
bled])<br>
diff --git a/meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_5.b=
b" rel=3D"noreferrer" target=3D"_blank">rng-tools_5.bb</a> b/meta/recipes-s=
upport/rng-tools/<a href=3D"http://rng-tools_5.bb" rel=3D"noreferrer" targe=
t=3D"_blank">rng-tools_5.bb</a><br>
index 9a19d1c..bc67990 100644<br>
--- a/meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_5.bb" rel=
=3D"noreferrer" target=3D"_blank">rng-tools_5.bb</a><br>
+++ b/meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_5.bb" rel=
=3D"noreferrer" target=3D"_blank">rng-tools_5.bb</a><br>
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0b6f033afe6=
db235e559456585dc8cdc&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://heanet.dl.sourceforge.net/sourcef=
orge/gkernel/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://=
heanet.dl.sourceforge.net/sourceforge/gkernel/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-If-the-libc-is-lackin=
g-argp-use-libargp.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Add-argument-to-contr=
ol-the-libargp-dependency.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://underquote.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://init \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://default&quot;<br>
<br>
@@ -20,12 +21,11 @@ python () {<br>
<br>
=C2=A0inherit autotools update-rc.d<br>
<br>
-PACKAGECONFIG =3D &quot;&quot;<br>
+PACKAGECONFIG =3D &quot;libgcrypt&quot;<br>
=C2=A0PACKAGECONFIG_libc-musl =3D &quot;libargp&quot;<br>
=C2=A0PACKAGECONFIG_libc-uclibc =3D &quot;libargp&quot;<br></blockquote><di=
v><br></div><div>I&#39;m not sure how well musl/uclibc support libgcrypt, b=
ut this does end up not including gcrypt support for those libcs, unless we=
 switch it to _append_libc-.</div></div></div>

--001a11408e9e84f741052bebd340--
