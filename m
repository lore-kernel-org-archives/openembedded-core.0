Return-Path: <bkylerussell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB0CC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 17:41:50 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.15591.1642700509305904758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 09:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EZUVJAkY;
 spf=pass (domain: gmail.com, ip: 209.85.167.182,
 mailfrom: krussell7711@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id s22so9890275oie.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 09:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gd6PRZAYhkV84Il7Q+uVB7Gg7YNeWVtC2yn0pNh1TLc=;
        b=EZUVJAkYRt9kjSYWEaLfut+6h6Nv9A+nB+mi8wPl/5SGHjpwdngIDBDun4gL22XGHv
         vjEc+cKrso2ynBVCZ16eSSUE6gG80o5J+ssug1U01M4pJxxXnhUwlRDBkwH4/dT0S5uH
         UHJnGj87iERmbT3cfKwMiFnbQhNuvlPCAsY3Ot+D3LnXd1zE3Z8UAXKMJho9ZDFl5E62
         dXp7AHRg3biqyw+ub2EMU+LOi/iZ6MEZDCWb605SQIVVfh9jHHNro34MEZRf7uzyxf2j
         JYk06Y8VovwT7rfbAcA9g7FDEADhFWrlsqm+8vGXL8YYXY+Q+Pw1qVdMmOJPM9LgGn4t
         5TCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gd6PRZAYhkV84Il7Q+uVB7Gg7YNeWVtC2yn0pNh1TLc=;
        b=upkKrd+X7rbRnGGbLOQkXR0U7d6OacjaA7uBC9/835g/HKIXDwVnL/NqIBAdI80B70
         VR8o8ZY+glPKIUYMaMO3Y3Ko5iB7D2u7Rx2B7IxZSpwygfQyAL5NK9JGtkYYx0sGpoeT
         iegqYohgZ/OpgANBiVbgTub+YmkV9PxzLUNPGG+x9bzQa8RHycc3jWKEIPvYSWiXHDqX
         9hUOydShs79+6R0sV75UeJyM0IUbSXb7QzhMYW7HLFVo6fUsBPGbDJqhRirTDnfyY73w
         2Z1av8VW/ssVgZSgdVwub4sqj0O8lqyUJ4i3lLcn23+8AnAcHrMuGeTvzn90ypnC8mrq
         pfAw==
X-Gm-Message-State: AOAM532sZyCJyUutFgY+swWrdLAtQcSzYDn1RxvZZeIV3AwNVjplx6JV
	tkfnbqrngKqmyxFJlyDm3aE57pZyiobJB5zMcQE=
X-Google-Smtp-Source: 
 ABdhPJzAYrYey6rA5LcdoXQ5fARnS81xu5RbBUBEt4iNUHLGyyXwmFmied75O9ernC866XJ3oGLZtPDXGEmMqz0w2tI=
X-Received: by 2002:a05:6808:90e:: with SMTP id
 w14mr8632168oih.135.1642700508493;
 Thu, 20 Jan 2022 09:41:48 -0800 (PST)
MIME-Version: 1.0
References: <20220120033045.1098738-1-bkylerussell@gmail.com>
 <CANNYZj9TtSZmzNJ8Jjsoa86WUEzKcBgMMEn2=OBrwyYj+dmxQg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9TtSZmzNJ8Jjsoa86WUEzKcBgMMEn2=OBrwyYj+dmxQg@mail.gmail.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Thu, 20 Jan 2022 12:41:37 -0500
Message-ID: 
 <CAFrQVPMvR0QnLan+=bdi0ZmgTpCxmz=-SZQxyTuEcm6=OTDmmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] security_flags.inc: don't default to PIE if
 image-prelink is enabled
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000047fb7805d607045d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 17:41:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160773

--00000000000047fb7805d607045d
Content-Type: text/plain; charset="UTF-8"

Yes, we do use prelink.  I think our use case primarily benefits from CoW
memory savings, rather than load times.  Of course, GCCPIE can be
overridden in the distro layer, but seeing as image-prelink.bbclass still
exists upstream, the default definition should support configurations that
choose to enable it.

On Thu, Jan 20, 2022 at 3:30 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I think we pretty much abandoned prelink at this point, are you using it
> and do you see the benefits?
>
> Alex
>
> On Thu, 20 Jan 2022 at 04:30, <bkylerussell@gmail.com> wrote:
>
>> Since a prelinked rootfs is in conflict with PIE, don't attempt the latter
>> if the image enables prelink.
>> ---
>>  meta/conf/distro/include/security_flags.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/distro/include/security_flags.inc
>> b/meta/conf/distro/include/security_flags.inc
>> index e469eadca1..be6feb9e5f 100644
>> --- a/meta/conf/distro/include/security_flags.inc
>> +++ b/meta/conf/distro/include/security_flags.inc
>> @@ -5,7 +5,7 @@
>>  # From a Yocto Project perspective, this file is included and tested
>>  # in the DISTRO="poky" configuration.
>>
>> -GCCPIE ?= "--enable-default-pie"
>> +GCCPIE ?= "${@bb.utils.contains('USER_CLASSES', 'image-prelink',
>> '--disable-default-pie', '--enable-default-pie', d)}"
>>  # If static PIE is known to work well, GLIBCPIE="--enable-static-pie"
>> can be set
>>
>>  # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as
>> they use
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#160749):
>> https://lists.openembedded.org/g/openembedded-core/message/160749
>> Mute This Topic: https://lists.openembedded.org/mt/88551948/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>

--00000000000047fb7805d607045d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, we do use prelink.=C2=A0 I think our use case primari=
ly benefits from CoW memory savings, rather than load times.=C2=A0 Of cours=
e, GCCPIE can be overridden in the distro layer, but seeing as image-prelin=
k.bbclass still exists upstream, the default definition should support conf=
igurations that choose to enable it.=C2=A0 <br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 20, 2022 at 3:30=
 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.ka=
navin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div>I think we pretty much abandoned preli=
nk at this point, are you using it and do you see the benefits?</div><div><=
br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 20 Jan 2022 at 04:30, &lt;<a href=3D"=
mailto:bkylerussell@gmail.com" target=3D"_blank">bkylerussell@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sinc=
e a prelinked rootfs is in conflict with PIE, don&#39;t attempt the latter<=
br>
if the image enables prelink.<br>
---<br>
=C2=A0meta/conf/distro/include/security_flags.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro=
/include/security_flags.inc<br>
index e469eadca1..be6feb9e5f 100644<br>
--- a/meta/conf/distro/include/security_flags.inc<br>
+++ b/meta/conf/distro/include/security_flags.inc<br>
@@ -5,7 +5,7 @@<br>
=C2=A0# From a Yocto Project perspective, this file is included and tested<=
br>
=C2=A0# in the DISTRO=3D&quot;poky&quot; configuration.<br>
<br>
-GCCPIE ?=3D &quot;--enable-default-pie&quot;<br>
+GCCPIE ?=3D &quot;${@bb.utils.contains(&#39;USER_CLASSES&#39;, &#39;image-=
prelink&#39;, &#39;--disable-default-pie&#39;, &#39;--enable-default-pie&#3=
9;, d)}&quot;<br>
=C2=A0# If static PIE is known to work well, GLIBCPIE=3D&quot;--enable-stat=
ic-pie&quot; can be set<br>
<br>
=C2=A0# _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds =
as they use<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160749): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160749" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160749</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88551948/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88551948/1686489</a><br>
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
</blockquote></div>

--00000000000047fb7805d607045d--

