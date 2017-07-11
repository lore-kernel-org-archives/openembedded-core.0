Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD8877E88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 07:42:51 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id k192so11429809ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bE5b//TkXgvoiyv5MWcjN4J+5eOgBDZcnuM6HUvTl2s=;
	b=CzCZqPzmKtJbPuUcX6j7q53TOHeKkEVuzTo3Xd0keYM3QXterQax8EC2ITP6sZIymj
	ZNJ+HQd0FnsOpGkZnnvpgJVEsabp8bX/+tqrBv3jURIhm1QQ8pXJ8dLoiOiySvT4j3tL
	3nb+zGf7nP8JJb+F+M0Fx7eHmQdyGXYtWYHxxJxaenfKe+iwUhI9l1RFw6/+a96Db5PQ
	Y22EiyV9u4Ld8gIPj0anwC6tTyofMvrx1lmeRu72mFk2tJa/rzGUZdmchaSyFgA0VXDh
	h8hsZR5WdAffBOkGJvIKrOjMXF/+lXVvSbqDVgX3XfTOb/PEfr8z+OE6hz8ENutnQn7F
	ORTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bE5b//TkXgvoiyv5MWcjN4J+5eOgBDZcnuM6HUvTl2s=;
	b=pgU2iOFIehlF5URnZSZdgvfcMBoTaxl2dcqYXwazV2KIFTQN4qQTm9T6uUNRg0aTub
	Xmv2khQDUyKXHgIAUOLKggq0Jb6ZCGYDqZoE1f2bcVGVK8Rnc+7D5nBuDmBuMVJ6am/r
	syPunO6l0AxKHK8f/EqJBDLxSIKdaJBVA+F32WA74uWUqajQKMLEotOJDLscdOwA0aPQ
	gc5IRAR5hmivfk0s3NlS66p1K1hd2XK2W8kS/z0ODQoSkJnOS5JfHthDY2I2OsVrgpq/
	GTkVXDZt3agCdZ/7EAfzNkJwCSORt9EULJ5N4JKyXOGXn88Z+w30814k1sXLqUOdFpcf
	Y/aw==
X-Gm-Message-State: AIVw112ZwsW71VKirwmZN1oLvzvXjHguKoVUwwaPsMRe2JeGs9y6a+Hc
	vuMYlon2y6NPpUIoHjQCc9p9L9cPVarm
X-Received: by 10.36.204.9 with SMTP id x9mr2118377itf.5.1499758973049; Tue,
	11 Jul 2017 00:42:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Tue, 11 Jul 2017 00:42:22 -0700 (PDT)
In-Reply-To: <CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 11 Jul 2017 10:42:22 +0300
Message-ID: <CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libepoxy: Upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Tue, 11 Jul 2017 07:42:54 -0000
Content-Type: multipart/alternative; boundary="94eb2c05a632d6a54a055405d8b1"

--94eb2c05a632d6a54a055405d8b1
Content-Type: text/plain; charset="UTF-8"

On 10 July 2017 at 17:47, Andrea Galbusera <gizero@gmail.com> wrote:

> On Tue, Jun 27, 2017 at 3:16 PM, Jussi Kukkonen <jussi.kukkonen@intel.com>
> wrote:
>
>> Imports the current EGL API registry from Khronos.
>>
>> Makes EGL support optional: this is reflected in the recipe but
>> egl is enabled by default as before.
>>
>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> ---
>>  .../libepoxy/{libepoxy_1.4.2.bb => libepoxy_1.4.3.bb}            | 9
>> +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>  rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.2.bb =>
>> libepoxy_1.4.3.bb} (70%)
>>
>> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
>> b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
>> similarity index 70%
>> rename from meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
>> rename to meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
>> index e69e828..c8b398f 100644
>> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
>> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
>> @@ -6,15 +6,16 @@ LICENSE = "MIT"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
>>
>>  SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${
>> BP}.tar.xz"
>> -SRC_URI[md5sum] = "632fcfd7ae9d21f5a634326d753a89c4"
>> -SRC_URI[sha256sum] = "bea6fdec3d10939954495da898d87
>> 2ee836b75c35699074cbf02a64fcb80d5b3"
>> +SRC_URI[md5sum] = "af4c3ce0fb1143bdc4e43f85695a9bed"
>> +SRC_URI[sha256sum] = "0b808a06c9685a62fca34b680abb8
>> bc7fb2fda074478e329b063c1f872b826f6"
>>  UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
>>
>>  inherit autotools pkgconfig distro_features_check
>>
>>  REQUIRED_DISTRO_FEATURES = "opengl"
>>
>> -DEPENDS = "util-macros virtual/egl"
>> +DEPENDS = "util-macros"
>>
>> +PACKAGECONFIG[egl] = "--enable-egl, --disable-egl, virtual/egl"
>>  PACKAGECONFIG[x11] = "--enable-glx, --disable-glx, virtual/libx11"
>> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
>> --
>> 2.1.4
>>
>
> Beside the issue with recent patch to mesa, also this one seems to have
> caused nasty effects on raspberrypi builds... I got to it after bisecting
> poky from 854c8c2 that failed with:
>
> ERROR: gtk+3-3.22.16-r0 do_prepare_recipe_sysroot: Error executing a
> python function in exec_python_func() autogenerated:
>
> The stack trace of python calls that resulted in this exception/failure
> was:
> File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:extend_recipe_sysroot(d)
>      0003:
> File: '/home/gizero/work/smartliving/distro/repo-master/build-
> poky/conf/../../layers/poky/meta/classes/staging.bbclass', lineno: 510,
> function: extend_recipe_sysroot
>      0506:                    dest = newmanifest[l]
>      0507:                    if l.endswith("/"):
>      0508:                        staging_copydir(l, targetdir, dest,
> seendirs)
>      0509:                        continue
>  *** 0510:                    staging_copyfile(l, targetdir, dest,
> postinsts, seendirs)
>      0511:
>      0512:    for f in fixme:
>      0513:        if f == '':
>      0514:            staging_processfixme(fixme[f], recipesysroot,
> recipesysroot, recipesysrootnative, d)
> File: '/home/gizero/work/smartliving/distro/repo-master/build-
> poky/conf/../../layers/poky/meta/classes/staging.bbclass', lineno: 151,
> function: staging_copyfile
>      0147:        os.symlink(linkto, dest)
>      0148:        #bb.warn(c)
>      0149:    else:
>      0150:        try:
>  *** 0151:            os.link(c, dest)
>      0152:        except OSError as err:
>      0153:            if err.errno == errno.EXDEV:
>      0154:                bb.utils.copyfile(c, dest)
>      0155:            else:
> Exception: FileExistsError: [Errno 17] File exists:
> '/home/gizero/work/smartliving/distro/repo-master/build-
> poky/tmp/sysroots-components/raspberrypi3/userland/usr/include/KHR/khrplatform.h'
> -> '/home/gizero/work/smartliving/distro/repo-master/build-
> poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/gtk+
> 3/3.22.16-r0/recipe-sysroot/usr/include/KHR/khrplatform.h'
>

/usr/include/KHR/khrplatform.h is the egl platform header file, provided by
both mesa and RPI userland. Does mesa end up in your gtk+3 recipe-sysroot
somehow?

For clarity: this could be a bug but it is unlikely to be related to the
libepoxy change (it does not use or ship the actual header file).

 - Jussi

--94eb2c05a632d6a54a055405d8b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
0 July 2017 at 17:47, Andrea Galbusera <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:gizero@gmail.com" target=3D"_blank">gizero@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div><div class=3D"gmail-h5"><div class=3D"gmail_extra"><div class=3D"gmail_=
quote">On Tue, Jun 27, 2017 at 3:16 PM, Jussi Kukkonen <span dir=3D"ltr">&l=
t;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukko=
nen@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Imports the current EGL API registry from Khronos.<br>
<br>
Makes EGL support optional: this is reflected in the recipe but<br>
egl is enabled by default as before.<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0.../libepoxy/{<a href=3D"http://libepoxy_1.4.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">libepoxy_1.4.2.<wbr>bb</a> =3D&gt; <a href=3D"http://lib=
epoxy_1.4.3.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/libepoxy<wbr>/{<a href=3D"http://libepox=
y_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.2.bb</a> =3D&=
gt; <a href=3D"http://libepoxy_1.4.3.bb" rel=3D"noreferrer" target=3D"_blan=
k">libepoxy_1.4.3.bb</a>} (70%)<br>
<br>
diff --git a/meta/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy=
_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.2.bb</a> b/met=
a/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy_1.4.3.bb" rel=
=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a><br>
similarity index 70%<br>
rename from meta/recipes-graphics/libepoxy<wbr>/<a href=3D"http://libepoxy_=
1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.2.bb</a><br>
rename to meta/recipes-graphics/libepoxy<wbr>/<a href=3D"http://libepoxy_1.=
4.3.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a><br>
index e69e828..c8b398f 100644<br>
--- a/meta/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy_1.4.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.2.bb</a><br>
+++ b/meta/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy_1.4.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a><br>
@@ -6,15 +6,16 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D58ef4c80d4<wbr>01e07b=
d9ee8b6b58cf464b&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/anholt/$%7BBPN%7D/rel=
eases/download/$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/anholt/${B<wbr>PN}/releases/download/${PV}/${<wbr>B=
P}.tar.xz</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;632fcfd7ae9d21f5a634326d753a8<wbr>9c4&quot;<br>
-SRC_URI[sha256sum] =3D &quot;bea6fdec3d10939954495da898d87<wbr>2ee836b75c3=
5699074cbf02a64fcb8<wbr>0d5b3&quot;<br>
+SRC_URI[md5sum] =3D &quot;af4c3ce0fb1143bdc4e43f85695a9<wbr>bed&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0b808a06c9685a62fca34b680abb8<wbr>bc7fb2fda07=
4478e329b063c1f872b<wbr>826f6&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/anholt/lib=
epoxy/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/anh=
olt/lib<wbr>epoxy/releases</a>&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig distro_features_check<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
<br>
-DEPENDS =3D &quot;util-macros virtual/egl&quot;<br>
+DEPENDS =3D &quot;util-macros&quot;<br>
<br>
+PACKAGECONFIG[egl] =3D &quot;--enable-egl, --disable-egl, virtual/egl&quot=
;<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;--enable-glx, --disable-glx, virtual/lib=
x11&quot;<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FE<wbr>ATURES&#39=
;, &#39;x11&#39;, d)}&quot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FE<wbr>ATURES&#39=
;, &#39;x11&#39;, d)} egl&quot;<br>
<span class=3D"gmail-m_702832814543370566m_827202577286063731gmail-HOEnZb">=
<font color=3D"#888888">--<br>
2.1.4</font></span><br></blockquote></div><br></div></div></div><div class=
=3D"gmail_extra">Beside the issue with recent patch to mesa, also this one =
seems to have caused nasty effects on raspberrypi builds... I got to it aft=
er bisecting poky from 854c8c2 that failed with:<br><br>ERROR: gtk+3-3.22.1=
6-r0 do_prepare_recipe_sysroot: Error executing a python function in exec_p=
ython_func() autogenerated:<br><br>The stack trace of python calls that res=
ulted in this exception/failure was:<br>File: &#39;exec_python_func() autog=
enerated&#39;, lineno: 2, function: &lt;module&gt;<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 0001:<br>=C2=A0*** 0002:extend_recipe_sysroot(d)<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 0003:<br>File: &#39;/home/gizero/work/smartliving<wbr>/distro/repo-m=
aster/build-<wbr>poky/conf/../../layers/poky/<wbr>meta/classes/staging.bbcl=
ass&#39;, lineno: 510, function: extend_recipe_sysroot<br>=C2=A0=C2=A0=C2=
=A0=C2=A0 0506:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dest =3D newmanifest=
[l]<br>=C2=A0=C2=A0=C2=A0=C2=A0 0507:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if l.endswith(&quot;/&quot;):<br>=C2=A0=C2=A0=C2=A0=C2=A0 0508:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging_copydir(l=
, targetdir, dest, seendirs)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0509:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue<br>=C2=A0*** 0=
510:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging_copyfile(l, targetdir=
, dest, postinsts, seendirs)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0511:<br>=C2=A0=C2=
=A0=C2=A0=C2=A0 0512:=C2=A0=C2=A0=C2=A0 for f in fixme:<br>=C2=A0=C2=A0=C2=
=A0=C2=A0 0513:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if f =3D=3D &#39;=
&#39;:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0514:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging_processfixme(fixme[f], recipesysr=
oot, recipesysroot, recipesysrootnative, d)<br>File: &#39;/home/gizero/work=
/smartliving<wbr>/distro/repo-master/build-<wbr>poky/conf/../../layers/poky=
/<wbr>meta/classes/staging.bbclass&#39;, lineno: 151, function: staging_cop=
yfile<br>=C2=A0=C2=A0=C2=A0=C2=A0 0147:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 os.symlink(linkto, dest)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0148:=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #bb.warn(c)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0=
149:=C2=A0=C2=A0=C2=A0 else:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0150:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:<br>=C2=A0*** 0151:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.link(c, dest)<br>=C2=A0=C2=
=A0=C2=A0=C2=A0 0152:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except OSEr=
ror as err:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0153:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if err.errno =3D=3D errno.EXDEV:<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0154:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.utils.copyfile(c, dest)<br=
>=C2=A0=C2=A0=C2=A0=C2=A0 0155:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 else:<br>Exception: FileExistsError: [Errno 17] Fi=
le exists: &#39;/home/gizero/work/smartliving<wbr>/distro/repo-master/build=
-<wbr>poky/tmp/sysroots-components/r<wbr>aspberrypi3/userland/usr/inclu<wbr=
>de/KHR/khrplatform.h&#39; -&gt; &#39;/home/gizero/work/smartliving<wbr>/di=
stro/repo-master/build-<wbr>poky/tmp/work/cortexa7hf-neon-<wbr>vfpv4-poky-l=
inux-gnueabi/gtk+<wbr>3/3.22.16-r0/recipe-sysroot/<wbr>usr/include/KHR/khrp=
latform.h&#39;<br></div></div></blockquote><div><br></div><div>/usr/include=
/KHR/khrplatform.h is the egl platform header file, provided by both mesa a=
nd RPI userland. Does mesa end up in your gtk+3 recipe-sysroot somehow?<br>=
</div><div><br></div><div>For clarity: this could be a bug but it is unlike=
ly to be related to the libepoxy change (it does not use or ship the actual=
 header file).</div><div>=C2=A0</div><div>=C2=A0- Jussi</div><div><br></div=
></div></div></div>

--94eb2c05a632d6a54a055405d8b1--
