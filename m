Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web08.18990.1613320259337729647
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 08:30:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LF/7wi9Q;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id l192so2202997vsd.5
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 08:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LDv8ViDFjoICgheeKdpJDMoRtwO48g/ZfnaV1nPioL4=;
        b=LF/7wi9QhYSsJnDdzGGAyBjU8kNuMRdTM3NsESn2Fwfyg9E74H2gG9vFzC6vgXsMEV
         UDkHi1XPDQzFwMYcYkFH1F7jgbgCOnTAbNZbd8Dub8GBeRgywc5czQPx095u9R7hjm0o
         Z2u6aq6/UG4oy3IayM5ceuWsx0P0Dxa3YWodtv5KyMwk8Xk1zgyZcDyspDG51nX1kYY3
         j10Xc/NBPLfOZ9PbPOeZ6nN6A8wgye9q6evmiAMQksWswnfpfYYs5/RixJKCJ+CIcNj+
         y2QWKsy2V97+qd1PsRU//hyuDEzWTPEF2hY6zW7ODFC9I39nkYsH+7FodGyLftCMI+SQ
         +Z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LDv8ViDFjoICgheeKdpJDMoRtwO48g/ZfnaV1nPioL4=;
        b=ueOVMGV+Rjon5ZT91rOHx1p90rNIyVhkI7x3Fv9ntenXXVBhSXDMyjXtab0WZ5TEoq
         gHIGv621HS4E0VgUwXhpCprmqc2m62TaSCGQPTX6kXq2lScsG1xBEZs+1aEU9eMoXman
         /LkFem97EV14ZYo5fiKP4oT6Pn6nct7DO4EfT8RPnS8YgliDM/WsHR5NClL76t7ur7Rg
         bY9/8ko1gqNMcg6sBAypLJvL3X47CYuRemvLixlvFIx206nrpNZSsNr8htCLmoJVK0Ll
         bIGcGdix07V5zHhcIIWwAR3/O+q1/Mlo7Jd7UjpxfRCJQqmvtpCKBVEWylCWRsmZRMuh
         s+jQ==
X-Gm-Message-State: AOAM530L3f74NKbdXRvaU15PVKLOqHLw0Hfzt2Id+N+3deCJ/ritdsda
	hFA7eUm96ClZXD1J8N2sTeWX9GexAWvlJjRvJMs=
X-Google-Smtp-Source: ABdhPJzpeQD1tHVFNw7HKdNDK5R0FC+W0CeDqkiyya/c0+Gzi7w3jtuCPSiO68t4QjyqteL7IHzEkKWzQKgeaLbdzzA=
X-Received: by 2002:a67:2ecf:: with SMTP id u198mr1080725vsu.51.1613320258415;
 Sun, 14 Feb 2021 08:30:58 -0800 (PST)
MIME-Version: 1.0
References: <80c70797943e52fa430d2f9f65bffe7a90730dec.camel@linuxfoundation.org>
 <CANNYZj-cpgjuvUikfCrYCnBqTLdsNsY-5PUBji7PqJhkrbuHzg@mail.gmail.com> <679f3ccb6bea88cd72132ba9ea51547e81bcf0d8.camel@linuxfoundation.org>
In-Reply-To: <679f3ccb6bea88cd72132ba9ea51547e81bcf0d8.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 14 Feb 2021 17:30:47 +0100
Message-ID: <CANNYZj999yc0DeVk-XWjK2+T=0voX3A_7uvbxpaLWY3zoD4fnw@mail.gmail.com>
Subject: Re: Autobuilder reproducibility target changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	swat <swat@lists.yoctoproject.org>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Steve Sakoman <steve@sakoman.com>, Joshua Watt <jpewhacker@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e9717b05bb4e64ab"

--000000000000e9717b05bb4e64ab
Content-Type: text/plain; charset="UTF-8"

On Sun, 14 Feb 2021 at 16:17, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2021-02-14 at 16:04 +0100, Alexander Kanavin wrote:
> > Cheers :) If there's something else I could help, tell.
>
> I'm going to try and get diffs of the remaining big package differences
> and see where we stand. The two big ones I know of are go as a language
> for reproducibility and perf. Perf will just be a shear pain to fix,
> hopefully the kernel will take patches.
>

I did a bit of work on the go reproducibility, that has been preserved here:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/go-repro

I got there, but it took quite a bit of time (debugging go build process is
extremely painful) and I'm not at all happy with the hacky/brittle things
in the patch, so it's on hold for now - but anyone is welcome to take it
and make it better, especially if they're go specialists.

Alex

--000000000000e9717b05bb4e64ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 14 Feb 2021 at 16:17, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2021-02-14 at 16:04=
 +0100, Alexander Kanavin wrote:<br>
&gt; Cheers :) If there&#39;s something else I could help, tell.<br>
<br>
I&#39;m going to try and get diffs of the remaining big package differences=
<br>
and see where we stand. The two big ones I know of are go as a language<br>
for reproducibility and perf. Perf will just be a shear pain to fix,<br>
hopefully the kernel will take patches.<br></blockquote><div><br></div><div=
>I did a bit of work on the go reproducibility, that has been preserved her=
e:</div><div><a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/l=
og/?h=3Dakanavin/go-repro">http://git.yoctoproject.org/cgit.cgi/poky-contri=
b/log/?h=3Dakanavin/go-repro</a></div><div><br></div><div>I got there, but =
it took quite a bit of time (debugging go build process is extremely painfu=
l) and I&#39;m not at all happy with the hacky/brittle things in the patch,=
 so it&#39;s on hold for now - but anyone is welcome to take it and make it=
 better, especially if they&#39;re go specialists.</div><div><br></div><div=
>Alex<br></div></div></div>

--000000000000e9717b05bb4e64ab--
