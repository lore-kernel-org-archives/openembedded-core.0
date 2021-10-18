Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BD3C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 13:57:11 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.36615.1634565431202441499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 06:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DUTqSqqS;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id f21so11304798plb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dwtzub+pO2cdRZwRIkgbWfpRNR3qCiqrswYZ6tLtoC8=;
        b=DUTqSqqSxMxq4tT1RaF9Q8yyFgSS1UNhHEz08qZTQZq+LXJVtDX5JKcsAIlbGqseyG
         fD8QT+QNrgzCcnATZmjJQqQHNJ5UFpkLCKhWvS+N+Llz4Je06iwGanw1oMxyrsQ6QCSr
         bt/qyDUbFVZvOGbydKf2z5GxwEKc5fErnaBqpp0GBY9Z5w7vqEO+PPIdfvvW9Yfa+mZH
         vTqdnxS/vs8Ds5cx3g8ng266mwdqE8Efoez7GQMI2ke4cCQHNeXhH8owllNLadFWqrAY
         ASC5rwBPUz+g+qs960rz44muOCRmbfTUVy1c2HyLz06L/ZUPwonHXN7HyXbc3Ltps5P1
         k1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dwtzub+pO2cdRZwRIkgbWfpRNR3qCiqrswYZ6tLtoC8=;
        b=PRj47JKEKBp7j37m/LmWqFrwZrUM/ChkDSDkzP6ufJI7gwsdGiW4cxptox8MUKSaBV
         odITU/pdf43Y9dP84thFAxx+DgkHXnGY4QZYWPF6QKr7R2i/kKyd7wkh2NEwqbVw4SZH
         MbK31mi9Icez/Ltm7yCa20xMEnkxeM2xOJS9mQQkSk/3L6h+Y1tTjM1Hzgf3Dmx3p2V7
         krKlijkQONdrMwNsz9RGPLYrHBv65NZ2NBZ4+FiL2yiOUvMLRnwXqGjFN45JAhe0MtyG
         OHAZDJvsnVqeLJb5EXb3x7yzBn6pC+ThsnOih+GQZ6UqsjC4qSQyo7V79BS80/CQqJFt
         imhg==
X-Gm-Message-State: AOAM532rguFaY5NJVbYLOhXIU51JDReGkS6NDHVZfSEeOkuhVBVbOfrW
	7c6cb+DjJnV4WDaPqtead8mA8z6Re9Agy3foCEc=
X-Google-Smtp-Source: 
 ABdhPJyqx536JXRGp4VUH3BJciedE2eb7Y5gQLvCiuD0x8hJ6nI6xkxJVKIpOHIQCCbVcpXH0Vvo0CABixwom1xpOKU=
X-Received: by 2002:a17:902:d114:b0:13f:5164:2e1c with SMTP id
 w20-20020a170902d11400b0013f51642e1cmr27371223plw.75.1634565430654; Mon, 18
 Oct 2021 06:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211017115703.3801301-1-schnitzeltony@gmail.com>
 <e4e32689f8bddb5de2f34b156620cd9cef488cdf.camel@linuxfoundation.org>
 <16AED214610C971D.13161@lists.openembedded.org>
In-Reply-To: <16AED214610C971D.13161@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Oct 2021 15:56:59 +0200
Message-ID: 
 <CA+chaQeYpbufBvZFgoiaQarwOs5wPVDAfd4DpyLNmDA93=kVgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add gperf-native to DEPENDS to fix
 build
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000db3ac605cea0ebb4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 13:57:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157061

--000000000000db3ac605cea0ebb4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 17, 2021 at 2:45 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> On Sun, Oct 17, 2021 at 2:03 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Sun, 2021-10-17 at 13:57 +0200, Andreas M=C3=BCller wrote:
>> > >   Could NOT find Gperf (missing: GPERF_EXECUTABLE) (Required is at
>> least
>> > >   version "3.0.1")
>> >
>> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> > ---
>> >  meta/recipes-sato/webkit/webkitgtk_2.34.0.bb | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
>> b/meta/recipes-
>> > sato/webkit/webkitgtk_2.34.0.bb
>> > index 25e1d422cc..a8e067147c 100644
>> > --- a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
>> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
>> > @@ -32,6 +32,7 @@ CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
>> >
>> >  DEPENDS =3D " \
>> >            ruby-native \
>> > +          gperf-native \
>> >            cairo \
>> >            harfbuzz \
>> >            jpeg \
>>
>> Out of interest, why are you seeing that and the automated testing isn't=
?
>>
>
> FWIW: I'm also seeing webkitgtk failures since last upgrade, but for me i=
t
> isn't because of gperf, but:
>
> | CMake Error at Source/cmake/OptionsGTK.cmake:353 (message):
> |   Either GLX or EGL is needed.
> | Call Stack (most recent call first):
> |   Source/cmake/WebKitCommon.cmake:220 (include)
> |   CMakeLists.txt:20 (include)
>
> possibly because the default setup in oe-core doesn't have opengl in
> DISTRO_FEATUES while all builds on autobuilder have opengl enabled with
> poky?
>

I've sent a fix for build for default oe-core setup (without opengl in
DISTRO_FEATURES).

In my build gperf-native was found in older 2.32.3 from native sysroot:

CMakeCache.txt.2.32.3-r0:GPERF_EXECUTABLE:FILEPATH=3D/jenkins/mjansa/build/=
ros/ros2-foxy-kirkstone/tmp-glibc/work/core2-64-oe-linux/webkitgtk/VER/reci=
pe-sysroot-native/usr/bin
/gperf
CMakeCache.txt.2.32.3-r0://Details about finding Gperf
CMakeCache.txt.2.32.3-r0:FIND_PACKAGE_MESSAGE_DETAILS_Gperf:INTERNAL=3D[/je=
nkins/mjansa/build/ros/ros2-foxy-kirkstone/tmp-glibc/work/core2-64-oe-linux=
/webkitgtk/VER/recipe-sys
root-native/usr/bin/gperf][v(3.0.1)]
CMakeCache.txt.2.32.3-r0://ADVANCED property for variable: GPERF_EXECUTABLE
CMakeCache.txt.2.32.3-r0:GPERF_EXECUTABLE-ADVANCED:INTERNAL=3D1

and it's found there through as transitive dependency from:

"fontconfig.do_prepare_recipe_sysroot" -> "gperf-native.do_populate_sysroot=
"
"glibc.do_prepare_recipe_sysroot" -> "gperf-native.do_populate_sysroot"
"libcap-native.do_prepare_recipe_sysroot" ->
"gperf-native.do_populate_sysroot"
"libcap.do_prepare_recipe_sysroot" -> "gperf-native.do_populate_sysroot"
"systemd.do_prepare_recipe_sysroot" -> "gperf-native.do_populate_sysroot"

with some other combination of DISTRO_FEATURES it might be missing as in
Andreas case and as it's direct dependency of webkitgtk I think removing it
in:
https://git.openembedded.org/openembedded-core/commit/?id=3Da5b6f978ef4aef6=
d484acc6e3c4558df7fec65d2
wasn't correct, maybe other dependencies removed here have similar issue
and successful pass on autobuilder tests only very limited set of
combinations (understandably).

Regards,

--000000000000db3ac605cea0ebb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Oct 17, 2021 at 2:45 PM Martin Ja=
nsa via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.o=
penembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.op=
enembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Sun, Oct 17, 2021 at=
 2:03 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sun, 2021-10-17 at 13:57 +0200, Andreas M=C3=BCller wrote:<br=
>
&gt; &gt; =C2=A0=C2=A0Could NOT find Gperf (missing: GPERF_EXECUTABLE) (Req=
uired is at least<br>
&gt; &gt; =C2=A0=C2=A0version &quot;3.0.1&quot;)<br>
&gt; <br>
&gt; Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony=
@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a> | 1 +<br>
&gt; =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.34=
.0.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a> b/meta/=
recipes-<br>
&gt; sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb" rel=3D"noreferrer" =
target=3D"_blank">webkitgtk_2.34.0.bb</a><br>
&gt; index 25e1d422cc..a8e067147c 100644<br>
&gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a><br>
&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a><br>
&gt; @@ -32,6 +32,7 @@ CVE_PRODUCT =3D &quot;webkitgtk webkitgtk\+&quot;<br=
>
&gt; =C2=A0<br>
&gt; =C2=A0DEPENDS =3D &quot; \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ruby=
-native \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gperf-native \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cair=
o \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0harf=
buzz \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0jpeg=
 \<br>
<br>
Out of interest, why are you seeing that and the automated testing isn&#39;=
t?<br></blockquote><div><br></div><div>FWIW: I&#39;m also seeing webkitgtk =
failures since last upgrade, but for me it isn&#39;t because of gperf, but:=
</div><div><br></div><div>| CMake Error at Source/cmake/OptionsGTK.cmake:35=
3 (message):<br>| =C2=A0 Either GLX or EGL is needed.<br>| Call Stack (most=
 recent call first):<br>| =C2=A0 Source/cmake/WebKitCommon.cmake:220 (inclu=
de)<br>| =C2=A0 CMakeLists.txt:20 (include)<br></div><div><br></div><div>po=
ssibly because the default setup in oe-core doesn&#39;t have opengl in DIST=
RO_FEATUES while all builds on autobuilder have opengl enabled with poky?</=
div></div></div></blockquote><div><br></div><div>I&#39;ve sent a fix for bu=
ild for default oe-core setup (without opengl in DISTRO_FEATURES).</div><di=
v><br></div><div>In my build gperf-native was found in older 2.32.3 from na=
tive sysroot:</div><div><br></div><div>CMakeCache.txt.2.32.3-r0:GPERF_EXECU=
TABLE:FILEPATH=3D/jenkins/mjansa/build/ros/ros2-foxy-kirkstone/tmp-glibc/wo=
rk/core2-64-oe-linux/webkitgtk/VER/recipe-sysroot-native/usr/bin<br>/gperf<=
br>CMakeCache.txt.2.32.3-r0://Details about finding Gperf<br>CMakeCache.txt=
.2.32.3-r0:FIND_PACKAGE_MESSAGE_DETAILS_Gperf:INTERNAL=3D[/jenkins/mjansa/b=
uild/ros/ros2-foxy-kirkstone/tmp-glibc/work/core2-64-oe-linux/webkitgtk/VER=
/recipe-sys<br>root-native/usr/bin/gperf][v(3.0.1)]<br>CMakeCache.txt.2.32.=
3-r0://ADVANCED property for variable: GPERF_EXECUTABLE<br>CMakeCache.txt.2=
.32.3-r0:GPERF_EXECUTABLE-ADVANCED:INTERNAL=3D1<br></div><div><br></div><di=
v>and it&#39;s found there through as transitive dependency from:</div><div=
><br></div><div>&quot;fontconfig.do_prepare_recipe_sysroot&quot; -&gt; &quo=
t;gperf-native.do_populate_sysroot&quot;<br>&quot;glibc.do_prepare_recipe_s=
ysroot&quot; -&gt; &quot;gperf-native.do_populate_sysroot&quot;<br>&quot;li=
bcap-native.do_prepare_recipe_sysroot&quot; -&gt; &quot;gperf-native.do_pop=
ulate_sysroot&quot;<br>&quot;libcap.do_prepare_recipe_sysroot&quot; -&gt; &=
quot;gperf-native.do_populate_sysroot&quot;<br>&quot;systemd.do_prepare_rec=
ipe_sysroot&quot; -&gt; &quot;gperf-native.do_populate_sysroot&quot;<br></d=
iv><div><br></div><div>with some other combination of DISTRO_FEATURES it mi=
ght be missing as in Andreas case and as it&#39;s direct dependency of webk=
itgtk I think removing it in:</div><div><a href=3D"https://git.openembedded=
.org/openembedded-core/commit/?id=3Da5b6f978ef4aef6d484acc6e3c4558df7fec65d=
2">https://git.openembedded.org/openembedded-core/commit/?id=3Da5b6f978ef4a=
ef6d484acc6e3c4558df7fec65d2</a><br></div><div>wasn&#39;t correct, maybe ot=
her dependencies removed here have similar issue and successful pass on aut=
obuilder tests only very limited set of combinations (understandably).</div=
><div><br></div><div>Regards,</div></div><div class=3D"gmail_quote"><br></d=
iv></div>

--000000000000db3ac605cea0ebb4--

