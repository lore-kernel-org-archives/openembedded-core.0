Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A9DC433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 14:33:31 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.31289.1655476407156236462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 07:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ayp8Azst;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 31so4193094pgv.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RyyXcRw/DkbGcrLo/08fSPI0ENL/QxtVmtvOk/0fXw4=;
        b=Ayp8AzstacLwdE6xQpRFbZ7S/RuIu+CLGsClh2dqgZJ51CRqa/3bFk51dGHEjpouri
         jMLiNSsVFGLrynTMix2HKvOL9cTy0Ud63ytJp7R59LUPFhEgSfHeFD30WzXXmcKprVDV
         nZXSxC1nB/iCm4Zhxwbj1jZXWgdAeF9KV9mWt18dApHRbkZ6zaE3Q5cRhJLQXCWYMS0v
         g7AmMTnueempAcBhLQmLBtoSJ8ajSzcBLggfwibag7ho7Xg7ZR8Zb1Ktb5rWKuZ+sMy3
         BRI/SfltSgAVUMhGNwKbVMcR+QDGuaG1QIY7tcu246p+UVcYLW5yXIXwIIjM+VWJ5fTE
         uJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RyyXcRw/DkbGcrLo/08fSPI0ENL/QxtVmtvOk/0fXw4=;
        b=h08Rhc+4bc1ei8BH9pjkEnaSlFQ1BXl/4m8F5ERa9Jak16icWj+6/wCLDEMJlu3hOK
         qg1kDp2+mb6TjrafnW3/cPVGKK+Abt7q/jzO6D2GWySLY6dVCPeGLBXcPz7s1w/HFIQ3
         VzDBbmkYOHI6bm6AfQLiZQGkDgjH6uiS561Pq1mEtS5D1nLbk4HBPbTcsEGbBYa/8jIo
         iE9iP9ZcdA9tHOV6tlvvYiUXH2thx9vkDyN4i9AZOd4VqAFXES/Rz8ELOwzXBri1VFsS
         E1CV5VtXp+VKA44trGrBJnnsSDHGBYvlUsPyboOzlqqc5LHVCkfj57wKQ0Y493Vj2/4v
         7W9g==
X-Gm-Message-State: AJIora8losrRznBcdkQgWwKW/aGUv6ceZ1A4jU83pzoFVvqQtMZxisF5
	PmDFL/QRfKrcWc+GONgwKCkr0k2n4pg8mUtF0GA=
X-Google-Smtp-Source: 
 AGRyM1vuxLilJxdFCmqLmF7FFHjYyorWbaybS5IOZuxl7fUOy2OFwm4rcuvMTnJ7kmaAP9ZTJn6HRE9NG9rK17JTGVM=
X-Received: by 2002:a63:234f:0:b0:405:3981:be7 with SMTP id
 u15-20020a63234f000000b0040539810be7mr9149341pgm.15.1655476406553; Fri, 17
 Jun 2022 07:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <1655447108-20329-1-git-send-email-wangmy@fujitsu.com>
 <CANPvuRmROkc3V1Bi28NhbHu_ZegJ6Ng3x8dowa8F0fPzXs1vUw@mail.gmail.com>
In-Reply-To: 
 <CANPvuRmROkc3V1Bi28NhbHu_ZegJ6Ng3x8dowa8F0fPzXs1vUw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 17 Jun 2022 07:33:17 -0700
Message-ID: 
 <CANx9H-CYac6RD1cd3dYNjWvG2POCTwMmzU_nwgKusQQeO1=2DQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-hypothesis: upgrade 6.46.11 -> 6.47.2
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 wangmy <wangmy@fujitsu.com>
Content-Type: multipart/alternative; boundary="00000000000025924b05e1a5a355"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 14:33:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167027

--00000000000025924b05e1a5a355
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2022 at 1:26 AM Jose Quaresma <quaresma.jose@gmail.com>
wrote:

>
>
> wangmy <wangmy@fujitsu.com> escreveu no dia sexta, 17/06/2022 =C3=A0(s) 0=
7:25:
>
>> Add dependence exceptiongroup.
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ---
>>  ...hon3-hypothesis_6.46.11.bb =3D> python3-hypothesis_6.47.2.bb} | 3 ++=
-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>  rename meta/recipes-devtools/python/{python3-hypothesis_6.46.11.bb =3D>
>> python3-hypothesis_6.47.2.bb} (88%)
>>
>> diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
>> b/meta/recipes-devtools/python/python3-hypothesis_6.47.2.bb
>> similarity index 88%
>> rename from meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
>> rename to meta/recipes-devtools/python/python3-hypothesis_6.47.2.bb
>> index 1d9772d4ff..f56bf3d19e 100644
>> --- a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
>> +++ b/meta/recipes-devtools/python/python3-hypothesis_6.47.2.bb
>> @@ -13,7 +13,7 @@ SRC_URI +=3D " \
>>      file://test_rle.py \
>>      "
>>
>> -SRC_URI[sha256sum] =3D
>> "f5c1cf61b24b094355577a6b8fbbb8eb54c1b0216fbc0519af97c46bddf43c42"
>> +SRC_URI[sha256sum] =3D
>> "9c01a225eada7d74d38430e3e91e659e3a892fbc2b15f7b051779ded6ab73ee7"
>>
>>  RDEPENDS:${PN} +=3D " \
>>      python3-attrs \
>> @@ -23,6 +23,7 @@ RDEPENDS:${PN} +=3D " \
>>      python3-sortedcontainers \
>>      python3-statistics \
>>      python3-unittest \
>> +    ${PYTHON_PN}-exceptiongroup \
>>
>
> IMO It's better to have it as python3-exceptiongroup for consistency with
> the other python in RDEPENDS
>

Agreed. That syntax is only needed if we have to support two python
versions (if python 4 becomes a thing).

>
> Jose
>
>
>>      "
>>
>>  RDEPENDS:${PN}-ptest +=3D " \
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167019):
> https://lists.openembedded.org/g/openembedded-core/message/167019
> Mute This Topic: https://lists.openembedded.org/mt/91816508/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000025924b05e1a5a355
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jun 17, 2022 at 1:26 AM Jose Quaresma &lt;<a href=
=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><=
div class=3D"gmail_quote"></div></div><div dir=3D"ltr"><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">wangmy &lt;<a href=3D"mailto:w=
angmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt; escreveu no=
 dia sexta, 17/06/2022 =C3=A0(s) 07:25:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Add depen=
dence exceptiongroup.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://hon3-hypothesis_6.46.11.bb" rel=3D"noreferrer" t=
arget=3D"_blank">hon3-hypothesis_6.46.11.bb</a> =3D&gt; <a href=3D"http://p=
ython3-hypothesis_6.47.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-h=
ypothesis_6.47.2.bb</a>} | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-hypoth=
esis_6.46.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.=
46.11.bb</a> =3D&gt; <a href=3D"http://python3-hypothesis_6.47.2.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-hypothesis_6.47.2.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-hypothe=
sis_6.46.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.4=
6.11.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-hypoth=
esis_6.47.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.4=
7.2.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-hypothes=
is_6.46.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.46=
.11.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-hypothesis=
_6.47.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.47.2.=
bb</a><br>
index 1d9772d4ff..f56bf3d19e 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-hypothesis_6.4=
6.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.46.11.bb=
</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-hypothesis_6.4=
7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.47.2.bb</=
a><br>
@@ -13,7 +13,7 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://test_rle.py \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;f5c1cf61b24b094355577a6b8fbbb8eb54c1b0216fbc0=
519af97c46bddf43c42&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9c01a225eada7d74d38430e3e91e659e3a892fbc2b15f=
7b051779ded6ab73ee7&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-attrs \<br>
@@ -23,6 +23,7 @@ RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-sortedcontainers \<br>
=C2=A0 =C2=A0 =C2=A0python3-statistics \<br>
=C2=A0 =C2=A0 =C2=A0python3-unittest \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-exceptiongroup \<br></blockquote><div><br></div=
></div></div><div dir=3D"ltr"><div class=3D"gmail_quote"><div>IMO It&#39;s =
better to have it as python3-exceptiongroup=C2=A0for consistency with the o=
ther python in RDEPENDS</div></div></div></blockquote><div dir=3D"auto"><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)"><div dir=3D"ltr"><div class=3D"gmail_quote"><div di=
r=3D"auto"></div><div></div></div></div></blockquote><div dir=3D"auto">Agre=
ed. That syntax is only needed if we have to support two python versions (i=
f python 4 becomes a thing).</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"ltr"><div =
class=3D"gmail_quote"><div><br>Jose</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot; \<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167019): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167019" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167019</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91816508/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
91816508/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000025924b05e1a5a355--

