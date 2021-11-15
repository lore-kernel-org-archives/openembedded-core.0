Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03F3C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 14:35:34 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web08.23265.1636986933569870259
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 06:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KvnOBH+7;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id d11so36001759ljg.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 06:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3cIPZrjEIsdxuVgH+Tfyvn7M+QGC3BFrWBKo58DzX+s=;
        b=KvnOBH+7dMRla30KTKpKCHKIADJS80d/tyM0OiyCfga1zTYWG9EK+yToKTp7P+FPT9
         npg/oWY/sm2NKsw7bG1/2ms40yViCPnxpqfrlVcYxIgIU/9pysCuTou5AyvCp3ZqVnfK
         SM1Z0ZCdWihYd3LpdgVqhPUzqpCZg/8c5N5hVUDtJ4hyPmOKE+1jupCW36HMA1rqpnXe
         HjhbNnphkPjg/Ji7xTsaCtw7h+xCDUlKrYV9DGwrGw1/WkKb3BkHLQuqltr9ThqM3Mkr
         5yucM+Q7+BWuHZlqM+0poN+JddtWD8gYysugetpghNlagJH8A9gwp+NUxPYpH/zZWS+E
         K4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3cIPZrjEIsdxuVgH+Tfyvn7M+QGC3BFrWBKo58DzX+s=;
        b=cXLQoNZq9ksO1qA9pDg4K6xe87cZ2TUweDW4XBhNgtpNxr/YCXGnLQUS2QjRPHmVt6
         P2z0Os/jWSccB+8wnnNASZy+94Hiaqkx4V+OxCBkNLaCS60sGG2y54UmCJ+qRImvPYy+
         SHAQFm2FX14SN4MQ6lW6JCwNXN4KCEf0tYhhCQ3c0eNiP2lAAHr3n5FW06J6eJNkyVZc
         MK8spRM5IrGCV/Uu8fVnwNzl/0ZOFrZOe2+YIXwIoABCzZerx9oEeGf81uepp7rRsVxU
         6vTCfIvYIMbcw0zyzuJvzX3/jp8tPJuvgK5jqlm4/H4u57ubORkIrENHD73i4xH/t0VG
         9iow==
X-Gm-Message-State: AOAM530zBdONerEY5ZJRGyKjWvETPjpUxzgssqtJK19hEWimoSZ44frI
	HRQiDNoAPsnjqfcDSAMD2khXPHETcR2swo8dKw0=
X-Google-Smtp-Source: 
 ABdhPJy24oEQKfrGZW5d0AXfP6Nj17rNFuMKs6TSWP6nmi1mAbmxd2cgl6gOOqp4BCOw/VJx/74B60sLmYrcqp+Od7U=
X-Received: by 2002:a2e:9510:: with SMTP id
 f16mr39908128ljh.409.1636986931697;
 Mon, 15 Nov 2021 06:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20211114202648.316923-1-quaresma.jose@gmail.com>
 <CANNYZj8pUc4Af9zoC0KGOFcbDT7e=5SQMCnv6LL_OcSnV3QQ+g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8pUc4Af9zoC0KGOFcbDT7e=5SQMCnv6LL_OcSnV3QQ+g@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 15 Nov 2021 14:35:20 +0000
Message-ID: 
 <CANPvuRmnX71Y0iTpK6m4Mk7KZrA=wbD7Wa8WtkzZ0D5bEG6f+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] spirv-headers: upgrade 1.5.4 -> 1.5.5
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000090dd4405d0d4b80a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 14:35:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158294

--00000000000090dd4405d0d4b80a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia segunda,
15/11/2021 =C3=A0(s) 13:57:

> There is no 1.5.5 release or tag here:
> https://github.com/KhronosGroup/SPIRV-Headers
> so this breaks version checks and automated updates.
>
> If you want to bump SRCREV to a post-release commit, PV should be set lik=
e
> this:
> PV =3D "1.5.4+git${SRCPV}"
>
> I'll send a patch to correct this.
>

I see on this MR that the version is bumped on CMakeLists.txt
and the user asks to create a new tag.
https://github.com/KhronosGroup/SPIRV-Headers/pull/246

But there ano updates on the code like on the last tag 1.5.4.
https://github.com/KhronosGroup/SPIRV-Headers/commit/7845730cab6ebbdeb621e7=
349b7dc1a59c3377be

You are right, the 1.5.5 is not concluded.
Thanks for looking and for the patch with the fixup.


>
> Alex
>
> On Sun, 14 Nov 2021 at 21:27, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
>
>> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>> ---
>>  .../spir/{spirv-headers_1.5.4.bb =3D> spirv-headers_1.5.5.bb}     | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-graphics/spir/{spirv-headers_1.5.4.bb =3D>
>> spirv-headers_1.5.5.bb} (92%)
>>
>> diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
>> b/meta/recipes-graphics/spir/spirv-headers_1.5.5.bb
>> similarity index 92%
>> rename from meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
>> rename to meta/recipes-graphics/spir/spirv-headers_1.5.5.bb
>> index 6c978ce51a..101a2e2948 100644
>> --- a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
>> +++ b/meta/recipes-graphics/spir/spirv-headers_1.5.5.bb
>> @@ -7,7 +7,7 @@ HOMEPAGE =3D "https://www.khronos.org/registry/spir-v"
>>  LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc938b85bceb8fb26c1a807f28a52=
ae2d"
>>
>> -SRCREV =3D "6cae8216a6ea19ff3f237af01e54378c1ff81fcd"
>> +SRCREV =3D "c8213b3c5a2cf3a0f5c4d1e7d7b8fc2ac9f4806d"
>>  SRC_URI =3D "git://
>> github.com/KhronosGroup/SPIRV-Headers;protocol=3Dhttps;branch=3Dmaster"
>>  UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)$"
>>  S =3D "${WORKDIR}/git"
>> --
>> 2.33.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#158267):
>> https://lists.openembedded.org/g/openembedded-core/message/158267
>> Mute This Topic: https://lists.openembedded.org/mt/87054847/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000090dd4405d0d4b80a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia s=
egunda, 15/11/2021 =C3=A0(s) 13:57:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div>There is no 1.5.5 release or tag =
here:</div><div><a href=3D"https://github.com/KhronosGroup/SPIRV-Headers" t=
arget=3D"_blank">https://github.com/KhronosGroup/SPIRV-Headers</a></div><di=
v>so this breaks version checks and automated updates.</div><div><br></div>=
<div>If you want to bump SRCREV to a post-release commit, PV should be set =
like this:</div><div>PV =3D &quot;1.5.4+git${SRCPV}&quot;</div><div><br></d=
iv><div>I&#39;ll send a patch to correct this.</div></div></blockquote><div=
><br></div><div>I see on this MR that the version is bumped on CMakeLists.t=
xt</div><div>and the user asks to create a new tag.</div><div><a href=3D"ht=
tps://github.com/KhronosGroup/SPIRV-Headers/pull/246">https://github.com/Kh=
ronosGroup/SPIRV-Headers/pull/246</a></div><div><br></div><div>But there an=
o updates on the code like on the last tag 1.5.4.</div><div><a href=3D"http=
s://github.com/KhronosGroup/SPIRV-Headers/commit/7845730cab6ebbdeb621e7349b=
7dc1a59c3377be">https://github.com/KhronosGroup/SPIRV-Headers/commit/784573=
0cab6ebbdeb621e7349b7dc1a59c3377be</a><br></div><div><br></div><div>You are=
 right, the 1.5.5 is not concluded.</div><div>Thanks for looking=C2=A0and f=
or the patch with the fixup.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div><br></div><div>Alex<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sun, 14 Nov 2021 at 21:27, Jose Quaresma &lt;<a href=3D"mailto:quaresm=
a.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: J=
ose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blan=
k">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../spir/{<a href=3D"http://spirv-headers_1.5.4.bb" rel=3D"noreferrer=
" target=3D"_blank">spirv-headers_1.5.4.bb</a> =3D&gt; <a href=3D"http://sp=
irv-headers_1.5.5.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.=
5.5.bb</a>}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-graphics/spir/{<a href=3D"http://spirv-headers_1.=
5.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.4.bb</a> =3D=
&gt; <a href=3D"http://spirv-headers_1.5.5.bb" rel=3D"noreferrer" target=3D=
"_blank">spirv-headers_1.5.5.bb</a>} (92%)<br>
<br>
diff --git a/meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5=
.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.4.bb</a> b/me=
ta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">spirv-headers_1.5.5.bb</a><br>
similarity index 92%<br>
rename from meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5.=
4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.4.bb</a><br>
rename to meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5.5.=
bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.5.bb</a><br>
index 6c978ce51a..101a2e2948 100644<br>
--- a/meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5.4.bb" =
rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.4.bb</a><br>
+++ b/meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5.5.bb" =
rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.5.bb</a><br>
@@ -7,7 +7,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://www.khronos.org/regis=
try/spir-v" rel=3D"noreferrer" target=3D"_blank">https://www.khronos.org/re=
gistry/spir-v</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc938b85bceb8fb26c1a80=
7f28a52ae2d&quot;<br>
<br>
-SRCREV =3D &quot;6cae8216a6ea19ff3f237af01e54378c1ff81fcd&quot;<br>
+SRCREV =3D &quot;c8213b3c5a2cf3a0f5c4d1e7d7b8fc2ac9f4806d&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/SPI=
RV-Headers;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_=
blank">github.com/KhronosGroup/SPIRV-Headers;protocol=3Dhttps;branch=3Dmast=
er</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;^(?P&lt;pver&gt;\d+(\.\d+)+)$&qu=
ot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.33.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158267): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158267" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158267</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87054847/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87054847/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000090dd4405d0d4b80a--

