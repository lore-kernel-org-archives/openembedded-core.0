Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF95C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 17:55:59 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.35985.1659030956906926533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 10:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gFuBgIg7;
 spf=pass (domain: gmail.com, ip: 209.85.219.177,
 mailfrom: chuckwolber@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 123so4437214ybv.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 10:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8qFG6TOsWetCWcLX23SoUDZNM5RrjKFLN+0TKL1BsgM=;
        b=gFuBgIg7N1hADiUpWVsui0TaVPNp2uawVvW2cudKvxCQDSlwKeTjQDhnF72lbG/Syi
         RMW82cqOUcVHojrWpLMcjpTfv0/EzvJQkp7KD2xoW9hTY4fn6nmLSQnQoA0/FEoK0GQ9
         Cc38Hkl/LAPeRchUGu91a7+KF6fs6Su6ttcA6CokYYDTbrKBAs+RkCBsq1peGCuuH2mQ
         HcdFSqCvWy/TbQw4bpX9csGD9cobtgQrg0j3hBjqjKgnqsxeol4QkjZI+PnUQ33fYMIR
         B0irjqD4koA+xF6yiTG4jsSflztaThKoSuDSFgXvgSjo0+LfKoZK65qnNtKcnFZ8ctFk
         bSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8qFG6TOsWetCWcLX23SoUDZNM5RrjKFLN+0TKL1BsgM=;
        b=3xBsm+ZNlqA80C7z8ejJQM/7gjKCC7dXUsGW9Uk+6oAV2dMlSuJ65Omcf3xI6tKOU3
         jEWzTMCAauNMZaKsBdmhincvFcNSsVFo/2ZcC8WV/BjPzIXBKFYDPgqY1H3F/LEY6QdM
         60B9KqxGiAPqYgGYdYtr0umTiM1aCpIf00qBTEiOjq45dfku9XIxztJ/zUYGJyrXyni5
         iACCab2snZw9WHkGLbSfPT03iJqJ0oshY4VhMO4fP0ybIk94aHdXsPNn3lhZ6suhL0Yi
         X33sK1qwmKCZi99PsmjtwpJmYS5kL+CLo1P7/YzMNcqDcwOeRui/zdNgD3dNE+iCQNHv
         HxZQ==
X-Gm-Message-State: AJIora+le13Ak06Ag+HXhYHDIHl0RD7KjorFb3UgbSnEQ5pkhDbF503k
	+013RgwzO+8/R/eY6Thu/1rIFjpIE1/RYGAs6AI=
X-Google-Smtp-Source: 
 AGRyM1usO2oHh5w9zaIHWjonomwje1h8GKOaVJkab/0spUtR1EUrnxL8K01o0pYIYI7cuNe9oCrK7lHID/8P9SB01GI=
X-Received: by 2002:a5b:3ce:0:b0:66f:4692:27a2 with SMTP id
 t14-20020a5b03ce000000b0066f469227a2mr22162589ybp.167.1659030955872; Thu, 28
 Jul 2022 10:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658882276.git.steve@sakoman.com>
 <bb1dc2bbfe268e73008dc37d6b1f83a861b48915.1658882276.git.steve@sakoman.com>
In-Reply-To: 
 <bb1dc2bbfe268e73008dc37d6b1f83a861b48915.1658882276.git.steve@sakoman.com>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Thu, 28 Jul 2022 10:55:44 -0700
Message-ID: 
 <CAB=6tBTxdkT640huLEiMRKxWbONvbniKBb6_oiz7P_aUwjNKYQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 13/15] gobject-introspection-data: Disable
 cache for g-ir-scanner
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cbd7e905e4e13ebc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 17:55:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168612

--000000000000cbd7e905e4e13ebc
Content-Type: text/plain; charset="UTF-8"

FWIW, the gobject-introspection-native recipe was one of the "canaries in
the mine" that reliably caused an image build to die while I was actively
encountering this GCC10 compiler issue in Hardknott:

https://www.mail-archive.com/yocto@lists.yoctoproject.org/msg06163.html
https://lists.yoctoproject.org/g/yocto/message/53971

Upon re-reading my post, I regret that I did not mention this fact. The
production image recipe I was working on at the time did not happen to
involve gobject-introspection-native, so I overlooked it. Our other image
recipes *DID* invoke gobject-introspection-native, but those were not as
immediately important at the time, and I was trying to keep the problem
description as focused as possible.

I do not expect this reply to result in anything materially relevant to the
problem (it still exists, but we use buildtools to get around it) other
than to add more data that may be relevant to someone googling something
similar in the future.

..Ch:W..

On Tue, Jul 26, 2022 at 5:41 PM Steve Sakoman <steve@sakoman.com> wrote:

> From: Tom Hochstein <tom.hochstein@nxp.com>
>
> An intermittent failure occurs in libical-native do_compile:
>
> | Traceback (most recent call last):
> |   File
> "/.../build/tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/python3.10/shutil.py",
> line 813, in move
> |     os.rename(src, real_dst)
> | OSError: [Errno 18] Invalid cross-device link:
> '/tmp/g-ir-scanner-cache-adxo_2bq' ->
> '/home/bamboo/.cache/g-ir-scanner/bab9a83d2cd93e62ed005a2c1d4f89ae75c67251'
> |
> | During handling of the above exception, another exception occurred:
> |
> | Traceback (most recent call last):
> |   File
> "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/bin/g-ir-scanner",
> line 99, in <module>
> |     sys.exit(scanner_main(sys.argv))
> |   File
> "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/scannermain.py",
> line 590, in scanner_main
> |     transformer = create_transformer(namespace, options)
> |   File
> "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/scannermain.py",
> line 409, in create_transformer
> |     transformer.register_include(include_obj)
> |   File
> "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/transformer.py",
> line 140, in register_include
> |     self._parse_include(filename)
> |   File
> "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/transformer.py",
> line 230, in _parse_include
> |     self._parse_include(dep_filename)
> |   File
> "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/transformer.py",
> line 225, in _parse_include
> |     self._cachestore.store(filename, parser)
> |   File
> "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/cachestore.py",
> line 153, in store
> |     shutil.move(tmp_filename, store_filename)
> |   File
> "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/python3.10/shutil.py",
> line 833, in move
> |     copy_function(src, real_dst)
> |   File
> "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/python3.10/shutil.py",
> line 435, in copy2
> |     copystat(src, dst, follow_symlinks=follow_symlinks)
> |   File
> "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/python3.10/shutil.py",
> line 374, in copystat
> |     lookup("utime")(dst, ns=(st.st_atime_ns, st.st_mtime_ns),
> | FileNotFoundError: [Errno 2] No such file or directory
>
> A similar issue is described in a fix for gobject-introspection-native.
>
>
> https://github.com/openembedded/openembedded-core/commit/d3c48ff7d19e86b2338b1778f9563969bba3d336
>
> The problem was fixed there by setting the environment variable
> GI_SCANNER_DISABLE_CACHE to disable the use of $HOME/.cache.
>
> Extend the fix to users of gobject-instropection by promoting the fix
> to the bbclass.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> (cherry picked from commit 35d5f707f6bb2ce5e9ab908e66e1ea9eeac754b1)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/gobject-introspection-data.bbclass              | 5 +++++
>  .../gobject-introspection/gobject-introspection_1.72.0.bb    | 3 ---
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/gobject-introspection-data.bbclass
> b/meta/classes/gobject-introspection-data.bbclass
> index 2ef684626a..d90cdb4839 100644
> --- a/meta/classes/gobject-introspection-data.bbclass
> +++ b/meta/classes/gobject-introspection-data.bbclass
> @@ -5,3 +5,8 @@
>  # so that qemu use can be avoided when necessary.
>  GI_DATA_ENABLED ?= "${@bb.utils.contains('DISTRO_FEATURES',
> 'gobject-introspection-data', \
>                        bb.utils.contains('MACHINE_FEATURES',
> 'qemu-usermode', 'True', 'False', d), 'False', d)}"
> +
> +do_compile:prepend() {
> +    # This prevents g-ir-scanner from writing cache data to $HOME
> +    export GI_SCANNER_DISABLE_CACHE=1
> +}
> diff --git a/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.72.0.bb
> b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
> index 355e77d107..9a47e908b7 100644
> --- a/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.72.0.bb
> +++ b/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.72.0.bb
> @@ -113,9 +113,6 @@ EOF
>  }
>
>  do_compile:prepend() {
> -        # This prevents g-ir-scanner from writing cache data to $HOME
> -        export GI_SCANNER_DISABLE_CACHE=1
> -
>          # Needed to run g-ir unit tests, which won't be able to find the
> built libraries otherwise
>          export GIR_EXTRA_LIBS_PATH=$B/.libs
>  }
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168536):
> https://lists.openembedded.org/g/openembedded-core/message/168536
> Mute This Topic: https://lists.openembedded.org/mt/92640670/894569
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> chuckwolber@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--000000000000cbd7e905e4e13ebc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>FWIW, the gobject-introspection-native recipe was one=
 of the &quot;canaries in the mine&quot; that reliably caused an image buil=
d to die while I was actively encountering this GCC10 compiler issue in Har=
dknott:</div><div><br></div><div><a href=3D"https://www.mail-archive.com/yo=
cto@lists.yoctoproject.org/msg06163.html">https://www.mail-archive.com/yoct=
o@lists.yoctoproject.org/msg06163.html</a></div><div><a href=3D"https://lis=
ts.yoctoproject.org/g/yocto/message/53971">https://lists.yoctoproject.org/g=
/yocto/message/53971</a></div><div><br></div><div>Upon re-reading my post, =
I regret that I did not mention this fact. The production image recipe I wa=
s working on at the time did not happen to involve gobject-introspection-na=
tive, so I overlooked it. Our other image recipes *DID* invoke gobject-intr=
ospection-native, but those were not as immediately important at the time, =
and I was trying to keep the problem description as focused as possible.<br=
></div><div><br></div><div>I do not expect this reply to result in anything=
 materially relevant to the problem (it still exists, but we use buildtools=
 to get around it) other than to add more data that may be relevant to some=
one googling something similar in the future.<br></div><div><br></div><div>=
..Ch:W..<br></div><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Jul 26, 2022 at 5:41 PM Steve Sakoman &lt;<a=
 href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">From: Tom Hochstein &lt=
;<a href=3D"mailto:tom.hochstein@nxp.com" target=3D"_blank">tom.hochstein@n=
xp.com</a>&gt;<br>
<br>
An intermittent failure occurs in libical-native do_compile:<br>
<br>
| Traceback (most recent call last):<br>
|=C2=A0 =C2=A0File &quot;/.../build/tmp/work/x86_64-linux/libical-native/3.=
0.14-r0/recipe-sysroot-native/usr/lib/python3.10/shutil.py&quot;, line 813,=
 in move<br>
|=C2=A0 =C2=A0 =C2=A0os.rename(src, real_dst)<br>
| OSError: [Errno 18] Invalid cross-device link: &#39;/tmp/g-ir-scanner-cac=
he-adxo_2bq&#39; -&gt; &#39;/home/bamboo/.cache/g-ir-scanner/bab9a83d2cd93e=
62ed005a2c1d4f89ae75c67251&#39;<br>
|<br>
| During handling of the above exception, another exception occurred:<br>
|<br>
| Traceback (most recent call last):<br>
|=C2=A0 =C2=A0File &quot;/.../tmp/work/x86_64-linux/libical-native/3.0.14-r=
0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/bin/g-ir-scanner&quo=
t;, line 99, in &lt;module&gt;<br>
|=C2=A0 =C2=A0 =C2=A0sys.exit(scanner_main(sys.argv))<br>
|=C2=A0 =C2=A0File &quot;/.../tmp/work/x86_64-linux/libical-native/3.0.14-r=
0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/scannermain=
.py&quot;, line 590, in scanner_main<br>
|=C2=A0 =C2=A0 =C2=A0transformer =3D create_transformer(namespace, options)=
<br>
|=C2=A0 =C2=A0File &quot;/.../tmp/work/x86_64-linux/libical-native/3.0.14-r=
0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/scannermain=
.py&quot;, line 409, in create_transformer<br>
|=C2=A0 =C2=A0 =C2=A0transformer.register_include(include_obj)<br>
|=C2=A0 =C2=A0File &quot;/.../tmp/work/x86_64-linux/libical-native/3.0.14-r=
0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/transformer=
.py&quot;, line 140, in register_include<br>
|=C2=A0 =C2=A0 =C2=A0self._parse_include(filename)<br>
|=C2=A0 =C2=A0File &quot;/.../tmp/work/x86_64-linux/libical-native/3.0.14-r=
0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/transformer=
.py&quot;, line 230, in _parse_include<br>
|=C2=A0 =C2=A0 =C2=A0self._parse_include(dep_filename)<br>
|=C2=A0 =C2=A0File &quot;/.../tmp/work/x86_64-linux/libical-native/3.0.14-r=
0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/transformer=
.py&quot;, line 225, in _parse_include<br>
|=C2=A0 =C2=A0 =C2=A0self._cachestore.store(filename, parser)<br>
|=C2=A0 =C2=A0File &quot;/.../tmp/work/x86_64-linux/libical-native/3.0.14-r=
0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/cachestore.=
py&quot;, line 153, in store<br>
|=C2=A0 =C2=A0 =C2=A0shutil.move(tmp_filename, store_filename)<br>
|=C2=A0 =C2=A0File &quot;/.../tmp/work/x86_64-linux/libical-native/3.0.14-r=
0/recipe-sysroot-native/usr/lib/python3.10/shutil.py&quot;, line 833, in mo=
ve<br>
|=C2=A0 =C2=A0 =C2=A0copy_function(src, real_dst)<br>
|=C2=A0 =C2=A0File &quot;/.../tmp/work/x86_64-linux/libical-native/3.0.14-r=
0/recipe-sysroot-native/usr/lib/python3.10/shutil.py&quot;, line 435, in co=
py2<br>
|=C2=A0 =C2=A0 =C2=A0copystat(src, dst, follow_symlinks=3Dfollow_symlinks)<=
br>
|=C2=A0 =C2=A0File &quot;/.../tmp/work/x86_64-linux/libical-native/3.0.14-r=
0/recipe-sysroot-native/usr/lib/python3.10/shutil.py&quot;, line 374, in co=
pystat<br>
|=C2=A0 =C2=A0 =C2=A0lookup(&quot;utime&quot;)(dst, ns=3D(st.st_atime_ns, s=
t.st_mtime_ns),<br>
| FileNotFoundError: [Errno 2] No such file or directory<br>
<br>
A similar issue is described in a fix for gobject-introspection-native.<br>
<br>
<a href=3D"https://github.com/openembedded/openembedded-core/commit/d3c48ff=
7d19e86b2338b1778f9563969bba3d336" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/openembedded/openembedded-core/commit/d3c48ff7d19e86b2338b1=
778f9563969bba3d336</a><br>
<br>
The problem was fixed there by setting the environment variable<br>
GI_SCANNER_DISABLE_CACHE to disable the use of $HOME/.cache.<br>
<br>
Extend the fix to users of gobject-instropection by promoting the fix<br>
to the bbclass.<br>
<br>
Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.com" t=
arget=3D"_blank">tom.hochstein@nxp.com</a>&gt;<br>
Signed-off-by: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bo=
otlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
(cherry picked from commit 35d5f707f6bb2ce5e9ab908e66e1ea9eeac754b1)<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/gobject-introspection-data.bbclass=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
=C2=A0.../gobject-introspection/<a href=3D"http://gobject-introspection_1.7=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">gobject-introspection_1.72.0.b=
b</a>=C2=A0 =C2=A0 | 3 ---<br>
=C2=A02 files changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/gobject-introspection-data.bbclass b/meta/classes=
/gobject-introspection-data.bbclass<br>
index 2ef684626a..d90cdb4839 100644<br>
--- a/meta/classes/gobject-introspection-data.bbclass<br>
+++ b/meta/classes/gobject-introspection-data.bbclass<br>
@@ -5,3 +5,8 @@<br>
=C2=A0# so that qemu use can be avoided when necessary.<br>
=C2=A0GI_DATA_ENABLED ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&=
#39;, &#39;gobject-introspection-data&#39;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bb.utils.contains(&#39;MACHINE_FEATURES&#39;, &#39;qemu-usermode&=
#39;, &#39;True&#39;, &#39;False&#39;, d), &#39;False&#39;, d)}&quot;<br>
+<br>
+do_compile:prepend() {<br>
+=C2=A0 =C2=A0 # This prevents g-ir-scanner from writing cache data to $HOM=
E<br>
+=C2=A0 =C2=A0 export GI_SCANNER_DISABLE_CACHE=3D1<br>
+}<br>
diff --git a/meta/recipes-gnome/gobject-introspection/<a href=3D"http://gob=
ject-introspection_1.72.0.bb" rel=3D"noreferrer" target=3D"_blank">gobject-=
introspection_1.72.0.bb</a> b/meta/recipes-gnome/gobject-introspection/<a h=
ref=3D"http://gobject-introspection_1.72.0.bb" rel=3D"noreferrer" target=3D=
"_blank">gobject-introspection_1.72.0.bb</a><br>
index 355e77d107..9a47e908b7 100644<br>
--- a/meta/recipes-gnome/gobject-introspection/<a href=3D"http://gobject-in=
trospection_1.72.0.bb" rel=3D"noreferrer" target=3D"_blank">gobject-introsp=
ection_1.72.0.bb</a><br>
+++ b/meta/recipes-gnome/gobject-introspection/<a href=3D"http://gobject-in=
trospection_1.72.0.bb" rel=3D"noreferrer" target=3D"_blank">gobject-introsp=
ection_1.72.0.bb</a><br>
@@ -113,9 +113,6 @@ EOF<br>
=C2=A0}<br>
<br>
=C2=A0do_compile:prepend() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This prevents g-ir-scanner from writing cach=
e data to $HOME<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GI_SCANNER_DISABLE_CACHE=3D1<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Needed to run g-ir unit tests, which wo=
n&#39;t be able to find the built libraries otherwise<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export GIR_EXTRA_LIBS_PATH=3D$B/.libs<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168536): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168536" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168536</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92640670/8945=
69" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
92640670/894569</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:chuckwolber@gmail.com" tar=
get=3D"_blank">chuckwolber@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><b><span style=3D"font-family:monospa=
ce">&quot;Perfection must be reached by degrees; she requires the slow hand=
 of time.&quot; - Voltaire</span></b></div></div></div></div>

--000000000000cbd7e905e4e13ebc--

