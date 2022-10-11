Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C182EC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 18:50:12 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.11473.1665514202393521173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 11:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BT8xRWRL;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id r17so33385082eja.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yxcx+fj7oYxL2X0qM67jXIB122X9miwmIbwoe426Aw0=;
        b=BT8xRWRLmgZti9gWoCk6/u69EJMdMxnWFenBEfKv9+zayDLu0dMjDAIlrWKfN244fx
         QkU5tDAjM9PRyEadWm+PJjhs2M3Vpdl+82BzLTd22wTzh7YCUK3nMRC8Ug1C6u+NrkO0
         0966aE8X9z/+Jq+Tp08rjf4r9aIOpOlrcqeSkl+iti+P23+nVBjYst4O0PD3BoMS5ITc
         cAK0RKGIcWnC0qoP/lDDuj4Jve4/B0OrjEnDESx7GHgHvkRyyXOs+poccvoqQ9ON0kvE
         z0XAM7ATbW1mOPFGikIBiTve01F29leAWmxv6P0Oi/M5MZ5PfRDI1K55JM78v8wj3Dls
         CEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yxcx+fj7oYxL2X0qM67jXIB122X9miwmIbwoe426Aw0=;
        b=YXHSTiZbA4EmiTOKhBI+roKWU6W6PUmLM4+hP5qKlgNnQF5JbJRtarTM/NGUlkYII/
         8Hdl26qhF68kMvJI5wlMKR4GtzO0jAz4wY5QlbWl6W1u+R4gs65uIjWDyE/F7ZwmMCDc
         ZHFrzNrGU+tI7mAjoXLZ6haZG1TFGDfBNH7u+v8SB551/d+defxtLi8fQ4AXUai4MAdW
         HWkGV/8bCC8nycBezxWL2DeLOhanH7MKi2mV0qSg9pIzJTqCFk5oLcXKhuuGmuodrxxW
         dkPG0nZ79F7UpMINDP3+5vcE/Vx3jAGFvwdPVXZ2rUlK5XhKxTyZiUytcSwH24iDCqk3
         Zl1Q==
X-Gm-Message-State: ACrzQf3X/+c6hz07cKcqp10DKitNSsBGPWBc41f6YX6Ijkqi2LpgA0wt
	TB9uBAOqRAPrZXmlSBD5DClb4OA0CSFy7z27tT8=
X-Google-Smtp-Source: 
 AMsMyM4fqDFHNa39AvwmuKRvAmxPBKk1RLZgQpp4dqUSzXsMYUm1JQcVEADVNM5ItTnK/u+bY5aM6APAWRmurYIhSuA=
X-Received: by 2002:a17:907:2e19:b0:78d:3ade:a546 with SMTP id
 ig25-20020a1709072e1900b0078d3adea546mr19049570ejc.564.1665514200657; Tue, 11
 Oct 2022 11:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221010115818.10917-1-thakur.virendra1810@gmail.com>
 <CACpMEhNrnTu4+w0onJkUb+juUejPTOWkUTv2Tu4R2dc1m2nEfQ@mail.gmail.com>
In-Reply-To: 
 <CACpMEhNrnTu4+w0onJkUb+juUejPTOWkUTv2Tu4R2dc1m2nEfQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 11 Oct 2022 11:49:48 -0700
Message-ID: 
 <CANx9H-ACquePTC1acdGaqwS4e4yggUBuvwFwfRjo_mr9sVQu0Q@mail.gmail.com>
Subject: Re: [OE-Core][dunfell][PATCH] python3: Whitelist CVE-2018-25032
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: virendra thakur <thakur.virendra1810@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Steve Sakoman <steve@sakoman.com>, virendrak@kpit.com
Content-Type: multipart/alternative; boundary="0000000000004c756905eac6be3b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 18:50:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171636

--0000000000004c756905eac6be3b
Content-Type: text/plain; charset="UTF-8"

While the reasoning is correct that this only applies to Windows, this
patch is superseded by upgrading to Python 3.8.14:

https://docs.python.org/release/3.8.14/whatsnew/changelog.html#windows
bpo-47194: Update zlib to v1.2.12 to resolve CVE-2018-25032.

On Mon, Oct 10, 2022 at 8:25 AM Ranjitsinh Rathod <
ranjitsinhrathod1991@gmail.com> wrote:

> Hi Virendra,
>
> Please add one space after # in both the comments.
>
> On Mon, 10 Oct, 2022, 5:28 pm virendra thakur, <
> thakur.virendra1810@gmail.com> wrote:
>
>> zlib v1.2.11 as used in Windows binary releases contains a security
>> issue.
>> Link: https://bugs.python.org/issue47194
>>
>> Signed-off-by: virendra thakur <thakur.virendra1810@gmail.com>
>> ---
>>  meta/recipes-devtools/python/python3_3.8.13.bb | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/python/python3_3.8.13.bb
>> b/meta/recipes-devtools/python/python3_3.8.13.bb
>> index d87abe2351..e0e6861677 100644
>> --- a/meta/recipes-devtools/python/python3_3.8.13.bb
>> +++ b/meta/recipes-devtools/python/python3_3.8.13.bb
>> @@ -62,6 +62,10 @@ CVE_CHECK_WHITELIST += "CVE-2020-15523 CVE-2022-26488"
>>  # The module will be removed in the future and flaws documented.
>>  CVE_CHECK_WHITELIST += "CVE-2015-20107"
>>
>> +#zlib v1.2.11 as used in Windows binary releases contains a security
>> issue
>> +#https://bugs.python.org/issue47194
>> +CVE_CHECK_WHITELIST += "CVE-2018-25032"
>> +
>>  PYTHON_MAJMIN = "3.8"
>>
>>  S = "${WORKDIR}/Python-${PV}"
>> --
>> 2.17.1
>>
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171577):
> https://lists.openembedded.org/g/openembedded-core/message/171577
> Mute This Topic: https://lists.openembedded.org/mt/94234436/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000004c756905eac6be3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">While the reasoning is correct that this only applies to W=
indows, this patch is superseded by upgrading to Python 3.8.14:<div><br><di=
v><a href=3D"https://docs.python.org/release/3.8.14/whatsnew/changelog.html=
#windows">https://docs.python.org/release/3.8.14/whatsnew/changelog.html#wi=
ndows</a><br></div><div>bpo-47194: Update zlib to v1.2.12 to resolve CVE-20=
18-25032.<br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Oct 10, 2022 at 8:25 AM Ranjitsinh Rathod =
&lt;<a href=3D"mailto:ranjitsinhrathod1991@gmail.com">ranjitsinhrathod1991@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"auto"><div>Hi Virendra,</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Please add one space after # in both the comments.<b=
r><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, 10 Oct, 2022, 5:28 pm virendra thakur, &lt;<a href=3D"mail=
to:thakur.virendra1810@gmail.com" target=3D"_blank">thakur.virendra1810@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">zlib v1.2.11 as used in Windows binary releases contains a security<b=
r>
issue.<br>
Link: <a href=3D"https://bugs.python.org/issue47194" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://bugs.python.org/issue47194</a><br>
<br>
Signed-off-by: virendra thakur &lt;<a href=3D"mailto:thakur.virendra1810@gm=
ail.com" rel=3D"noreferrer" target=3D"_blank">thakur.virendra1810@gmail.com=
</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.8.13.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">python3_3.8.13.bb</a> | 4 ++++=
<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.13.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3_3.8.13.bb</a> b=
/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.13.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">python3_3.8.13.bb</a><br>
index d87abe2351..e0e6861677 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.13.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">python3_3.8.13.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.13.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">python3_3.8.13.bb</a><br>
@@ -62,6 +62,10 @@ CVE_CHECK_WHITELIST +=3D &quot;CVE-2020-15523 CVE-2022-2=
6488&quot;<br>
=C2=A0# The module will be removed in the future and flaws documented.<br>
=C2=A0CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-20107&quot;<br>
<br>
+#zlib v1.2.11 as used in Windows binary releases contains a security issue=
<br>
+#<a href=3D"https://bugs.python.org/issue47194" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://bugs.python.org/issue47194</a><br>
+CVE_CHECK_WHITELIST +=3D &quot;CVE-2018-25032&quot;<br>
+<br>
=C2=A0PYTHON_MAJMIN =3D &quot;3.8&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/Python-${PV}&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171577): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171577" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171577</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94234436/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94234436/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004c756905eac6be3b--

