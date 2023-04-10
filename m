Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BECC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 15:32:20 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.48500.1681140735512851619
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 08:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=U7Umotvy;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id p91so16904185uap.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681140734; x=1683732734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O0rfM9shJ12uLsJ4HeKmcOe1I1JX5lhzE9GEK0SL40Q=;
        b=U7UmotvyHh0p7USzFgdnPXJL4Xsc16Ig1x+KCHB0S14IcMHDfmpKuuzkLDGy/sSuZ4
         qvk5H9czY7IOdshRXNvuiAYIUXChwHyJ3TxEwGMtGibmhSaIqFrlHb2NxAY8HlByUDYs
         Rin1PWF2xgj6615qSQvlfpe/u8EuQQ1BcYqVbAipdDBFtj6OTO4rU/3rHKv8MDWgsSsF
         E4yqVswk34TGXUZUX/m2qD3N6i3fdbNcxfml9+X4i9l/DX19NfRvb9bs4JRNXWvz036/
         oJ8J6vuzGN98BgXfe35BP0AgepYa8dp282YyX0XnKZHa5nSFQ85ND5WDDXAUJ0nKYP/X
         9DWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681140734; x=1683732734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0rfM9shJ12uLsJ4HeKmcOe1I1JX5lhzE9GEK0SL40Q=;
        b=RU3xjqds2s/zQWep5IPetrMe8MBvkDnZnVW0XwwdcyY7cxYXjp/8fxjED5tGyxjIyA
         czaKDHuQKRU4Ihirm2pewa0aQnkiDfWfhnwzbCPY9ymKuRW6SN4q9UEDcQ7LMMdI0f+e
         ZdMjBGzsAcghhi/Ogyp/oUhVDQpEHZWRzKfjhmbhm0UNwavBnbN5WJFZJ8ripoyZqvsm
         CiICsWYNeYULiMdr6ufBBSidWNk+pzgrjKkfidYbOmXpIyOUYnVD1d/LxBNWYricq1XG
         /XP6iQ8GFWJx+dCTIdIwEQHVLHiGfSQ7F+J9Mh+VZpfvgOAY5h+FMTTSG09I0iKGhIL0
         fanQ==
X-Gm-Message-State: AAQBX9cGX/v+aWImru9kuMRRHaYnhxWSHlZx1YP8QYjz4RRPfFpJ7dJt
	tP3HjLqAAiLck0nm3y+EtHnhxEsbUPq2igLXb4I=
X-Google-Smtp-Source: AKy350YDnZFhLoOXwCyPOjbReCT3dlA9YhxUo8WipINvl3ixjPPXF+o0kR2JzK4SZJuxkv2DnP9s4NCcWh4KjpKgqMI=
X-Received: by 2002:a1f:9813:0:b0:43f:c93f:4eb8 with SMTP id
 a19-20020a1f9813000000b0043fc93f4eb8mr2934264vke.3.1681140734236; Mon, 10 Apr
 2023 08:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <1753B0402875C548.11304@lists.openembedded.org>
 <CA+cAkerWUvabx_kzN2s6S64454t88ifOR+nqtaLwk0wHfw3n2Q@mail.gmail.com>
 <6381549a7f058cb233c656dca9324ae4d7a435c2.camel@linuxfoundation.org> <CA+cAkerd92jAqwA1iDrNOV+W1mK5Tb39yvT_Dp-t18=LCNm09w@mail.gmail.com>
In-Reply-To: <CA+cAkerd92jAqwA1iDrNOV+W1mK5Tb39yvT_Dp-t18=LCNm09w@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 10 Apr 2023 16:32:03 +0100
Message-ID: <CANPvuRkfQuVdP-WJw58UOK9WVhy95UgujST4k6unnUvYQ7FySA@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000481d9d05f8fd149c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 15:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179889

--000000000000481d9d05f8fd149c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frederic,

Frederic Martinsons <frederic.martinsons@gmail.com> escreveu no dia
domingo, 9/04/2023 =C3=A0(s) 16:05:

>
>
> Le dim. 9 avr. 2023, 10:43, Richard Purdie <
> richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
>> On Sat, 2023-04-08 at 09:56 +0200, Frederic Martinsons wrote:
>> > Forget my previous question,
>> >
>> > I simply
>> > edit https://git.openembedded.org/openembedded-core/tree/meta/lib/oeq
>> > a/selftest/cases/reproducible.py#n137
>> > to replace by zavariant, and with OEQA_DEBUGGING_SAVED_OUTPUT set , I
>> > managed to see the html diff
>> >
>> > Nevertheless, It took one hour, but it seems that it cannot be
>> > avoided since there are two builds and one
>> > without any shared state.
>>
>> Unfortunately that is the nature of the test, one side has to be built
>> from scratch. Tweaking the test as you'd done to target a specific
>> component is what I'd have done too to speed things up for a specific
>> recipe.
>>
>> To get a further speedup, you could probably keep the sstate for each
>> of the two builds separate but retain both, then in theory on the
>> pieces you change would rebuild. Again, it would mean tweaking the test
>> but for debugging, I think that is fine. Rust can be a pain if you just
>> rebuild those as it still takes a while. Thanks for taking a look!
>>
>> Cheers,
>>
>> Richard
>>
>>
> Thank you for the tip, I'll try that, everything that help to speed up is
> good to take of course.
>

To speedup the build you can take the rust-native from the state cache [1]
and this will improve a bit bit the time needed:

sstate_target =3D [ "rust-native" ]

[1] https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selft=
est/cases/reproducible.py#n139


Jose


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179841):
> https://lists.openembedded.org/g/openembedded-core/message/179841
> Mute This Topic: https://lists.openembedded.org/mt/98126404/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000481d9d05f8fd149c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Frederic,</div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Frederic Martinsons &lt;=
<a href=3D"mailto:frederic.martinsons@gmail.com">frederic.martinsons@gmail.=
com</a>&gt; escreveu no dia domingo, 9/04/2023 =C3=A0(s) 16:05:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div><br>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le dim=
. 9 avr. 2023, 10:43, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@l=
inuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sat, 2023-04-08 at 09:56 +0200, Frederic Martinsons wrote:<br=
>
&gt; Forget my previous question,=C2=A0<br>
&gt; <br>
&gt; I simply<br>
&gt; edit=C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/tr=
ee/meta/lib/oeq" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gi=
t.openembedded.org/openembedded-core/tree/meta/lib/oeq</a><br>
&gt; a/selftest/cases/reproducible.py#n137<br>
&gt; to replace by zavariant, and with=C2=A0OEQA_DEBUGGING_SAVED_OUTPUT set=
 , I<br>
&gt; managed to see the html diff<br>
&gt; <br>
&gt; Nevertheless, It took one hour, but it seems that it cannot be<br>
&gt; avoided since there are two builds and one<br>
&gt; without any shared state.<br>
<br>
Unfortunately that is the nature of the test, one side has to be built<br>
from scratch. Tweaking the test as you&#39;d done to target a specific<br>
component is what I&#39;d have done too to speed things up for a specific<b=
r>
recipe.<br>
<br>
To get a further speedup, you could probably keep the sstate for each<br>
of the two builds separate but retain both, then in theory on the<br>
pieces you change would rebuild. Again, it would mean tweaking the test<br>
but for debugging, I think that is fine. Rust can be a pain if you just<br>
rebuild those as it still takes a while. Thanks for taking a look!<br>
<br>
Cheers,<br>
<br>
Richard<br><br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Thank you for the tip, I&#39;ll try that, everything that help t=
o speed up is good to take of course.=C2=A0</div></div></blockquote><div><b=
r>To speedup the build you can take the rust-native from the state=C2=A0cac=
he [1] and this will improve a bit bit the time needed:<br><br>sstate_targe=
t =3D [ &quot;rust-native&quot; ]<br><br><pre style=3D"padding:0px;margin-t=
op:0px;margin-bottom:0px;color:rgb(0,0,0);font-size:13.3333px"><span style=
=3D"font-family:Arial,Helvetica,sans-serif;font-size:small;color:rgb(34,34,=
34)">[1] <a href=3D"https://git.openembedded.org/openembedded-core/tree/met=
a/lib/oeqa/selftest/cases/reproducible.py#n139">https://git.openembedded.or=
g/openembedded-core/tree/meta/lib/oeqa/selftest/cases/reproducible.py#n139<=
/a>
=C2=A0</span></pre>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"auto"><div dir=3D"auto"></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179841): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179841" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179841</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98126404/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98126404/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000481d9d05f8fd149c--

