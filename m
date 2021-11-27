Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F632C433FE
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 01:51:24 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web09.31610.1637977883062406958
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 17:51:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ed5pNR9R;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id 14so13528989ioe.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 17:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8kYVmOdHUWk8g3kwc0PpykXcDiQv4q+qk/Cb5Kf5TUE=;
        b=ed5pNR9RWmcUWDqSTZwkLmDuYwQkOSs/FG13bBNwnrwOx9ATqteBkdQ3utGB24bayQ
         jedMoYFG+75rqU8q+jeyhEoMzYBpRwMeVFWykmpOsPx3gUZB4wstC1LG8h28j+ozO1kh
         q2H2d5BqSZW5TXnqRop+xarpCZc0Q3HCeeoV509qLhqwzsJmlTr+5vP7KYsTqCXJ1Vyc
         g3cTbhSj8otCe+yUD72dVhLoF6UUsHwJPekYC7ogPX5315AIUk9hocwrcY5mnjzESRGT
         9ckNA00Ts8XeBZ7BpkeOp4Osr4UOIhALgLfxEXDxnPooRDh1Sqy1kxcUKl8ivlqMcTQt
         E6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8kYVmOdHUWk8g3kwc0PpykXcDiQv4q+qk/Cb5Kf5TUE=;
        b=Ox5kDMXpY3om2eJ+VCuLrNUTTvizC1LZ4oTAKZbkz0H/SJ0ps/OzHYuDfnXj8t0xz+
         6exB0TDKvwXpZ5sL95yjG3SZPMKNgrfESfUMfi0suRo45GY2qw9wLLg39vqJH/+HfWk4
         ElE87EECe+P3cY5J+HPJ0gYtbUS0FnhhoP3SJgdgIhTkzw4tTYvFPGUTkQq6kvL1/8+2
         NWWSNAe94zwEOsuCW/agKKpcEuFB03jG+Jm01kUDohrNeodz+Og0tWQSI1hcMRY5p0Wh
         VmpZ1e0skuLj/oJgqBLrKUjhP0fVe4iqQYgu5jeUy0jW4t5KrFWAnHLaRjqIdFOVJXLo
         SSNg==
X-Gm-Message-State: AOAM531oocemyOTOndZ6UGmI2uAis451PudenidP8Pc83IzpkS+PiBEQ
	Wn+BM7Frny2FSjLDI10mTqBS+kMHomFB3AooR18=
X-Google-Smtp-Source: 
 ABdhPJzrneVIh7QGrVeXj1/3g8ZgLwy3k4KfmcaeF6kBEoP/kUTpBGnVtvQcyNMY7rg+3evSaAH/Xi5Yqq7uugX68w4=
X-Received: by 2002:a6b:f403:: with SMTP id i3mr40318672iog.83.1637977882329;
 Fri, 26 Nov 2021 17:51:22 -0800 (PST)
MIME-Version: 1.0
References: <16BAEC7B11896AEA.23256@lists.yoctoproject.org>
 <CAA=hcWSA8-8TCJDD8_Zib11Vaizok-xZvQMqSevjKJLrQ+GuhA@mail.gmail.com>
 <16BB4412EB9EABB0.15594@lists.yoctoproject.org>
In-Reply-To: <16BB4412EB9EABB0.15594@lists.yoctoproject.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 26 Nov 2021 17:51:11 -0800
Message-ID: 
 <CANx9H-BczVumN8LwcH6+4SmobRJz=Hxmand2soVyfuoYZVmMQw@mail.gmail.com>
Subject: Re: [yocto] [OE-core] How to create connman_1.40.bbappend to enable
 and to build connman with iwd?
To: ticotimo@gmail.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Armin Kuster <akuster808@gmail.com>,
	Daniel Wagner <wagi@monom.org>, JH <jupiter.hce@gmail.com>,
 comman <connman@lists.linux.dev>,
	oe-core <openembedded-core@lists.openembedded.org>,
	yocto <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000d3854505d1bb7149"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 01:51:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158846

--000000000000d3854505d1bb7149
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 26, 2021 at 5:48 PM Tim Orling via lists.yoctoproject.org
<ticotimo=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Thu, Nov 25, 2021 at 10:26 PM JH <jupiter.hce@gmail.com> wrote:
>
>> Hi,
>>
>> Given the high profile of iwd and advocating connman with iwd, I
>> believe someone have already built Yocto connman and iwd,
>> surprisingly, I could not even find an iwd recipe in
>> https://github.com/openembedded/openembedded/tree/master/recipes, nor
>> can I find connman document and instructions to replace wpa_supplicant
>> by iwd, what could I be missing here?
>>
>
> Please look at the layer index for recipes:
> https://layers.openembedded.org/layerindex/branch/master/layers/
>
> I don=E2=80=99t have any advice for building it however.
>

I forgot to include the recipe link:
https://layers.openembedded.org/layerindex/recipe/89268/


>
>> Appreciate your kind advice.
>>
>> Thank you.
>>
>> Kind regards,
>>
>> - jh
>>
>>
>> On 11/26/21, JH via lists.yoctoproject.org
>> <jupiter.hce=3Dgmail.com@lists.yoctoproject.org> wrote:
>> > Hi,
>> >
>> > Please correct me, but it seems to me the connman is moving to a
>> > direction to ditch out wpa_supplicant and to use iwd, but the Honister
>> > still configure connman with wpa_supplicant by default, appreciate
>> > your advice:
>> >
>> > - Is connman with iwd stable enough?
>> >
>> > - How can I create a connman_1.40.bbappend  to replace wpa_supplicant
>> > by iwd configure?
>> >
>> > - Where are the documents for configuring and building connman with
>> > iwd? Where is the operational guidance to run connman with iwd? Can I
>> > use the same connman dbus APIs or are there any dbus API changes to
>> > run connman with iwd?
>> >
>> > My apology for FAQs.
>> >
>> > Thank you very much.
>> >
>> > Kind regards,
>> >
>> > - JH
>> >
>>
>>
>> --
>> "A man can fail many times, but he isn't a failure until he begins to
>> blame somebody else."
>> -- John Burroughs
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#55430):
> https://lists.yoctoproject.org/g/yocto/message/55430
> Mute This Topic: https://lists.yoctoproject.org/mt/87331141/924729
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d3854505d1bb7149
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 26, 2021 at 5:48 PM Tim Orling via <a href=3D"h=
ttp://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;ticotimo=3D<a =
href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproje=
ct.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><br></di=
v><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, Nov 25, 2021 at 10:26 PM JH &lt;<a href=3D"mailto:jupiter.hce@gmai=
l.com" target=3D"_blank">jupiter.hce@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Hi,<br>
<br>
Given the high profile of iwd and advocating connman with iwd, I<br>
believe someone have already built Yocto connman and iwd,<br>
surprisingly, I could not even find an iwd recipe in<br>
<a href=3D"https://github.com/openembedded/openembedded/tree/master/recipes=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/openembedded/open=
embedded/tree/master/recipes</a>, nor<br>
can I find connman document and instructions to replace wpa_supplicant<br>
by iwd, what could I be missing here?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Please look at t=
he layer index for recipes:</div><div dir=3D"auto"><div><a href=3D"https://=
layers.openembedded.org/layerindex/branch/master/layers/" target=3D"_blank"=
>https://layers.openembedded.org/layerindex/branch/master/layers/</a></div>=
<br></div><div dir=3D"auto">I don=E2=80=99t have any advice for building it=
 however.</div><div dir=3D"auto"></div></div></div></blockquote><div dir=3D=
"auto"><div dir=3D"auto"><br></div><div dir=3D"auto">I forgot to include th=
e recipe link:</div><div><a href=3D"https://layers.openembedded.org/layerin=
dex/recipe/89268/">https://layers.openembedded.org/layerindex/recipe/89268/=
</a></div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"gmail=
_quote"><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br></bl=
ockquote></div></div><div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
Appreciate your kind advice.<br>
<br>
Thank you.<br>
<br>
Kind regards,<br>
<br>
- jh<br>
<br>
<br>
On 11/26/21, JH via <a href=3D"http://lists.yoctoproject.org" rel=3D"norefe=
rrer" target=3D"_blank">lists.yoctoproject.org</a><br>
&lt;jupiter.hce=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" targe=
t=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; Please correct me, but it seems to me the connman is moving to a<br>
&gt; direction to ditch out wpa_supplicant and to use iwd, but the Honister=
<br>
&gt; still configure connman with wpa_supplicant by default, appreciate<br>
&gt; your advice:<br>
&gt;<br>
&gt; - Is connman with iwd stable enough?<br>
&gt;<br>
&gt; - How can I create a connman_1.40.bbappend=C2=A0 to replace wpa_suppli=
cant<br>
&gt; by iwd configure?<br>
&gt;<br>
&gt; - Where are the documents for configuring and building connman with<br=
>
&gt; iwd? Where is the operational guidance to run connman with iwd? Can I<=
br>
&gt; use the same connman dbus APIs or are there any dbus API changes to<br=
>
&gt; run connman with iwd?<br>
&gt;<br>
&gt; My apology for FAQs.<br>
&gt;<br>
&gt; Thank you very much.<br>
&gt;<br>
&gt; Kind regards,<br>
&gt;<br>
&gt; - JH<br>
&gt;<br>
<br>
<br>
--<br>
&quot;A man can fail many times, but he isn&#39;t a failure until he begins=
 to<br>
blame somebody else.&quot;<br>
-- John Burroughs<br>
<br>
<br>
<br>
</blockquote></div></div><div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"></blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#55430): <a href=3D"https://lists.yoctoproject.org/g/yoc=
to/message/55430" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctop=
roject.org/g/yocto/message/55430</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87331141/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt/=
87331141/924729</a><br>
Group Owner: <a href=3D"mailto:yocto%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">yocto+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto/un=
sub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@g=
mail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d3854505d1bb7149--

