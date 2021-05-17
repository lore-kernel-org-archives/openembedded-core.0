Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web12.19841.1621261958512338241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vKKDAdAy;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id j13so3220030vsf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IjruOFL3AQZ4LN57VhTT8NFYI0XKJTvSIhX8QcEVZMM=;
        b=vKKDAdAyCC1Hll7IyjV8ttG6UxIqxyy7ZXXZFxKFco+1i30X/5G6gUAuEi2bfVB/t7
         j2UMCQmgJQuncd4hwMZJ9CbESwF68mqoJGMFcsi2fzAxc0p77oXxmVKaDX0405l5a/c8
         9vJV8L4WfLytnJE38lZyD0reM/FwehTXc1hXjkoZhU8sDl7q/l7G1uzcvaIyz85gZoEH
         d46uG4fPCWa8kVvlx2M71lUbP6fidIXKEE3Gov9fJ7hLUOIr66m9MLOoM84b7Ud1PT9W
         l5pFwAv1OifR7iHHqiu+bS1crtDjBY9N5+BR1JeJSWn1VlqfpzsVPtm62ivdDWmcJ5lh
         TmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IjruOFL3AQZ4LN57VhTT8NFYI0XKJTvSIhX8QcEVZMM=;
        b=tkuJXF2vZYOtCRc/TGoInVI2lswdAJNc6MrnXvGgGSnylQ8RdkavdCy7Vp9hffLpPt
         yciFVji7h2QQTJhnnSd00NhHGRFK+TPKx5ak6+Ahw6S+PXA+MqqaNw9YIyFKbfP+mb4b
         khCCCeoLUlLIhNAZgmD8XM7Ao/9H75rZ1mKw6JFYCJMC86DNcIPyVpZJXa97ItZR3UbM
         nYh3f35QHKo6QXNtK+gS8BCk8+Dg8yxuXnOT+TlF7lGBSjqHxlevD/VjVUYh+rIi3lj8
         kPnSYHQqEHddL5KYRr5FGMeXAvf4UR+TF2wQqtKaETf/glxnzfpRXg6dCxjByBDXWkCq
         dyBg==
X-Gm-Message-State: AOAM533w715l1D2VCYOfDYoA1yFGqYf+Fg2K/gTF7lJx9/k9WzeGGl6z
	w1oHjKPbPKYEpt/NWA2hMgMxr03hJM7dV/mBg4s=
X-Google-Smtp-Source: ABdhPJwizPXFOW29BrwWfh0rPQZK6vsXj3JbMTG/z5wCzcHHAU1WeNVRM4GVji2QTXKoXX5Uu0B4aqsxD8l2oZnmBzM=
X-Received: by 2002:a67:1447:: with SMTP id 68mr452646vsu.20.1621261957699;
 Mon, 17 May 2021 07:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <20210517103528.24434-6-vinay.m.engg@gmail.com>
 <CANNYZj8jNE92Ct9541GmLzmmNwgrJ2UOEC4=jQstwyi12PBMpw@mail.gmail.com>
 <CANUMPcWJiKAKbw=UHkPd=T3TzTt4fmNwTya6hMZRbewUXdL2wQ@mail.gmail.com>
 <CANNYZj9C0DRCtsMjfr7DDTBqzSJpHSY+FGYx7-Sn2i5kdqNCUw@mail.gmail.com> <CANUMPcVaW7vKKwW5cfvu2ETgcrWb70qdAFpCuiD8J8KNoAjjNQ@mail.gmail.com>
In-Reply-To: <CANUMPcVaW7vKKwW5cfvu2ETgcrWb70qdAFpCuiD8J8KNoAjjNQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 17 May 2021 16:32:26 +0200
Message-ID: <CANNYZj9OeUc73=xf+F5qub-T4Fr6msvWTpshN=XubL-mL2j5UQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="000000000000139d9b05c287772f"

--000000000000139d9b05c287772f
Content-Type: text/plain; charset="UTF-8"

Thanks, can you please look into the error? The line where it happens and
the way to get a backtrace is right there :)
There's no reason it shouldn't work.

Alex

On Mon, 17 May 2021 at 15:21, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> Hi Alex,
>
> Error on qemu  image (ex. Aarch64) booted with tap interface.
> ===========================
> root@qemuarm64:~# ./remote-test-server
> starting test server
> thread 'main' panicked at 'TcpListener::bind(bind_addr) failed with
> Cannot assign requested address (os error 99)',
> src/tools/remote-test-server/src/main.rs:90:20
> note: run with `RUST_BACKTRACE=1` environment variable to display a
> backtrace
> ===========================
>
> On Mon, May 17, 2021 at 5:16 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Mon, 17 May 2021 at 13:34, Vinay Kumar <vinay.m.engg@gmail.com>
> wrote:
> >>
> >> "remote-test-server" on qemu-image with a tap interface throws an error.
> >> The emulators for rust testing are with tcp port forwarding so used
> >> slirp method with added rust port.
> >
> >
> > I'm not sure I understand - what kind of error? In both cases the server
> starts listening on a port, so in slirp scenario the address is
> 127.0.0.1:12345 (prone to breakage if something else on the build host
> took that port btw, including another instance of the same test), in tap it
> would be 192.168.7.2:12345. For the client you simply supply that via
> TEST_DEVICE_ADDR. No?
> >
> > Alex
>

--000000000000139d9b05c287772f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, can you please look into the error? The line =
where it happens and the way to get a backtrace is right there :)<br></div>=
<div>There&#39;s no reason it shouldn&#39;t work.</div><div><br></div><div>=
Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 17 May 2021 at 15:21, Vinay Kumar &lt;<a href=3D"ma=
ilto:vinay.m.engg@gmail.com">vinay.m.engg@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Alex,<br>
<br>
Error on qemu=C2=A0 image (ex. Aarch64) booted with tap interface.<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
root@qemuarm64:~# ./remote-test-server<br>
starting test server<br>
thread &#39;main&#39; panicked at &#39;TcpListener::bind(bind_addr) failed =
with<br>
Cannot assign requested address (os error 99)&#39;,<br>
src/tools/remote-test-server/src/main.rs:90:20<br>
note: run with `RUST_BACKTRACE=3D1` environment variable to display a backt=
race<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
<br>
On Mon, May 17, 2021 at 5:16 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, 17 May 2021 at 13:34, Vinay Kumar &lt;<a href=3D"mailto:vinay.=
m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt;<br>
&gt;&gt; &quot;remote-test-server&quot; on qemu-image with a tap interface =
throws an error.<br>
&gt;&gt; The emulators for rust testing are with tcp port forwarding so use=
d<br>
&gt;&gt; slirp method with added rust port.<br>
&gt;<br>
&gt;<br>
&gt; I&#39;m not sure I understand - what kind of error? In both cases the =
server starts listening on a port, so in slirp scenario the address is <a h=
ref=3D"http://127.0.0.1:12345" rel=3D"noreferrer" target=3D"_blank">127.0.0=
.1:12345</a> (prone to breakage if something else on the build host took th=
at port btw, including another instance of the same test), in tap it would =
be <a href=3D"http://192.168.7.2:12345" rel=3D"noreferrer" target=3D"_blank=
">192.168.7.2:12345</a>. For the client you simply supply that via TEST_DEV=
ICE_ADDR. No?<br>
&gt;<br>
&gt; Alex<br>
</blockquote></div>

--000000000000139d9b05c287772f--
