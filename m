Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 31D0F744AA;
	Sun, 23 Sep 2018 09:20:16 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id j25-v6so7526790wmc.1;
	Sun, 23 Sep 2018 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iprO32OQ3ZKBfV7ycZrpwFu54EAGK1Zsw5ulxqlxK0w=;
	b=PT2aLto/whLlEcVQkjvpizJa05d56WvIHZuEUdYBjCRo41Q+uoNg7OwPrrkEAlaNEC
	RKOBtB7OVOgWbnnqE9BxuNTaBdCw6MZgjxzrSuWQc/fk8ckodlEp+l1hkWrZXgeSOcQq
	kGMyewvt0sMA4NOVog++YMy7XaTrhOYm5sYk9CH5QHMjmEs6fEkk6pl5q21RQdUyNNwj
	vQnbeDsFEJ2J2/w5WT1OCe4HrCil+bKBSyZZ+hujwqS+Bt3JsC3C6fe+b5xWHV+mvrv2
	i/xz2H5pyBEXwWakqeDhkb0W34Nq8NmE6PvZr0Ep/CaIf7xrohf9p0MDcLGDlXkEY2Ln
	rl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iprO32OQ3ZKBfV7ycZrpwFu54EAGK1Zsw5ulxqlxK0w=;
	b=iy1RoiYdqv7T4HjRFyWf/D1p5yxW5YEvAkGo3BEM218pZsPSo3BSkrzD6m3u3Sw1Wc
	PQzpUmUtPFWI2AcDsZMTXwu8CM63IhrJsXht3nO0zSdrkOHimBw4zH7j6/MW+OSYdJcN
	wpl7hDApCJBu34vGYebfNp0FSYoaMRdK7RHzQFBbZTjV68sDj86QVGDkrkD5axVw8577
	y7fDw8I+yB0Ni7oWoa3pH5qFiOvTk7CtRHrp94cmInuJFty58cPmbqAdG2f6Sa0cOgHs
	hvWCnPp5R8IXCZ47xP0a0Mm1T6skWCLOHk8yXS/1XYV1KIA2ES8i0BIqNgg2rLfEFHh6
	vlhw==
X-Gm-Message-State: APzg51BiMmUyLhFWZxUOXNhRqD9RiFMddeb/PZeKHH6po328z5oou9l3
	zpkSGLaXq1P7mkfr5RWKcCF4xSZ4L1wzMCuPSME=
X-Google-Smtp-Source: ACcGV61qt2jukZiuRij5Lx/TN+soBbHJogVOk/xxqBI2CoqHX8CI5lLVeVfhSI14qLZ5sffwjB89MselpeQnMyO8fOE=
X-Received: by 2002:a7b:c143:: with SMTP id z3-v6mr496856wmi.1.1537694416431; 
	Sun, 23 Sep 2018 02:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <153754348673.9161.13447934313277658780@git.openembedded.org>
	<20180921152447.28A71234DE8@git.openembedded.org>
In-Reply-To: <20180921152447.28A71234DE8@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 23 Sep 2018 11:20:05 +0200
Message-ID: <CA+chaQcHh7nAJy+k9ZmxB6ERm0r5woFVnUku_5RB0PiakE95CA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 02/45: fribidi: use Meson instead of autotools
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
X-List-Received-Date: Sun, 23 Sep 2018 09:20:16 -0000
Content-Type: multipart/alternative; boundary="00000000000076fa7e0576866189"

--00000000000076fa7e0576866189
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Was this one ever sent to ML? I haven't found it in the archives.

With security flags enabled it fails on older hosts (e.g. Ubuntu 14.04 with
gcc-4.8) now with:

DEBUG: Executing shell function do_compile
[1/63] gcc -Igen.tab/gen.tab@@gen-unicode-version@exe -Igen.tab
-I../fribidi-1.0.5/gen.tab -I. -I../fribidi-1.0.5/ -Ilib
-I../fribidi-1.0.5/lib -pipe -D_FILE_OFFSET_BITS=3D64 -ansi
-fvisibility=3Dhidden -O2 -g -feliminate-unused-debug-types
-fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fri=
bidi/1.0.5-r0=3D/usr/src/debug/fribidi/1.0.5-r0
-fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fri=
bidi/1.0.5-r0/recipe-sysroot=3D
-fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fri=
bidi/1.0.5-r0/recipe-sysroot-native=3D
-UHAVE_CONFIG_H -DHAVE_STRINGIZE -DDONT_HAVE_FRIBIDI_CONFIG_H
-DHAVE_STDLIB_H -DHAVE_STRING_H -DHAVE_STRINGS_H -DSTDC_HEADERS=3D1  -MD -M=
Q
'gen.tab/gen.tab@@gen-unicode-version@exe/gen-unicode-version.c.o' -MF
'gen.tab/gen.tab@@gen-unicode-version@exe/gen-unicode-version.c.o.d' -o
'gen.tab/gen.tab@@gen-unicode-version@exe/gen-unicode-version.c.o' -c
../fribidi-1.0.5/gen.tab/gen-unicode-version.c
[2/63] gcc   -o gen.tab/gen-unicode-version 'gen.tab/gen.tab@
@gen-unicode-version@exe/gen-unicode-version.c.o' -Wl,--no-undefined
-Wl,--as-needed -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fri=
bidi/1.0.5-r0=3D/usr/src/debug/fribidi/1.0.5-r0
-fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fri=
bidi/1.0.5-r0/recipe-sysroot=3D
-fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fri=
bidi/1.0.5-r0/recipe-sysroot-native=3D
-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-protector-strong
-Wl,-z,relro,-z,now
FAILED: gen.tab/gen-unicode-version
gcc   -o gen.tab/gen-unicode-version 'gen.tab/gen.tab@
@gen-unicode-version@exe/gen-unicode-version.c.o' -Wl,--no-undefined
-Wl,--as-needed -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fri=
bidi/1.0.5-r0=3D/usr/src/debug/fribidi/1.0.5-r0
-fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fri=
bidi/1.0.5-r0/recipe-sysroot=3D
-fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fri=
bidi/1.0.5-r0/recipe-sysroot-native=3D
-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-protector-strong
-Wl,-z,relro,-z,now
gcc: error: unrecognized command line option =E2=80=98-fstack-protector-str=
ong=E2=80=99
ninja: build stopped: subcommand failed.
WARNING: exit code 1 from a shell command.

Is meson too active in adding SECURITY_FLAGS even to native part of the
build or should we just just remove -fstack-protector-strong completely for
fribidi?



On Fri, Sep 21, 2018 at 5:24 PM <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>
> commit d297f7ebf3f62528d055e1938a9693d6f3a61935
> Author: Ross Burton <ross.burton@intel.com>
> AuthorDate: Fri Sep 14 00:28:39 2018 +0100
>
>     fribidi: use Meson instead of autotools
>
>     Upstream is moving to Meson, so backport a patch to use that instead =
of
>     autotools.
>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/fribidi/fribidi/meson.patch | 44
> ++++++++++++++++++++++++
>  meta/recipes-support/fribidi/fribidi_1.0.5.bb    |  8 ++---
>  2 files changed, 47 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-support/fribidi/fribidi/meson.patch
> b/meta/recipes-support/fribidi/fribidi/meson.patch
> new file mode 100644
> index 0000000..8b3c4a9
> --- /dev/null
> +++ b/meta/recipes-support/fribidi/fribidi/meson.patch
> @@ -0,0 +1,44 @@
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From f5feb6c599adb52f24656f8589868039b0d14272 Mon Sep 17 00:00:00 2001
> +From: Heiko Becker <heirecka@exherbo.org>
> +Date: Fri, 7 Sep 2018 20:57:11 +0200
> +Subject: [PATCH] Build generator executables natively
> +
> +They are run during the build and not installed in the end. Without
> +this one gets the following error from meson: "ERROR: Can not use
> +target gen-unicode-version as a generator because it is cross-built
> +and no exe wrapper is defined. You might want to set it to native
> +instead."
> +
> +Closes #87.
> +
> +---
> + gen.tab/meson.build | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/gen.tab/meson.build b/gen.tab/meson.build
> +index 6006d98..8c21e98 100644
> +--- a/gen.tab/meson.build
> ++++ b/gen.tab/meson.build
> +@@ -33,7 +33,8 @@ gen_unicode_version =3D executable('gen-unicode-versio=
n',
> +   'gen-unicode-version.c',
> +   include_directories: incs,
> +   c_args: native_args,
> +-  install: false)
> ++  install: false,
> ++  native: true)
> +
> + fribidi_unicode_version_h =3D custom_target('fribidi-unicode-version.h'=
,
> +   input: files('unidata/ReadMe.txt', 'unidata/BidiMirroring.txt'),
> +@@ -67,7 +68,8 @@ foreach tab : tabs
> +     gen_prog_src, 'packtab.c',
> +     include_directories: incs,
> +     c_args: native_args,
> +-    install: false)
> ++    install: false,
> ++    native: true)
> +
> +   tab_inc_file =3D custom_target(gen_prog_name,
> +     input: gen_prog_inputs,
> diff --git a/meta/recipes-support/fribidi/fribidi_1.0.5.bb
> b/meta/recipes-support/fribidi/fribidi_1.0.5.bb
> index 303ccb7..63b2da6 100644
> --- a/meta/recipes-support/fribidi/fribidi_1.0.5.bb
> +++ b/meta/recipes-support/fribidi/fribidi_1.0.5.bb
> @@ -3,16 +3,14 @@ SECTION =3D "libs"
>  LICENSE =3D "LGPLv2.1+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb742476=
9c7"
>
> -SRC_URI =3D "
> https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.bz2"
> +SRC_URI =3D "
> https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
> +           file://meson.patch"
>  SRC_URI[md5sum] =3D "0f97f65038545340316ec0f4bd53df0b"
>  SRC_URI[sha256sum] =3D
> "6a64f2a687f5c4f203a46fa659f43dd43d1f8b845df8d723107e8a7e6158e4ce"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
>
> -inherit autotools lib_package pkgconfig
> -
> -# TODO use Meson instead of autotools when
> -# https://github.com/fribidi/fribidi/issues/87 is solved
> +inherit meson lib_package pkgconfig
>
>  CVE_PRODUCT =3D "gnu_fribidi"
>
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--00000000000076fa7e0576866189
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Was this one ever sent to ML? I haven&#39=
;t found it in the archives.<div><br></div><div>With security flags enabled=
 it fails on older hosts (e.g. Ubuntu 14.04 with gcc-4.8) now with:</div><d=
iv><br></div><div><div>DEBUG: Executing shell function do_compile</div><div=
>[1/63] gcc -Igen.tab/gen.tab@@gen-unicode-version@exe -Igen.tab -I../fribi=
di-1.0.5/gen.tab -I. -I../fribidi-1.0.5/ -Ilib -I../fribidi-1.0.5/lib -pipe=
 -D_FILE_OFFSET_BITS=3D64 -ansi -fvisibility=3Dhidden -O2 -g -feliminate-un=
used-debug-types -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-=
linux-gnueabi/fribidi/1.0.5-r0=3D/usr/src/debug/fribidi/1.0.5-r0 -fdebug-pr=
efix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5=
-r0/recipe-sysroot=3D -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-w=
ebos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot-native=3D -UHAVE_CONFIG_=
H -DHAVE_STRINGIZE -DDONT_HAVE_FRIBIDI_CONFIG_H -DHAVE_STDLIB_H -DHAVE_STRI=
NG_H -DHAVE_STRINGS_H -DSTDC_HEADERS=3D1=C2=A0 -MD -MQ &#39;gen.tab/gen.tab=
@@gen-unicode-version@exe/gen-unicode-version.c.o&#39; -MF &#39;gen.tab/gen=
.tab@@gen-unicode-version@exe/gen-unicode-version.c.o.d&#39; -o &#39;gen.ta=
b/gen.tab@@gen-unicode-version@exe/gen-unicode-version.c.o&#39; -c ../fribi=
di-1.0.5/gen.tab/gen-unicode-version.c</div><div>[2/63] gcc=C2=A0 =C2=A0-o =
gen.tab/gen-unicode-version &#39;gen.tab/gen.tab@@gen-unicode-version@exe/g=
en-unicode-version.c.o&#39; -Wl,--no-undefined -Wl,--as-needed -O2 -pipe -g=
 -feliminate-unused-debug-types -fdebug-prefix-map=3DTOPDIR/BUILD/work/rasp=
berrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0=3D/usr/src/debug/fribidi/1.0.=
5-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueab=
i/fribidi/1.0.5-r0/recipe-sysroot=3D -fdebug-prefix-map=3DTOPDIR/BUILD/work=
/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot-native=3D=
 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-protector-strong -W=
l,-z,relro,-z,now=C2=A0</div><div>FAILED: gen.tab/gen-unicode-version=C2=A0=
</div><div>gcc=C2=A0 =C2=A0-o gen.tab/gen-unicode-version &#39;gen.tab/gen.=
tab@@gen-unicode-version@exe/gen-unicode-version.c.o&#39; -Wl,--no-undefine=
d -Wl,--as-needed -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefi=
x-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0=
=3D/usr/src/debug/fribidi/1.0.5-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/r=
aspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot=3D -fdebug-=
prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0=
.5-r0/recipe-sysroot-native=3D -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-need=
ed -fstack-protector-strong -Wl,-z,relro,-z,now=C2=A0</div><div>gcc: error:=
 unrecognized command line option =E2=80=98-fstack-protector-strong=E2=80=
=99</div><div>ninja: build stopped: subcommand failed.</div><div>WARNING: e=
xit code 1 from a shell command.</div></div><div><br></div><div>Is meson to=
o active in adding SECURITY_FLAGS even to native part of the build or shoul=
d we just just remove -fstack-protector-strong completely for fribidi?</div=
><div><br></div><div><br></div></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr">On Fri, Sep 21, 2018 at 5:24 PM &lt;<a href=3D"mailto:git@g=
it.openembedded.org">git@git.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">This is an automated email from the git hooks/pos=
t-receive script.<br>
<br>
rpurdie pushed a commit to branch master-next<br>
in repository openembedded-core.<br>
<br>
commit d297f7ebf3f62528d055e1938a9693d6f3a61935<br>
Author: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"=
_blank">ross.burton@intel.com</a>&gt;<br>
AuthorDate: Fri Sep 14 00:28:39 2018 +0100<br>
<br>
=C2=A0 =C2=A0 fribidi: use Meson instead of autotools<br>
<br>
=C2=A0 =C2=A0 Upstream is moving to Meson, so backport a patch to use that =
instead of<br>
=C2=A0 =C2=A0 autotools.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/fribidi/fribidi/meson.patch | 44 +++++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-support/fribidi/<a href=3D"http://fribidi_1.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank">fribidi_1.0.5.bb</a>=C2=A0 =C2=A0 |=C2=A0=
 8 ++---<br>
=C2=A02 files changed, 47 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/fribidi/fribidi/meson.patch b/meta/recipe=
s-support/fribidi/fribidi/meson.patch<br>
new file mode 100644<br>
index 0000000..8b3c4a9<br>
--- /dev/null<br>
+++ b/meta/recipes-support/fribidi/fribidi/meson.patch<br>
@@ -0,0 +1,44 @@<br>
+Upstream-Status: Backport<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" ta=
rget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
+<br>
+From f5feb6c599adb52f24656f8589868039b0d14272 Mon Sep 17 00:00:00 2001<br>
+From: Heiko Becker &lt;<a href=3D"mailto:heirecka@exherbo.org" target=3D"_=
blank">heirecka@exherbo.org</a>&gt;<br>
+Date: Fri, 7 Sep 2018 20:57:11 +0200<br>
+Subject: [PATCH] Build generator executables natively<br>
+<br>
+They are run during the build and not installed in the end. Without<br>
+this one gets the following error from meson: &quot;ERROR: Can not use<br>
+target gen-unicode-version as a generator because it is cross-built<br>
+and no exe wrapper is defined. You might want to set it to native<br>
+instead.&quot;<br>
+<br>
+Closes #87.<br>
+<br>
+---<br>
+ gen.tab/meson.build | 6 ++++--<br>
+ 1 file changed, 4 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/gen.tab/meson.build b/gen.tab/meson.build<br>
+index 6006d98..8c21e98 100644<br>
+--- a/gen.tab/meson.build<br>
++++ b/gen.tab/meson.build<br>
+@@ -33,7 +33,8 @@ gen_unicode_version =3D executable(&#39;gen-unicode-vers=
ion&#39;,<br>
+=C2=A0 =C2=A0&#39;gen-unicode-version.c&#39;,<br>
+=C2=A0 =C2=A0include_directories: incs,<br>
+=C2=A0 =C2=A0c_args: native_args,<br>
+-=C2=A0 install: false)<br>
++=C2=A0 install: false,<br>
++=C2=A0 native: true)<br>
+ <br>
+ fribidi_unicode_version_h =3D custom_target(&#39;fribidi-unicode-version.=
h&#39;,<br>
+=C2=A0 =C2=A0input: files(&#39;unidata/ReadMe.txt&#39;, &#39;unidata/BidiM=
irroring.txt&#39;),<br>
+@@ -67,7 +68,8 @@ foreach tab : tabs<br>
+=C2=A0 =C2=A0 =C2=A0gen_prog_src, &#39;packtab.c&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0include_directories: incs,<br>
+=C2=A0 =C2=A0 =C2=A0c_args: native_args,<br>
+-=C2=A0 =C2=A0 install: false)<br>
++=C2=A0 =C2=A0 install: false,<br>
++=C2=A0 =C2=A0 native: true)<br>
+ <br>
+=C2=A0 =C2=A0tab_inc_file =3D custom_target(gen_prog_name,<br>
+=C2=A0 =C2=A0 =C2=A0input: gen_prog_inputs,<br>
diff --git a/meta/recipes-support/fribidi/<a href=3D"http://fribidi_1.0.5.b=
b" rel=3D"noreferrer" target=3D"_blank">fribidi_1.0.5.bb</a> b/meta/recipes=
-support/fribidi/<a href=3D"http://fribidi_1.0.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">fribidi_1.0.5.bb</a><br>
index 303ccb7..63b2da6 100644<br>
--- a/meta/recipes-support/fribidi/<a href=3D"http://fribidi_1.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank">fribidi_1.0.5.bb</a><br>
+++ b/meta/recipes-support/fribidi/<a href=3D"http://fribidi_1.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank">fribidi_1.0.5.bb</a><br>
@@ -3,16 +3,14 @@ SECTION =3D &quot;libs&quot;<br>
=C2=A0LICENSE =3D &quot;LGPLv2.1+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da916467b91076e631dd8e=
db7424769c7&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/$%7BBPN%7D/$%7BBPN%7D/rele=
ases/download/v$%7BPV%7D/$%7BBP%7D.tar.bz2" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.b=
z2</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/$%7BBPN%7D/$%7BBPN%7D/rele=
ases/download/v$%7BPV%7D/$%7BBP%7D.tar.bz2" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.b=
z2</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://meson.patch&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;0f97f65038545340316ec0f4bd53df0b&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;6a64f2a687f5c4f203a46fa659f43dd43d1f8b84=
5df8d723107e8a7e6158e4ce&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/$%7BBPN%7D=
/$%7BBPN%7D/releases" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/${BPN}/${BPN}/releases</a>&quot;<br>
<br>
-inherit autotools lib_package pkgconfig<br>
-<br>
-# TODO use Meson instead of autotools when<br>
-# <a href=3D"https://github.com/fribidi/fribidi/issues/87" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/fribidi/fribidi/issues/87</a> is s=
olved<br>
+inherit meson lib_package pkgconfig<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;gnu_fribidi&quot;<br>
<br>
<br>
-- <br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
-- <br>
_______________________________________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org" target=3D"_b=
lank">Openembedded-commits@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mai=
lman/listinfo/openembedded-commits</a><br>
</blockquote></div>

--00000000000076fa7e0576866189--
