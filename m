Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3DCEB64DA
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 10:11:47 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.2708.1690020697466331828
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 03:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fEMhPqDA;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fbf1f6c771so4332556e87.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 03:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690020695; x=1690625495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HsdJq7JIMNeq7X5i+JQV1IwM8TsT8nZYEu0k5sjRW0g=;
        b=fEMhPqDA1Es9iLrr1dVdxkRm8xJ6sJilt/4LzYiBhh+HSIVPTB7XcRbWVhs03RCdp+
         F6SiJpj8BeAh8IlNfeG/Z6Ze8z3cw8Mfmmle5kTiIcfNk8aek0dyHZ0UlLT4AUN6Fm1v
         7R8I6uYGwFz7eUltPXHbp4/LO1maGW16ipSpLZ9D1awVjluCZJ/E6bWyJd8fXItRgLfR
         AP1Rr/qn2S/Jwl6DUb8uyXYtN7ge3+b2OwLOt+VJJ6/XQc/2iz8BCD9omp1LL8QAn0yg
         +myWjs40xDyzoNeDorxseY3htweB0KNdvsF5W7lyogax5aU/jaEfhlHXiM6KnvRE8AAO
         7uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690020695; x=1690625495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsdJq7JIMNeq7X5i+JQV1IwM8TsT8nZYEu0k5sjRW0g=;
        b=Tlv6NA4DedCk95Njzb3AAy6hp8oPMOuApb8VtIPIU4N+b1yFJkBLEslPj822A/gslq
         D5YAAEl0+ErTw2oHCcL3DHH5vPJJ/QmxdZvOONxwuO4izDthbuPwQu6LF+Xr37OL4EGY
         Yg/hHF/tqNI9WN2yBjhXsFsGXQ+uAWu2YOMQS34uvr13QRAT4ZsKxAroYzFO6GlsnbEH
         IM0HlZTFAkjkyegYsM4blhO93zJ5OTTAWuvq4wmHlZZ1yxs9SLpafPyz//kjy9FYvxXM
         l52zyab7TJVgjc3v4ngJz6av+ln+qWVKmsdj0saJUPaGogQ0dd4Eq79x7IS28sr1p9Gf
         3t/A==
X-Gm-Message-State: ABy/qLb5ddRqhW9PIbia4ZOz7FDMHKp/NQ/8BkeUPmVDKpRtLvUxy22q
	rNo0qCbDI1WSTZfFIDsdn/gGDZUhitgUEUtzQxc=
X-Google-Smtp-Source: APBJJlEr4b5OcXI16JSKX1V3XISA98k4uPHsGIsSEMpcdYtzrb0SUjGYmD1NYDngd5DflGtcmmsoyCIeS/ILFoWTSxU=
X-Received: by 2002:a05:6512:39d0:b0:4f8:70b0:eec6 with SMTP id
 k16-20020a05651239d000b004f870b0eec6mr2887765lfu.28.1690020694951; Sat, 22
 Jul 2023 03:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230720162535.116519-1-peron.clem@gmail.com> <CA+chaQe+eoUuus_huavoJ6mAuRx_8Fp49gbuKO+38dZHSh=nvw@mail.gmail.com>
 <1773D6CEC3F30D4C.21241@lists.openembedded.org>
In-Reply-To: <1773D6CEC3F30D4C.21241@lists.openembedded.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 22 Jul 2023 12:11:23 +0200
Message-ID: <CAJiuCcc03avpgZBwdB7e9_aQQhOJTDh80b+UjykcE9TBYz6a6A@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/4] Bump Protobuf/gRPC
To: peron.clem@gmail.com
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-core@lists.openembedded.org, 
	Wang Mingyu <wangmy@fujitsu.com>
Content-Type: multipart/alternative; boundary="0000000000002f8daf0601109bfd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 10:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184716

--0000000000002f8daf0601109bfd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 21 Jul 2023 at 11:07, Cl=C3=A9ment P=C3=A9ron via lists.openembedde=
d.org
<peron.clem=3Dgmail.com@lists.openembedded.org> wrote:

> Hi Martin,
>
> On Thu, 20 Jul 2023 at 18:38, Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
>> These patches should be sent to openembedded-devel not openembedded-core=
.
>>
>
> Sorry about that. I will send the next version in the correct ML
>
>
>> > ERROR: abseil-cpp-20230125.3-r0 do_package: Variable Requires:
>> absl_config =3D 20230125, absl_core_headers =3D 20230125,
>> absl_log_internal_append_truncated =3D 20230125, absl_log_internal_confi=
g =3D
>> 20230125, absl_log_internal_globals =3D 20230125, absl_log_severity =3D
>> 20230125, absl_strings =3D 20230125, absl_str_format =3D 20230125, absl_=
time =3D
>> 20230125, absl_span  contains an operation using the old override syntax=
.
>> Please convert this layer/metadata before attempting to use with a newer
>> bitbake.
>>
>> Do you have this change in your build?
>> https://lists.openembedded.org/g/openembedded-core/message/179019
>>
>
> No, thanks for pointing out this fix, I have proposed a backport to
> kirkstone.
>
> Regards,
> Clement
>
>
>>
>> On Thu, Jul 20, 2023 at 6:25=E2=80=AFPM Cl=C3=A9ment P=C3=A9ron <peron.c=
lem@gmail.com>
>> wrote:
>>
>>> Hi,
>>>
>>> I'm trying to bump gRPC to a more recent version,
>>> but it requires a bump of protobuf.
>>>
>>> I'm strugling with the following issue when compiling:
>>>
>>> ERROR: abseil-cpp-20230125.3-r0 do_package: Variable Requires:
>>> absl_config =3D 20230125, absl_core_headers =3D 20230125,
>>> absl_log_internal_append_truncated =3D 20230125, absl_log_internal_conf=
ig =3D
>>> 20230125, absl_log_internal_globals =3D 20230125, absl_log_severity =3D
>>> 20230125, absl_strings =3D 20230125, absl_str_format =3D 20230125, absl=
_time =3D
>>> 20230125, absl_span  contains an operation using the old override synta=
x.
>>> Please convert this layer/metadata before attempting to use with a newe=
r
>>> bitbake.
>>> ERROR: Logfile of failure stored in:
>>> /build/tmp/work/armv8a-poky-linux/abseil-cpp/20230125.3-r0/temp/log.do_=
package.2192204
>>> ERROR: Task
>>> (/build/../meta-outsight/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:=
do_package)
>>> failed with exit code '1'
>>>
>>> Do you have an idea of what is happening?
>>
>>
I'm now facing the issue that /usr/lib/libutf8_validity.a is installed by
both utf8-range-native and protobuf-native.

I'm not an expert but is it not kind of strange that a python package ships
a library in /usr/lib no? I would expect it to be used at link time but not
shipped. Am I correct?

https://github.com/protocolbuffers/protobuf/blob/main/python/setup.py#L309

Regards,
Clement



>
>>> Thanks for your help
>>>
>>> Cl=C3=A9ment P=C3=A9ron (4):
>>>   jsoncpp: extend with nativesdk
>>>   devtools: protobuf: add utf8-range recipe
>>>   protobuf: bump to 3.23.4
>>>   devtools: grpc: bump to 1.56.2
>>>
>>>  ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------
>>>  ...d-separate-export-for-plugin-targets.patch | 93 -------------------
>>>  .../grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.bb}   |  6 +-
>>>  .../recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb |  2 +-
>>>  .../0001-Fix-linking-error-with-ld-gold.patch | 69 --------------
>>>  ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  4 +-
>>>  ...protobuf_3.21.12.bb =3D> protobuf_3.23.4.bb} |  8 +-
>>>  .../protobuf/utf8-range_git.bb                | 22 +++++
>>>  8 files changed, 32 insertions(+), 234 deletions(-)
>>>  delete mode 100644
>>> meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SY=
NC-to-GPR_ABSEIL_SYNC.patch
>>>  delete mode 100644
>>> meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-p=
lugin-targets.patch
>>>  rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.=
bb}
>>> (92%)
>>>  delete mode 100644
>>> meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-=
ld-gold.patch
>>>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb =3D>
>>> protobuf_3.23.4.bb} (95%)
>>>  create mode 100644 meta-oe/recipes-devtools/protobuf/utf8-range_git.bb
>>>
>>> --
>>> 2.41.0
>>>
>>>
>>>
>>>
>>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184677):
> https://lists.openembedded.org/g/openembedded-core/message/184677
> Mute This Topic: https://lists.openembedded.org/mt/100259348/4240582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> peron.clem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002f8daf0601109bfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace">Hi,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 21 Jul 2023 at 11:07, Cl=C3=A9ment P=
=C3=A9ron via <a href=3D"http://lists.openembedded.org" target=3D"_blank">l=
ists.openembedded.org</a> &lt;peron.clem=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-family:monospace">Hi Martin=
,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 20 Jul 2023 at 18:38, Martin Jansa &lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r">These patches should be sent to openembedded-devel not openembedded-core=
.</div></blockquote><div><br></div><div style=3D"font-family:monospace">Sor=
ry about that. I will send the next version in the correct ML</div><div sty=
le=3D"font-family:monospace"><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div><br></div><div>&gt; ERROR: abseil-cpp-2=
0230125.3-r0 do_package: Variable Requires: absl_config =3D 20230125, absl_=
core_headers =3D 20230125, absl_log_internal_append_truncated =3D 20230125,=
 absl_log_internal_config =3D 20230125, absl_log_internal_globals =3D 20230=
125, absl_log_severity =3D 20230125, absl_strings =3D 20230125, absl_str_fo=
rmat =3D 20230125, absl_time =3D 20230125, absl_span=C2=A0=C2=A0<span>conta=
ins</span>=C2=A0<span>an</span>=C2=A0<span>operation</span>=C2=A0<span>usin=
g</span>=C2=A0<span>the</span>=C2=A0<span>old</span>=C2=A0<span>override</s=
pan>=C2=A0<span>syntax</span>. Please convert this layer/metadata before at=
tempting to use with a newer bitbake.</div><div><br></div><div>Do you have =
this change in your build?</div><div><a href=3D"https://lists.openembedded.=
org/g/openembedded-core/message/179019" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/message/179019</a></div></div></blockquot=
e><div><br></div><div style=3D"font-family:monospace">No, thanks for pointi=
ng out this fix, I have proposed a backport to kirkstone.</div><div style=
=3D"font-family:monospace"><br></div><div style=3D"font-family:monospace">R=
egards,<br>Clement<br><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 20, 2023 at 6:25=E2=80=
=AFPM Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gmail.com" t=
arget=3D"_blank">peron.clem@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
I&#39;m trying to bump gRPC to a more recent version,<br>
but it requires a bump of protobuf.<br>
<br>
I&#39;m strugling with the following issue when compiling:<br>
<br>
ERROR: abseil-cpp-20230125.3-r0 do_package: Variable Requires: absl_config =
=3D 20230125, absl_core_headers =3D 20230125, absl_log_internal_append_trun=
cated =3D 20230125, absl_log_internal_config =3D 20230125, absl_log_interna=
l_globals =3D 20230125, absl_log_severity =3D 20230125, absl_strings =3D 20=
230125, absl_str_format =3D 20230125, absl_time =3D 20230125, absl_span=C2=
=A0 contains an operation using the old override syntax. Please convert thi=
s layer/metadata before attempting to use with a newer bitbake.<br>
ERROR: Logfile of failure stored in: /build/tmp/work/armv8a-poky-linux/abse=
il-cpp/20230125.3-r0/temp/log.do_package.2192204<br>
ERROR: Task (/build/../meta-outsight/recipes-devtools/abseil-cpp/abseil-cpp=
_git.bb:do_package) failed with exit code &#39;1&#39;<br>
<br>
Do you have an idea of what is happening?</blockquote></div></blockquote></=
div></div></blockquote><div><br></div><div><div class=3D"gmail_default" sty=
le=3D"font-family:monospace">I&#39;m now facing the issue that=C2=A0/usr/li=
b/libutf8_validity.a is installed by both utf8-range-native and protobuf-na=
tive.</div><div class=3D"gmail_default" style=3D"font-family:monospace"><br=
>I&#39;m not an expert but is it not=C2=A0kind of strange that a python pac=
kage ships a library in /usr/lib no? I would expect it to be used at link t=
ime but not shipped. Am I correct?<br></div><br><a href=3D"https://github.c=
om/protocolbuffers/protobuf/blob/main/python/setup.py#L309">https://github.=
com/protocolbuffers/protobuf/blob/main/python/setup.py#L309</a><br></div><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-family:monospa=
ce">Regards,</div><div class=3D"gmail_default" style=3D"font-family:monospa=
ce">Clement</div></div><div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks for your help<br>
<br>
Cl=C3=A9ment P=C3=A9ron (4):<br>
=C2=A0 jsoncpp: extend with nativesdk<br>
=C2=A0 devtools: protobuf: add utf8-range recipe<br>
=C2=A0 protobuf: bump to 3.23.4<br>
=C2=A0 devtools: grpc: bump to 1.56.2<br>
<br>
=C2=A0...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------<br>
=C2=A0...d-separate-export-for-plugin-targets.patch | 93 ------------------=
-<br>
=C2=A0.../grpc/{<a href=3D"http://grpc_1.50.1.bb" rel=3D"noreferrer" target=
=3D"_blank">grpc_1.50.1.bb</a> =3D&gt; <a href=3D"http://grpc_1.56.2.bb" re=
l=3D"noreferrer" target=3D"_blank">grpc_1.56.2.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
6 +-<br>
=C2=A0.../recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9.5.bb" rel=
=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.5.bb</a> |=C2=A0 2 +-<br>
=C2=A0.../0001-Fix-linking-error-with-ld-gold.patch | 69 --------------<br>
=C2=A0...e-respect-CXX-LDFLAGS-variables-fix-.patch |=C2=A0 4 +-<br>
=C2=A0...<a href=3D"http://protobuf_3.21.12.bb" rel=3D"noreferrer" target=
=3D"_blank">protobuf_3.21.12.bb</a> =3D&gt; <a href=3D"http://protobuf_3.23=
.4.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.23.4.bb</a>} |=C2=A0=
 8 +-<br>
=C2=A0.../protobuf/<a href=3D"http://utf8-range_git.bb" rel=3D"noreferrer" =
target=3D"_blank">utf8-range_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 22 +++++<br>
=C2=A08 files changed, 32 insertions(+), 234 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Cha=
nged-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-=
separate-export-for-plugin-targets.patch<br>
=C2=A0rename meta-oe/recipes-devtools/grpc/{<a href=3D"http://grpc_1.50.1.b=
b" rel=3D"noreferrer" target=3D"_blank">grpc_1.50.1.bb</a> =3D&gt; <a href=
=3D"http://grpc_1.56.2.bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.56.2=
.bb</a>} (92%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Fi=
x-linking-error-with-ld-gold.patch<br>
=C2=A0rename meta-oe/recipes-devtools/protobuf/{<a href=3D"http://protobuf_=
3.21.12.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.21.12.bb</a> =
=3D&gt; <a href=3D"http://protobuf_3.23.4.bb" rel=3D"noreferrer" target=3D"=
_blank">protobuf_3.23.4.bb</a>} (95%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/protobuf/<a href=3D"http:=
//utf8-range_git.bb" rel=3D"noreferrer" target=3D"_blank">utf8-range_git.bb=
</a><br>
<br>
-- <br>
2.41.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184677): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184677" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184677</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100259348/424=
0582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100259348/4240582</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:peron.clem@gmail.com" targ=
et=3D"_blank">peron.clem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002f8daf0601109bfd--

