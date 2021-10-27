Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3934FC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 21:16:02 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.2657.1635369361367637557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 14:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KQRG2KyQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id a132so2777967qkg.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 14:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UN8Pt0PMhcsAuaB8P4jnJyL8VEB+rJoP2yhcBwbxPXM=;
        b=KQRG2KyQt4yolyqhxtIkQ/29hMa+liZjKmGeXeq/I5dfMQ2IXHm96jrLNBAKcRjF4H
         fkAL03Yw/p2rAEt0GkEk9ZaG/x3rAKYStyaQUp33+46Ar8DxYZ5LVOYHzTMpo3mekqaC
         hWpQe1Dt8I/RvzH0CAKZsUOy5BgZZH4OQkbX+49qVSgwG1/PoWYZy+zqf+ykaM4+JCeZ
         feDaBZqncNkcP52SjoVvxbEDa3RSIZ4NNsguxzBEmP2rEiQRl4hVmX4DklfARwkUbfp+
         QLevbziuWMwdRf6KEsydvtv+fzfOFyR4A4NQzEfsaYizO6iJJujtD6ZaTEtABwgQHZbe
         0f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UN8Pt0PMhcsAuaB8P4jnJyL8VEB+rJoP2yhcBwbxPXM=;
        b=YSOALQ5zk6v+DyA8QhVFfX9ryCcpR17KdoZpwCYZfINcfeG6F4Zzxhab7DSivnxqO3
         kIDUTgWuYoeaxSAhwiYZSygJ3hH7v6nsZE7YWio05TaaoXJHHyWZ7CDn1R3jQomwBTZm
         2oGn23kGSFp/u0qTR1aspoqoS+R7oc7crBstOBFqW6S+gr8omnGkhiApYS1AJvRdRm0f
         xjVYBQimPdPX/0fCyKQh601ZegOZzPMQIxwnnfyNHNEX9T6jvULDESo0OFwNuVvpD91+
         zbHdBKUv51nRe0FaxSr9fNFcMMXaSzz5uUAVoSdxUj2/ubmLSiCJrHx6vCIte2zY102W
         iq/Q==
X-Gm-Message-State: AOAM533G5t0MFcGsItdd5k8ogCP57rERe1k+wQ0pOQthpPEkLGL0k5UL
	wESk/fyLlNDCP3Nd9nsdr9cA3u43UEZm5wwDZ8CW9XKU
X-Google-Smtp-Source: 
 ABdhPJwAA8GLMbqTTJGNu1PJ+Y1nuExxD6ANRuPOhbvi4Oiq8y1zF9X4ZxcCFvWa/skjvlMmM8JQ80D0o8Q4lVtDEeY=
X-Received: by 2002:ae9:de07:: with SMTP id s7mr231107qkf.47.1635369360405;
 Wed, 27 Oct 2021 14:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211027210338.3320083-1-open.source@oleksandr-kravchuk.com>
 <CAMKF1spyTN8SHPdw+OyF5qoOKZfyMmg2zzPOzWBRt2tTJNbZUg@mail.gmail.com>
 <bca08ee4-f424-5eb8-9d1d-5bd22e7971d6@oleksandr-kravchuk.com>
In-Reply-To: <bca08ee4-f424-5eb8-9d1d-5bd22e7971d6@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Oct 2021 14:15:49 -0700
Message-ID: 
 <CAMKF1sqUNt=aRYX6Wiq1RNPvGYa1CqQJv-S7fH5=iyuutzt+4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcvt: add recipe
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cdb86a05cf5c19f1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 21:16:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157572

--000000000000cdb86a05cf5c19f1
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 27, 2021 at 2:12 PM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> On 27/10/2021 23:09, Khem Raj wrote:
>
>
>
> On Wed, Oct 27, 2021 at 2:03 PM Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com> wrote:
>
>> This library is a dependancy of xserver-xorg 21.1.0.
>>
>
> I wonder if we need this to be in core layer though
>
> Could you please clarify why it shouldn't if the package that needs is
> part of the core layer?
>

I read the dependency in reverse however the next question is that is this
new dependency or else how did we manage up until this point?

>
>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../xorg-lib/libxcvt_0.1.1.bb                 | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>  create mode 100644 meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>> b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>> new file mode 100644
>> index 0000000000..628ccfb647
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>> @@ -0,0 +1,19 @@
>> +SUMMARY = "Library providing a standalone version of the X server \
>> +implementation of the VESA CVT standard timing modelines generator"
>> +HOMEPAGE = "https://gitlab.freedesktop.org/xorg/lib/libxcvt"
>> +BUGTRACKER = "https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/issues"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=129947a06984d6faa6f9a9788fa2a03f"
>> +SECTION = "x11/libs"
>> +
>> +SRC_URI = "git://
>> gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https"
>> +SRCREV = "6fe840b9295cfdc41bd734586c5b8756f6af6f9b"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit meson
>> +
>> +FILES:${PN} = " \
>> +    ${libdir}/libxcvt.so.0* \
>> +    ${bindir}/cvt \
>> +"
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#157569):
>> https://lists.openembedded.org/g/openembedded-core/message/157569
>> Mute This Topic: https://lists.openembedded.org/mt/86638516/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>

--000000000000cdb86a05cf5c19f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 27, 2021 at 2:12 PM Oleksandr Kravchuk &lt;<a h=
ref=3D"mailto:open.source@oleksandr-kravchuk.com">open.source@oleksandr-kra=
vchuk.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div>
    <div>On 27/10/2021 23:09, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 27, 2021 at 2:0=
3
            PM Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksan=
dr-kravchuk.com" target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&g=
t;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">This
            library is a dependancy of xserver-xorg 21.1.0.<br>
          </blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">I wonder if we need this to be in core layer
            though</div>
        </div>
      </div>
    </blockquote>
    Could you please clarify why it shouldn&#39;t if the package that needs
    is part of the core layer?</div></blockquote><div dir=3D"auto"><br></di=
v><div dir=3D"auto">I read the dependency in reverse however the next quest=
ion is that is this new dependency or else how did we manage up until=C2=A0=
this point?=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">
    </div><div><blockquote type=3D"cite">
      <div>
        <div class=3D"gmail_quote">
          <div dir=3D"auto"><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><br>
            Signed-off-by: Oleksandr Kravchuk &lt;<a href=3D"mailto:open.so=
urce@oleksandr-kravchuk.com" target=3D"_blank">open.source@oleksandr-kravch=
uk.com</a>&gt;<br>
            ---<br>
            =C2=A0.../xorg-lib/<a href=3D"http://libxcvt_0.1.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">libxcvt_0.1.1.bb</a>=C2=A0
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++=
++++++++++++++++<br>
            =C2=A01 file changed, 19 insertions(+)<br>
            =C2=A0create mode 100644 meta/recipes-graphics/xorg-lib/<a href=
=3D"http://libxcvt_0.1.1.bb" rel=3D"noreferrer" target=3D"_blank">libxcvt_0=
.1.1.bb</a><br>
            <br>
            diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://l=
ibxcvt_0.1.1.bb" rel=3D"noreferrer" target=3D"_blank">libxcvt_0.1.1.bb</a>
            b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcvt_0.1.=
1.bb" rel=3D"noreferrer" target=3D"_blank">libxcvt_0.1.1.bb</a><br>
            new file mode 100644<br>
            index 0000000000..628ccfb647<br>
            --- /dev/null<br>
            +++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcvt_=
0.1.1.bb" rel=3D"noreferrer" target=3D"_blank">libxcvt_0.1.1.bb</a><br>
            @@ -0,0 +1,19 @@<br>
            +SUMMARY =3D &quot;Library providing a standalone version of th=
e X
            server \<br>
            +implementation of the VESA CVT standard timing modelines
            generator&quot;<br>
            +HOMEPAGE =3D &quot;<a href=3D"https://gitlab.freedesktop.org/x=
org/lib/libxcvt" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freede=
sktop.org/xorg/lib/libxcvt</a>&quot;<br>
            +BUGTRACKER =3D &quot;<a href=3D"https://gitlab.freedesktop.org=
/xorg/lib/libxcvt/-/issues" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/xorg/lib/libxcvt/-/issues</a>&quot;<br>
            +LICENSE =3D &quot;MIT&quot;<br>
            +LIC_FILES_CHKSUM =3D
            <a>&quot;file://COPYING;md5=3D129947a06984d6faa6f9a9788fa2a03f&=
quot;</a><br>
            +SECTION =3D &quot;x11/libs&quot;<br>
            +<br>
            +SRC_URI =3D &quot;<a>git://</a><a href=3D"http://gitlab.freede=
sktop.org/xorg/lib/libxcvt.git;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=3Dhttps</a=
>&quot;<br>
            +SRCREV =3D &quot;6fe840b9295cfdc41bd734586c5b8756f6af6f9b&quot=
;<br>
            +<br>
            +S =3D &quot;${WORKDIR}/git&quot;<br>
            +<br>
            +inherit meson<br>
            +<br>
            +FILES:${PN} =3D &quot; \<br>
            +=C2=A0 =C2=A0 ${libdir}/libxcvt.so.0* \<br>
            +=C2=A0 =C2=A0 ${bindir}/cvt \<br>
            +&quot;<br>
            -- <br>
            2.25.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#157569): <a href=3D"https://lists.openembed=
ded.org/g/openembedded-core/message/157569" rel=3D"noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-core/message/157569</a>=
<br>
            Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/8=
6638516/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/86638516/1997914</a><br>
            Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.=
openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembed=
ded.org</a><br>
            Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openem=
bedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-core/unsub</a>
            [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </div>
</blockquote></div></div>

--000000000000cdb86a05cf5c19f1--

