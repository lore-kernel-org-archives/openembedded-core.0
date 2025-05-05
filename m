Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45809C3ABB6
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 09:50:06 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.46438.1746438591733951920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 02:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=edkaIQ/A;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-401f6513cb2so2974975b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746438591; x=1747043391; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hydc02yd3JOvrAnJ2J7Ejt47448MIjAhOFJt7Ocvo0A=;
        b=edkaIQ/A+PGI86T6+p6/R/vV9Sl/5RziKmIvPI2tynNi+VcJl2IyVfn03m+lDpEy50
         P1XaVtVrQqE6DSATPFk3oDWlAyK08BEmvvKQ4MM7nRQwYonFByrNO9K7sHCQwJ2bDqKp
         3bvUDyosezYnsFQWK1AXRa3Uz5zSnkGG/7bG40+MaOv8lhpyLSXYPLcfrDI4XOb/eXL3
         3VRbSrbXxvSm8/xBAtVve68P6FnT9EEWvOHOXQGtd/x9gaTwbFeu7dGAeM8HREksh20Q
         yRvd+HcI7xhGP2+mbUCmn2imb79xgZk44ay3HEWPsFiFcq0jxHL4Y/l2oxhVb33z0XmJ
         vHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746438591; x=1747043391;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hydc02yd3JOvrAnJ2J7Ejt47448MIjAhOFJt7Ocvo0A=;
        b=ib9KD2ovR87yJoavOfiY21kpaZYIWB92LTGDsLCHpDmQBnHQlx0SJDmgpahNTGNzaL
         g8Rd7Sc1BpPxv9L+Z9fOwOSer0gzEj82UPdOP+1vulYAszfqKFIJdBJBs5DTztsrG22Z
         kmc+ZF6C4pN6TH/l/O3iZwEi99LmLkIbfPJDx4lsFZAdqmME7PbicG9wHfPGW8GDb3Ba
         xdKXqdUqi6fZbZXYu7bupuOfI19saxGVnFacABVW2bMzW3lOcAS+smFYGACgQTFrHZ1z
         UUCMaJ5oILWXZqveHgPBPDTk5mxzrbybIgsPf5Mrm0uWcddwFNXbjnbfxdIYrZQ9ec4X
         p4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCW38Gv99BR1GCJkYFlk1i3oQjxB5U5TlZb0cQqsCqpxngTCV8j0wldU/htEopqCGOYIIU/Kn0Il+JHuBVE6KnRd9g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwtL16aI9PLY0yl2+XQGPDSAW7L5uImu8hRirBa7ry642JC4va8
	Vu+HJ8eTbV0XMvhtbKWeWBMXNB5LP1hXwldSWSM6coK4YlSBwIxZ7HzpgLA193cmDtRf3i5eJNq
	QG6n3udjr1iCPj46nCby0ZZG/36t9Z55B
X-Gm-Gg: ASbGncui5ZjadIpcPyWrAhqcrjhYm8Hnxvn05hvt3/e7pSz3J8eMc2m+jn8J1z4jlCV
	Dpmr6c1SATdy9OF+zvyjicD1IVkaaA9WU9A8h6Zt0ImGjexYtbKe7RVLAbONA2nUzyQGRriSo7V
	z5TOczNHAjEcruf4eHP0zjNg==
X-Google-Smtp-Source: AGHT+IF7PzYywzI69YszSrwfSzCFGtpmFCiLT7tJhAdTcKZ4wEO5XrbAWbb+J+y66avJiKJ/B8bSzJTLRNLuV1d0qtc=
X-Received: by 2002:a05:6820:1898:b0:600:5673:69ef with SMTP id
 006d021491bc7-607ed9ba5bfmr7605400eaf.1.1746438590725; Mon, 05 May 2025
 02:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAMSfU+5sS-5bBxwK9N07+Jwfqw9rXaTszmd87ecteO_B84O8OA@mail.gmail.com>
 <7063.1746436829581898913@lists.openembedded.org> <CAMSfU+5ztTXWS-ZncZcB=rMBG94ZWJC2UixhXdEr2RdQ0n16ew@mail.gmail.com>
In-Reply-To: <CAMSfU+5ztTXWS-ZncZcB=rMBG94ZWJC2UixhXdEr2RdQ0n16ew@mail.gmail.com>
From: Ashish Mishra <emailaddress.ashish@gmail.com>
Date: Mon, 5 May 2025 15:19:38 +0530
X-Gm-Features: ATxdqUFwN1AYD858ZxVxJAJDmjKqvyEez1wFADFKjRA6p-azlQI3xZm_Tsif5dk
Message-ID: <CAE_=ZzG0Ne_mviLsoLs1y74=vfuAUp=DJnFYQLn9LnL0zrDgnw@mail.gmail.com>
Subject: Re: Private: Re: [OE-core] Process to get the patch reviewed
To: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d280a90634606b1f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 09:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216002

--000000000000d280a90634606b1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann ,

Have submitted the patch you suggested
https://lists.yoctoproject.org/g/yocto-patches/message/1497

Thanks for the quick suggestion.
- Ashish


On Mon, May 5, 2025 at 3:02=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr>=
 wrote:

>
>
> Le lun. 5 mai 2025 =C3=A0 11:20, Ashish Mishra via Lists.Openembedded.Org
> <emailaddress.ashish=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>
>> Thanks Yoann.
>> I was using github.com/meta-java/meta-java
>> "...To contribute to this layer you may submit the patches for review to
>> the mailing list (openembedded-devel@lists.openembedded.org)."
>>
>
> Oh yeah, I see. It looks like this line was missed when migrating.
> Maybe you can send a patch to change this line as well?
>
>
>>  Thanks for pointing the yocto-patches@lists.yoctoproject.org.
>> Will send the patch there.
>>
>> Thanks Again for quick help.
>> -Ashish
>>
>>
>
>
> --
> Yoann Congal
> Smile ECS
>

--000000000000d280a90634606b1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Yoann , <br></div><div><br></div>=
<div>Have submitted the patch you suggested <a href=3D"https://lists.yoctop=
roject.org/g/yocto-patches/message/1497">https://lists.yoctoproject.org/g/y=
octo-patches/message/1497</a> <br></div><div><br></div><div>Thanks for the =
quick suggestion.</div><div>- Ashish <br></div><div><br></div></div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, May 5, 2025 at 3:02=E2=80=AFPM Yoann Congal &lt;<a href=3D=
"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div d=
ir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0lun. 5 mai 2025 =C3=A0=C2=A011:20, Ashish Mishra vi=
a <a href=3D"http://Lists.Openembedded.Org" target=3D"_blank">Lists.Openemb=
edded.Org</a> &lt;emailaddress.ashish=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;=
 a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div>Thanks Yoann.</div>
<div>I was using <a href=3D"http://github.com/meta-java/meta-java" target=
=3D"_blank">github.com/meta-java/meta-java</a> </div>
<div>&quot;...To contribute to this layer you may submit the patches for re=
view to the mailing list (<a href=3D"mailto:openembedded-devel@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a>=
).&quot;</div></blockquote><div><br></div><div>Oh yeah, I see. It looks lik=
e this line was missed when migrating.</div><div>Maybe you can send a patch=
 to change this line as well?</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<div>=C2=A0Thanks for pointing the <a href=3D"mailto:yocto-patches@lists.yo=
ctoproject.org" rel=3D"noopener" target=3D"_blank">yocto-patches@lists.yoct=
oproject.org</a>.</div>
<div>Will send the patch there.</div>
<div>=C2=A0</div>
<div>Thanks Again for quick help.</div>
<div>-Ashish </div>
<div>=C2=A0</div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</blockquote></div></div>

--000000000000d280a90634606b1f--

