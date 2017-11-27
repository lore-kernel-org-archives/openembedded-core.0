Return-Path: <limon.anibal@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id F05C378055
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 23:14:29 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id w73so9541835wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 15:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K+G9rHoup0+iurGBJOCWVGX/xgIIM1MH+BDpx+ms6Y4=;
	b=qPLR9rpLvGBr+Lj2TTE/hoy8sB0SE0L9/GIXEoSKwSbSPvV3olBwI08AWu0OZ+ZGXL
	4yDmZBQ+FtY7WiY8EHqvGcMv6S9HF8+XWdP34cUeNrmyO55LA+VQ/DdLsHUeQExO73e8
	VoPG/jGZa2RNEnLBTiDcWezXfT/2PHZWLCHZOyBxL46w/gtxWYmqmg/xaA4K5xLl4PHq
	LqbHmwxXVF/B3fUHmtEPURKpD1y05bDGDHQ4DikvRtfURmv0sSIzyjeilvCX2xQgxFgj
	nAYH+rO4ubk4zd1igRNjXC/naQw4gOIrjuSdoZqcExQbswtEcn8szULwrR/EIKEkypSR
	837A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K+G9rHoup0+iurGBJOCWVGX/xgIIM1MH+BDpx+ms6Y4=;
	b=BzH3hR2Q+MFw/YJpWup/dH/6fF8V9RZJTBxqE+JbPcAzT4tkunXoKz6WU3pMWUaDcp
	vUm4kwBcXEi0DeOVXh/RR46GGf9okEOrkFkMFN6IKtG0MN+bfEUzMk+2yXJ2n+Vxbju2
	mTbPs39R+szZU+iy0woIFhE9Hn4AJYdHGt5VudmuIuCAz3QfMFsxw3SbTknG7xbxGawO
	U8cv2cvtDNVcpldzKGu0Gy9aYo8jpFbAyzEV5O3i7QOoN3Mjv8vHdStrJKGOqVMD6ZXC
	LwH/rhaeWFzJXyuRzzCGyxvoMMj++xWfKjgERMsZd4C6CVhfZpwXf9em9bouN2BVPSA4
	zwjQ==
X-Gm-Message-State: AJaThX5rAUEbN2DcgOU38XyL0Daw+imRZ/6vnpTbj4nhUbmwqYHHjwol
	uhbNzPopWSR+OCnfzniAFcrwAlt7gZIoEuUsjWw=
X-Google-Smtp-Source: AGs4zMaEMQ8ZKgfbctmzuDpEP3OXlBy98nuF8UGnwTmzmoT8b34paFvClxoXQ5FsBfOk+OriGTFnOaFA7ibJRdEc4lU=
X-Received: by 10.80.245.172 with SMTP id u41mr54412353edm.195.1511824470637; 
	Mon, 27 Nov 2017 15:14:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.241.18 with HTTP; Mon, 27 Nov 2017 15:14:30 -0800 (PST)
In-Reply-To: <5cff7c9d-788c-65bf-0576-88a71ac4ccf3@windriver.com>
References: <20171124165203.11759-1-limon.anibal@gmail.com>
	<5cff7c9d-788c-65bf-0576-88a71ac4ccf3@windriver.com>
From: =?UTF-8?Q?Anibal_Lim=C3=B3n?= <limon.anibal@gmail.com>
Date: Mon, 27 Nov 2017 17:14:30 -0600
Message-ID: <CAPS-YPCi9PXq72rO6B8ae-3Sa+FQ6+Z9yhG7pLBnyzgJY4Y8aQ@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] recipes-graphics/piglit: Add patch for fix build in HiKey platforms
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
X-List-Received-Date: Mon, 27 Nov 2017 23:14:30 -0000
Content-Type: multipart/alternative; boundary="001a114811fa8900fb055eff10b0"

--001a114811fa8900fb055eff10b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2017 at 5:06 PM, Randy MacLeod <randy.macleod@windriver.com=
>
wrote:

> On 2017-11-24 11:52 AM, An=C3=ADbal Lim=C3=B3n wrote:
>
>> From: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>>
>> Some EGL implementations do not actually ship all Khronos-extensions.
>> As it turns out, the Mali 450 driver does not include
>> eglGetPlatformDisplay
>> symbol so there is not grauntee to exists use
>> piglit_egl_get_default_display
>>
>
> Anibal,
>
> First, my grammar OCD corrections,   :)
>
> s/grauntee/guarantee/
>

Ok, typo.


>
> and more generally:
>   so there is not guarantee ...
>   so there is no guarantee that it exists,
>      use piglit_egl_get_default_display
>
> or just use the upstream commit log:
>     The entry point is not guaranteed to exist, so use the
>     piglit_egl_get_default_display() helper which does the
>     correct thing.
>
>
> This a backport of 45095dc08b from the piglet git repo
> so please make that clear in the long log as well.
>

This isn't a backport, i will explain better in the commit message.

Cheers,
Anibal



>
> Thanks,
>
> ../Randy
>
>
>
> wrapper instead.
>>
>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
>> ---
>>   ...gl-context-priority.c-Use-piglit_egl_get_.patch | 39
>> ++++++++++++++++++++++
>>   meta/recipes-graphics/piglit/piglit_git.bb         |  1 +
>>   2 files changed, 40 insertions(+)
>>   create mode 100644 meta/recipes-graphics/piglit/p
>> iglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch
>>
>> diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-
>> context-priority.c-Use-piglit_egl_get_.patch
>> b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-
>> context-priority.c-Use-piglit_egl_get_.patch
>> new file mode 100644
>> index 0000000000..6b73950fc1
>> --- /dev/null
>> +++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-
>> context-priority.c-Use-piglit_egl_get_.patch
>> @@ -0,0 +1,39 @@
>> +From 3b6c3abe3698abb0ae08d14a399eea29805cafd6 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?An=3DC3=3DADbal=3D20Lim=3DC3=3DB3n?=3D <anibal.limon@=
linaro.org>
>> +Date: Fri, 24 Nov 2017 10:11:42 -0600
>> +Subject: [PATCH] tests/egl/egl-context-priority.c: Use
>> + piglit_egl_get_default_display
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Some EGL implementations do not actually ship all Khronos-extensions.
>> +As it turns out, the Mali 450 driver does not include
>> eglGetPlatformDisplay
>> +symbol so there is not grauntee to exists use
>> piglit_egl_get_default_display
>> +wrapper instead. See rev 45095dc08b.
>> +
>> +Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>> +Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
>> +
>> +Upstream-Status: Submitted [piglit@lists.freedesktop.org]
>> +---
>> + tests/egl/egl-context-priority.c | 3 +--
>> + 1 file changed, 1 insertion(+), 2 deletions(-)
>> +
>> +diff --git a/tests/egl/egl-context-priority.c
>> b/tests/egl/egl-context-priority.c
>> +index 7f26fc614..9590ccae3 100644
>> +--- a/tests/egl/egl-context-priority.c
>> ++++ b/tests/egl/egl-context-priority.c
>> +@@ -99,8 +99,7 @@ piglit_init(int argc, char **argv)
>> +       if (!strstr(exts, "EGL_MESA_platform_surfaceless"))
>> +               piglit_report_result(PIGLIT_SKIP);
>> +
>> +-      dpy =3D eglGetPlatformDisplay(EGL_PLATFORM_SURFACELESS_MESA,
>> +-                                  EGL_DEFAULT_DISPLAY, NULL);
>> ++      dpy =3D piglit_egl_get_default_display(EGL_PLATFORM_SURFACELESS_
>> MESA);
>> +
>> +       ok =3D eglInitialize(dpy, &major, &minor);
>> +       if (!ok) {
>> +--
>> +2.11.0
>> +
>> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb
>> b/meta/recipes-graphics/piglit/piglit_git.bb
>> index eae3eed342..c6d4e5c6e0 100644
>> --- a/meta/recipes-graphics/piglit/piglit_git.bb
>> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
>> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db2beded710
>> 3a3d8a442a2a0391d607b0"
>>   SRC_URI =3D "git://anongit.freedesktop.org/piglit \
>>              file://0001-cmake-install-bash-completions-in-the-right-pla=
ce.patch
>> \
>>              file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv=
.h.patch
>> \
>> +           file://0001-tests-egl-egl-context-priority.c-Use-piglit_egl_=
get_.patch
>> \
>>              "
>>     # From 2017-02-06
>>
>>
>
> --
> # Randy MacLeod.  WR Linux
> # Wind River an Intel Company
>

--001a114811fa8900fb055eff10b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Nov 27, 2017 at 5:06 PM, Randy MacLeod <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:randy.macleod@windriver.com" target=3D"_blank">randy.macleo=
d@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On 2017-11-24 11:52 AM, An=C3=ADbal Lim=C3=B3n wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org"=
 target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
<br>
Some EGL implementations do not actually ship all Khronos-extensions.<br>
As it turns out, the Mali 450 driver does not include eglGetPlatformDisplay=
<br>
symbol so there is not grauntee to exists use piglit_egl_get_default_displa=
y<br>
</blockquote>
<br></span>
Anibal,<br>
<br>
First, my grammar OCD corrections,=C2=A0 =C2=A0:)<br>
<br>
s/grauntee/guarantee/<br></blockquote><div><br></div><div>Ok, typo.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
<br>
and more generally:<br>
=C2=A0 so there is not guarantee ...<br>
=C2=A0 so there is no guarantee that it exists,<br>
=C2=A0 =C2=A0 =C2=A0use piglit_egl_get_default_display<br>
<br>
or just use the upstream commit log:<br>
=C2=A0 =C2=A0 The entry point is not guaranteed to exist, so use the<br>
=C2=A0 =C2=A0 piglit_egl_get_default_display<wbr>() helper which does the<b=
r>
=C2=A0 =C2=A0 correct thing.<br>
<br>
<br>
This a backport of 45095dc08b from the piglet git repo<br>
so please make that clear in the long log as well.<br></blockquote><div><br=
></div><div>This isn&#39;t a backport, i will explain better in the commit =
message.</div><div><br></div><div>Cheers,</div><div>Anibal</div><div><br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
<br>
../Randy<div><div class=3D"h5"><br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
wrapper instead.<br>
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
Signed-off-by: Daniel D=C3=ADaz &lt;<a href=3D"mailto:daniel.diaz@linaro.or=
g" target=3D"_blank">daniel.diaz@linaro.org</a>&gt;<br>
---<br>
=C2=A0 ...gl-context-priority.c-Use-p<wbr>iglit_egl_get_.patch | 39 +++++++=
+++++++++++++++<br>
=C2=A0 meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D=
"noreferrer" target=3D"_blank">p<wbr>iglit_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0 2 files changed, 40 insertions(+)<br>
=C2=A0 create mode 100644 meta/recipes-graphics/piglit/p<wbr>iglit/0001-tes=
ts-egl-egl-conte<wbr>xt-priority.c-Use-piglit_egl_<wbr>get_.patch<br>
<br>
diff --git a/meta/recipes-graphics/piglit<wbr>/piglit/0001-tests-egl-egl-<w=
br>context-priority.c-Use-piglit_<wbr>egl_get_.patch b/meta/recipes-graphic=
s/piglit<wbr>/piglit/0001-tests-egl-egl-<wbr>context-priority.c-Use-piglit_=
<wbr>egl_get_.patch<br>
new file mode 100644<br>
index 0000000000..6b73950fc1<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/piglit<wbr>/piglit/0001-tests-egl-egl-<wbr>cont=
ext-priority.c-Use-piglit_<wbr>egl_get_.patch<br>
@@ -0,0 +1,39 @@<br>
+From 3b6c3abe3698abb0ae08d14a399eea<wbr>29805cafd6 Mon Sep 17 00:00:00 200=
1<br>
+From: =3D?UTF-8?q?An=3DC3=3DADbal=3D20Lim=3DC3<wbr>=3DB3n?=3D &lt;<a href=
=3D"mailto:anibal.limon@linaro.org" target=3D"_blank">anibal.limon@linaro.o=
rg</a>&gt;<br>
+Date: Fri, 24 Nov 2017 10:11:42 -0600<br>
+Subject: [PATCH] tests/egl/egl-context-priority<wbr>.c: Use<br>
+ piglit_egl_get_default_display<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Some EGL implementations do not actually ship all Khronos-extensions.<br>
+As it turns out, the Mali 450 driver does not include eglGetPlatformDispla=
y<br>
+symbol so there is not grauntee to exists use piglit_egl_get_default_displ=
ay<br>
+wrapper instead. See rev 45095dc08b.<br>
+<br>
+Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@l=
inaro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
+Signed-off-by: Daniel D=C3=ADaz &lt;<a href=3D"mailto:daniel.diaz@linaro.o=
rg" target=3D"_blank">daniel.diaz@linaro.org</a>&gt;<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"mailto:piglit@lists.freedesktop.org=
" target=3D"_blank">piglit@lists.freedesktop.org</a>]<br>
+---<br>
+ tests/egl/egl-context-priority<wbr>.c | 3 +--<br>
+ 1 file changed, 1 insertion(+), 2 deletions(-)<br>
+<br>
+diff --git a/tests/egl/egl-context-priori<wbr>ty.c b/tests/egl/egl-context=
-priori<wbr>ty.c<br>
+index 7f26fc614..9590ccae3 100644<br>
+--- a/tests/egl/egl-context-priori<wbr>ty.c<br>
++++ b/tests/egl/egl-context-priori<wbr>ty.c<br>
+@@ -99,8 +99,7 @@ piglit_init(int argc, char **argv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strstr(exts, &quot;EGL_MESA_platform_surfa=
celess<wbr>&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0piglit_report_resul=
t(PIGLIT_S<wbr>KIP);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 dpy =3D eglGetPlatformDisplay(EGL_PLAT<wbr>FORM_SURF=
ACELESS_MESA,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EGL_DEFAULT_DISPLAY, NULL);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 dpy =3D piglit_egl_get_default_display<wbr>(EGL_PLAT=
FORM_SURFACELESS_<wbr>MESA);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ok =3D eglInitialize(dpy, &amp;major, &amp;mino=
r);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ok) {<br>
+--<br>
+2.11.0<br>
+<br>
diff --git a/meta/recipes-graphics/piglit<wbr>/<a href=3D"http://piglit_git=
.bb" rel=3D"noreferrer" target=3D"_blank">piglit_git.bb</a> b/meta/recipes-=
graphics/piglit<wbr>/<a href=3D"http://piglit_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">piglit_git.bb</a><br>
index eae3eed342..c6d4e5c6e0 100644<br>
--- a/meta/recipes-graphics/piglit<wbr>/<a href=3D"http://piglit_git.bb" re=
l=3D"noreferrer" target=3D"_blank">piglit_git.bb</a><br>
+++ b/meta/recipes-graphics/piglit<wbr>/<a href=3D"http://piglit_git.bb" re=
l=3D"noreferrer" target=3D"_blank">piglit_git.bb</a><br>
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db2beded710<=
wbr>3a3d8a442a2a0391d607b0&quot;<br>
=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://anongit.freedesktop.org/pi=
glit" rel=3D"noreferrer" target=3D"_blank">anongit.freedesktop.org<wbr>/pig=
lit</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cmake-install-b=
as<wbr>h-completions-in-the-right-pla<wbr>ce.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-Use-FE_UP=
WA<wbr>RD-only-if-its-defined-in-fenv<wbr>.h.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-egl-egl-con<wbr=
>text-priority.c-Use-piglit_egl<wbr>_get_.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0 =C2=A0 # From 2017-02-06<br>
<br>
</blockquote>
<br>
<br>
-- <br></div></div>
# Randy MacLeod.=C2=A0 WR Linux<br>
# Wind River an Intel Company<br>
</blockquote></div><br></div></div>

--001a114811fa8900fb055eff10b0--
