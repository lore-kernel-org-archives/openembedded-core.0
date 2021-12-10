Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3688C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 15:47:43 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.9115.1639151262510536990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c87BdjAL;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id s9so8280678qvk.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DwDzQICT6JWGLltqKap9FcebV6U5WeYoC8Ez0UhXj5E=;
        b=c87BdjALHPlOf7rISBHHyYkQ5xuiBlkZH+yeaz64Jo66X8iorT9XF9uGvGqP4m/aKZ
         lArgtLXIILg9yJdrve7h+SVfBqrsStSCo9OB6kMcsX/qgjZ8T70XM09pXexlazQw6GU7
         DhGBOCxYNyHq5u8qlqcMKE4NoKnXzdlxbD+BRU8ldwgvPp3uEateTJ5RXAktDZBNsDFw
         u5pRKQdTgqFokb77sGyXSSEmGOXIPdkPD7smL0XWBDPK3bdRAdthY7/aMgMvR7PckV/R
         WglFVjaroMUORn5UycDtYfYryzxLJmUd/f8wmgpkx0iV42PLzKjCOMsu+Zfhju+3LX2d
         p8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DwDzQICT6JWGLltqKap9FcebV6U5WeYoC8Ez0UhXj5E=;
        b=7C9TN9wQXAwsxlhqvJsO/X9nXd9j21QnxH0e4zSbzEZNV3eYYzyqCVx44BQ/K4fz6O
         Ii5/7LQpwSqA6wc8ThVmoV+d4NanAZaOUk7OraHfY8OdbjmZ9bOPIu3w/4SotnH7vBVk
         UesPyaUpL8sebJoVlb2HmPyIoEV+GEcll8fLhO27RVZNUxSoRAnw9Ve4dP28XB+97VWo
         p9g+h6qenNgnv+M82F6f6Bpi2HSH7jYM8s2PObSd4ca17kyLAzbQN1aFJB26z/y5qmfC
         o4foq8AK0p0ABSKzFfW2f1yiTMwYluzdWR5A7FVXik0IJ9ScuEKQRC+DgEo91jdoD8Az
         sM9w==
X-Gm-Message-State: AOAM53273ndYX5QXpvEUuoMiOwtJv0VQveIdSb3Z+QthXfpWYHQ5lm87
	XYjf4GwWm+jh5+Ub9FMvvIa4A8mYd2LiMdUItBhTDN2bRM0=
X-Google-Smtp-Source: 
 ABdhPJx3tXtQq7wzjV+WMzU9w2AEx+NQp+mBZCUWrTNXWwaV+EDUMD3I/CcRkF5AZjeF6mm3iCqFHpR31cIZ5DVwyzU=
X-Received: by 2002:a05:6214:c83:: with SMTP id
 r3mr26010169qvr.110.1639151261577;
 Fri, 10 Dec 2021 07:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20211210140234.3713-1-f_l_k@t-online.de>
 <CANNYZj9YbZJxLADiti4fzsCex06DK9RUk4G-y3ARb3tLgkW9=w@mail.gmail.com>
 <d95c3019-ae4b-f94c-fb34-ab9ac669b6e2@t-online.de>
In-Reply-To: <d95c3019-ae4b-f94c-fb34-ab9ac669b6e2@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Dec 2021 07:47:30 -0800
Message-ID: 
 <CAMKF1srHmV5dy=vZigjUZf+7pOBOyqPu8myaQXcECpne6HmhJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libva: move wayland PACKAGECONFIG to libva.inc
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000adfa4205d2cca4c5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 15:47:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159548

--000000000000adfa4205d2cca4c5
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 10, 2021 at 6:33 AM Markus Volk <f_l_k@t-online.de> wrote:

> Thats strange indeed. Wayland is set as a DISTRO_FEATURE for my image, so
> it gets built by a lot of packages. This wasn't a clean build, i had
> sstate cache availbale when i started to experiment with libva and normally
> it doesn't get  built inside my image because i can't use it on my board.
> First i did 'bitbake libva' and this succeeded. Second i added 'va'
> PACKAGECONFIG to a mesa.bbappend and started rebuilding the image. Now the
> build for libva-initial was started and failed with the error about missing
> wayland-scanner.
>
> I also wondered what is pulling  wayland into  its sysroot . Did 'bitbake
> -c cleanstate libva-initial libva' and tried to build libva-initial again
> with 'bitbake libva-initial' and had the same issue. On my machine this is
> reproducible
>

Post configure logs including meson run  logs for this package perhaps
there is some hint in there

>
> Markus
> Am 10.12.21 um 15:06 schrieb Alexander Kanavin:
>
> | Run-time dependency wayland-client found: YES 1.19.0
>
> Can you please explain how the issue can be reproduced? I find it odd that
> libva-initial (which only needs libdrm, and is required by mesa) has
> wayland in its sysroot in your build - where does that come from? There's a
> chance the problem is elsewhere.
>
> Alex
>
> On Fri, 10 Dec 2021 at 15:03, Markus Volk <f_l_k@t-online.de> wrote:
>
>> I encountered an error while trying to build libva under wayland.
>> libva-initial
>> was missing wayland-native dependency and failed like this:
>>
>> | Run-time dependency xfixes found: NO (tried pkgconfig and cmake)
>> | Run-time dependency wayland-client found: YES 1.19.0
>> | Program wayland-scanner /usr/bin/wayland-scanner found: NO
>> |
>> | ../libva-2.13.0/meson.build:107:4: ERROR: Program 'wayland-scanner
>> /usr/bin/wayland-scanner' not found
>> |
>> | A full log can be found at
>> /home/flk/build/poky/build-rock/tmp/work/cortexa72-cortexa53-crypto-poky-linux/libva-initial/2.13.0-r0/build/meson-logs/meson-log.txt
>> | ERROR: meson failed
>> | WARNING: exit code 1 from a shell command.
>>
>> This commit moves the PACKAGECONFIG[wayland] to libva.inc to make it
>> available to libva-initial also
>>
>> Signed-off-by: MarkusVolk <f_l_k@t-online.de>
>> ---
>>  meta/recipes-graphics/libva/libva.inc       | 7 +++++++
>>  meta/recipes-graphics/libva/libva_2.13.0.bb | 4 +---
>>  2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/libva/libva.inc
>> b/meta/recipes-graphics/libva/libva.inc
>> index bcf9757c1a..0e2721e291 100644
>> --- a/meta/recipes-graphics/libva/libva.inc
>> +++ b/meta/recipes-graphics/libva/libva.inc
>> @@ -27,3 +27,10 @@ UPSTREAM_CHECK_URI = "
>> https://github.com/intel/libva/releases"
>>  DEPENDS = "libdrm"
>>
>>  inherit meson pkgconfig
>> +
>> +PACKAGECONFIG:append = " \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
>> +"
>> +
>> +PACKAGECONFIG[wayland] =
>> "-Dwith_wayland=yes,-Dwith_wayland=no,wayland-native wayland"
>> +
>> diff --git a/meta/recipes-graphics/libva/libva_2.13.0.bb
>> b/meta/recipes-graphics/libva/libva_2.13.0.bb
>> index ed2be289fc..a8c6355b01 100644
>> --- a/meta/recipes-graphics/libva/libva_2.13.0.bb
>> +++ b/meta/recipes-graphics/libva/libva_2.13.0.bb
>> @@ -2,14 +2,12 @@ require libva.inc
>>
>>  PACKAGECONFIG ??= " \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', '', d)}
>> \
>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)} \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
>>  "
>>
>>  PACKAGECONFIG[x11] = "-Dwith_x11=yes,-Dwith_x11=no,virtual/libx11
>> libxext libxfixes"
>>  PACKAGECONFIG[glx] = "-Dwith_glx=yes,-Dwith_glx=no,virtual/mesa"
>>
>> -PACKAGECONFIG[wayland] =
>> "-Dwith_wayland=yes,-Dwith_wayland=no,wayland-native wayland"
>> -
>>  PACKAGES =+ "${PN}-x11 ${PN}-glx ${PN}-wayland"
>>
>>  RDEPENDS:${PN}-x11 =+ "${PN}"
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159539):
> https://lists.openembedded.org/g/openembedded-core/message/159539
> Mute This Topic: https://lists.openembedded.org/mt/87636241/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000adfa4205d2cca4c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Dec 10, 2021 at 6:33 AM Markus Volk &lt;<a href=3D"=
mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p><font face=3D"Liberation Sans">Thats strange indeed. Wayland is set
        as a DISTRO_FEATURE for my image, so it gets built by a lot of</fon=
t><font face=3D"Liberation Sans"> packages. This wasn&#39;t a clean build, =
i
        had sstate cache availbale when i started to experiment with
        libva and normally it doesn&#39;t get=C2=A0 built inside my image b=
ecause
        i can&#39;t use it on my board. First i did &#39;bitbake libva&#39;=
 and this
        succeeded. Second i added &#39;va&#39; PACKAGECONFIG to a mesa.bbap=
pend
        and started rebuilding the image. Now the build for
        libva-initial was started and failed with the error about
        missing wayland-scanner.</font></p>
    <p><font face=3D"Liberation Sans">I also wondered what is pulling=C2=A0
        wayland into=C2=A0 its sysroot . Did &#39;bitbake -c cleanstate
        libva-initial libva&#39; and tried to build libva-initial again wit=
h
        &#39;bitbake libva-initial&#39; and had the same issue. On my machi=
ne
        this is reproducible</font></p></div></blockquote><div dir=3D"auto"=
><br></div><div dir=3D"auto">Post configure logs including meson run =C2=A0=
logs for this package perhaps there is some hint in there=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div><p dir=3D"auto"><font face=3D"Liberation Sans=
"><br>
      </font></p>
    <p><font face=3D"Liberation Sans">Markus<br>
      </font></p>
    <div>Am 10.12.21 um 15:06 schrieb Alexander
      Kanavin:<br>
    </div></div><div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>
          | Run-time dependency wayland-client found: YES 1.19.0</div>
        <div><br>
        </div>
        <div>Can you please explain how the issue can be reproduced? I
          find it odd that libva-initial (which only needs libdrm, and
          is required by mesa) has wayland in its sysroot in your build
          - where does that come from? There&#39;s a chance the problem is
          elsewhere.<br>
        </div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Fri, 10 Dec 2021 at 15:03,
          Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_b=
lank">f_l_k@t-online.de</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">I
          encountered an error while trying to build libva under
          wayland. libva-initial<br>
          was missing wayland-native dependency and failed like this:<br>
          <br>
          | Run-time dependency xfixes found: NO (tried pkgconfig and
          cmake)<br>
          | Run-time dependency wayland-client found: YES 1.19.0<br>
          | Program wayland-scanner /usr/bin/wayland-scanner found: NO<br>
          |<br>
          | ../libva-2.13.0/meson.build:107:4: ERROR: Program
          &#39;wayland-scanner /usr/bin/wayland-scanner&#39; not found<br>
          |<br>
          | A full log can be found at
/home/flk/build/poky/build-rock/tmp/work/cortexa72-cortexa53-crypto-poky-li=
nux/libva-initial/2.13.0-r0/build/meson-logs/meson-log.txt<br>
          | ERROR: meson failed<br>
          | WARNING: exit code 1 from a shell command.<br>
          <br>
          This commit moves the PACKAGECONFIG[wayland] to libva.inc to
          make it available to libva-initial also<br>
          <br>
          Signed-off-by: MarkusVolk &lt;<a href=3D"mailto:f_l_k@t-online.de=
" target=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
          ---<br>
          =C2=A0meta/recipes-graphics/libva/libva.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 7 +++++++<br>
          =C2=A0meta/recipes-graphics/libva/<a href=3D"http://libva_2.13.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libva_2.13.0.bb</a>
          | 4 +---<br>
          =C2=A02 files changed, 8 insertions(+), 3 deletions(-)<br>
          <br>
          diff --git a/meta/recipes-graphics/libva/libva.inc
          b/meta/recipes-graphics/libva/libva.inc<br>
          index bcf9757c1a..0e2721e291 100644<br>
          --- a/meta/recipes-graphics/libva/libva.inc<br>
          +++ b/meta/recipes-graphics/libva/libva.inc<br>
          @@ -27,3 +27,10 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https:=
//github.com/intel/libva/releases" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/intel/libva/releases</a>&quot;<br>
          =C2=A0DEPENDS =3D &quot;libdrm&quot;<br>
          <br>
          =C2=A0inherit meson pkgconfig<br>
          +<br>
          +PACKAGECONFIG:append =3D &quot; \<br>
          +=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39=
;wayland&#39;, d)} \<br>
          +&quot;<br>
          +<br>
          +PACKAGECONFIG[wayland] =3D
          &quot;-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,wayland-native way=
land&quot;<br>
          +<br>
          diff --git a/meta/recipes-graphics/libva/<a href=3D"http://libva_=
2.13.0.bb" rel=3D"noreferrer" target=3D"_blank">libva_2.13.0.bb</a>
          b/meta/recipes-graphics/libva/<a href=3D"http://libva_2.13.0.bb" =
rel=3D"noreferrer" target=3D"_blank">libva_2.13.0.bb</a><br>
          index ed2be289fc..a8c6355b01 100644<br>
          --- a/meta/recipes-graphics/libva/<a href=3D"http://libva_2.13.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libva_2.13.0.bb</a><br>
          +++ b/meta/recipes-graphics/libva/<a href=3D"http://libva_2.13.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libva_2.13.0.bb</a><br>
          @@ -2,14 +2,12 @@ require libva.inc<br>
          <br>
          =C2=A0PACKAGECONFIG ??=3D &quot; \<br>
          =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;x11 opengl&#39;,
          &#39;glx&#39;, &#39;&#39;, d)} \<br>
          -=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39=
;x11 wayland&#39;, d)}
          \<br>
          +=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39=
;x11&#39;, d)} \<br>
          =C2=A0&quot;<br>
          <br>
          =C2=A0PACKAGECONFIG[x11] =3D
          &quot;-Dwith_x11=3Dyes,-Dwith_x11=3Dno,virtual/libx11 libxext
          libxfixes&quot;<br>
          =C2=A0PACKAGECONFIG[glx] =3D
          &quot;-Dwith_glx=3Dyes,-Dwith_glx=3Dno,virtual/mesa&quot;<br>
          <br>
          -PACKAGECONFIG[wayland] =3D
          &quot;-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,wayland-native way=
land&quot;<br>
          -<br>
          =C2=A0PACKAGES =3D+ &quot;${PN}-x11 ${PN}-glx ${PN}-wayland&quot;=
<br>
          <br>
          =C2=A0RDEPENDS:${PN}-x11 =3D+ &quot;${PN}&quot;<br>
          -- <br>
          2.25.1<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
      <br>
      <fieldset></fieldset>
      <pre>

</pre>
    </blockquote>
  </div><div></div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159539): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159539" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159539</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87636241/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87636241/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000adfa4205d2cca4c5--

