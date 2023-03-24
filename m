Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFA0C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:48:45 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.86.1679672919268516213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SIJntnGC;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id e65so2667876ybh.10
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679672918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KMuz76KxQsNoVFvRTlyh5uLCQjwo61TjgM8KU8/E7wg=;
        b=SIJntnGCNSMkl+Iq6jbcxP8cimIaJUb3DZsAH6NW6kQgvsc4nyvgVmHThbItyJqVkv
         Esmb7aBGVQJ9wEeP0KSppw8v0UKek+P7fUwpnj7aeuOWMyLGkoQV0nGwmo2D7PN0cUXo
         QzxZrG4UVxZUG43LiAv8AFDCwNXojxVjqqc6vA7ysc/KyagQNuKNMiSlfKm7dNUdw8Oa
         HeeWCMXSd8m70vu1h5KcsDUbNbyi9YioHV0JS31f8+X9fleapDTlzrVASDUsO8XT4a0j
         cvPbC7Su1Suvpv1J/GDUTtyJYouAvLaDHVvuMUoZdRTkSAj0eaY5o6dcnws6CkvY97HX
         gF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679672918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMuz76KxQsNoVFvRTlyh5uLCQjwo61TjgM8KU8/E7wg=;
        b=HmNcZho/G2mF5XnfIdjTe/RmMXxsFPbJuW+JXBY/YJCnNjANvkn9bOg/7ReGi+ChkB
         c4lYBAasr3H+eKWhCLVm7MKNGXAVPcfWdvh9Gi0TZYsjvqqSU6sYcfjGJvgsC/PjZy1/
         fk4y/Xg+1AMtMfV9zsUeBNi56bBdHxEVECAa5LuLxgetT9Q7ONMnXu0fIDXX3lw1wQZw
         kAwkLu9AAUTN0rjLEcp9od1Qvl4g9nwjghBbG4H7e0jP7IrZLMdHTQh2O18Xh3+Nyswr
         oGILKCvwAmwWMbYwNrerPusxadk4MuVkoJLL7n1J0H42MzUd9dLpoYrkS3iPRZeKk39J
         ONaA==
X-Gm-Message-State: AAQBX9dlwHkbENmKKNWNrFjjj/Lm66EzQY/PtgUKLFrwIa/vcfra2kIA
	tqkOBFFetNIHbnQoXgdPbLRnWfjYOdP1Fr+U68k=
X-Google-Smtp-Source: AKy350ZtpBzEK0aZslS430KUtf165wEHjj0L7gAPRjCXT6mPQArUxTXlSJE3M9ocXuczJLnts7sMhVRk6kBJf6P81Os=
X-Received: by 2002:a25:2f84:0:b0:b6e:d788:eba0 with SMTP id
 v126-20020a252f84000000b00b6ed788eba0mr1638981ybv.11.1679672918324; Fri, 24
 Mar 2023 08:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230324152238.194877-1-kubiznak@2n.com> <20230324152238.194877-3-kubiznak@2n.com>
 <174F6583B00F6A21.25304@lists.openembedded.org>
In-Reply-To: <174F6583B00F6A21.25304@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 24 Mar 2023 08:48:27 -0700
Message-ID: <CANx9H-B38+6nHr-y_0OQWzi5t7TGfnJFSRdwmzeUhBkkzM25gQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 3/6] python3-pygobject: depend on gobject-introspection
To: ticotimo@gmail.com
Cc: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a2bb3905f7a75372"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179073

--000000000000a2bb3905f7a75372
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 8:47=E2=80=AFAM Tim Orling via lists.openembedded.o=
rg
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Fri, Mar 24, 2023 at 8:24=E2=80=AFAM Petr Kubiz=C5=88=C3=A1k <kubiznak=
@2n.com> wrote:
>
>> When g-i feature is disabled, the gobject-introspection package
>> dependency is not pulled in but pygobject has a hard dependency on it.
>>
>> Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
>> ---
>>  meta/recipes-devtools/python/python3-pygobject_3.42.2.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
>> b/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
>> index cc7b07e804..f54f4ce784 100644
>> --- a/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
>> +++ b/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
>> @@ -10,7 +10,7 @@ GIR_MESON_OPTION =3D ""
>>
>>  inherit gnomebase setuptools3-base gobject-introspection
>> upstream-version-is-even
>>
>> -DEPENDS +=3D "python3 glib-2.0"
>> +DEPENDS +=3D "python3 glib-2.0 gobject-introspection"
>>
>
> This is not needed. It is already added by the inherited
> gobject-introspection class
>
> https://git.yoctoproject.org/poky/tree/meta/classes-recipe/gobject-intros=
pection.bbclass#n38
>
>

I had not yet read the previous patch to the class. Ignore this comment for
now, but this feels like a step backward.


>
>
>  SRCNAME=3D"pygobject"
>>
>> --
>> 2.30.2
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179072):
> https://lists.openembedded.org/g/openembedded-core/message/179072
> Mute This Topic: https://lists.openembedded.org/mt/97825895/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a2bb3905f7a75372
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 24, 2023 at 8:47=E2=80=AF=
AM Tim Orling via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Mar 24, 2023 at 8:24=E2=80=AFAM Petr Kubiz=C5=88=C3=A1k &lt;<a href=
=3D"mailto:kubiznak@2n.com" target=3D"_blank">kubiznak@2n.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When g-i featu=
re is disabled, the gobject-introspection package<br>
dependency is not pulled in but pygobject has a hard dependency on it.<br>
<br>
Signed-off-by: Petr Kubiz=C5=88=C3=A1k &lt;<a href=3D"mailto:kubiznak@2n.co=
m" target=3D"_blank">kubiznak@2n.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pygobject_3.42=
.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.42.2.bb</a>=
 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-pygobje=
ct_3.42.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.42.2=
.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-pygobject_=
3.42.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.42.2.bb=
</a><br>
index cc7b07e804..f54f4ce784 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-pygobject_3.42=
.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.42.2.bb</a>=
<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pygobject_3.42=
.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.42.2.bb</a>=
<br>
@@ -10,7 +10,7 @@ GIR_MESON_OPTION =3D &quot;&quot;<br>
<br>
=C2=A0inherit gnomebase setuptools3-base gobject-introspection upstream-ver=
sion-is-even<br>
<br>
-DEPENDS +=3D &quot;python3 glib-2.0&quot;<br>
+DEPENDS +=3D &quot;python3 glib-2.0 gobject-introspection&quot;<br></block=
quote><div><br></div><div>This is not needed. It is already added by the in=
herited gobject-introspection class</div><div><a href=3D"https://git.yoctop=
roject.org/poky/tree/meta/classes-recipe/gobject-introspection.bbclass#n38"=
 target=3D"_blank">https://git.yoctoproject.org/poky/tree/meta/classes-reci=
pe/gobject-introspection.bbclass#n38</a></div><div>=C2=A0</div></div></div>=
</blockquote><div><br></div><div>I had not yet read the previous patch to t=
he class. Ignore this comment for now, but this feels like a step backward.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0SRCNAME=3D&quot;pygobject&quot;<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179072): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179072" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179072</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97825895/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
97825895/924729</a><br>
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

--000000000000a2bb3905f7a75372--

