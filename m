Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id EA6416B6F7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 15:28:13 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id t184so409804515qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 07:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dLVYASoAAgONEiZt2fL1SmMq67VQCcTGLoPw0zVVKeA=;
	b=axpcfHHQvWsq+SdCbXVoIWa70jJZ7epOM0rqQbsHTu7JEb7bXmcfLoJpU72SZvPcxk
	wNPJHwn3vz5ANrH32109KAY58bUiR1RxsSOWd7eNCHPZ5AbzbzEA6x9Z5JCpsT6PkYmB
	0qG5x/cVQ+v2SJtk6QIw5GuyZU0pSZo3HDn792qO0/Se/DfJaTp59C0uxyCPrwIWJ94t
	6QNBNXbBcEQu8ASiY+7Mys1mscDRrW34zzDqrJ51NNxrGPBdi4PM2mlbfnHdmQ3UKxoE
	pOQYNVpWTYgG1wcOXSnF0UjzJgcytiHShPzjf94S5zeQeSx70zVW1X9BYGTEs8u92KY9
	ta0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dLVYASoAAgONEiZt2fL1SmMq67VQCcTGLoPw0zVVKeA=;
	b=VERWqcmoXkB3DgxvpRZNxcK8DR/1htvEBiz6LwBmpSm9mVfBwWuX0oGgLP4XiOQhlT
	AtTHHBKy9XbyiPDrRo+N8dvfptBDRKSFe0SKIiUggfySid1QEzyeWUoPy0BvfmPfFiNG
	iGd4jzsGT8mzHZzMsJkJHpTwWTe5o+HTmYx40thnmTi1GIScdpuu+hCXZxcJp5g6JULG
	A7t0zTLuAF3K0i8QMt8+rwB4V7u2dEDwIveSyCnATPMGBQ/fqY6Buemb2WaJgEuI+r/6
	GxoQ0KR/KJwyIhBfilh+Wayx62DuEyYeDf/W8Omc4T//7dfsDZOKQU5S/jN21TkzuK8e
	A1ng==
X-Gm-Message-State: AIkVDXKsKnSziuUcVRex82rhTHtJtWPZR1LTAdYmXRTcRUd1TiOUx5PF2ONaFgUF62gsbJ4bur00BemQ171BWRxW
X-Received: by 10.55.31.24 with SMTP id f24mr63505044qkf.221.1483543693740;
	Wed, 04 Jan 2017 07:28:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 4 Jan 2017 07:27:53 -0800 (PST)
In-Reply-To: <1483300393-10174-3-git-send-email-schnitzeltony@googlemail.com>
References: <1483300393-10174-1-git-send-email-schnitzeltony@googlemail.com>
	<1483300393-10174-3-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Jan 2017 15:27:53 +0000
Message-ID: <CAJTo0Lagj=bO9_n46JJ38JWwF9UFVLAtBzW8F+njMv7CpkjLhQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] alsa-utils-scripts: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Wed, 04 Jan 2017 15:28:15 -0000
Content-Type: multipart/alternative; boundary=001a1147e2bae040340545466ef8

--001a1147e2bae040340545466ef8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This fails to build:

| Making all in alsaucm
| make[1]: Entering directory
'/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/alsa-utils-scripts/1=
.1.3-r0/build/alsaucm'
| x86_64-poky-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3Dss=
e
-msse4.2 --sysroot=3D/data/poky-master/tmp-glibc/sysroots/intel-corei7-64
-DHAVE_CONFIG_H -I. -I../../alsa-utils-1.1.3/alsaucm -I../include  -Wall
-I../../alsa-utils-1.1.3/include   -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=3D/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/=
alsa-utils-scripts/1.1.3-r0=3D/usr/src/debug/alsa-utils-scripts/1.1.3-r0
-fdebug-prefix-map=3D/data/poky-master/tmp-glibc/sysroots/x86_64-linux=3D
-fdebug-prefix-map=3D/data/poky-master/tmp-glibc/sysroots/intel-corei7-64=
=3D
 -c -o usecase.o ../../alsa-utils-1.1.3/alsaucm/usecase.c
| make[1]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.
Stop.

On 1 January 2017 at 19:53, Andreas M=C3=BCller <schnitzeltony@googlemail.c=
om>
wrote:

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../alsa/{alsa-utils-scripts_1.1.2.bb =3D> alsa-utils-scripts_1.1.3.bb}
>  | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.2.bb =3D>
> alsa-utils-scripts_1.1.3.bb} (100%)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.2.bb
> b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.3.bb
> similarity index 100%
> rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.2.bb
> rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.3.bb
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1147e2bae040340545466ef8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fails to build:<div><br></div><div>| Making all in al=
saucm<div>| make[1]: Entering directory &#39;/data/poky-master/tmp-glibc/wo=
rk/corei7-64-poky-linux/alsa-utils-scripts/1.1.3-r0/build/alsaucm&#39;</div=
><div>| x86_64-poky-linux-gcc =C2=A0-m64 -march=3Dcorei7 -mtune=3Dcorei7 -m=
fpmath=3Dsse -msse4.2 --sysroot=3D/data/poky-master/tmp-glibc/sysroots/inte=
l-corei7-64 -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.1.3/alsaucm -I../inclu=
de =C2=A0-Wall -I../../alsa-utils-1.1.3/include =C2=A0 -O2 -pipe -g -felimi=
nate-unused-debug-types -fdebug-prefix-map=3D/data/poky-master/tmp-glibc/wo=
rk/corei7-64-poky-linux/alsa-utils-scripts/1.1.3-r0=3D/usr/src/debug/alsa-u=
tils-scripts/1.1.3-r0 -fdebug-prefix-map=3D/data/poky-master/tmp-glibc/sysr=
oots/x86_64-linux=3D -fdebug-prefix-map=3D/data/poky-master/tmp-glibc/sysro=
ots/intel-corei7-64=3D =C2=A0-c -o usecase.o ../../alsa-utils-1.1.3/alsaucm=
/usecase.c</div><div>| make[1]: *** No rule to make target &#39;alsaucm.1&#=
39;, needed by &#39;all-am&#39;.=C2=A0 Stop.</div></div></div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On 1 January 2017 at 19:53, An=
dreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Andreas M=C3=BCller=
 &lt;<a href=3D"mailto:schnitzeltony@googlemail.com">schnitzeltony@googlema=
il.com</a>&gt;<br>
---<br>
=C2=A0.../alsa/{<a href=3D"http://alsa-utils-scripts_1.1.2.bb" rel=3D"noref=
errer" target=3D"_blank">alsa-utils-scripts_<wbr>1.1.2.bb</a> =3D&gt; <a hr=
ef=3D"http://alsa-utils-scripts_1.1.3.bb" rel=3D"noreferrer" target=3D"_bla=
nk">alsa-utils-scripts_1.1.3.bb</a>}=C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A01 file changed, 0 insertions(+), 0 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/alsa/{<a href=3D"http://alsa-utils-scr=
ipts_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>alsa-utils-scripts=
_1.1.2.bb</a> =3D&gt; <a href=3D"http://alsa-utils-scripts_1.1.3.bb" rel=3D=
"noreferrer" target=3D"_blank">alsa-utils-scripts_1.1.3.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>alsa/<a href=3D"http://alsa-utils=
-scripts_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">alsa-utils-scripts_=
1.1.2.<wbr>bb</a> b/meta/recipes-multimedia/<wbr>alsa/<a href=3D"http://als=
a-utils-scripts_1.1.3.bb" rel=3D"noreferrer" target=3D"_blank">alsa-utils-s=
cripts_1.1.3.<wbr>bb</a><br>
similarity index 100%<br>
rename from meta/recipes-multimedia/alsa/<a href=3D"http://alsa-utils-scrip=
ts_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">a<wbr>lsa-utils-scripts_1=
.1.2.bb</a><br>
rename to meta/recipes-multimedia/alsa/<a href=3D"http://alsa-utils-scripts=
_1.1.3.bb" rel=3D"noreferrer" target=3D"_blank">a<wbr>lsa-utils-scripts_1.1=
.3.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.5<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1147e2bae040340545466ef8--
