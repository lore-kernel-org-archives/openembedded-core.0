Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 52AFB7F3B6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 14:58:01 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id u192so1329430vkb.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wA3oKY/YjGb7X83WR8XeN6osf3VhnK0PGain9Vt37fQ=;
	b=cICQnu43A3KMUOA06Z3ZciJtIx4ExuYTgnbk8/zQIy72qVlTIBSJVvNZhxQXLB4syo
	5jXjZFAhrIUljwm5JmkNinVfVRP99SGxAzxRYuQz+tcpfSbTS2QtG1e6Us/M95f2yOws
	ImQ3WnyXkJHzD7dO+OTg3/EaLkLQLJ+eJT7/qwIclEEM32O2kg9UFJSI4n37b7BSfLWo
	ofaJngp/kQcx0+QX5sBm3UiMF8Y00bkLEaZyPV0Q692XqaYxJBlGizQP9PJyJib+tTzo
	//e/sWco3W/IrGdRqYPwIefdJcDnaC9rmVCynm/5EB5RML557sxUnlVUqcUe5E67aMTV
	ihdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wA3oKY/YjGb7X83WR8XeN6osf3VhnK0PGain9Vt37fQ=;
	b=Oz6xXpYbxltoeVJbceUINg1YerkyQXFx2cwVe4SFwpSWJaQfHuVBhhFAZ6QKDsTtJp
	/AFY/epFpcafjK1vIo3MVu+flvAG2SwAbPXLYExC3warWnzivMX+lPC15QS09VuGJStl
	DYggZ7qBvf5xOLyhRiF45QmyScJXHD2j+szXO2JWpVV7KRkcWAR3ZJX+Wwxpoo3DYhN4
	+Lf2g+Gr3EhpwuRaCjylGgXtPbFzPqtR0ZuRrMF99Y0FJhvAu7zS+9YmGp+X1l/L4Gvx
	BBNm5NZJiKGVQjKtTLVDtI26Xh+5V2hLCz7sYvmccjtxag2unHKVB2l839yJlgLSlT0q
	j/7Q==
X-Gm-Message-State: APjAAAVEdmd4NQhRnPtUlUbtynAZST6AfesdMmoF6HGEXy7+FZqEhiUO
	HS83gfyvRsn+FoWRzKXIP++Ektj+ndUJ4xBgrfI=
X-Google-Smtp-Source: APXvYqwM4HJUDdr9zuuJp1JE8ArppYQwCT7X3JdDspw3iz26qUT7P89ZkyZ/G4XoPAA3QN3CAq9EGGL0CbNUIlsHSDg=
X-Received: by 2002:ac5:ce9d:: with SMTP id 29mr255022vke.72.1567781882295;
	Fri, 06 Sep 2019 07:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567765705.git.alex.kanavin@gmail.com>
	<6e77eaadaddda55437eb3fabda41f66eb7d79356.1567765705.git.alex.kanavin@gmail.com>
	<CAMKF1srkdsYYz+s6Q8es+k-L11fd+FN+99AsFyJ2nZqD0a8diQ@mail.gmail.com>
In-Reply-To: <CAMKF1srkdsYYz+s6Q8es+k-L11fd+FN+99AsFyJ2nZqD0a8diQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Sep 2019 16:57:51 +0200
Message-ID: <CANNYZj995PtxptOPJZJcDkG5uoMz75zBJqpE+rks7fkjLW0YnA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
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
X-List-Received-Date: Fri, 06 Sep 2019 14:58:02 -0000
Content-Type: multipart/alternative; boundary="0000000000002dfa1b0591e3aa77"

--0000000000002dfa1b0591e3aa77
Content-Type: text/plain; charset="UTF-8"

I think the native dsitro features should still be in lockstep with target
distro features, for simplicity's sake. For example here, we enable native
opengl support only if the target also will have it. If the host system
can't handle opengl, then there'll be a runtime error from qemu.

Trying to manage native distro features according to what the host system
can do sounds like a lot of complexity, I'd rather just install missing
packages on the host, or print runtime/test time errors.

Alex

On Fri, 6 Sep 2019 at 16:26, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Fri, Sep 6, 2019 at 4:18 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> This will allow better control over native virgl/qemu configurations.
>>
>> Adjust gtk+3/cairo native configurations to actually ignore opengl
>> when building for -native: we do not need it, and it would cause build
>> failures as only a limited subset of mesa-native is currently built.
>>
>> Drop native/nativesdk overrides from virglrenderer/libepoxy recipes
>> as opengl feature is now correctly set for those variants.
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>  meta/conf/bitbake.conf                                     | 4 ++--
>>  meta/recipes-gnome/gtk+/gtk+3.inc                          | 2 ++
>>  meta/recipes-graphics/cairo/cairo_1.16.0.bb                | 2 ++
>>  meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb           | 2 --
>>  meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb | 2 --
>>  5 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index a0a7f4911e0..d36f4c6ccef 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -824,8 +824,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
>>
>>  # Normally target distro features will not be applied to native builds:
>>  # Native distro features on this list will use the target feature value
>> -DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
>> -DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
>> +DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation opengl"
>> +DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation opengl"
>>
>>  DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit
>> gobject-introspection-data ldconfig"
>>  MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
>> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc
>> b/meta/recipes-gnome/gtk+/gtk+3.inc
>> index 77b6c31536b..2f9e05b1cd4 100644
>> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
>> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
>> @@ -47,6 +47,8 @@ do_compile_prepend() {
>>
>>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayland
>> x11', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11',
>> 'glx', '', d)}"
>> +PACKAGECONFIG_class-native = "${@bb.utils.filter('DISTRO_FEATURES',
>> 'x11', d)}"
>> +PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES',
>> 'x11', d)}"
>>
>
> Should we extend distro features to non target recipes as well I wonder
> since I might have a development system which has full x11 and capable of
> running GTK with X11 but target maybe not will
> So is distro feature in someway related in these
> Different classes of recipes ?
>
>>
>>  PACKAGECONFIG[x11] =
>> "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11
>> libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite
>> libxfixes"
>>  # this is provided by oe-core patch that removes epoxy/gl dependency
>> from a X11 build
>> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
>> b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
>> index f32e9ba1bcd..84c7b0adde9 100644
>> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
>> +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
>> @@ -41,6 +41,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}
>> \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11
>> xcb', '', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
>> 'opengl', '', d)}"
>> +PACKAGECONFIG_class-native = "${@bb.utils.contains('DISTRO_FEATURES',
>> 'x11', 'x11 xcb', '', d)}"
>> +PACKAGECONFIG_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES',
>> 'x11', 'x11 xcb', '', d)}"
>>
>>  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no
>> --disable-xlib,${X11DEPENDS}"
>>  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
>> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
>> b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
>> index c8d1650c637..5d7639a929e 100644
>> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
>> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
>> @@ -14,8 +14,6 @@ UPSTREAM_CHECK_URI = "
>> https://github.com/anholt/libepoxy/releases"
>>  inherit meson pkgconfig distro_features_check
>>
>>  REQUIRED_DISTRO_FEATURES = "opengl"
>> -REQUIRED_DISTRO_FEATURES_class-native = ""
>> -REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
>>
>>  PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
>>  PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11 virtual/libgl"
>> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
>> b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
>> index d2b11c103a3..65365eb900a 100644
>> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
>> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
>> @@ -17,5 +17,3 @@ inherit autotools pkgconfig distro_features_check
>>  BBCLASSEXTEND = "native nativesdk"
>>
>>  REQUIRED_DISTRO_FEATURES = "opengl"
>> -REQUIRED_DISTRO_FEATURES_class-native = ""
>> -REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--0000000000002dfa1b0591e3aa77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think the native dsitro features should still be in=
 lockstep with target distro features, for simplicity&#39;s sake. For examp=
le here, we enable native opengl support only if the target also will have =
it. If the host system can&#39;t handle opengl, then there&#39;ll be a runt=
ime error from qemu.<br></div><div><br></div><div>Trying to manage native d=
istro features according to what the host system can do sounds like a lot o=
f complexity, I&#39;d rather just install missing packages on the host, or =
print runtime/test time errors.<br></div><div><br></div><div>Alex<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Fri, 6 Sep 2019 at 16:26, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div><div dir=3D"auto"><br></div></div><div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 6,=
 2019 at 4:18 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">This will allow better contro=
l over native virgl/qemu configurations.<br>
<br>
Adjust gtk+3/cairo native configurations to actually ignore opengl<br>
when building for -native: we do not need it, and it would cause build<br>
failures as only a limited subset of mesa-native is currently built.<br>
<br>
Drop native/nativesdk overrides from virglrenderer/libepoxy recipes<br>
as opengl feature is now correctly set for those variants.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 4 ++--<br>
=C2=A0meta/recipes-gnome/gtk+/gtk+3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=3D=
"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libepoxy_1.5.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 --<br>
=C2=A0meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_0=
.8.0.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.0.bb</a> | =
2 --<br>
=C2=A05 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index a0a7f4911e0..d36f4c6ccef 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -824,8 +824,8 @@ DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br>
<br>
=C2=A0# Normally target distro features will not be applied to native build=
s:<br>
=C2=A0# Native distro features on this list will use the target feature val=
ue<br>
-DISTRO_FEATURES_FILTER_NATIVE ?=3D &quot;api-documentation&quot;<br>
-DISTRO_FEATURES_FILTER_NATIVESDK ?=3D &quot;api-documentation&quot;<br>
+DISTRO_FEATURES_FILTER_NATIVE ?=3D &quot;api-documentation opengl&quot;<br=
>
+DISTRO_FEATURES_FILTER_NATIVESDK ?=3D &quot;api-documentation opengl&quot;=
<br>
<br>
=C2=A0DISTRO_FEATURES_BACKFILL =3D &quot;pulseaudio sysvinit gobject-intros=
pection-data ldconfig&quot;<br>
=C2=A0MACHINE_FEATURES_BACKFILL =3D &quot;rtc qemu-usermode&quot;<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gt=
k+3.inc<br>
index 77b6c31536b..2f9e05b1cd4 100644<br>
--- a/meta/recipes-gnome/gtk+/gtk+3.inc<br>
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc<br>
@@ -47,6 +47,8 @@ do_compile_prepend() {<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39=
;, &#39;opengl wayland x11&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl x11&#39;, &#39;glx&#=
39;, &#39;&#39;, d)}&quot;<br>
+PACKAGECONFIG_class-native =3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATUR=
ES&#39;, &#39;x11&#39;, d)}&quot;<br>
+PACKAGECONFIG_class-nativesdk =3D &quot;${@bb.utils.filter(&#39;DISTRO_FEA=
TURES&#39;, &#39;x11&#39;, d)}&quot;<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Should we extend=
 distro features to non target recipes as well I wonder since I might have =
a development system which has full x11 and capable of running GTK with X11=
 but target maybe not will</div><div dir=3D"auto">So is distro feature in s=
omeway related in these</div><div dir=3D"auto">Different classes of recipes=
 ?</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;--enable-x11-backend,--disable-x11-backe=
nd,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxra=
ndr libxrender libxcomposite libxfixes&quot;<br>
=C2=A0# this is provided by oe-core patch that removes epoxy/gl dependency =
from a X11 build<br>
diff --git a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a> b/meta/recipes-gr=
aphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=3D"noreferrer" target=
=3D"_blank">cairo_1.16.0.bb</a><br>
index f32e9ba1bcd..84c7b0adde9 100644<br>
--- a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=3D=
"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
+++ b/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=3D=
"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
@@ -41,6 +41,8 @@ X11DEPENDS =3D &quot;virtual/libx11 libsm libxrender libx=
ext&quot;<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39=
;, &#39;directfb&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11 xcb&#39;=
, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 opengl&#39;, &#39;openg=
l&#39;, &#39;&#39;, d)}&quot;<br>
+PACKAGECONFIG_class-native =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;x11&#39;, &#39;x11 xcb&#39;, &#39;&#39;, d)}&quot;<br>
+PACKAGECONFIG_class-nativesdk =3D &quot;${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;, &#39;x11&#39;, &#39;x11 xcb&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;--with-x=3Dyes -enable-xlib,--with-x=3Dn=
o --disable-xlib,${X11DEPENDS}&quot;<br>
=C2=A0PACKAGECONFIG[xcb] =3D &quot;--enable-xcb,--disable-xcb,libxcb&quot;<=
br>
diff --git a/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.=
3.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.3.bb</a> b/meta/rec=
ipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.3.bb" rel=3D"noreferr=
er" target=3D"_blank">libepoxy_1.5.3.bb</a><br>
index c8d1650c637..5d7639a929e 100644<br>
--- a/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libepoxy_1.5.3.bb</a><br>
+++ b/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libepoxy_1.5.3.bb</a><br>
@@ -14,8 +14,6 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.co=
m/anholt/libepoxy/releases" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/anholt/libepoxy/releases</a>&quot;<br>
=C2=A0inherit meson pkgconfig distro_features_check<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
-REQUIRED_DISTRO_FEATURES_class-native =3D &quot;&quot;<br>
-REQUIRED_DISTRO_FEATURES_class-nativesdk =3D &quot;&quot;<br>
<br>
=C2=A0PACKAGECONFIG[egl] =3D &quot;-Degl=3Dyes, -Degl=3Dno, virtual/egl&quo=
t;<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;-Dglx=3Dyes, -Dglx=3Dno, virtual/libx11 =
virtual/libgl&quot;<br>
diff --git a/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglren=
derer_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.0.bb=
</a> b/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_=
0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.0.bb</a><b=
r>
index d2b11c103a3..65365eb900a 100644<br>
--- a/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_0=
.8.0.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.0.bb</a><br=
>
+++ b/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_0=
.8.0.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.0.bb</a><br=
>
@@ -17,5 +17,3 @@ inherit autotools pkgconfig distro_features_check<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
-REQUIRED_DISTRO_FEATURES_class-native =3D &quot;&quot;<br>
-REQUIRED_DISTRO_FEATURES_class-nativesdk =3D &quot;&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>
</blockquote></div>

--0000000000002dfa1b0591e3aa77--
