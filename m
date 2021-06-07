Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web09.1340.1623089096981060745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 11:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ph8EVKgm;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id x8so9428992vso.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jun 2021 11:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ckTJi0ZPZbLpTXyg8GS6I523gwjmSlZw6Qd/mGc03o8=;
        b=Ph8EVKgmwP9ELVIx/GrOFVQMJ1/d08LA+J2DgGr9O8MF+iSNP1hRE6z5EoimqEHsX/
         4ATHLHXREglRge/mx0qtbo7PTRWw/hiMFqL9xXzoiNHnsJNtkUDpl+Sxuyo4x0T8FgUz
         zc0H0uIlV8ziZ12tQXHpgEKenfEZ0SumPKHhaWm12NRUSpG8RFiC0xSc9h47lTJ1mgwz
         DGUtZY1eOPzUoqIhrjnLu+i/5C+YGl+LKao695JIIsEq5tnbKaSaviny8+jSJRb3/jVc
         NqyyaN9ezjer+UvYDQToVcSyhVBW+2AymtHBU6AICEAl+HG4FBR6hEipJiosiK6LLKQk
         fozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ckTJi0ZPZbLpTXyg8GS6I523gwjmSlZw6Qd/mGc03o8=;
        b=emCEzjmZhVwJMP72F6kQXlXsz/rPYLAzOol9MDySQzDH43Tz7fJvPm1QPBYXFffNQK
         /YCR6Z0dQ89LvQCDNgGXhfIpxArZboVh5Vuch10ZFCKK4rTGQteswKVndNTNK4hZ9ie9
         BWVb8SxDSE7p2iHpPa7/ILc7MafTrp2JZcWSIUcmeKUGBZvzHGm+qNkIqEtsxJTofBny
         D7kItYzTx4EwOO3RMgCHiCulZA6BZXkVQicCht8ItY1Ug7pIcT3+SGCvTkHMzy08Ljm9
         jcJ+5yAd+HqkntqXLCeWrG6MVw18p67Srk9FVHepR0zdol+zw/rBx+X7PeZIZskLbc/s
         cSYA==
X-Gm-Message-State: AOAM532ZleffZGYJnwGUsYNZDgngkASiZKoY8kkV7FL/Juvs2ZZWeDAi
	qw/s3iOK1KXdsmokwwN6TDGv8My7uTIQeuUGppQ=
X-Google-Smtp-Source: ABdhPJwqqak8KUhUtXoukPTvaxMxFsXXEhLKFCWsebZG+YfIfggqPpkEk0pfSk1N/cZl11+JcN/5BlRDzRg021gBtbg=
X-Received: by 2002:a67:1502:: with SMTP id 2mr9946529vsv.54.1623089096064;
 Mon, 07 Jun 2021 11:04:56 -0700 (PDT)
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
 <CADfgfob3EjTPSuxOXQ1EbR6j108OqcKi_oNibGE9xQ-=_AHxGQ@mail.gmail.com> <CAMKF1spK+WC_J-pb-iYsnvHzVj4-sr8YKaz63yjCU98F+VurTw@mail.gmail.com>
In-Reply-To: <CAMKF1spK+WC_J-pb-iYsnvHzVj4-sr8YKaz63yjCU98F+VurTw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 7 Jun 2021 20:04:44 +0200
Message-ID: <CANNYZj-1D7M6ggXiaGZX7PnkmENqK_8wgHpR06W9AWp==kwbUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Khem Raj <raj.khem@gmail.com>
Cc: Michael Halstead <mhalstead@linuxfoundation.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000002813405c430e1bf"

--00000000000002813405c430e1bf
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Jun 2021 at 19:18, Khem Raj <raj.khem@gmail.com> wrote:

> > I added the needed packages to the CentOS workers. The compiled binary
> prints "rc=0" on the three CentOS workers.
>
> can we now try linking and running it against SDK built nativesdk-glibc ?
>

Using the host libc won't show the issue, as it is old (2.28), isn't using
utimensat_time64 and goes straight to utimensat.

With nativesdk-glibc, it still succeeds:
utimensat_time64(3, NULL, [{tv_sec=1, tv_nsec=2} /*
1970-01-01T00:00:01.000000002+0000 */, {tv_sec=3, tv_nsec=4} /*
1970-01-01T00:00:03.000000004+0000 */], 0) = 0

So we'd need to look into why the kernel accepts this, but rejects the call
from cmake. Any easy way to trace this? Just to repeat the failing one:

utimensat_time64(AT_FDCWD,
"../install/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake",
[{tv_sec=1622966723, tv_nsec=6319439026193432576}, {tv_sec=1622966579,
tv_nsec=17840053692309438464}], 0) = -1 EINVAL (Invalid argument)

Alex

--00000000000002813405c430e1bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 7 Jun 2021 at 19:18, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">&gt; I added the needed packages to the CentO=
S workers. The compiled binary prints &quot;rc=3D0&quot; on the three CentO=
S workers.<br>
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

--00000000000002813405c430e1bf--
