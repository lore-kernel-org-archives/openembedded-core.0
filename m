Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id B2F2F77EA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:01:03 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id m84so13198796ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 02:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Id65t15J3eCge27E/UzB4yCAaJeTaqGIsHOz/u7QU7k=;
	b=AmDQ7wHtNGCLwiT6muM8e9EQ0kQ6WmOLaVWEITO6EQLhdLqtC1PMMtdIyNE1+tTizC
	747YO2s8HycNInMTTq7trrk1y3E2g18dPLVrOZYClnV1pqfrh4WEnsX1uyg5gfIj8ERW
	IJtKfqMZewdV0sKHusIxTf2YvvBn0JR3l6ABYRh9e75xK4+UB5g0rBe98lvkB+7R3m6F
	2xyb9wkk1lLDMs/rlmy3mZQ8MJp7UyEUH2nZserImOCH/sBUUUrItBqE400NpmibC+Sr
	wgpUD1NipWeWLsOgyZL9HJvOiOINQExvynysAP7n2+pLGKHYww79pz7zszf9jrx3bZ12
	vGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Id65t15J3eCge27E/UzB4yCAaJeTaqGIsHOz/u7QU7k=;
	b=SO60Ny2tXC8gl3KIiIC2WaGh2UW9Ss8GWF6QiZbZwh2MINLGo2Ecv5B0o0hwPD9AO+
	NFS2puKY80HLCDcrMDnjSWVTUw53VjXErBHkKQaefpDg/5aSXADMd2HcrTQUpT9qFC47
	StCCiepbroDv1lHQ+aHwd1jWtIHbbzlg+WLgi/TSh/A1FLZdGFpmG1kRPNnDcs23WTFn
	Z/HYWqIPfPMHa75jl+hElGTOFRxYef37pXLAbWNJq6Mj8SJz543C2UvCUoEvtdUPrai9
	bK5q14wlI2zeDEQ80X+lZbUIPSzpccSf+HwPEmvcSXxViknU+Z4uxSSiT+B2pE76DcKB
	n8MA==
X-Gm-Message-State: AIVw111Dc/TE3MwKKK1YxewvXwJgwHpSfQZa1G321t7AXNrWNL3I0FYO
	oSZ8zpQ1Lt3QbMLl/ohUmnIyhhvsbSz+
X-Received: by 10.107.37.141 with SMTP id l135mr7187435iol.146.1499763664541; 
	Tue, 11 Jul 2017 02:01:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Tue, 11 Jul 2017 02:00:34 -0700 (PDT)
In-Reply-To: <20170703200210.32229-2-otavio@ossystems.com.br>
References: <20170703200210.32229-1-otavio@ossystems.com.br>
	<20170703200210.32229-2-otavio@ossystems.com.br>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 11 Jul 2017 12:00:34 +0300
Message-ID: <CAHiDW_GV0z+8u6YG0wujroEbnAHnXueWWizDXpjBOkQp+FHwHg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] mesa: Upgrade to 17.1.4 release
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
X-List-Received-Date: Tue, 11 Jul 2017 09:01:04 -0000
Content-Type: multipart/alternative; boundary="001a114031ea78ee26055406f05c"

--001a114031ea78ee26055406f05c
Content-Type: text/plain; charset="UTF-8"

On 3 July 2017 at 23:02, Otavio Salvador <otavio@ossystems.com.br> wrote:

> This includes following upstream bug fixes:
>
> Bug 77240 - khrplatform.h not installed if EGL is disabled
>

Saying this here as well for visibility:

This conflicts with userland from meta-raspberrypi  because both mesa-gl
and userland now have khrplatform.h

Since mesa-gl provides no GLES or EGL, it shouldn't really need to ship
khrplatform.h.

Jussi


> Bug 95530 - Stellaris - colored overlay of sectors doesn't render on i965
> Bug 96958 - [SKL] Improper rendering in Europa Universalis IV
> Bug 99467 - [radv] DOOM 2016 + wine. Green screen everywhere (but can be
> started)
> Bug 101071 - compiling glsl fails with undefined reference to
> `pthread_create'
> Bug 101252 - eglGetDisplay() is not thread safe
> Bug 101294 - radeonsi minecraft forge splash freeze since 17.1
> Bug 101451 - [G33] ES2-CTS.functional.clipping.polygon regression
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
> Changes in v2: None
>
>  meta/recipes-graphics/mesa/{mesa-gl_17.1.3.bb => mesa-gl_17.1.4.bb} | 0
>  meta/recipes-graphics/mesa/{mesa_17.1.3.bb => mesa_17.1.4.bb}       | 4
> ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-gl_17.1.3.bb => mesa-gl_17.1.4.bb}
> (100%)
>  rename meta/recipes-graphics/mesa/{mesa_17.1.3.bb => mesa_17.1.4.bb}
> (84%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.3.bb
> b/meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_17.1.3.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb
> diff --git a/meta/recipes-graphics/mesa/mesa_17.1.3.bb
> b/meta/recipes-graphics/mesa/mesa_17.1.4.bb
> similarity index 84%
> rename from meta/recipes-graphics/mesa/mesa_17.1.3.bb
> rename to meta/recipes-graphics/mesa/mesa_17.1.4.bb
> index d9860213f2..2a1ecd3124 100644
> --- a/meta/recipes-graphics/mesa/mesa_17.1.3.bb
> +++ b/meta/recipes-graphics/mesa/mesa_17.1.4.bb
> @@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/
> archive/mesa-${PV}.tar.xz \
>             file://0002-hardware-gloat.patch \
>  "
>
> -SRC_URI[md5sum] = "1946a93d543bc219427e2bebe2ac4752"
> -SRC_URI[sha256sum] = "5f1ee9a8aea2880f887884df2dea0c
> 16dd1b13eb42fd2e52265db0dc1b380e8c"
> +SRC_URI[md5sum] = "be2ef7c9edec23b07f74f6512a6a6fa5"
> +SRC_URI[sha256sum] = "06f3b0e6a28f0d20b7f3391cf67fe8
> 9ae98ecd0a686cd545da76557b6cec9cad"
>
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114031ea78ee26055406f05c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 3 July 2017 at 23:02, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This includes fo=
llowing upstream bug fixes:<br>
<br>
Bug 77240 - khrplatform.h not installed if EGL is disabled<br></blockquote>=
<div><br></div><div>Saying this here as well for visibility:</div><div><br>=
</div><div>This conflicts with userland from meta-raspberrypi =C2=A0because=
 both mesa-gl and userland now have khrplatform.h</div><div><br></div><div>=
Since mesa-gl provides no GLES or EGL, it shouldn&#39;t really need to ship=
 khrplatform.h.</div><div><br></div><div>Jussi</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
Bug 95530 - Stellaris - colored overlay of sectors doesn&#39;t render on i9=
65<br>
Bug 96958 - [SKL] Improper rendering in Europa Universalis IV<br>
Bug 99467 - [radv] DOOM 2016 + wine. Green screen everywhere (but can be st=
arted)<br>
Bug 101071 - compiling glsl fails with undefined reference to `pthread_crea=
te&#39;<br>
Bug 101252 - eglGetDisplay() is not thread safe<br>
Bug 101294 - radeonsi minecraft forge splash freeze since 17.1<br>
Bug 101451 - [G33] ES2-CTS.functional.clipping.<wbr>polygon regression<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
Changes in v2: None<br>
<br>
=C2=A0meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_17.1.3.bb" rel=
=3D"noreferrer" target=3D"_blank">me<wbr>sa-gl_17.1.3.bb</a> =3D&gt; <a hre=
f=3D"http://mesa-gl_17.1.4.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl=
_17.1.4.bb</a>} | 0<br>
=C2=A0meta/recipes-graphics/mesa/{<a href=3D"http://mesa_17.1.3.bb" rel=3D"=
noreferrer" target=3D"_blank">me<wbr>sa_17.1.3.bb</a> =3D&gt; <a href=3D"ht=
tp://mesa_17.1.4.bb" rel=3D"noreferrer" target=3D"_blank">mesa_17.1.4.bb</a=
>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_17.1.3.b=
b" rel=3D"noreferrer" target=3D"_blank">me<wbr>sa-gl_17.1.3.bb</a> =3D&gt; =
<a href=3D"http://mesa-gl_17.1.4.bb" rel=3D"noreferrer" target=3D"_blank">m=
esa-gl_17.1.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_17.1.3.bb" =
rel=3D"noreferrer" target=3D"_blank">me<wbr>sa_17.1.3.bb</a> =3D&gt; <a hre=
f=3D"http://mesa_17.1.4.bb" rel=3D"noreferrer" target=3D"_blank">mesa_17.1.=
4.bb</a>} (84%)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_17.1.3.bb=
" rel=3D"noreferrer" target=3D"_blank">m<wbr>esa-gl_17.1.3.bb</a> b/meta/re=
cipes-graphics/mesa/<a href=3D"http://mesa-gl_17.1.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">m<wbr>esa-gl_17.1.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_17.1.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">mes<wbr>a-gl_17.1.3.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_17.1.4.bb" r=
el=3D"noreferrer" target=3D"_blank">mes<wbr>a-gl_17.1.4.bb</a><br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.3.bb" r=
el=3D"noreferrer" target=3D"_blank">m<wbr>esa_17.1.3.bb</a> b/meta/recipes-=
graphics/mesa/<a href=3D"http://mesa_17.1.4.bb" rel=3D"noreferrer" target=
=3D"_blank">m<wbr>esa_17.1.4.bb</a><br>
similarity index 84%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.3.bb" re=
l=3D"noreferrer" target=3D"_blank">mes<wbr>a_17.1.3.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">mes<wbr>a_17.1.4.bb</a><br>
index d9860213f2..2a1ecd3124 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">m<wbr>esa_17.1.3.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">m<wbr>esa_17.1.4.bb</a><br>
@@ -7,8 +7,8 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org/a=
rchive/mesa-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://mesa=
.freedesktop.org/<wbr>archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-hardware-gloat.<wbr>p=
atch \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>1946a93d543bc219427e2bebe2ac47<wbr>52&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>5f1ee9a8aea2880f887884df2dea0c<wbr>16dd1=
b13eb42fd2e52265db0dc1b38<wbr>0e8c&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>be2ef7c9edec23b07f74f6512a6a6f<wbr>a5&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>06f3b0e6a28f0d20b7f3391cf67fe8<wbr>9ae98=
ecd0a686cd545da76557b6cec<wbr>9cad&quot;<br>
<br>
=C2=A0#because we cannot rely on the fact that all apps will use pkgconfig,=
<br>
=C2=A0#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a114031ea78ee26055406f05c--
