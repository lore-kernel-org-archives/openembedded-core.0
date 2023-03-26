Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFFD7C6FD1C
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 14:58:33 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.11759.1679842708884359198
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 07:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mJDiaF5T;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id a11so6368782lji.6
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 07:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679842707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tqj8VZJSyjjg4DI5NJ+MW5k6fzykHlMSzAAlrHfuSyo=;
        b=mJDiaF5Tdl52siBGEyw4ECwAmS4l287EbsakoOjG1ZBLq+fmwYgwoUZyC3Yqf1D9bo
         iQr5+P5oRYEWRTUxge77qi+c61q9U6X7jeKlyfQJQUmpF3fMV7RV1WE5mBwGg8SJ7yJa
         O975gI3UhUzWMmjh56PLIhHdI9etUdG0tBmwfG5V6qS+vEMCf6JuJeLZaG3eeD1r8Cw8
         W7A0bAWQkwnupb29/Isi+vBk3pGTbEfTUZjg+GNcz5xGOX9Mg+f54nXtLsKS0dKJsESJ
         27dIaGf6h6CnYrRLzy6kEeS7UzhWZgZ7MIi7W/gsjoDR9ktbqkGOR/484UsZAqFrkfp/
         LHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679842707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tqj8VZJSyjjg4DI5NJ+MW5k6fzykHlMSzAAlrHfuSyo=;
        b=wueAzPAivHtT+NYPUOn/A5BGYKkP+/lcEsrjRF7aqmp5U57Q8SMZ++nlYdREBMpqEZ
         mmLWl+ZQbQHGD9jn95+KctsSlRbPWuHKREXS+GRQhKLa52ARkeaL2ugiyxyZAXyZkK5X
         raIf5pwKRv16bhAOZGUOKJvzOv0zAf5lAzZnTbbskyWeM2SJHWO1DUTzozvGGSDJZWcJ
         VPQwy13uCjhHppqmSKUkI69I/Gg46M/y/GNUEUcpUyBIs9ddt/6lWPCo+qKqmDT1ywIL
         hselFY5HYgkXnB9+0nWVSIDkRDWhTrNyFzWUS/QPzb2JHININB7bAwi/ucxnxiEG2h/6
         Tx/g==
X-Gm-Message-State: AO0yUKXTabFHb9tFLDV0dZne6y3cdc8Ev6lZZjFdoLzyHu6rZ80VMYHR
	TMIBGOb5Lz1kn+vuTEn180uZIvWli3fkHj3lzek=
X-Google-Smtp-Source: AK7set+SXshy3qpts8Hlsg1wBiUR1DTLN6ja3QtkBAc2r12898tfmtOa2w/f1VHHBkonO86utYP2ZtuvnH/cnu1lqGM=
X-Received: by 2002:a2e:5710:0:b0:2a2:35dd:4b30 with SMTP id
 l16-20020a2e5710000000b002a235dd4b30mr4769640ljb.3.1679842706490; Sun, 26 Mar
 2023 07:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <b48dd61e593e57d7673b65a34a44cd304cb7b7b8.1679734210.git.frederic.martinsons@gmail.com>
 <CANNYZj_W+qLQRMVTuW8RMSJeBSgstixSPh1rZh77KxvN4vsCgg@mail.gmail.com> <CA+cAkep6MPVsP=sY_y9jonjgn8X2oEJL4OPiidfGyT5jJUjVzQ@mail.gmail.com>
In-Reply-To: <CA+cAkep6MPVsP=sY_y9jonjgn8X2oEJL4OPiidfGyT5jJUjVzQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sun, 26 Mar 2023 16:58:14 +0200
Message-ID: <CA+cAkeqFrnuoSL5Z2d1MrPNv3VbmLfUPV0w0BBQ-w3Jd2-A3YA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] devtool: add support for multiple git url
 inside a cargo based recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alex.kiernan@gmail.com
Content-Type: multipart/alternative; boundary="000000000000cc8a9605f7cedbcf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 14:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179127

--000000000000cc8a9605f7cedbcf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I submit a V2 series where I made modifications you suggested, I choose to
use a more
generic type (git-dependency instead of cargo-dep) since I foresee that
could be used also
for npm based recipe (see
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11015)

For the moment, I let the example recipe in oe-core because I don't know
where it should
go (or even if I should keep it or remove it)

On Sun, 26 Mar 2023 at 07:15, Fr=C3=A9d=C3=A9ric Martinsons <
frederic.martinsons@gmail.com> wrote:

> Ah, good idea, I'll try that and provide a V2 of this series if it fits.
>
> On Sat, 25 Mar 2023 at 20:02, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Sat, 25 Mar 2023 at 10:01, Frederic Martinsons
>> <frederic.martinsons@gmail.com> wrote:
>> > @@ -72,6 +73,8 @@ python () {
>> >                      url_data.type =3D=3D 'npmsw' or url_data.type =3D=
=3D
>> 'crate' or
>> >                      'type' in parm and parm['type'] =3D=3D 'kmeta'):
>> >                  local_srcuri.append(url)
>> > +            if url in cargo_git_deps:
>> > +                local_srcuri.append(url)
>>
>> Come to think of it, it's better to use the same type parameter with a
>> special value as in kernel recipes:
>>
>> git://.....;type=3Dcargo-dep;...
>>
>> This would avoid the ugly special variable.
>>
>> Alex
>>
>

--000000000000cc8a9605f7cedbcf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I submit a V2 series where I made modifications you sugges=
ted, I choose to use a more<div>generic type (git-dependency instead of car=
go-dep) since I foresee that could be used also</div><div>for npm based rec=
ipe (see=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D11015">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11015</a>)</d=
iv><div><br></div><div>For the moment, I let the example recipe in oe-core =
because I don&#39;t know where it should</div><div>go (or even if I should =
keep it or remove it)</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sun, 26 Mar 2023 at 07:15, Fr=C3=A9d=C3=A9ric=
 Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com">frederic.m=
artinsons@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr">Ah, good idea, I&#39;ll try that and pr=
ovide a V2 of this series if it fits.</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sat, 25 Mar 2023 at 20:02, Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">a=
lex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Sat, 25 Mar 2023 at 10:01, Frederic Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fred=
eric.martinsons@gmail.com</a>&gt; wrote:<br>
&gt; @@ -72,6 +73,8 @@ python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 url_data.type =3D=3D &#39;npmsw&#39; or url_data.type =3D=3D &#39;cr=
ate&#39; or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;type&#39; in parm and parm[&#39;type&#39;] =3D=3D &#39;kmeta&#3=
9;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local_sr=
curi.append(url)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if url in cargo_git_deps:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local_srcuri.=
append(url)<br>
<br>
Come to think of it, it&#39;s better to use the same type parameter with a<=
br>
special value as in kernel recipes:<br>
<br>
git://.....;type=3Dcargo-dep;...<br>
<br>
This would avoid the ugly special variable.<br>
<br>
Alex<br>
</blockquote></div>
</blockquote></div>

--000000000000cc8a9605f7cedbcf--

