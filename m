Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.14713.1613594982396295281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 12:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RgTKBBUX;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id 81so4329qkf.4
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 12:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eq+B71swSbWKosH/cqBpG/iwpmavH5JyZOyckh152ds=;
        b=RgTKBBUX0zU1vVBAV7zXG1lYF2GUmyuGBwizwjklmHQcm1RtFfdcF3UwSG/n9Kit0J
         S4N3l7uhMKiyAIqUo+Ce8aw3HAS3WqRHSuMgTSKBb8EIo1lpnPnxaYRa+INql8DsmnXh
         XY8iZmzt9Rld1xg94eITD1d3SEGbwcaP2S3czUfpl4xakpcVnytKoqsHokYxte2rIikt
         JILIbAFHR7sTQlmj2RT/yrzXWze03cM1ATSd+bMI4MtLy1LVgM6TGWugbXTOyO5pBPe8
         4UpAhJ72PFbDPmsGVe5G2Si4ki9I8hec7wDqKaW1tl9iDd37dw6BX/L3IRWgdXd5gul4
         Rqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eq+B71swSbWKosH/cqBpG/iwpmavH5JyZOyckh152ds=;
        b=TgyVd6/A+JW1Kv2tUIQ7dNjwzKHuhS52Zk3H149gHjC6aZtP0eKMYhG83baY0JIweU
         tTOqyZRRfu4YhuqJuTtVr/0Fzw6Q/IIiHtj5ehd8b7Xk40lE5IMg22XCqkBn1EvI6P+y
         wUHW2xGJG2NSXnR1wvq+FASLi3zMo8mAE/hNN5oHyFF6v1ejaBHlLgRyPYLm0VRBeaHT
         7DVvr+ZTOgtb3OE7q9rALYG48gQGbRzHrjrKJ0nVL8h5EjBQXuepfI7iBgbv1yd0iTc0
         gmS8poDmaCYIXEXYyR82P67oiwFoQku/dgZ2MAQ4s1m2b7I/zHClJl63A8McL3UOJz4S
         i58g==
X-Gm-Message-State: AOAM530QaPNmx//XHu4dY90pPQbERW8845AbhG6fgGznR3nc2Obe8ctR
	f58aLn7TexpM0L3LOV7IQ7mDvPUiZw8x2IAzEJM=
X-Google-Smtp-Source: ABdhPJxVmDgjxRlPDH3dQpO2qmYnjBDyBaoYJqitCPpjXRVVRPfsYsCQMlaWHzawjaiiAHeUkDQ+0hCmsdAe51TnqeA=
X-Received: by 2002:a37:e13:: with SMTP id 19mr1076908qko.119.1613594981537;
 Wed, 17 Feb 2021 12:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20210216190600.2038009-1-richard.purdie@linuxfoundation.org>
 <CAMKF1spnShJ96Xo+Laj4-aCUEXizKWAMkgO+P1Fq=kTmLX2A0A@mail.gmail.com> <cc0164c7eb45418117aca6b948116acc941ba464.camel@linuxfoundation.org>
In-Reply-To: <cc0164c7eb45418117aca6b948116acc941ba464.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Feb 2021 12:49:30 -0800
Message-ID: <CAMKF1sr5ez1-Ty67OeiPNvbYJq4ipjPuFEmSV51GPeEG8yDutA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: Refresh mmap fixes patch status/content
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000af9b6b05bb8e5b4c"

--000000000000af9b6b05bb8e5b4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am always on master next and rebasing my branch onto it often sometimes
multiple times a day I am trying latest master-next and let=E2=80=99s see w=
hat
happens

On Wed, Feb 17, 2021 at 12:46 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2021-02-17 at 10:05 -0800, Khem Raj wrote:
> > I am seeing musl builds are hung in qemu now, I suspect this change is
> > causing it.
>
> Are you using master or a master-next? I did revert this patch in one of
> the -nexts just to test the bug reproduced ok. I did test the revised
> patch with the change and things seemed ok.
>
> Cheers,
>
> Richard
>
>

--000000000000af9b6b05bb8e5b4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I am always on master next and rebasing my branch onto it=
 often sometimes multiple times a day I am trying latest master-next and le=
t=E2=80=99s see what happens=C2=A0</div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 17, 2021 at 12:46 PM Ric=
hard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richa=
rd.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">On Wed, 2021-02-17 at 10:05 -0800, Khem Raj wrote:<br>
&gt; I am seeing musl builds are hung in qemu now, I suspect this change is=
<br>
&gt; causing it.<br>
<br>
Are you using master or a master-next? I did revert this patch in one of=C2=
=A0<br>
the -nexts just to test the bug reproduced ok. I did test the revised=C2=A0=
<br>
patch with the change and things seemed ok.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000af9b6b05bb8e5b4c--
