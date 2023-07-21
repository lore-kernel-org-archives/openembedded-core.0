Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E2DEB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 09:07:49 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.3377.1689930468262409137
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 02:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=n5h99QyQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b74209fb60so25172521fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 02:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689930466; x=1690535266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W/VYHjMQ6NFQ9060ZK8+zWVh3x33Vc2vppGtemNaQvw=;
        b=n5h99QyQjmtsY9zW95TOTW0jpZMzEu+xvrsVea5gjlIjXexq4ox//KBCTAqpzMjcwl
         /LIUs7Ugn5VT0z/eH7l6p9BA+2UQCsVaQJzVDeE8050G8WbChBgv1H9QK3bQ4jOFXkko
         hM+Xaf9fweLkb8LmkNNUJWHc6IUW6cQ0NzDkt/chUnE/yv1IuYWUd7SzZX4tw8cwCgCA
         UBVmB+OarPt7ByJUoz9kn5kqMU0hie8FOnNAmicBZgZCyrJan/C8o7luFuqVpCE0oDIo
         u37ILyb/7weru79UKqX5w0aXnEB2DN7ZL54dLwh2S6Dh9D2JuJIRiPp75jBtpZlpHtFx
         418g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689930466; x=1690535266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/VYHjMQ6NFQ9060ZK8+zWVh3x33Vc2vppGtemNaQvw=;
        b=LiwYgRoKbX1P/+tRO3AW0/CvBPwGFkm7vjst5xhh6Y5gnwEQ5udXE4BFSbjGAvwECv
         PFkBWDHZkTrRCoLijIRbHXb8oouVmBQRyh7mer1lFHFWLWdNa81aOQrvrBBE0M9KPlXC
         KDBVjeuxh86RHldJ2V4Ox22jgxDVCk+PBqctGBzG+NLNAS7xwQ2QrkUqCXxqwQ+dp2HS
         VK31kW0UqCdiDE9sKldkiiNuCVQu2bwZeohZeC4Ol8cM+8wZIl9SSaAjGlLO2wr1++PJ
         GYXiiOczbBwCfoMisSHtiAKoeymtC3hY7L+RrFEbj1TinfYnC46y69pkwliytk8aJjR+
         Ysmg==
X-Gm-Message-State: ABy/qLbblpM2x46JgsMMLXaEp3yYKq7JjOzPFJPmgwwUhNbpDaAwxGDF
	71vxYmu2kDdrE9vveOrF+OY+tlbfX07AL5z1ZRs8csvGrJs=
X-Google-Smtp-Source: APBJJlErtcKMm+X7fct+Hj36u2z5sPH3BRVtWYbsRfiCnR9yC35QJtC4Oqs5Zujj4/f9irhJ2mI057/Vdkkg93JKIpE=
X-Received: by 2002:a2e:8883:0:b0:2b9:3461:45ad with SMTP id
 k3-20020a2e8883000000b002b9346145admr1153664lji.20.1689930466138; Fri, 21 Jul
 2023 02:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230720162535.116519-1-peron.clem@gmail.com> <CA+chaQe+eoUuus_huavoJ6mAuRx_8Fp49gbuKO+38dZHSh=nvw@mail.gmail.com>
In-Reply-To: <CA+chaQe+eoUuus_huavoJ6mAuRx_8Fp49gbuKO+38dZHSh=nvw@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 21 Jul 2023 11:07:34 +0200
Message-ID: <CAJiuCccvdXYM=gdSYRLdbGLC+koh=_JQTwEvw40R5mObs1eAsQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/4] Bump Protobuf/gRPC
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000211fd10600fb9906"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 09:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184677

--000000000000211fd10600fb9906
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Thu, 20 Jul 2023 at 18:38, Martin Jansa <martin.jansa@gmail.com> wrote:

> These patches should be sent to openembedded-devel not openembedded-core.
>

Sorry about that. I will send the next version in the correct ML


> > ERROR: abseil-cpp-20230125.3-r0 do_package: Variable Requires:
> absl_config =3D 20230125, absl_core_headers =3D 20230125,
> absl_log_internal_append_truncated =3D 20230125, absl_log_internal_config=
 =3D
> 20230125, absl_log_internal_globals =3D 20230125, absl_log_severity =3D
> 20230125, absl_strings =3D 20230125, absl_str_format =3D 20230125, absl_t=
ime =3D
> 20230125, absl_span  contains an operation using the old override syntax.
> Please convert this layer/metadata before attempting to use with a newer
> bitbake.
>
> Do you have this change in your build?
> https://lists.openembedded.org/g/openembedded-core/message/179019
>

No, thanks for pointing out this fix, I have proposed a backport to
kirkstone.

Regards,
Clement


>
> On Thu, Jul 20, 2023 at 6:25=E2=80=AFPM Cl=C3=A9ment P=C3=A9ron <peron.cl=
em@gmail.com>
> wrote:
>
>> Hi,
>>
>> I'm trying to bump gRPC to a more recent version,
>> but it requires a bump of protobuf.
>>
>> I'm strugling with the following issue when compiling:
>>
>> ERROR: abseil-cpp-20230125.3-r0 do_package: Variable Requires:
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
>> ERROR: Logfile of failure stored in:
>> /build/tmp/work/armv8a-poky-linux/abseil-cpp/20230125.3-r0/temp/log.do_p=
ackage.2192204
>> ERROR: Task
>> (/build/../meta-outsight/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:d=
o_package)
>> failed with exit code '1'
>>
>> Do you have an idea of what is happening?
>>
>> Thanks for your help
>>
>> Cl=C3=A9ment P=C3=A9ron (4):
>>   jsoncpp: extend with nativesdk
>>   devtools: protobuf: add utf8-range recipe
>>   protobuf: bump to 3.23.4
>>   devtools: grpc: bump to 1.56.2
>>
>>  ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------
>>  ...d-separate-export-for-plugin-targets.patch | 93 -------------------
>>  .../grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.bb}   |  6 +-
>>  .../recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb |  2 +-
>>  .../0001-Fix-linking-error-with-ld-gold.patch | 69 --------------
>>  ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  4 +-
>>  ...protobuf_3.21.12.bb =3D> protobuf_3.23.4.bb} |  8 +-
>>  .../protobuf/utf8-range_git.bb                | 22 +++++
>>  8 files changed, 32 insertions(+), 234 deletions(-)
>>  delete mode 100644
>> meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYN=
C-to-GPR_ABSEIL_SYNC.patch
>>  delete mode 100644
>> meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-pl=
ugin-targets.patch
>>  rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.b=
b}
>> (92%)
>>  delete mode 100644
>> meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-l=
d-gold.patch
>>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb =3D>
>> protobuf_3.23.4.bb} (95%)
>>  create mode 100644 meta-oe/recipes-devtools/protobuf/utf8-range_git.bb
>>
>> --
>> 2.41.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184644):
>> https://lists.openembedded.org/g/openembedded-core/message/184644
>> Mute This Topic: https://lists.openembedded.org/mt/100259348/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> Martin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000211fd10600fb9906
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace">Hi Martin,</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, 20 Jul 2023 at 18:38, Martin Ja=
nsa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr">These patches should be sent to openembedded-devel not openem=
bedded-core.</div></blockquote><div><br></div><div class=3D"gmail_default" =
style=3D"font-family:monospace">Sorry about that. I will send the next vers=
ion in the correct ML</div><div class=3D"gmail_default" style=3D"font-famil=
y:monospace"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div><br></div><div>&gt; ERROR: abseil-cpp-20230125.3-r0 do_=
package: Variable Requires: absl_config =3D 20230125, absl_core_headers =3D=
 20230125, absl_log_internal_append_truncated =3D 20230125, absl_log_intern=
al_config =3D 20230125, absl_log_internal_globals =3D 20230125, absl_log_se=
verity =3D 20230125, absl_strings =3D 20230125, absl_str_format =3D 2023012=
5, absl_time =3D 20230125, absl_span=C2=A0=C2=A0<span>contains</span>=C2=A0=
<span>an</span>=C2=A0<span>operation</span>=C2=A0<span>using</span>=C2=A0<s=
pan>the</span>=C2=A0<span>old</span>=C2=A0<span>override</span>=C2=A0<span>=
syntax</span>. Please convert this layer/metadata before attempting to use =
with a newer bitbake.</div><div><br></div><div>Do you have this change in y=
our build?</div><div><a href=3D"https://lists.openembedded.org/g/openembedd=
ed-core/message/179019" target=3D"_blank">https://lists.openembedded.org/g/=
openembedded-core/message/179019</a></div></div></blockquote><div><br></div=
><div class=3D"gmail_default" style=3D"font-family:monospace">No, thanks fo=
r pointing out this fix, I have proposed a backport to kirkstone.</div><div=
 class=3D"gmail_default" style=3D"font-family:monospace"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-family:monospace">Regards,<br>Clement<br=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Jul 20, 2023 at 6:25=E2=80=AFPM Cl=C3=A9ment P=C3=
=A9ron &lt;<a href=3D"mailto:peron.clem@gmail.com" target=3D"_blank">peron.=
clem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi,<br>
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
Do you have an idea of what is happening?<br>
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184644): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184644" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184644</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100259348/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100259348/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div>

--000000000000211fd10600fb9906--

