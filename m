Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BC5C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 16:19:02 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.9900.1641917941344760792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 08:19:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bZ5UiN5m;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id a8so13489549qvx.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 08:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M1mYEKaB2UwGODsQpsiDqDfpDeDsFCaWW0mq8fLH0Jw=;
        b=bZ5UiN5mvzrnodGw21Bi7d52XqfgOS9pa2K6moBB4wT36Sj0iTMmaKHan9VsrtlbKA
         kEHBqkdWudMoHuZCeJ+KsTeue36D+dVq1yxXeqcEqNmsarX3PeiNV3K4S5oQiFCnDALG
         sPh/ljkisjJRmbcqTnQ1kwjgcehhaxzbybd426IAtt053LSfnCP7NuaovI7sCma4oH2N
         9utixj7gahO4O2EViRHRg2YfD0fBcxVQZL/MEpl7aoa59vAH45ojaqLlmBVSpWZwzEkf
         gw5ekT05R1ABP3sfkaHpHwddX+/d6czJEPeGTW3RjsxCqyPbXJ1Sp8vhk9V7W4sonEqx
         3s8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M1mYEKaB2UwGODsQpsiDqDfpDeDsFCaWW0mq8fLH0Jw=;
        b=grGB5afXPF+PokK+cYq65mPFC2DJzy0GK2fbbe5G0jIAW/+YwKgnANsOQJWT6susLf
         Ntf6pjNjgU57EtRXvs9OUHPeo+bHQ+eFXXfzkNwsZQwh/Syo9K83KXzL7CMPW/Phk9bY
         4rAs9S4kwmNYwD/wWs4s8aBps3VfuA3EtVqHzJXOi7G9mxszTW4l8JftJeu9R0PuTHEU
         viwmVSL166bXGN4Ruj/XjEmJPu0r46rxF/smxVTYTH7e2Yf/IjZC5c2cW+LNcf4N1Kg3
         3o0a7HtHqvNdH89MFP+Gw5OuNJhsSqS44lH+LKIiCM6EWee2xVpTsiihAKQ8Q6f6L33G
         aVzw==
X-Gm-Message-State: AOAM533VyvgKaKfMe18+C+avh/MlXJVEq5xhI9zRw25QnXHAJAIppQQf
	7zk8nogt6Iqr7A+0hLBlrEm4D+P7+QYRprwU7Gc=
X-Google-Smtp-Source: 
 ABdhPJxhw9C4ggj7ocBPdY48XkcGMQzkwWhuXegOeuPpCIjkeNYu9px8jlytEBRNuXt9VTPrc6zycFv2K/BmyRpS4Oo=
X-Received: by 2002:ad4:596b:: with SMTP id eq11mr4365224qvb.16.1641917940267;
 Tue, 11 Jan 2022 08:19:00 -0800 (PST)
MIME-Version: 1.0
References: <20220111025030.1428488-1-alejandro@enedino.org>
 <CAMKF1sqnEYZn4j722Wm-UvLBNZMQu8qHWr8Xo_Q4WNZNXXpu-g@mail.gmail.com>
 <CAHMutrZpjgAhzugwWzpaqhgzoVsJzj9X_=7aC0Fnvh3MBqdg4Q@mail.gmail.com>
In-Reply-To: 
 <CAHMutrZpjgAhzugwWzpaqhgzoVsJzj9X_=7aC0Fnvh3MBqdg4Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jan 2022 08:18:49 -0800
Message-ID: 
 <CAMKF1sr986hOVw4iD_xJ33WdjQoxaozw0txvHGuiPF6LGjOX9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc-cross-canadian: Fix cross canadian compiler
 for baremetal targets
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000947f7e05d550cf94"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 16:19:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160417

--000000000000947f7e05d550cf94
Content-Type: text/plain; charset="UTF-8"

Sounds good to me thanks for doing it

On Tue, Jan 11, 2022 at 1:27 AM Alejandro Enedino Hernandez Samaniego <
alejandro@enedino.org> wrote:

> On Tue, 11 Jan 2022 at 00:55, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mon, Jan 10, 2022 at 6:50 PM Alejandro Hernandez Samaniego
>> <alejandro@enedino.org> wrote:
>> >
>> > While building GCC it checks whether the include directory exists,
>> > if it doesnt it throws an error and exits:
>> >
>> > | The directory that should contain system headers does not exist:
>> > | tmp/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-riscv32/
>> >     11.2.0-r0/recipe-sysroot/usr/include/
>> > | make[1]: *** [Makefile:3257: stmp-fixinc] Error 1
>> >
>> > Even though for the baremetal toolchain not having this directory
>> > does make sense.
>> >
>> > We overcame this by removing the --with-sysroot=/not/exist argument
>> > for baremetal toolchains (via TARGET_OS override), however, the
>> > newlib toolchain does have headers and an includedir, hence by fixing
>> > the baremetal toolchain we broke the newlib one since it uses the same
>> > TARGET_OS as baremetal, causing for example (on newlib):
>> >
>> > /sdk/sysroots/x86_64-pokysdk-linux/usr/lib/riscv32-poky-elf/gcc/
>> >     riscv32-poky-elf/11.2.0/include/stdint.h:9:16:
>> > fatal error: stdint.h: No such file or directory
>> >
>> > | # include_next <stdint.h>
>> >                  ^~~~~~~~~~
>> > compilation terminated.
>> >
>> > By creating a dummy includedir, and removing the previous fix we
>> > allow GCC to be built the same way, unifying the cross compiler
>> > for all targets.
>> >
>> > After this fix both TCLIBC=baremetal and TCLIBC=newlib SDKs work
>> > properly.
>> >
>> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
>> alejandro@enedino.org>
>> > ---
>> >  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 8 ++++----
>> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> > index 495dd9070b..168486bd4e 100644
>> > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> > @@ -45,6 +45,9 @@ export WINDRES_FOR_TARGET = "${TARGET_PREFIX}windres"
>> >  export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET}"
>> >
>> >  do_configure () {
>> > +        if [ ! -d ${RECIPE_SYSROOT}/${target_includedir} ]; then
>> > +            mkdir -p ${RECIPE_SYSROOT}/${target_includedir}
>> > +        fi
>>
>> this looks ok from looks of it. Can you check what changes in
>> buildhistory when doing this for baremetal ( non-newlib ) build ?
>>
>
> Hi Khem,
>
> Sure thing, after the patch buildhistory reports only a change in size
> (for doc which is a little odd):
>  $ buildhistory-diff
>
> packages/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-riscv32/gcc-cross-canadian-riscv32-doc:
> PKGSIZE changed from 181563 to 2993113 (+1549%)
>
> I was a bit curious on what had changed in the docs and some docfiles used
> to have "timestamp" in them and now they contain actual data.
>
> Alejandro
>
>
>>
>> >         export CC_FOR_BUILD="${BUILD_CC}"
>> >         export CXX_FOR_BUILD="${BUILD_CXX}"
>> >         export CFLAGS_FOR_BUILD="${BUILD_CFLAGS}"
>> > @@ -180,9 +183,6 @@ SYSTEMLIBS = "${target_base_libdir}/"
>> >  SYSTEMLIBS1 = "${target_libdir}/"
>> >
>> >  EXTRA_OECONF += "--enable-poison-system-directories"
>> > -EXTRA_OECONF:remove:elf = "--with-sysroot=/not/exist"
>> > -EXTRA_OECONF:remove:eabi = "--with-sysroot=/not/exist"
>> > -EXTRA_OECONF:append:elf = " --without-headers --with-newlib"
>> > -EXTRA_OECONF:append:eabi = " --without-headers --with-newlib"
>> > +
>> >  # gcc 4.7 needs -isystem
>> >  export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET}
>> -isystem=${target_includedir}"
>> > --
>> > 2.25.1
>> >
>> >
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#160383):
>> https://lists.openembedded.org/g/openembedded-core/message/160383
>> > Mute This Topic: https://lists.openembedded.org/mt/88341227/1997914
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> raj.khem@gmail.com]
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> >
>>
>

--000000000000947f7e05d550cf94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sounds good to me thanks for doing it=C2=A0</div><div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, J=
an 11, 2022 at 1:27 AM Alejandro Enedino Hernandez Samaniego &lt;<a href=3D=
"mailto:alejandro@enedino.org">alejandro@enedino.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"></div><div dir=3D"ltr"><d=
iv dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,sans=
-serif;font-size:small"><span style=3D"font-family:Arial,Helvetica,sans-ser=
if">On Tue, 11 Jan 2022 at 00:55, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:</span><br></d=
iv></div></div><div dir=3D"ltr"><div class=3D"gmail_quote"></div></div><div=
 dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Mon, Jan 10, 2022 at 6:50 PM Alejandro Hernandez Samanieg=
o<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank">alejandro@en=
edino.org</a>&gt; wrote:<br>
&gt;<br>
&gt; While building GCC it checks whether the include directory exists,<br>
&gt; if it doesnt it throws an error and exits:<br>
&gt;<br>
&gt; | The directory that should contain system headers does not exist:<br>
&gt; | tmp/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-riscv32/<=
br>
&gt;=C2=A0 =C2=A0 =C2=A011.2.0-r0/recipe-sysroot/usr/include/<br>
&gt; | make[1]: *** [Makefile:3257: stmp-fixinc] Error 1<br>
&gt;<br>
&gt; Even though for the baremetal toolchain not having this directory<br>
&gt; does make sense.<br>
&gt;<br>
&gt; We overcame this by removing the --with-sysroot=3D/not/exist argument<=
br>
&gt; for baremetal toolchains (via TARGET_OS override), however, the<br>
&gt; newlib toolchain does have headers and an includedir, hence by fixing<=
br>
&gt; the baremetal toolchain we broke the newlib one since it uses the same=
<br>
&gt; TARGET_OS as baremetal, causing for example (on newlib):<br>
&gt;<br>
&gt; /sdk/sysroots/x86_64-pokysdk-linux/usr/lib/riscv32-poky-elf/gcc/<br>
&gt;=C2=A0 =C2=A0 =C2=A0riscv32-poky-elf/11.2.0/include/stdint.h:9:16:<br>
&gt; fatal error: stdint.h: No such file or directory<br>
&gt;<br>
&gt; | # include_next &lt;stdint.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~=
~~<br>
&gt; compilation terminated.<br>
&gt;<br>
&gt; By creating a dummy includedir, and removing the previous fix we<br>
&gt; allow GCC to be built the same way, unifying the cross compiler<br>
&gt; for all targets.<br>
&gt;<br>
&gt; After this fix both TCLIBC=3Dbaremetal and TCLIBC=3Dnewlib SDKs work<b=
r>
&gt; properly.<br>
&gt;<br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank">alejandro@enedino.org</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 8 ++++----<br=
>
&gt;=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/r=
ecipes-devtools/gcc/gcc-cross-canadian.inc<br>
&gt; index 495dd9070b..168486bd4e 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc<br>
&gt; @@ -45,6 +45,9 @@ export WINDRES_FOR_TARGET =3D &quot;${TARGET_PREFIX}=
windres&quot;<br>
&gt;=C2=A0 export ARCH_FLAGS_FOR_TARGET =3D &quot;--sysroot=3D${STAGING_DIR=
_TARGET}&quot;<br>
&gt;<br>
&gt;=C2=A0 do_configure () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -d ${RECIPE_SYSROOT}/${target_incl=
udedir} ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${RECIPE_SYSROOT}/=
${target_includedir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
this looks ok from looks of it. Can you check what changes in<br>
buildhistory when doing this for baremetal ( non-newlib ) build ?<br></bloc=
kquote><div><br></div></div></div><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;=
font-size:small">Hi Khem,</div><div class=3D"gmail_default" style=3D"font-f=
amily:arial,sans-serif;font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-family:arial,sans-serif;font-size:small">Sure thing, afte=
r the patch buildhistory reports only a change in size (for doc which is a =
little odd):<br>=C2=A0$ buildhistory-diff =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>packages/x86_64-nat=
ivesdk-pokysdk-linux/gcc-cross-canadian-riscv32/gcc-cross-canadian-riscv32-=
doc: PKGSIZE changed from 181563 to 2993113 (+1549%)</div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:=
small">I was a bit curious on what had changed in the docs and some docfile=
s used to have &quot;timestamp&quot; in them and now they contain actual da=
ta.</div></div></div></div><div dir=3D"ltr"><div class=3D"gmail_quote"><div=
><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-family:arial=
,sans-serif;font-size:small">Alejandro</div></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export CC_FOR_BUILD=3D&quot;${BUILD_C=
C}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export CXX_FOR_BUILD=3D&quot;${BUILD_=
CXX}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export CFLAGS_FOR_BUILD=3D&quot;${BUI=
LD_CFLAGS}&quot;<br>
&gt; @@ -180,9 +183,6 @@ SYSTEMLIBS =3D &quot;${target_base_libdir}/&quot;<=
br>
&gt;=C2=A0 SYSTEMLIBS1 =3D &quot;${target_libdir}/&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECONF +=3D &quot;--enable-poison-system-directories&quot;=
<br>
&gt; -EXTRA_OECONF:remove:elf =3D &quot;--with-sysroot=3D/not/exist&quot;<b=
r>
&gt; -EXTRA_OECONF:remove:eabi =3D &quot;--with-sysroot=3D/not/exist&quot;<=
br>
&gt; -EXTRA_OECONF:append:elf =3D &quot; --without-headers --with-newlib&qu=
ot;<br>
&gt; -EXTRA_OECONF:append:eabi =3D &quot; --without-headers --with-newlib&q=
uot;<br>
&gt; +<br>
&gt;=C2=A0 # gcc 4.7 needs -isystem<br>
&gt;=C2=A0 export ARCH_FLAGS_FOR_TARGET =3D &quot;--sysroot=3D${STAGING_DIR=
_TARGET} -isystem=3D${target_includedir}&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#160383): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/160383" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/160383</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88341227=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/88341227/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000947f7e05d550cf94--

