Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F102AC433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:21:00 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web08.37522.1634566859767553532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oL71LumN;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id e2so4045580uax.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/TrUBH9kD4Vh7BUu94SpgxzN+cIdVRhTKbX65+oUmOs=;
        b=oL71LumNKysa8EUWfs3i0UVuiNB1JvhztHE5BDhBSRgqLy9bHPmwKn8OEFrvWWD85S
         jyUv6ODNgysivrKnQwOOBf+BGnW86i9ZNqNoizn1+YkcP+zss86du7xfipx1zR+hm+td
         ajKpMRbcEr5SEK8so6Jn2SxLxWAOA9DZz0KBnV8LyTPHxUyn5THw4EbsfB+NWaDbcmGU
         AmjsL8vkMJXCA0kg4BJSdZEHMlZZXNBzBjfVcal/5JrjTZlvIyMvIhE+6NtBpH0QtQRp
         6gK9Qr7T9Jud3yEgCqwaql0jEkiE+IZseC/hEAX+LIHYTUtq3cohMwd4Es2LYsGTUevL
         DGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/TrUBH9kD4Vh7BUu94SpgxzN+cIdVRhTKbX65+oUmOs=;
        b=eh3vjgD+RGSC4Xe8/RmVifToMN0sKl4Une2Bf9w+t02NrCVV8bx1PJ3CL/iNHgG5Ab
         JXFw04uzpegqaQDITw6GPQxm+VDv5O3X88v6VyMT2wFaS0i1h3Y60G32+Oa2XjXUGXAW
         D4rwN8Dlre0qBThx/rLLZBgbP++u8eFJwx21Uk8QQ2sNz0eJjWlFog0mg/RGcdDfxc97
         J4ms/XrOZHI/y3bQ+6d6iWDe90pxDgMR1n3VCqDnuqeBityQS/1BQg+xgzs0VpoYb5SR
         QiU0h7cPJxoDqSzr2ieXnWUkt9mvCZUIwbqKMCQnsPpkNjnlUwJHGHcvRZ7g6hcvds6Q
         CpNw==
X-Gm-Message-State: AOAM5314lSsAaUEn7GI9bnkWaewclPwyzpk7uoIJ2bKkUr/eX+geOhqT
	hiEMcn/iEQIkLIShmvnKaa9h6hAVASeaXVgpTTk=
X-Google-Smtp-Source: 
 ABdhPJyLckR0et8cLM8SUnvQaMEDAmIzKkrfPCEgKBJeB83e9ZNegEWjqIpgrfzPJLW/7RzRm136SHAMLk6q0raNsmM=
X-Received: by 2002:a67:d09a:: with SMTP id s26mr26933672vsi.13.1634566858961;
 Mon, 18 Oct 2021 07:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211018135322.246963-1-Martin.Jansa@gmail.com>
 <CANNYZj-A0eNR=GWz+-xdZQSxmWYNuU=0PGNQA-1d0w2tSp+NiA@mail.gmail.com>
 <CA+chaQf06t-OSB-x321YRUcWTTuooP=E4o1a0C+asiJJmQzn4g@mail.gmail.com>
 <16AF25A15C500BAB.24927@lists.openembedded.org>
In-Reply-To: <16AF25A15C500BAB.24927@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Oct 2021 16:20:47 +0200
Message-ID: 
 <CANNYZj_md-5xjssO5icG2fKP1KPVf9axD9nW7Ji-S+hKrstkOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add PACKAGECONFIG for opengl-or-es
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fd774c05cea140d2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:21:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157069

--000000000000fd774c05cea140d2
Content-Type: text/plain; charset="UTF-8"

... especially if you don't actually have a use case for this, and wrote
the patch just to keep your private CI happy.

Alex

On Mon, 18 Oct 2021 at 16:16, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> Sorry, but no. If you say 'Pending', the upstreaming is on you - I will
> simply drop the patch if it proves to be a pain.
>
> Alex
>
> On Mon, 18 Oct 2021 at 16:14, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> On Mon, Oct 18, 2021 at 4:06 PM Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> Please do send this upstream, the patch looks like a pain to rebase (and
>>> there's no AB config to test it).
>>>
>>
>> Feel free to do that, I'm not interested in webkitgtk at all - just
>> wanted it to disappear from build failures in world CI.
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157067):
> https://lists.openembedded.org/g/openembedded-core/message/157067
> Mute This Topic: https://lists.openembedded.org/mt/86414212/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000fd774c05cea140d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>... especially if you don&#39;t actually have a use c=
ase for this, and wrote the patch just to keep your private CI happy.</div>=
<div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, 18 Oct 2021 at 16:16, Alexander K=
anavin via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
>gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Sorry, but no. If yo=
u say &#39;Pending&#39;, the upstreaming is on you - I will simply drop the=
 patch if it proves to be a pain.</div><div><br></div><div>Alex<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, 18 Oct 2021 at 16:14, Martin Jansa &lt;<a href=3D"mailto:martin.jansa=
@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div d=
ir=3D"ltr">On Mon, Oct 18, 2021 at 4:06 PM Alexander Kanavin &lt;<a href=3D=
"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div>Please do send this upstream,=
 the patch looks like a pain to rebase (and there&#39;s no AB config to tes=
t it).</div></div></blockquote><div><br></div><div>Feel free to do that, I&=
#39;m not interested in webkitgtk at all - just wanted it to disappear from=
 build failures in world CI.=C2=A0</div></div></div>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157067): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157067" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157067</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86414212/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86414212/1686489</a><br>
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

--000000000000fd774c05cea140d2--

