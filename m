Return-Path: <gizero@gmail.com>
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8B177E9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:27:51 +0000 (UTC)
Received: by mail-yb0-f178.google.com with SMTP id e201so35699365ybb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PBEBxBIgHBYJQOnD2sgjfGpW3ipYqrXYiVwcVGbSGg8=;
	b=RSv4LZMdwEaNvEGGXU4cnrqA5GffNRh8KfuJjF7F4DU9nsk1wY4tNPiTDH+oOhiW5g
	vJ9Lwazalte+0Ee3239df1wj1vr81ssMBDG5hjDBckCS5lzbJ2o5oJ+UTIWJt0vGXkTK
	yIE5zDK6EpFRFkkqnQpjJSCYlmFaa4TLY/HCawdMr8ALOkZd8IV10KPBdGFHNu/d1nf0
	hvr4vO69UGcjNXUcyfdMkAIbwcW4gVVUz6VNVnCuTkzcfgxNXPecYceXk0ZIEcXW9P6i
	QozK+UpBnf9/9xdw4CKy+/rPuDg7g5MLrEZIG1ijOfv3LZ3BVqKNZvy1fH24BgBt96wW
	O8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PBEBxBIgHBYJQOnD2sgjfGpW3ipYqrXYiVwcVGbSGg8=;
	b=RpnCw8oBHEbIj2XYNUnrR0rEDFY5uWAqGIAXDvpJcce5g5KxHfwD1cWs4hDzgcBVg6
	SBH6gARul2YYnmkH7bbF5msRa5CSoeOs9p3XOVbWCE9KZ3x6hy8q1S0Gi6rlKJy3AUnx
	UGJsIcBhlCwP6zw7AnMZDkxZOxzMSbyrblB+6Lx3+oQMJIbh0rzrUj/tlyxq8nc9mQAL
	WnaWhmDtudnrj2cPO/l6A/qfaW9dc1Z5AuY1XAFBHthBI7BXGwlzFa+MGpTltCZWeHWG
	ulAU3xAB7jNyh+qU+iJwrQoKrezMrjVSsPqeZ7Zls3LixMOCE8xctcdw8nqQV31EQXsE
	+vug==
X-Gm-Message-State: AIVw113yMwmTXVnH8aV4wpvgQ01feH8QUxLsxc0ao+cXmOtqQQMD3lYJ
	U9od7p08xBs96VFBi6aozcVHK23/7w==
X-Received: by 10.37.210.67 with SMTP id j64mr17144475ybg.155.1499761672769;
	Tue, 11 Jul 2017 01:27:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.200.129 with HTTP; Tue, 11 Jul 2017 01:27:52 -0700 (PDT)
In-Reply-To: <CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Tue, 11 Jul 2017 10:27:52 +0200
Message-ID: <CAC+thW0WJB-=p32gyEy8v3_ALpPx8LhfFN2G-A=NA+FqYxsWag@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
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
X-List-Received-Date: Tue, 11 Jul 2017 08:27:52 -0000
Content-Type: multipart/alternative; boundary="94eb2c0600a6c0d93405540679ed"

--94eb2c0600a6c0d93405540679ed
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 9:42 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> On 10 July 2017 at 17:47, Andrea Galbusera <gizero@gmail.com> wrote:
>
>> On Tue, Jun 27, 2017 at 3:16 PM, Jussi Kukkonen <jussi.kukkonen@intel.com
>> > wrote:
>>
>>> Imports the current EGL API registry from Khronos.
>>>
>>> Makes EGL support optional: this is reflected in the recipe but
>>> egl is enabled by default as before.
>>>
>>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>> ---
>>>  .../libepoxy/{libepoxy_1.4.2.bb => libepoxy_1.4.3.bb}            | 9
>>> +++++----
>>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>>  rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.2.bb =>
>>> libepoxy_1.4.3.bb} (70%)
>>>
>>> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
>>> b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
>>> similarity index 70%
>>> rename from meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
>>> rename to meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
>>> index e69e828..c8b398f 100644
>>> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
>>> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
>>> @@ -6,15 +6,16 @@ LICENSE = "MIT"
>>>  LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d4
>>> 01e07bd9ee8b6b58cf464b"
>>>
>>>  SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${
>>> BP}.tar.xz"
>>> -SRC_URI[md5sum] = "632fcfd7ae9d21f5a634326d753a89c4"
>>> -SRC_URI[sha256sum] = "bea6fdec3d10939954495da898d87
>>> 2ee836b75c35699074cbf02a64fcb80d5b3"
>>> +SRC_URI[md5sum] = "af4c3ce0fb1143bdc4e43f85695a9bed"
>>> +SRC_URI[sha256sum] = "0b808a06c9685a62fca34b680abb8
>>> bc7fb2fda074478e329b063c1f872b826f6"
>>>  UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
>>>
>>>  inherit autotools pkgconfig distro_features_check
>>>
>>>  REQUIRED_DISTRO_FEATURES = "opengl"
>>>
>>> -DEPENDS = "util-macros virtual/egl"
>>> +DEPENDS = "util-macros"
>>>
>>> +PACKAGECONFIG[egl] = "--enable-egl, --disable-egl, virtual/egl"
>>>  PACKAGECONFIG[x11] = "--enable-glx, --disable-glx, virtual/libx11"
>>> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>>> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}
>>> egl"
>>> --
>>> 2.1.4
>>>
>>
>> Beside the issue with recent patch to mesa, also this one seems to have
>> caused nasty effects on raspberrypi builds... I got to it after bisecting
>> poky from 854c8c2 that failed with:
>>
>> ERROR: gtk+3-3.22.16-r0 do_prepare_recipe_sysroot: Error executing a
>> python function in exec_python_func() autogenerated:
>>
>> The stack trace of python calls that resulted in this exception/failure
>> was:
>> File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
>>      0001:
>>  *** 0002:extend_recipe_sysroot(d)
>>      0003:
>> File: '/home/gizero/work/smartliving/distro/repo-master/build-poky
>> /conf/../../layers/poky/meta/classes/staging.bbclass', lineno: 510,
>> function: extend_recipe_sysroot
>>      0506:                    dest = newmanifest[l]
>>      0507:                    if l.endswith("/"):
>>      0508:                        staging_copydir(l, targetdir, dest,
>> seendirs)
>>      0509:                        continue
>>  *** 0510:                    staging_copyfile(l, targetdir, dest,
>> postinsts, seendirs)
>>      0511:
>>      0512:    for f in fixme:
>>      0513:        if f == '':
>>      0514:            staging_processfixme(fixme[f], recipesysroot,
>> recipesysroot, recipesysrootnative, d)
>> File: '/home/gizero/work/smartliving/distro/repo-master/build-poky
>> /conf/../../layers/poky/meta/classes/staging.bbclass', lineno: 151,
>> function: staging_copyfile
>>      0147:        os.symlink(linkto, dest)
>>      0148:        #bb.warn(c)
>>      0149:    else:
>>      0150:        try:
>>  *** 0151:            os.link(c, dest)
>>      0152:        except OSError as err:
>>      0153:            if err.errno == errno.EXDEV:
>>      0154:                bb.utils.copyfile(c, dest)
>>      0155:            else:
>> Exception: FileExistsError: [Errno 17] File exists:
>> '/home/gizero/work/smartliving/distro/repo-master/build-poky
>> /tmp/sysroots-components/raspberrypi3/userland/usr/include/KHR/khrplatform.h'
>> -> '/home/gizero/work/smartliving/distro/repo-master/build-poky
>> /tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/gtk+3/3.
>> 22.16-r0/recipe-sysroot/usr/include/KHR/khrplatform.h'
>>
>
> /usr/include/KHR/khrplatform.h is the egl platform header file, provided
> by both mesa and RPI userland. Does mesa end up in your gtk+3
> recipe-sysroot somehow?
>

Indeed, both mesa-gl and userland are listed in
tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/gtk+3/3.22.16-r0/recipe-sysroot/sysroot-providers.
Are these two conflicting? Something I can do to help nailing it down? I
managed to call cleansstate for all recipes in userland, gtk+3 and mesa but
I end up with the same recipe-sysroot...


>
> For clarity: this could be a bug but it is unlikely to be related to the
> libepoxy change (it does not use or ship the actual header file).
>

--94eb2c0600a6c0d93405540679ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jul 11, 2017 at 9:42 AM, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"=
><div><div class=3D"gmail-h5">On 10 July 2017 at 17:47, Andrea Galbusera <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:gizero@gmail.com" target=3D"_blank">g=
izero@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div><div class=3D"gmail-m_-30490644368046=
89204gmail-h5"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On Tue=
, Jun 27, 2017 at 3:16 PM, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"=
mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Imports the current EGL API registry from Khronos.<br>
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
<span class=3D"gmail-m_-3049064436804689204gmail-m_702832814543370566m_8272=
02577286063731gmail-HOEnZb"><font color=3D"#888888">--<br>
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
aster/build-poky<wbr>/conf/../../layers/poky/meta/<wbr>classes/staging.bbcl=
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
/smartliving<wbr>/distro/repo-master/build-poky<wbr>/conf/../../layers/poky=
/meta/<wbr>classes/staging.bbclass&#39;, lineno: 151, function: staging_cop=
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
-poky<wbr>/tmp/sysroots-components/raspb<wbr>errypi3/userland/usr/include/<=
wbr>KHR/khrplatform.h&#39; -&gt; &#39;/home/gizero/work/smartliving<wbr>/di=
stro/repo-master/build-poky<wbr>/tmp/work/cortexa7hf-neon-vfpv<wbr>4-poky-l=
inux-gnueabi/gtk+3/3.<wbr>22.16-r0/recipe-sysroot/usr/<wbr>include/KHR/khrp=
latform.h&#39;<br></div></div></blockquote><div><br></div></div></div><div>=
/usr/include/KHR/khrplatform.h is the egl platform header file, provided by=
 both mesa and RPI userland. Does mesa end up in your gtk+3 recipe-sysroot =
somehow?<br></div></div></div></div></blockquote><div><br></div><div>Indeed=
, both mesa-gl and userland are listed in tmp/work/cortexa7hf-neon-vfpv4-po=
ky-linux-gnueabi/gtk+3/3.22.16-r0/recipe-sysroot/sysroot-providers. Are the=
se two conflicting? Something I can do to help nailing it down? I managed t=
o call cleansstate for all recipes in userland, gtk+3 and mesa but I end up=
 with the same recipe-sysroot...<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extr=
a"><div class=3D"gmail_quote"><div></div><div><br></div><div>For clarity: t=
his could be a bug but it is unlikely to be related to the libepoxy change =
(it does not use or ship the actual header file).<br></div></div></div></di=
v></blockquote><div><br><br>=C2=A0</div></div></div></div>

--94eb2c0600a6c0d93405540679ed--
