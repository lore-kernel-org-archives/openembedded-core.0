Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C77C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 12:08:52 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web09.8203.1637323731472345351
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 04:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j/t0C3/r;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id l24so20801171uak.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 04:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jjQ0G/BEL8BEA31gIqRnMe/AI3F3TVUkeWoHp4WeheQ=;
        b=j/t0C3/reLh9PzTHt26A/K1OAe5b0Um3OckKFsh8nR2BGEgE0uV1Zo70RCLo/ZIA24
         5l65BJ85SeP/hNWXUT0zhnsfk53LH+y9LB72MGPd2n0jOklWUaJAkwdu8aiVoyo5lXsm
         bpUiYQoTMMhbn7ppzcN02bBToxH1t9lG3j+KQb3kUkn5k+B2SdKcHkds1uwC9xvscZc8
         msfXtxbDMCjnfwgqL+wtvwtYh9saup6hbqmJKGHtoUHaq+Shl17L5asPNnrLoGosy5VG
         z1CyVVFHcf+ulLhJGO4eQlIT69hCW8ux1UoWtWP7Ts9JkKj3aMjJH/iE5T+uaIhG7UUa
         NoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jjQ0G/BEL8BEA31gIqRnMe/AI3F3TVUkeWoHp4WeheQ=;
        b=2PLFERlvj8nL14Eak49LvQ469Sb71fGah/9Yv5F4TL+gW9uGBAP4GumZHjn/VZI93F
         +/jXVl0FzTNLeWZKgeWdCK9Qd7JGWR+ZjhdeXjno5uPjDyGvdoqjdE0YHWjWcVlA8TBK
         w3BmIXDeXoJMky+UTg9x4xOdqmK5Xx+o2+M5Nv5DQun/gkC8rco/VyKPvB2t45L7sCFj
         IMznlzIBjIcOqwWae7nlP8bKnh/Z7IkhcwZxQ7azK8vfpghlSF41W5f+UfRE7mURItHK
         FPDDuzIqHaH5k6F7ZJcHbjXuxeHw0BaiJkTmqUykyvTpfwbe8wAOvyvYgq/ylQo8+wef
         Xvaw==
X-Gm-Message-State: AOAM530mzsrmIIXQ+NilEa/7xYDCrEtqzPVIysasabaiQLpdf63K/qX8
	GygM34+DXknIa1dIIj80FAWHZwr+PLLBc5FW9N4=
X-Google-Smtp-Source: 
 ABdhPJyWvf8t/+PKeZnCa9zEJFxqHUvSUgravpd+6LopP894YbktXxIatd+ouZhIE2QJJmCh/no23+p8GfSXfOkpoB8=
X-Received: by 2002:a67:c511:: with SMTP id e17mr96382116vsk.40.1637323730627;
 Fri, 19 Nov 2021 04:08:50 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-2-alex@linutronix.de>
 <84c2e406c6127e55e7bdea01f2bcade6a9ab1c89.camel@linuxfoundation.org>
 <16B8EF5BF2691601.30231@lists.openembedded.org>
In-Reply-To: <16B8EF5BF2691601.30231@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Nov 2021 13:08:39 +0100
Message-ID: 
 <CANNYZj_7qsm0zf1CfeDF=_mzkj+xWJa3G+D-cFC_WSgGnRA-ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/36] groff: mark patch as non-upstreamable
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000058b0b105d12323e8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 12:08:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158518

--00000000000058b0b105d12323e8
Content-Type: text/plain; charset="UTF-8"

I checked; the patches are the same, except the upstream one misses one
file, which is fixed in a different upstream patch. I'd say we can keep
things as they are.

Alex

On Fri, 19 Nov 2021 at 12:34, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> This is the upstream fix:
>
> https://git.savannah.gnu.org/cgit/groff.git/commit/?id=979f3f4266151c7681a68a40d2c4913842a7271d
>
> I can backport that, rebase the existing patch on top and see what's left,
> sure.
>
> Alex
> On Fri, 19 Nov 2021 at 12:15, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Wed, 2021-11-17 at 16:34 +0100, Alexander Kanavin wrote:
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >  meta/recipes-extended/groff/files/0001-Include-config.h.patch | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git
>> a/meta/recipes-extended/groff/files/0001-Include-config.h.patch
>> b/meta/recipes-extended/groff/files/0001-Include-config.h.patch
>> > index 46065bc513..34fca1eb2f 100644
>> > --- a/meta/recipes-extended/groff/files/0001-Include-config.h.patch
>> > +++ b/meta/recipes-extended/groff/files/0001-Include-config.h.patch
>> > @@ -20,7 +20,7 @@ In file included from
>> TOPDIR/build/tmp/work/aarch64-yoe-linux-musl/groff/1.22.4-
>> >  We delete eqn.cpp and qen.hpp in do_configure
>> >  to ensure they're regenerated and deterministic.
>> >
>> > -Upstream-Status: Pending
>> > +Upstream-Status: Inappropriate [issue fixed upstream with a similar
>> patch]
>> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >  ---
>> >   src/libs/libgroff/assert.cpp  |   4 +
>>
>>
>> Should we replace this with the upstream patch? That way we'd have a clean
>> backport which would help at upgrade time?
>>
>> Is the upstream patch exactly functionally equivalent?
>>
>> Sometimes it can be good to test the upstream version so we know come
>> upgrade
>> time we're ok and we don't need to ask upstream to make any further
>> tweaks.
>>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158506):
> https://lists.openembedded.org/g/openembedded-core/message/158506
> Mute This Topic: https://lists.openembedded.org/mt/87121973/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000058b0b105d12323e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I checked; the patches are the same, except the upstr=
eam one misses one file, which is fixed in a different upstream patch. I&#3=
9;d say we can keep things as they are.</div><div><br></div><div>Alex<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, 19 Nov 2021 at 12:34, Alexander Kanavin via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a hre=
f=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div>This is the upstream fix:<br></div><div><a href=3D=
"https://git.savannah.gnu.org/cgit/groff.git/commit/?id=3D979f3f4266151c768=
1a68a40d2c4913842a7271d" target=3D"_blank">https://git.savannah.gnu.org/cgi=
t/groff.git/commit/?id=3D979f3f4266151c7681a68a40d2c4913842a7271d</a></div>=
<div><br></div><div>I can backport that, rebase the existing patch on top a=
nd see what&#39;s left, sure.</div><div><br></div><div>Alex<br></div></div>=
<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 19 Nov 2021 at 12:15, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Wed, 2021-11-17 at 16:34 +0100, Alexander Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/groff/files/0001-Include-config.h.patch | =
2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/groff/files/0001-Include-config.h.p=
atch b/meta/recipes-extended/groff/files/0001-Include-config.h.patch<br>
&gt; index 46065bc513..34fca1eb2f 100644<br>
&gt; --- a/meta/recipes-extended/groff/files/0001-Include-config.h.patch<br=
>
&gt; +++ b/meta/recipes-extended/groff/files/0001-Include-config.h.patch<br=
>
&gt; @@ -20,7 +20,7 @@ In file included from TOPDIR/build/tmp/work/aarch64-=
yoe-linux-musl/groff/1.22.4-<br>
&gt;=C2=A0 We delete eqn.cpp and qen.hpp in do_configure<br>
&gt;=C2=A0 to ensure they&#39;re regenerated and deterministic.<br>
&gt;=C2=A0 <br>
&gt; -Upstream-Status: Pending<br>
&gt; +Upstream-Status: Inappropriate [issue fixed upstream with a similar p=
atch]<br>
&gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/libs/libgroff/assert.cpp=C2=A0 |=C2=A0 =C2=A04 +<br>
<br>
<br>
Should we replace this with the upstream patch? That way we&#39;d have a cl=
ean<br>
backport which would help at upgrade time?=C2=A0<br>
<br>
Is the upstream patch exactly functionally equivalent?<br>
<br>
Sometimes it can be good to test the upstream version so we know come upgra=
de<br>
time we&#39;re ok and we don&#39;t need to ask upstream to make any further=
 tweaks.<br></blockquote></div><div class=3D"gmail_quote"><br></div><div cl=
ass=3D"gmail_quote"><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158506): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158506" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158506</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87121973/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87121973/1686489</a><br>
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

--00000000000058b0b105d12323e8--

