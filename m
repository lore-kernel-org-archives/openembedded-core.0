Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web09.685.1623166828273850759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 08:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aY5M/6kG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.180, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lj1-f180.google.com with SMTP id c11so27605120ljd.6
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 08:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jJbabTHek8nSS2jkMh7aUKdrwGLIzyywUGMFBWxmI0c=;
        b=aY5M/6kGqg1nbtXLLemlVZ/EqCeBkjSl1J30Xb21ZM/KU8/Z2OrO36xhIJ5Z9Mr++g
         RCAlQ48eS6EEvFxlouCyRuiCXYDlegCXN51CvCABjbNkLdslVrKoCvmqSy4b6DNvQH9g
         SxXGikYbR65FkR5tOz07Qge/tK4znr0zW+bY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jJbabTHek8nSS2jkMh7aUKdrwGLIzyywUGMFBWxmI0c=;
        b=DsAvX6UPaj5KnrgOsVEp6TbB7l1rNHeVxQLIlquqOnvhQi8GDglA8EP9/fR1ZVtmiw
         WTGNq52+ZR/aOYRXbdyOsAuBt40oIzOs8fkRFxyTklN4dJ0lUtBTrj+eD0jEX50vDCfx
         TvfvEmh2zmozt/B5nPzukhhQ0e44nAhy1BkToy9Hx73wEjVXLUai/2H/bTat4EhABD0O
         JGJrC640VCVwdxO2HTmDs+Kbl4uhjhorhZWz5xB3Ur2/5miABeZnlHCMEv5Zdy8f/nUF
         oviLm5FPqOa3t9CqCePxcahhIzfEkGmhWi7C9NJS3w7vpgm/dyaLdUmy1ngyz0kesz9/
         3wLQ==
X-Gm-Message-State: AOAM533e3pTUAErV3F93xHhLDavIj7J8DXux+0cY2QzRT9PtdXRjSX1g
	FEvz2ngRWkvXwxh+8+wYQ848uWFGjOCfmZUXkxv51w==
X-Google-Smtp-Source: ABdhPJzVZKJSY/HHMpzMKeX5W8N6zMJ2R7aup/VwZHWMzCW/IMaNdRDkgapDVK5vKpyT49Gm99FlmudbLkwpOURYj44=
X-Received: by 2002:a2e:88da:: with SMTP id a26mr18916523ljk.214.1623166826252;
 Tue, 08 Jun 2021 08:40:26 -0700 (PDT)
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
 <CAMKF1spK+WC_J-pb-iYsnvHzVj4-sr8YKaz63yjCU98F+VurTw@mail.gmail.com> <CANNYZj-1D7M6ggXiaGZX7PnkmENqK_8wgHpR06W9AWp==kwbUQ@mail.gmail.com>
In-Reply-To: <CANNYZj-1D7M6ggXiaGZX7PnkmENqK_8wgHpR06W9AWp==kwbUQ@mail.gmail.com>
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
Date: Tue, 8 Jun 2021 08:40:15 -0700
Message-ID: <CADfgfoaUpky3zgsU=q90nQdbuPWa63VxQSKQCc=r1YahwKw5oQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000017241805c442fa27"

--00000000000017241805c442fa27
Content-Type: text/plain; charset="UTF-8"

I've rebooted centos8-ty-1 using the previous 4.18.0-240.15.1.el8_3.x86_64
kernel and kept it in the pool. I've paused centos8-ty-2 so it won't
interfere with builds and left it at the current 4.18.0-305.3.1.el8.x86_64
kernel for testing.

On Mon, Jun 7, 2021 at 11:04 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Mon, 7 Jun 2021 at 19:18, Khem Raj <raj.khem@gmail.com> wrote:
>
>> > I added the needed packages to the CentOS workers. The compiled binary
>> prints "rc=0" on the three CentOS workers.
>>
>> can we now try linking and running it against SDK built nativesdk-glibc ?
>>
>
> Using the host libc won't show the issue, as it is old (2.28), isn't using
> utimensat_time64 and goes straight to utimensat.
>
> With nativesdk-glibc, it still succeeds:
> utimensat_time64(3, NULL, [{tv_sec=1, tv_nsec=2} /*
> 1970-01-01T00:00:01.000000002+0000 */, {tv_sec=3, tv_nsec=4} /*
> 1970-01-01T00:00:03.000000004+0000 */], 0) = 0
>
> So we'd need to look into why the kernel accepts this, but rejects the
> call from cmake. Any easy way to trace this? Just to repeat the failing one:
>
> utimensat_time64(AT_FDCWD,
> "../install/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake",
> [{tv_sec=1622966723, tv_nsec=6319439026193432576}, {tv_sec=1622966579,
> tv_nsec=17840053692309438464}], 0) = -1 EINVAL (Invalid argument)
>
> Alex
>


-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--00000000000017241805c442fa27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve rebooted=C2=A0centos8-ty-1=C2=A0using the previou=
s=C2=A04.18.0-240.15.1.el8_3.x86_64 kernel and kept it in the pool. I&#39;v=
e paused=C2=A0centos8-ty-2 so it won&#39;t interfere with builds and left i=
t at the current 4.18.0-305.3.1.el8.x86_64 kernel for testing.=C2=A0</div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Jun 7, 2021 at 11:04 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 7 Jun 2021 at 19:18, Khe=
m Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&gt; I added the needed packages to the CentOS workers. The comp=
iled binary prints &quot;rc=3D0&quot; on the three CentOS workers.<br>
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
 class=3D"gmail_signature"><div dir=3D"ltr">Michael Halstead<div>Linux Foun=
dation / Yocto Project</div><div>Systems Operations Engineer</div></div></d=
iv>

--00000000000017241805c442fa27--
