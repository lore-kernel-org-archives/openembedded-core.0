Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web09.582.1623176140108408611
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 11:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UZSxv9rH;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id k71so373173vka.11
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 11:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8z9qnfVoD4b4kcNwg9JdBpVk3pScsFncJQFRSbRQLlc=;
        b=UZSxv9rHTWAS91gJOshIz6+Ynx+3IWVAFjYMDhSz113EJsM7ZBnrYz+TV2WUtigDz3
         a2TEpmt+uMkhvnMgBkqkO21EJ+Z74uABUWNib390JWGdG3Lb9RwObdYhviOBM5F/xu0I
         FLLFsoTmuhPIqluZUmw5zCVUMWbC2aXG+zO9SWyddgHo2iJo2S5cDYRoTCjetsGsLs5b
         BtUFnFCv7qnTPvOIp6yQIGJY0EV/LeA1HyaVpYLd8zwMZhTij8sO/BoMBLrbYitAIL+o
         5WElLS5bOecSGkAYu3PzrYCeSyxPXlHfEq93O/r8+D/tt5v12IgGrk5yzyMYWaPdt8Nd
         0mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8z9qnfVoD4b4kcNwg9JdBpVk3pScsFncJQFRSbRQLlc=;
        b=TTzaUj4Ji39TcCZtLTfC/5pCnKRk4ucx3Ah1dAMChFlwK2E6reQctOX5GVQX3TJgLD
         06AwwvYRXIVUyt25SR1RF5k9VqBfQAu+hbcF2hLmR24sU07hsXikrBaqX0BYCobLSEZV
         6lH2RD2rRdRR9ymyP595LgD77Uih0XVn5q3RMwR7RwhIXBPKGc2C3nfRal3MSXCe44UE
         nKoOP+rTZsTrdzPoJPhmlnQ1+t99H0aJrFtrA/mjefldNgf+gU62E6vPLrwgW4EFXN9k
         wI8QE0RaytkJ9rgWkJWVWov8i7eMktWMrn6IT8G1eYpumWfPRsdO0uZaKeI6VhRRodeh
         7dfw==
X-Gm-Message-State: AOAM532Ay7T46LIyFqFDYnQW210kUvTMpFHOUSDmm72Lm/LY5szStzlU
	qKk0CD5J/oIrY+H3Q6Pi0mKyPdc4GJuEx5Y3l9Y=
X-Google-Smtp-Source: ABdhPJz1Dp30XzfzMDZYLk+LAyuRgJV5BJZyxNBaP0N5EZ9IyTejCSXbNuSajaHirPw5YQ72LxNw4rGoVauoTaDv2fk=
X-Received: by 2002:a1f:4594:: with SMTP id s142mr1513275vka.16.1623176139146;
 Tue, 08 Jun 2021 11:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
 <20210604091458.1381144-4-alex.kanavin@gmail.com> <1685B658849E960A.4717@lists.openembedded.org>
 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com> <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
 <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
 <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
 <CAMKF1srMGpi0fCdx0b=n0NCSMrkBUBN80srR1sMP9vZZbHf=tQ@mail.gmail.com>
 <CANNYZj9spx5kAGMZBTTYz_daHG=G17uAfx6rE3=0fe+CP8-p=A@mail.gmail.com>
 <CAMKF1sqWNP8G=DwthpeiXfV2niSygRBeNQACXDrVgT5NEds3vA@mail.gmail.com>
 <CANNYZj-iYbPjM7KKv+bPL_Tu2WZqG2sOCB5njjHHZ-5ou36rUg@mail.gmail.com>
 <CAMKF1sobgTDj0Cf5TZ=DcO00tTGQb=q2yPiMuub57-PfAv058w@mail.gmail.com>
 <CADfgfob3EjTPSuxOXQ1EbR6j108OqcKi_oNibGE9xQ-=_AHxGQ@mail.gmail.com>
 <CAMKF1spK+WC_J-pb-iYsnvHzVj4-sr8YKaz63yjCU98F+VurTw@mail.gmail.com>
 <CANNYZj-1D7M6ggXiaGZX7PnkmENqK_8wgHpR06W9AWp==kwbUQ@mail.gmail.com> <CADfgfoaUpky3zgsU=q90nQdbuPWa63VxQSKQCc=r1YahwKw5oQ@mail.gmail.com>
In-Reply-To: <CADfgfoaUpky3zgsU=q90nQdbuPWa63VxQSKQCc=r1YahwKw5oQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 8 Jun 2021 20:15:27 +0200
Message-ID: <CANNYZj9wKQv+YMgCN98R1fEiCaruFTiK_MHXt+aNPVLOYBBS2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000002e87b205c4452572"

--0000000000002e87b205c4452572
Content-Type: text/plain; charset="UTF-8"

I can confirm that the previous kernel behaves correctly:
utimensat_time64(AT_FDCWD,
"../install/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake",
[{tv_sec=1623176017, tv_nsec=6290007298941124608}, {tv_sec=1622966579,
tv_nsec=17838646317425885184}], 0) = -1 ENOSYS (Function not implemented)
utimensat(AT_FDCWD,
"../install/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake",
[{tv_sec=1623176017, tv_nsec=0} /* 2021-06-08T18:13:37+0000 */,
{tv_sec=1622966579, tv_nsec=0} /* 2021-06-06T08:02:59+0000 */], 0) = 0

Does look like a botched backport of time64 syscalls to me.

Alex

On Tue, 8 Jun 2021 at 17:40, Michael Halstead <mhalstead@linuxfoundation.org>
wrote:

> I've rebooted centos8-ty-1 using the previous 4.18.0-240.15.1.el8_3.x86_64
> kernel and kept it in the pool. I've paused centos8-ty-2 so it won't
> interfere with builds and left it at the current 4.18.0-305.3.1.el8.x86_64
> kernel for testing.
>
> On Mon, Jun 7, 2021 at 11:04 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Mon, 7 Jun 2021 at 19:18, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> > I added the needed packages to the CentOS workers. The compiled binary
>>> prints "rc=0" on the three CentOS workers.
>>>
>>> can we now try linking and running it against SDK built nativesdk-glibc ?
>>>
>>
>> Using the host libc won't show the issue, as it is old (2.28), isn't
>> using utimensat_time64 and goes straight to utimensat.
>>
>> With nativesdk-glibc, it still succeeds:
>> utimensat_time64(3, NULL, [{tv_sec=1, tv_nsec=2} /*
>> 1970-01-01T00:00:01.000000002+0000 */, {tv_sec=3, tv_nsec=4} /*
>> 1970-01-01T00:00:03.000000004+0000 */], 0) = 0
>>
>> So we'd need to look into why the kernel accepts this, but rejects the
>> call from cmake. Any easy way to trace this? Just to repeat the failing one:
>>
>> utimensat_time64(AT_FDCWD,
>> "../install/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake",
>> [{tv_sec=1622966723, tv_nsec=6319439026193432576}, {tv_sec=1622966579,
>> tv_nsec=17840053692309438464}], 0) = -1 EINVAL (Invalid argument)
>>
>> Alex
>>
>
>
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer
>

--0000000000002e87b205c4452572
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I can confirm that the previous kernel behaves correc=
tly:</div><div>utimensat_time64(AT_FDCWD, &quot;../install/usr/local/lib/cm=
ake/assimp-4.1/assimp-config.cmake&quot;, [{tv_sec=3D1623176017, tv_nsec=3D=
6290007298941124608}, {tv_sec=3D1622966579, tv_nsec=3D17838646317425885184}=
], 0) =3D -1 ENOSYS (Function not implemented)<br>utimensat(AT_FDCWD, &quot=
;../install/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake&quot;, [{tv_=
sec=3D1623176017, tv_nsec=3D0} /* 2021-06-08T18:13:37+0000 */, {tv_sec=3D16=
22966579, tv_nsec=3D0} /* 2021-06-06T08:02:59+0000 */], 0) =3D 0</div><div>=
<br></div><div>Does look like a botched backport of time64 syscalls to me.<=
/div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 8 Jun 2021 at 17:40, Michael=
 Halstead &lt;<a href=3D"mailto:mhalstead@linuxfoundation.org">mhalstead@li=
nuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr">I&#39;ve rebooted=C2=A0centos8-ty-1=C2=A0=
using the previous=C2=A04.18.0-240.15.1.el8_3.x86_64 kernel and kept it in =
the pool. I&#39;ve paused=C2=A0centos8-ty-2 so it won&#39;t interfere with =
builds and left it at the current 4.18.0-305.3.1.el8.x86_64 kernel for test=
ing.=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Mon, Jun 7, 2021 at 11:04 AM Alexander Kanavin &lt;<a href=3D"=
mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, 7 Jun 2021 at 19:18, Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">&gt; I added the needed package=
s to the CentOS workers. The compiled binary prints &quot;rc=3D0&quot; on t=
he three CentOS workers.<br>
<br>
can we now try linking and running it against SDK built nativesdk-glibc ?<b=
r></blockquote><div><br></div><div>Using the host libc won&#39;t show the i=
ssue, as it is old (2.28), isn&#39;t using utimensat_time64 and goes straig=
ht to utimensat.</div><div><br></div><div>With nativesdk-glibc, it still su=
cceeds:</div><div>utimensat_time64(3, NULL, [{tv_sec=3D1, tv_nsec=3D2} /* 1=
970-01-01T00:00:01.000000002+0000 */, {tv_sec=3D3, tv_nsec=3D4} /* 1970-01-=
01T00:00:03.000000004+0000 */], 0) =3D 0</div><div><br></div><div>So we&#39=
;d need to look into why the kernel accepts this, but rejects the call from=
 cmake. Any easy way to trace this? Just to repeat the failing one:</div><d=
iv><br></div><div>utimensat_time64(AT_FDCWD, &quot;../install/usr/local/lib=
/cmake/assimp-4.1/assimp-config.cmake&quot;, [{tv_sec=3D1622966723, tv_nsec=
=3D6319439026193432576}, {tv_sec=3D1622966579, tv_nsec=3D178400536923094384=
64}], 0) =3D -1 EINVAL (Invalid argument)</div><div><br></div><div>Alex<br>=
</div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Project</di=
v><div>Systems Operations Engineer</div></div></div>
</blockquote></div>

--0000000000002e87b205c4452572--
