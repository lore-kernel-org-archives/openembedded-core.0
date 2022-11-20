Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAA7C4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 23:56:33 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.26493.1668988588420890701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 15:56:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iI0Cg+Ib;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id u2so12818558ljl.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 15:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IeFwNZzVFyBV0/UyRSZ2ozE1UPyFlsPLu7VFk4chero=;
        b=iI0Cg+IbwjvlZGHwn1fMdQwne/MaVO/JLBWK57ad63zGb787BhGh5aY5sTIxOvnx38
         Mo2ZIEKwayGCG1+nXH6jCNurB/KW7d/ohxNM2VPIpvvsYUTOJkvepOdyoTmtOsGDluKJ
         03nq8i3ECJ5mmo25sViJe+6doMzkwcwsFHF3PRnxIKmCwfzSUmKM+GgebEJakhTQBk68
         5P47YDa3WVfrUvUWwJagvaHETQb+Y3x+4rbGGRdsctmH3oCSICADw9b+iRiL3dX6DhVV
         FCG3PPVHhNhqRpJ3DFAvEA7wmieSug3S9wlh5TfDafYrBmCGfp5kW+5xT8PcQJbDh1AZ
         UYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IeFwNZzVFyBV0/UyRSZ2ozE1UPyFlsPLu7VFk4chero=;
        b=u6sNXauBMjJ3wfnDbO6ypAGk2fIKCpr7jy8PujhIgw6BdsbuaXT3C1GKSSCVBDrUcl
         e372bj/p17M1dAzLf/3ezdBUs32qQFkiN2h2dl9KyERKKAZzBytq0sCeJdyy+AWaj+xE
         ebsnJyt27ueu2PoJfzS70XKqI3F31hSKG2eFqAVGGVSOeLgiD0hpKv3kX6Xyun+WPHD0
         PGz3wh1Lji0wisFAOW6KMRaU5Oww9zYR6Zs8txLEjqNdYMwgERjwhaIyflBS9jbYVGKl
         1hDKaEoe+GODMthGj+XldcZpbAt7EnkpicqwHUx2LgN7ACbD5XjAVE+7ozN2Hbsfzv96
         548Q==
X-Gm-Message-State: ANoB5pmN30awdLIVycDgnd70RNGKR4DtAzuCU7zzEa4Ihj2a2hiavxUP
	ra/cCNMU0gvb2NnnHJWx4QFMWzyG2Ii1qXR1IFs=
X-Google-Smtp-Source: AA0mqf6k5tRmPBjY9WU5mx2fj6c6TFGdIoO9Zo8+POJ0H+aLTHI6YDabHEVT+txWUxii9FUPaaU3v9daAIINgUDHNAM=
X-Received: by 2002:a05:651c:1145:b0:277:8759:bf65 with SMTP id
 h5-20020a05651c114500b002778759bf65mr4673474ljo.108.1668988586517; Sun, 20
 Nov 2022 15:56:26 -0800 (PST)
MIME-Version: 1.0
References: <20221120175237.194899-1-f_l_k@t-online.de> <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
In-Reply-To: <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Nov 2022 00:56:15 +0100
Message-ID: <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d568fa05edefaf02"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 23:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173643

--000000000000d568fa05edefaf02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Python community has no plans for python4 whatsoever. Anything but gentle
and steady evolution won=E2=80=99t be well received.

https://www.techrepublic.com/article/programming-languages-why-python-4-0-w=
ill-probably-never-arrive-according-to-its-creator/


Alex

On Mon 21. Nov 2022 at 0.17, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Sun, Nov 20, 2022 at 9:52 AM Markus Volk <f_l_k@t-online.de> wrote:
>
>> Currently /usr/bin/python is provided by the python2 package. If python2
>> is not installed, the built image lacks a provider for it.
>> This results in failed scripts when using '/usr/bin/python' shebang.
>>
>> This patch adds a /usr/bin/python symlink for python3 to fix this issue.
>> For images containing python2 and python3, the do_rootfs task will fail
>> because now both of them provide the same file.
>> To allow this corner case, a DISTRO_FEATURE 'python2' has been introduce=
d
>> which,
>> if set, will prevent python3 from creating the symlink.
>>
>> The link is created with relative path because using an absolute path
>> would fail
>> for native and nativesdk.
>
>
> What happens if and when python4 comes ?
> This might get us into same mess we had migrating python2 to 3
>
>
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>  meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
>>  meta/recipes-devtools/python/python3_3.11.0.bb             | 4 ++++
>>  2 files changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json
>> b/meta/recipes-devtools/python/python3/python3-manifest.json
>> index 64203cf0fc..7b6f509a45 100644
>> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>> @@ -203,6 +203,7 @@
>>          "files": [
>>              "${bindir}/python${PYTHON_MAJMIN}",
>>              "${bindir}/python${PYTHON_MAJMIN}.real",
>> +            "${bindir}/python",
>>              "${bindir}/python3",
>>              "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
>>              "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
>> diff --git a/meta/recipes-devtools/python/python3_3.11.0.bb
>> b/meta/recipes-devtools/python/python3_3.11.0.bb
>> index 92a1f69320..18b631f79d 100644
>> --- a/meta/recipes-devtools/python/python3_3.11.0.bb
>> +++ b/meta/recipes-devtools/python/python3_3.11.0.bb
>> @@ -144,6 +144,7 @@ do_install:prepend() {
>>
>>  do_install:append:class-target() {
>>          oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
>> +        ${@bb.utils.contains('DISTRO_FEATURES', 'python2', '', 'ln -sf
>> ./python3 ${D}${bindir}/python', d)}
>>  }
>>
>>  do_install:append:class-native() {
>> @@ -156,6 +157,7 @@ do_install:append:class-native() {
>>          # (these often end up too long for the #! parser in the kernel
>> as the
>>          # buffer is 128 bytes long).
>>          ln -s python3-native/python3 ${D}${bindir}/nativepython3
>> +        ${@bb.utils.contains('DISTRO_FEATURES', 'python2', '', 'ln -sf
>> ./python3-native/python3 ${D}${bindir}/nativepython', d)}
>>
>>          # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,00=
0
>> of them
>>          # and the overhead in each recipe-sysroot-native isn't worth it=
,
>> particularly
>> @@ -213,6 +215,7 @@ do_install:append() {
>>  }
>>
>>  do_install:append:class-nativesdk () {
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'python2', '', 'ln -sf
>> ./python3 ${D}${bindir}/python', d)}
>>      # Make sure we use /usr/bin/env python
>>      for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
>>           sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
>> @@ -376,6 +379,7 @@ RRECOMMENDS:${PN}-crypt:append:class-nativesdk =3D "
>> ${MLPREFIX}openssl ${MLPREFIX
>>
>>  # For historical reasons PN is empty and provided by python3-modules
>>  FILES:${PN} =3D ""
>> +RPROVIDES:${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES', 'python2',
>> '', '${bindir}/python', d)}"
>>  RPROVIDES:${PN}-modules =3D "${PN}"
>>
>>  FILES:${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc=
3"
>> --
>> 2.34.1
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173642):
> https://lists.openembedded.org/g/openembedded-core/message/173642
> Mute This Topic: https://lists.openembedded.org/mt/95156228/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d568fa05edefaf02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Python community has no plans for python4 whatsoever. Any=
thing but gentle and steady evolution won=E2=80=99t be well received.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><div><a href=3D"https://www.t=
echrepublic.com/article/programming-languages-why-python-4-0-will-probably-=
never-arrive-according-to-its-creator/">https://www.techrepublic.com/articl=
e/programming-languages-why-python-4-0-will-probably-never-arrive-according=
-to-its-creator/</a></div><br></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon 21. Nov 2022 at 0.17, Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,=
204)"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Sun, Nov 20, 2022 at 9:52 AM Markus Volk &lt;<a href=
=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">Currently /usr/bin/python is provided by th=
e python2 package. If python2<br>
is not installed, the built image lacks a provider for it.<br>
This results in failed scripts when using &#39;/usr/bin/python&#39; shebang=
.<br>
<br>
This patch adds a /usr/bin/python symlink for python3 to fix this issue.<br=
>
For images containing python2 and python3, the do_rootfs task will fail<br>
because now both of them provide the same file.<br>
To allow this corner case, a DISTRO_FEATURE &#39;python2&#39; has been intr=
oduced which,<br>
if set, will prevent python3 from creating the symlink.<br>
<br>
The link is created with relative path because using an absolute path would=
 fail<br>
for native and nativesdk.</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">What happens if and when python4 comes ?</div><div dir=3D"auto">T=
his might get us into same mess we had migrating python2 to 3</div></div></=
div><div><div class=3D"gmail_quote"><div dir=3D"auto"><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,=
204)" dir=3D"auto"><br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/python3/python3-manifest.json | 1 +<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.11.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.11.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
=C2=A02 files changed, 5 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json<br>
index 64203cf0fc..7b6f509a45 100644<br>
--- a/meta/recipes-devtools/python/python3/python3-manifest.json<br>
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json<br>
@@ -203,6 +203,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;files&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${bindir}/python${PYT=
HON_MAJMIN}&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${bindir}/python${PYT=
HON_MAJMIN}.real&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python&quot;,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${bindir}/python3&quo=
t;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${includedir}/python$=
{PYTHON_MAJMIN}/pyconfig*.h&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/UserDict.py&quot;,<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.11.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.11.0.bb</a> b/meta/recip=
es-devtools/python/<a href=3D"http://python3_3.11.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python3_3.11.0.bb</a><br>
index 92a1f69320..18b631f79d 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.11.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.11.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.11.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.11.0.bb</a><br>
@@ -144,6 +144,7 @@ do_install:prepend() {<br>
<br>
=C2=A0do_install:append:class-target() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header python${PYTHON_MAJMIN}=
/pyconfig.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;python2&#39;, &#39;&#39;, &#39;ln -sf ./python3 ${D}${bindir}/python=
&#39;, d)}<br>
=C2=A0}<br>
<br>
=C2=A0do_install:append:class-native() {<br>
@@ -156,6 +157,7 @@ do_install:append:class-native() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# (these often end up too long for the #!=
 parser in the kernel as the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# buffer is 128 bytes long).<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s python3-native/python3 ${D}${bindir=
}/nativepython3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;python2&#39;, &#39;&#39;, &#39;ln -sf ./python3-native/python3 ${D}$=
{bindir}/nativepython&#39;, d)}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove the opt-1.pyc and opt-2.pyc file=
s. There are over 3,000 of them<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# and the overhead in each recipe-sysroot=
-native isn&#39;t worth it, particularly<br>
@@ -213,6 +215,7 @@ do_install:append() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install:append:class-nativesdk () {<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;python2=
&#39;, &#39;&#39;, &#39;ln -sf ./python3 ${D}${bindir}/python&#39;, d)}<br>
=C2=A0 =C2=A0 =C2=A0# Make sure we use /usr/bin/env python<br>
=C2=A0 =C2=A0 =C2=A0for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bin=
dir}`; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;1s|^#!.*|#!/usr/bin/env p=
ython3|&#39; $PYTHSCRIPT<br>
@@ -376,6 +379,7 @@ RRECOMMENDS:${PN}-crypt:append:class-nativesdk =3D &quo=
t; ${MLPREFIX}openssl ${MLPREFIX<br>
<br>
=C2=A0# For historical reasons PN is empty and provided by python3-modules<=
br>
=C2=A0FILES:${PN} =3D &quot;&quot;<br>
+RPROVIDES:${PN} =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;python2&#39;, &#39;&#39;, &#39;${bindir}/python&#39;, d)}&quot;<br>
=C2=A0RPROVIDES:${PN}-modules =3D &quot;${PN}&quot;<br>
<br>
=C2=A0FILES:${PN}-pydoc +=3D &quot;${bindir}/pydoc${PYTHON_MAJMIN} ${bindir=
}/pydoc3&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div><div><div class=3D"gmail_quote"></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173642): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173642" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173642</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95156228/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95156228/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d568fa05edefaf02--

