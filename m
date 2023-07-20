Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA5BEB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 16:38:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.1968.1689871128682441185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 09:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Nki6yzi0;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso6972615e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 09:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689871127; x=1690475927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ylLCBtpyRumXiRICzv41le/igaCv4xlLkmrBFSrCBxQ=;
        b=Nki6yzi0dO+9DKqgeKBeYzPB+IqgpqPg26tAluMYFBpmu7TARzZpPV67rBwuzaV7ka
         Juyb4oAaF+Xn6rofYl/d0qmepUgMg6BCVjwlPZLy/2i8ZCjcLscqCpqz7jxcBbtmcAna
         /4RbJ+cmhhh0zsFnkXofGDsnbkwe/HAfnaVrGqEI5P/QNarLzzjiuqwKGynhtopPKvXV
         t/7VSJZHqKtuX8vEeGGrQJT7jh0wdZOIBCTw+rT+WRzdehDlYf5KIyjeh8I4Qs6NhJwd
         CtiQYHI93hcfVkqSgUrEToPpjUfen0blFTBrKEzYwM3mQMxTDMiViPOJty/N0GnQDiO3
         lfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689871127; x=1690475927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylLCBtpyRumXiRICzv41le/igaCv4xlLkmrBFSrCBxQ=;
        b=IFTIl2ToYNIwbLMDTBU8X6MLLtaWQmW6KKBkfbDVIQNo/5AN7KBxWXuyR05AiBkXRG
         dWmQ0/52rkIvnWmkebU8Jgv+wFMWiprvJQ+nkwDmb2emGahtgEIOmmFUOzVrYhlAD+9x
         qHblmyY76kVk4a1+EGCVhwugZ1wZUYqnGlr14HNujnUlBO7EViN5Qh5GWoorCwBxvHkY
         y6P5EYPehkkI1Fn0T/k8pNtVJ8GL3MP5vXVAL8YoxjGefYmkTtOwshL1mOSHn3PlzN8E
         5J8onFc7BRPX7H4riVIj91fGejueUGCZ9pqWOg1iafacat7jAVrMrockk6WVrnS6Dttw
         WMCg==
X-Gm-Message-State: ABy/qLbZV03pKwPHjEkJZcpt3ALIwXq7p+3Z/CmfMouwyhFu5d70diCY
	hR97X0G4xMgrTp6Fkg3rzibc9Z/JaqSxoeYhu24=
X-Google-Smtp-Source: APBJJlH42WAjqqxfLpsi/BxdOBz+35klAGyrpU0ZhHxv4MA2mHSlAG/VJgAipNfMm5JTBI3d10JT9bsrt7k8Ms9PTVQ=
X-Received: by 2002:a1c:7413:0:b0:3fb:b18a:f32d with SMTP id
 p19-20020a1c7413000000b003fbb18af32dmr5303272wmc.17.1689871126704; Thu, 20
 Jul 2023 09:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230720162535.116519-1-peron.clem@gmail.com>
In-Reply-To: <20230720162535.116519-1-peron.clem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 20 Jul 2023 18:38:35 +0200
Message-ID: <CA+chaQe+eoUuus_huavoJ6mAuRx_8Fp49gbuKO+38dZHSh=nvw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/4] Bump Protobuf/gRPC
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003937ac0600edc81f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 16:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184649

--0000000000003937ac0600edc81f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

These patches should be sent to openembedded-devel not openembedded-core.

> ERROR: abseil-cpp-20230125.3-r0 do_package: Variable Requires:
absl_config =3D 20230125, absl_core_headers =3D 20230125,
absl_log_internal_append_truncated =3D 20230125, absl_log_internal_config =
=3D
20230125, absl_log_internal_globals =3D 20230125, absl_log_severity =3D
20230125, absl_strings =3D 20230125, absl_str_format =3D 20230125, absl_tim=
e =3D
20230125, absl_span  contains an operation using the old override syntax.
Please convert this layer/metadata before attempting to use with a newer
bitbake.

Do you have this change in your build?
https://lists.openembedded.org/g/openembedded-core/message/179019

On Thu, Jul 20, 2023 at 6:25=E2=80=AFPM Cl=C3=A9ment P=C3=A9ron <peron.clem=
@gmail.com> wrote:

> Hi,
>
> I'm trying to bump gRPC to a more recent version,
> but it requires a bump of protobuf.
>
> I'm strugling with the following issue when compiling:
>
> ERROR: abseil-cpp-20230125.3-r0 do_package: Variable Requires: absl_confi=
g
> =3D 20230125, absl_core_headers =3D 20230125,
> absl_log_internal_append_truncated =3D 20230125, absl_log_internal_config=
 =3D
> 20230125, absl_log_internal_globals =3D 20230125, absl_log_severity =3D
> 20230125, absl_strings =3D 20230125, absl_str_format =3D 20230125, absl_t=
ime =3D
> 20230125, absl_span  contains an operation using the old override syntax.
> Please convert this layer/metadata before attempting to use with a newer
> bitbake.
> ERROR: Logfile of failure stored in:
> /build/tmp/work/armv8a-poky-linux/abseil-cpp/20230125.3-r0/temp/log.do_pa=
ckage.2192204
> ERROR: Task
> (/build/../meta-outsight/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do=
_package)
> failed with exit code '1'
>
> Do you have an idea of what is happening?
>
> Thanks for your help
>
> Cl=C3=A9ment P=C3=A9ron (4):
>   jsoncpp: extend with nativesdk
>   devtools: protobuf: add utf8-range recipe
>   protobuf: bump to 3.23.4
>   devtools: grpc: bump to 1.56.2
>
>  ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------
>  ...d-separate-export-for-plugin-targets.patch | 93 -------------------
>  .../grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.bb}   |  6 +-
>  .../recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb |  2 +-
>  .../0001-Fix-linking-error-with-ld-gold.patch | 69 --------------
>  ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  4 +-
>  ...protobuf_3.21.12.bb =3D> protobuf_3.23.4.bb} |  8 +-
>  .../protobuf/utf8-range_git.bb                | 22 +++++
>  8 files changed, 32 insertions(+), 234 deletions(-)
>  delete mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC=
-to-GPR_ABSEIL_SYNC.patch
>  delete mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plu=
gin-targets.patch
>  rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.bb=
}
> (92%)
>  delete mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld=
-gold.patch
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb =3D>
> protobuf_3.23.4.bb} (95%)
>  create mode 100644 meta-oe/recipes-devtools/protobuf/utf8-range_git.bb
>
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184644):
> https://lists.openembedded.org/g/openembedded-core/message/184644
> Mute This Topic: https://lists.openembedded.org/mt/100259348/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003937ac0600edc81f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">These patches should be sent to openembedded-devel not ope=
nembedded-core.<div><br></div><div>&gt; ERROR: abseil-cpp-20230125.3-r0 do_=
package: Variable Requires: absl_config =3D 20230125, absl_core_headers =3D=
 20230125, absl_log_internal_append_truncated =3D 20230125, absl_log_intern=
al_config =3D 20230125, absl_log_internal_globals =3D 20230125, absl_log_se=
verity =3D 20230125, absl_strings =3D 20230125, absl_str_format =3D 2023012=
5, absl_time =3D 20230125, absl_span=C2=A0=C2=A0<span class=3D"gmail-il">co=
ntains</span>=C2=A0<span class=3D"gmail-il">an</span>=C2=A0<span class=3D"g=
mail-il">operation</span>=C2=A0<span class=3D"gmail-il">using</span>=C2=A0<=
span class=3D"gmail-il">the</span>=C2=A0<span class=3D"gmail-il">old</span>=
=C2=A0<span class=3D"gmail-il">override</span>=C2=A0<span class=3D"gmail-il=
">syntax</span>. Please convert this layer/metadata before attempting to us=
e with a newer bitbake.</div><div><br></div><div>Do you have this change in=
 your build?</div><div><a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/message/179019">https://lists.openembedded.org/g/openembedded-cor=
e/message/179019</a><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jul 20, 2023 at 6:25=E2=80=AFPM Cl=C3=
=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gmail.com">peron.clem@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hi,<br>
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

--0000000000003937ac0600edc81f--

