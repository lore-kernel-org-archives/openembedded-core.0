Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web12.37642.1614011972507213204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:39:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b0gR67g3;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id t15so4523760ual.6
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 08:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hq86CejxOiFpwoYx1Gv4RKAnSgMnp+cQa9UfjZFv2Uc=;
        b=b0gR67g3FBUZSOOEc9Wds0K6MhW8IpnI4Kf6bcOmqwcjG1VU1cnVXp51iiIdFTmZb3
         SNxJyofegfUwYyyEdt0h9CysABoA27hxFPx3UK15SLuM0IYyO8rxXY24zm6UMzdb9K1L
         051X2kSyIDEU5AXkHE2uIVHXXjO9/AWKs9CqSM2RqwIZ3bLztNKA5ZXKF2vUop9ixSTo
         adrll3PAtsRug0mUdsvtDyHTQ8UnFqROKDpZ+NfDoL3VpyQveanbGSXW5F0sdGmOsmcr
         gWbpOEPAsqeVaTmD7J4OFWZsmpkzpx1Qr1dN3V6KyTvwPEGQZP+1UcH6Ii1BMe/MrTs7
         Du5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hq86CejxOiFpwoYx1Gv4RKAnSgMnp+cQa9UfjZFv2Uc=;
        b=B6b2IcztJrFEGCYr8SDvTzEE5yEnATSCeoIBC7oV1uOTu6Be19mlHk5ijRjC7sg2Jt
         QR0Lq0fmtLDgCg4BeOQqPoxPjn50PF+yZrgc3KXadJIYLtOK7hDBCcQVfzwoRHI0NieR
         /NoVTLfnSeOq4bDc2BHEa2yTZH+m1H1qowWsJCNKCab1DvRz2nPJdJmrWOvyjkdM0OAw
         2x7ebPM3gsV6AYh9ScP6eHx7MdazT+Dml+56LTVqJXE7t4pXPyG3otZnIUse2LdWRAqn
         FfWjuXODyBtGRhsbAg458UAFVFKvBYZz65Iu3NMVSPeqIexwB9H/rS2KETL3NnAa+zgs
         Cu4Q==
X-Gm-Message-State: AOAM532PnhyKGN9VnjzEYOkPBPl1PQ3aiXSFFf2fBCy3aorgweqzLszQ
	qnl/mgGSeEBxW7CprnpeDxcQ57f3GFWxaNYwhCk=
X-Google-Smtp-Source: ABdhPJxnbgQm9hKzq8DqhATOCACKJcdkXEf8pB/TyJlo1ClJ5YOvb7eh8cW+W+GFbCtCThqKtricz3wj3aui9f0HknA=
X-Received: by 2002:a9f:2c0f:: with SMTP id r15mr14887035uaj.93.1614011971653;
 Mon, 22 Feb 2021 08:39:31 -0800 (PST)
MIME-Version: 1.0
References: <20210222154956.27267-1-andrej.valek@siemens.com> <4462ffe940c0fa879486300e5d7d358045604133.camel@linuxfoundation.org>
In-Reply-To: <4462ffe940c0fa879486300e5d7d358045604133.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 22 Feb 2021 17:39:20 +0100
Message-ID: <CANNYZj_1RL9rSJxaaRTQf__mnzEr49Eze5gW44TBtJn7FEhN0Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] busybox: search stable versions for AUH
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andrej Valek <andrej.valek@siemens.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Content-Type: multipart/alternative; boundary="0000000000003bd5bf05bbef7269"

--0000000000003bd5bf05bbef7269
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Feb 2021 at 17:02, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > +UPSTREAM_CHECK_URI = "https://busybox.net/"
> > +UPSTREAM_CHECK_REGEX = "BusyBox\ (?P<pver>\d+\.\d+\.\d+)\ \(stable\)"
> I just realised/wondered whether:
>
> inherit upstream-version-is-even
>
> would work here?
>

I don't think so - busybox seems to declare x.y.0 as unstable, and
everything else as stable.

Alex

--0000000000003bd5bf05bbef7269
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 22 Feb 2021 at 17:02, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; +=
UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://busybox.net/" rel=3D"norefe=
rrer" target=3D"_blank">https://busybox.net/</a>&quot;<br>
&gt; +UPSTREAM_CHECK_REGEX =3D &quot;BusyBox\ (?P&lt;pver&gt;\d+\.\d+\.\d+)=
\ \(stable\)&quot;<br>I just realised/wondered whether:<br>
<br>
inherit upstream-version-is-even<br>
<br>
would work here?<br></blockquote><div><br></div><div>I don&#39;t think so -=
 busybox seems to declare x.y.0 as unstable, and everything else as stable.=
</div><div><br></div><div>Alex<br></div></div></div>

--0000000000003bd5bf05bbef7269--
