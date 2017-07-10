Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id CF5146022E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 08:14:42 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id v202so9082080itb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Vue7JSFxKpuM84wIt/MD0JFQ42IM6IGa3U7z+Ne8Kiw=;
	b=g+YxrSZ4eyw/dU2S8Dr1zqrN3a4bhQL2Z2hqsYVUk0uCw7LPZHQcmYQemBr3c2x0BB
	SsVpT/aYge6Q20yCDW12qkU2bGFQHZXzqdMfq/+0PBvC98FNHBBV0Bn8hOaL/rKbhKI5
	wTxeTeFFB5im8q+dCkrJ/2zOH0VJYxnHAoNJhKOh3eSIGFq70tuMegYQxYbGiE6ZUI7Y
	bWZ4Q0u55hkyn0OnEk0fQmjWBiSTF/UNNiesiMK63PGqd+IJrmRSYT5BoYfkh2yXdpHv
	CDYSvu9h/bQ+yvJxk8/ihE/jWTmNOceZZ/p8dM02Sik3ZiJFjHLOaTUV4iKrVcXJ3ale
	X91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Vue7JSFxKpuM84wIt/MD0JFQ42IM6IGa3U7z+Ne8Kiw=;
	b=lGm52Y4v12Tm4k6A85PvdOwkiHj0lvCUwk1szCyyE6HXOGLTKfpEUB3eLSYaPRY59d
	utpxW1U/lvbjgjNWlkt6rzqZws/xjiJxl98nZfE/y85cUGH0hkpB+YtZVbA/DwPHB0BY
	puPzeUW0sNjoKlYr86KQQN8PGOH/XfFxrr9ExctOccTuVEMvk5XpbBE5HeOy5TDnI2ig
	armE315YcXuE3emHcfI9jTGBZleQvOk3RW6jfPO6a+uF6u979kvKcOHMLPalPRXueV1C
	AQ2vWbs1Cb0Rx6Lj+9KokXnsh7QwAKWxTQhHUibFL7CKKzSC+6DFSPGz2esC4n+9KM7J
	iiIA==
X-Gm-Message-State: AIVw112qk1IyUPHwlUwURo5XxnxPxYwldakZPJdokOv41ZeR5UN+Ya0x
	rGZQlG4ykkbk4o5uQLmek6v6FLTpLFLA
X-Received: by 10.36.31.129 with SMTP id d123mr10516931itd.5.1499674483817;
	Mon, 10 Jul 2017 01:14:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Mon, 10 Jul 2017 01:14:13 -0700 (PDT)
In-Reply-To: <CAC+thW25+hHFEn6gAaJwE5fmg=kuJG=RU-dF7JpC1yfDJCN2vQ@mail.gmail.com>
References: <20170703200210.32229-1-otavio@ossystems.com.br>
	<CAC+thW25+hHFEn6gAaJwE5fmg=kuJG=RU-dF7JpC1yfDJCN2vQ@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 10 Jul 2017 11:14:13 +0300
Message-ID: <CAHiDW_GcatNNhH8ZrCwxKLShPWArVu1unZvmsDsQjxLiwi6ihw@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] mesa: Avoid platform probing when building without EGL
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
X-List-Received-Date: Mon, 10 Jul 2017 08:14:44 -0000
Content-Type: multipart/alternative; boundary="001a1144a226e32e2f0553f22c87"

--001a1144a226e32e2f0553f22c87
Content-Type: text/plain; charset="UTF-8"

On 8 July 2017 at 18:34, Andrea Galbusera <gizero@gmail.com> wrote:

> Hi!
>
> On Mon, Jul 3, 2017 at 10:02 PM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>
>> The 17.1.2 release has changed the platform setting and when not
>> explicitly disabled it assumes x11 support.
>>
>> Fixes:
>>
>> | checking for x11-xcb xcb xcb-dri2 >= 1.8 xcb-xfixes... no
>> | configure: error: Package requirements (x11-xcb xcb xcb-dri2 >= 1.8
>> xcb-xfixes) were not met:
>> |
>> | No package 'x11-xcb' found
>> | No package 'xcb' found
>> | No package 'xcb-dri2' found
>> | No package 'xcb-xfixes' found
>> |
>> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>> | installed software in a non-standard prefix.
>> |
>> | Alternatively, you may set the environment variables XCB_DRI2_CFLAGS
>> | and XCB_DRI2_LIBS to avoid the need to call pkg-config.
>> | See the pkg-config man page for more details.
>>
>> The issue has been exposed by meta-freescale BSP. Fix tested with
>> imx6qsabresd machine.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>> Changes in v2:
>> - new patch
>>
>>  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc
>> b/meta/recipes-graphics/mesa/mesa.inc
>> index 41747cffc8..a12ab7ab5b 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -49,7 +49,7 @@ PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2,
>> --disable-gles1 --disable-
>>  EGL_PLATFORMS  = "drm"
>>  EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'x11', ',x11',
>> '', d)}"
>>  EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'wayland',
>> ',wayland', '', d)}"
>> -PACKAGECONFIG[egl] = "--enable-egl --with-platforms=${EGL_PLATFORMS},
>> --disable-egl"
>> +PACKAGECONFIG[egl] = "--enable-egl --with-platforms=${EGL_PLATFORMS},
>> --disable-egl --with-platforms=''"
>>
>>  PACKAGECONFIG[etnaviv] = ""
>>  PACKAGECONFIG[imx] = ""
>> --
>> 2.13.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
> After merging this patch (as per current poky master), builds for
> MACHINE=raspberrypi3 with meta-raspberrypi fail complaining like this:
>
> | checking for x11 xext xdamage >= 1.1 xfixes x11-xcb xcb xcb-glx >= 1.8.1
> xcb-dri2 >= 1.8 xxf86vm... yes
> | checking for wayland-scanner... no
> | configure: error: Building without the x11 platform as GLX is enabled,
> is not supported
> | NOTE: The following config.log files may provide further information.
> | NOTE: /home/gizero/work/smartliving/distro/repo-master/build-poky/
> tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-
> gl/2_17.1.4-r0/build/config.log
> | ERROR: configure failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /home/gizero/work/smartliving/distro/repo-master/build-poky/
> tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.
> 1.4-r0/temp/log.do_configure.11176)
>
> I know very little about graphical stacks since I use these systems mostly
> headless. Can anyone have a look into it? BTW, without this only commit,
> the build runs to the end with no other errors.
>

I think --enable-egl and --with-platforms should not be behind a single
packageconfig. Like the upstream commit says "Platform selection does not
depend on EGL".

Possibly something like

---
PLATFORMS ?= "surfaceless \
                            ${@bb.utils.contains('PACKAGECONFIG', 'gbm',
',drm', '', d)} \
                            ${@bb.utils.filter('PACKAGECONFIG', 'x11
wayland', d)} \
"
EXTRA_OECONF = "--with-platforms=${PLATFORMS} ..."
---

This should end up with a reasonable set by default and would allow e.g.
meta-raspberrypi to override the variable if needed (I don't think they
would need to but they could).

--001a1144a226e32e2f0553f22c87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 8=
 July 2017 at 18:34, Andrea Galbusera <span dir=3D"ltr">&lt;<a href=3D"mail=
to:gizero@gmail.com" target=3D"_blank">gizero@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv class=3D"gmail_extra"><div class=3D"gmail_quote">Hi!</div><div class=3D"=
gmail_quote"><br></div><div class=3D"gmail_quote"><span class=3D"gmail-">On=
 Mon, Jul 3, 2017 at 10:02 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com=
.br</a>&gt;</span> wrote:<br></span><div><div class=3D"gmail-h5"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">The 17.1.2 release has changed the =
platform setting and when not<br>
explicitly disabled it assumes x11 support.<br>
<br>
Fixes:<br>
<br>
| checking for x11-xcb xcb xcb-dri2 &gt;=3D 1.8 xcb-xfixes... no<br>
| configure: error: Package requirements (x11-xcb xcb xcb-dri2 &gt;=3D 1.8 =
xcb-xfixes) were not met:<br>
|<br>
| No package &#39;x11-xcb&#39; found<br>
| No package &#39;xcb&#39; found<br>
| No package &#39;xcb-dri2&#39; found<br>
| No package &#39;xcb-xfixes&#39; found<br>
|<br>
| Consider adjusting the PKG_CONFIG_PATH environment variable if you<br>
| installed software in a non-standard prefix.<br>
|<br>
| Alternatively, you may set the environment variables XCB_DRI2_CFLAGS<br>
| and XCB_DRI2_LIBS to avoid the need to call pkg-config.<br>
| See the pkg-config man page for more details.<br>
<br>
The issue has been exposed by meta-freescale BSP. Fix tested with<br>
imx6qsabresd machine.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
- new patch<br>
<br>
=C2=A0meta/recipes-graphics/mesa/me<wbr>sa.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/m<wbr>esa.inc b/meta/recipes-graphi=
cs/mesa/m<wbr>esa.inc<br>
index 41747cffc8..a12ab7ab5b 100644<br>
--- a/meta/recipes-graphics/mesa/m<wbr>esa.inc<br>
+++ b/meta/recipes-graphics/mesa/m<wbr>esa.inc<br>
@@ -49,7 +49,7 @@ PACKAGECONFIG[gles] =3D &quot;--enable-gles1 --enable-gle=
s2, --disable-gles1 --disable-<br>
=C2=A0EGL_PLATFORMS=C2=A0 =3D &quot;drm&quot;<br>
=C2=A0EGL_PLATFORMS .=3D&quot;${@bb.utils.contains(&#39;PACKA<wbr>GECONFIG&=
#39;, &#39;x11&#39;, &#39;,x11&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0EGL_PLATFORMS .=3D&quot;${@bb.utils.contains(&#39;PACKA<wbr>GECONFIG&=
#39;, &#39;wayland&#39;, &#39;,wayland&#39;, &#39;&#39;, d)}&quot;<br>
-PACKAGECONFIG[egl] =3D &quot;--enable-egl --with-platforms=3D${EGL_PLATFOR=
<wbr>MS}, --disable-egl&quot;<br>
+PACKAGECONFIG[egl] =3D &quot;--enable-egl --with-platforms=3D${EGL_PLATFOR=
<wbr>MS}, --disable-egl --with-platforms=3D&#39;&#39;&quot;<br>
<br>
=C2=A0PACKAGECONFIG[etnaviv] =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[imx] =3D &quot;&quot;<br>
<span class=3D"gmail-m_-1644056343677310354gmail-HOEnZb"><font color=3D"#88=
8888">--<br>
2.13.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div></div></div><br></div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">After merging this patch (as pe=
r current poky master), builds for MACHINE=3Draspberrypi3 with meta-raspber=
rypi fail complaining like this:</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra"><div class=3D"gmail_extra">| checking for x11 xe=
xt xdamage &gt;=3D 1.1 xfixes x11-xcb xcb xcb-glx &gt;=3D 1.8.1 xcb-dri2 &g=
t;=3D 1.8 xxf86vm... yes</div><div class=3D"gmail_extra">| checking for way=
land-scanner... no</div><div class=3D"gmail_extra">| configure: error: Buil=
ding without the x11 platform as GLX is enabled, is not supported</div><div=
 class=3D"gmail_extra">| NOTE: The following config.log files may provide f=
urther information.</div><div class=3D"gmail_extra">| NOTE: /home/gizero/wo=
rk/smartliving/<wbr>distro/repo-master/build-poky/<wbr>tmp/work/cortexa7hf-=
neon-<wbr>vfpv4-poky-linux-gnueabi/mesa-<wbr>gl/2_17.1.4-r0/build/config.<w=
br>log</div><div class=3D"gmail_extra">| ERROR: configure failed</div><div =
class=3D"gmail_extra">| WARNING: exit code 1 from a shell command.</div><di=
v class=3D"gmail_extra">| ERROR: Function failed: do_configure (log file is=
 located at /home/gizero/work/smartliving/<wbr>distro/repo-master/build-pok=
y/<wbr>tmp/work/cortexa7hf-neon-<wbr>vfpv4-poky-linux-gnueabi/mesa-<wbr>gl/=
2_17.</div><div class=3D"gmail_extra">1.4-r0/temp/log.do_configure.<wbr>111=
76)</div></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">I know very little about graphical stacks since I use these systems mos=
tly headless. Can anyone have a look into it? BTW, without this only commit=
, the build runs to the end with no other errors.</div></div></blockquote><=
div><br></div><div>I think --enable-egl and --with-platforms should not be =
behind a single packageconfig. Like the upstream commit says &quot;Platform=
 selection does not</div><div>depend on EGL&quot;.</div><div><br></div><div=
>Possibly something like=C2=A0</div><div><br></div><div>---</div><div>PLATF=
ORMS ?=3D &quot;surfaceless \</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.=
contains(&#39;PACKAGECONFIG&#39;, &#39;gbm&#39;, &#39;,drm&#39;, &#39;&#39;=
, d)} \</div><div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.filter(&#39;PACKA=
GECONFIG&#39;, &#39;x11 wayland&#39;, d)} \</div></div><div>&quot;</div><di=
v>EXTRA_OECONF =3D &quot;--with-platforms=3D${PLATFORMS} ...&quot;<br></div=
><div>---</div><div><br></div><div>This should end up with a reasonable set=
 by default and would allow e.g. meta-raspberrypi to override the variable =
if needed (I don&#39;t think they would need to but they could).</div><div>=
<br></div></div></div></div>

--001a1144a226e32e2f0553f22c87--
