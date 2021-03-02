Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web10.6126.1614677131047931447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 01:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HSdZ6ZgH;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id t23so10267147vsk.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 01:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EIKIlKj8AUveutJ8rIFDcLpsYwQpDSkxVd1wSxAekjA=;
        b=HSdZ6ZgHxOFWZ7pUy9BVOh+GE7nmTaHpRtErfBMxLPLOkmSIf+EH9NjwRQhd3PJ7Yi
         Q0iW5kBvCCVXNj0+Tu1cAYR+yrnCUK/caIYFz6WJ9Qgiirb6RMD1mDtF2lFSYjxXCfOy
         ErElbfDCMePtBgYhhtNQD/RLDDnaMjprrJ1OowsQG23z7pKp/QzayscTqfaFXeyuEI5L
         d8Cn4h9OjBI2czbPC2y1yMYVV6pIJL7k1P42zLFtCAT7FSxMyPXu7HUpLkkrJexOHeJf
         Do+KpJ+h6r+idU3b3cMYFw1B95c27Y5yEl/bG6KJ+MBVrlTqjnyl88pCYKQC+JE2Nnao
         cj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EIKIlKj8AUveutJ8rIFDcLpsYwQpDSkxVd1wSxAekjA=;
        b=RwYu/5E8FKOC9UiDCEIFt9UGsVwSr7y+slRDXSPVJAyqg6qja14PsuO3r7kygcxCa/
         Y1L7jTwII1yHBHNXpreB2F60K3oueFTiPEHgEYRX/g5M1CnkNlMNCNQUzVGU5U1rCnBI
         k9kCrb3ECvgebH2q5l4a9uBOgHoHM5rDIpe2AdkMgqGESUS8tHa+vhqHftLtE/OCiZ09
         JGviOk2LAceLAw3oqrG9yOs/010uDle/Pdye/UBIBPEAyQ6aIXpykP4h/uKrOrZlk7Qp
         EiwTcYBtm68WPOKcnMsGTE30Id6M5NbpYB3jJVAbnQbbwVGqVEV3V6k6yW4piPz5XFwk
         mjUA==
X-Gm-Message-State: AOAM530Nrj+CnfcWNZ0QeD7qHngfra1JcDePQpCgAgWstO1viLr+rfGd
	Io2yUE7Ppe2bYltZxX/ttunu6urBJfu6SmSbJng=
X-Google-Smtp-Source: ABdhPJwt6ZHxMH4/XZwWV1TM0M8EEsmaFROBmq1IfrmmEGSUF0y7Xu1SDXbXLfZVORJkSImQcgSVovTlgLkxXAMuiiw=
X-Received: by 2002:a05:6102:74a:: with SMTP id v10mr4353133vsg.20.1614677130244;
 Tue, 02 Mar 2021 01:25:30 -0800 (PST)
MIME-Version: 1.0
References: <20210302062805.9917-1-yifan.yu@windriver.com>
In-Reply-To: <20210302062805.9917-1-yifan.yu@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 2 Mar 2021 10:25:19 +0100
Message-ID: <CANNYZj8anmqq4+5h4Fxb2p_fxC9GW2RU=-K10W4D78sXQVs+=w@mail.gmail.com>
Subject: Re: [oe-core] cairo: Using the snapshot version instead of the stable release
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c674d605bc8a5032"

--000000000000c674d605bc8a5032
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Mar 2021 at 07:29, Yi Fan Yu <yifan.yu@windriver.com> wrote:

>
> Thoughts on if its acceptable for Yocto to use a snapshot release for
> cairo?
>
> current version 1.16 was released on 2018-10-19
>
> Archlinux uses 1.17.4
> Linux From Scratch recommends 1.17.2
>

Fedora, Debian, Ubuntu, opensuse all use 1.16.0.

The 1.17.4 was released in end of November, so with a little patience 1.18
should show up soon enough.

If you need the new features, you can supply the new version from a
separate layer?

Alex

--000000000000c674d605bc8a5032
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 2 Mar 2021 at 07:29, Yi Fan Yu &lt;<a href=3D"mailto:yifan.y=
u@windriver.com">yifan.yu@windriver.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><br>
Thoughts on if its acceptable for Yocto to use a snapshot release for cairo=
?<br>
<br>
current version 1.16 was released on 2018-10-19<br>
<br>
Archlinux uses 1.17.4<br>
Linux From Scratch recommends 1.17.2<br></blockquote><div><br></div><div>Fe=
dora, Debian, Ubuntu, opensuse all use 1.16.0. <br></div><div><br></div><di=
v>The 1.17.4 was released in end of November, so with a little patience 1.1=
8 should show up soon enough.</div><div><br></div><div>If you need the new =
features, you can supply the new version from a separate layer?</div><div><=
br></div><div>Alex<br></div></div></div>

--000000000000c674d605bc8a5032--
