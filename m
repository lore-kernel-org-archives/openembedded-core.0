Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web12.12034.1611668088943697329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 05:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MkM2tvWB;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id n18so8974794vsa.12
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 05:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eN8ZxS+IgHjX3Nhwqno6Mmq6kiST+Pv2qMwpArUzwZk=;
        b=MkM2tvWBybXKHJm2ZAm8aNb314X+JFznhlUTly1sqfyERlM0jgmSohfVNXS81fCJnV
         uNb2Uj6wWTWd1p2M/J3PNSAxDPKy1Z7SgjyrbGf229LlUX4Ql166JOrwWhPurXfplBk9
         W3uvTf7yTB3HZzvFGSmgcm85ndV+boq/k+SbxOTzWPHUHEo3JrZ6McWzWrHTRkuugS9L
         NGoSbuZDazd+8/XIUCw7Xqv6IVQs3aOsWqMKdtdHfDLV81mtf1TLcnHDF/bEjAM3MxZc
         wAvUVB8fmrlZ1oeJGjTCmSXeUKJLEqU2oW0wBQI48mQuGduBaNo8AFBj0G/SJA3H3yMt
         /nBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eN8ZxS+IgHjX3Nhwqno6Mmq6kiST+Pv2qMwpArUzwZk=;
        b=rdf4JzRr4vwyFZ7yhwsHHuSEbN8cG5eskKC5xRYuR58ARkknouODxULITjOaTYPeWI
         hmosNr7tQPh19uFsRLUs56LqvK8UtnwSJ/zlbC6B9ILvICwXmWd1TVpoMrrUNvnzdflZ
         w+Q/H8PQLRs4ILltbRrwHtcSwAFWvt94NsGKDU47HToFwizLVA2N1hRi4Lk8gwjtmkx8
         8ptFHTuYoRk3VmI32KAeSvqS/ugYOLg+AzqlWdRkymuy078Mmxa6TREDUDJLN2KgvbhV
         e18BBivrDosgkXHMPdAlWEi+0t5ZbYLnOLvP+lmsNlaRqrHPRaX4NlRbB5vipJg75ZoU
         MXsA==
X-Gm-Message-State: AOAM533K0SfFhbG7DOYSMr+UDZ6JE0Q+yTnS8vxu91j/5R+K6KQq3TO2
	uM6E9jTedH+Vp+2pTY6cxM96hFU0mdr8ZZ2unak=
X-Google-Smtp-Source: ABdhPJwJ14lWpGKs/pfH4L/Ivr2zDmaDt3Jy7jgTZHAzJYRvicWzpYEeE4RGiyUtjFYOz1MMt3uolEd071V3B3nu7P0=
X-Received: by 2002:a67:7750:: with SMTP id s77mr4200949vsc.31.1611668088146;
 Tue, 26 Jan 2021 05:34:48 -0800 (PST)
MIME-Version: 1.0
References: <CAHtQpK71uAoq_hwDGJCvt5O_=kNXHkWFkmHC-BQkzcSCM3ys7A@mail.gmail.com>
 <CANNYZj9eoz-9xvEpCSD6mgMwETMn_R8xPEtYc1jVK0FSF3qpSQ@mail.gmail.com> <CAHtQpK7ZtJ9edRJeCyjvdH3eQXur4pqaSd1btpS1S-MC5KvNyQ@mail.gmail.com>
In-Reply-To: <CAHtQpK7ZtJ9edRJeCyjvdH3eQXur4pqaSd1btpS1S-MC5KvNyQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 26 Jan 2021 14:34:36 +0100
Message-ID: <CANNYZj-DHZ6TwgJmtF6JwP==efpGL-BjGawyqs1tBn_qSgYDBQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell]: gpsd recipe (3.19) build is broken
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e3cef505b9cdb779"

--000000000000e3cef505b9cdb779
Content-Type: text/plain; charset="UTF-8"

Version upgrades which bring new features and changes are a tough sell for
LTS branches.

Alex

On Tue, 26 Jan 2021 at 14:10, Andrey Zhizhikin <andrey.z@gmail.com> wrote:

> Hello Alex,
>
> On Tue, Jan 26, 2021 at 1:48 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Can you rather identify a single commit that can be backported to fix
> the specific issue you see?
>
> This I did tried at the beginning (was considering to get a
> low-hanging fruit), but it appears that it is not quite trivial -
> there is a significant amount of commits in between 2 versions...
>
> If that would be a preferred option over version upgrade - I can try
> to bisect it further, just need more time to identify it.
>
> >
> > Alex
> >
> > On Tue, 26 Jan 2021 at 13:13, Andrey Zhizhikin <andrey.z@gmail.com>
> wrote:
> >>
> >> Hello Steve,
> >>
> >> gpsd recipe build breaks on the dunfell branch with following error
> messages:
> >>
> >> |
> /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
> >> ./libgpsd.a(ppsthread.o): undefined reference to symbol
> >> 'pthread_create@@GLIBC_2.17'
> >> |
> /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
> >>
> /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot/lib/libpthread.so.0:
> >> error adding symbols: DSO missing from command line
> >>
> >> This cannot be reproduced on the current master branch, where the
> >> version of gpsd recipe has been bumped up from 3.19 to 3.20.
> >>
> >> Can you please consider to cherry-pick following commits from master
> >> in order to upgrade the gspd version on dunfell branch:
> >>
> >> 98e61961c gpsd: add new init script
> >> 04afc692a gpsd: mark CLEANBROKEN
> >> 33a15c790 gpsd: fix build on aarch64
> >> cecab9c4c gpsd: Upgrade 3.19 -> 3.20
> >>
> >> I've tried to cherry-pick them locally and they do apply clean. Also
> >> the build of gpsd is successful after this upgrade.
> >>
> >> --
> >> Regards,
> >> Andrey.
> >>
> >> 
> >>
>
>
> --
> Regards,
> Andrey.
>

--000000000000e3cef505b9cdb779
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Version upgrades which bring new features and changes=
 are a tough sell for LTS branches. <br></div><div><br></div><div>Alex<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, 26 Jan 2021 at 14:10, Andrey Zhizhikin &lt;<a href=3D"mailto:a=
ndrey.z@gmail.com">andrey.z@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hello Alex,<br>
<br>
On Tue, Jan 26, 2021 at 1:48 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Can you rather identify a single commit that can be backported to fix=
 the specific issue you see?<br>
<br>
This I did tried at the beginning (was considering to get a<br>
low-hanging fruit), but it appears that it is not quite trivial -<br>
there is a significant amount of commits in between 2 versions...<br>
<br>
If that would be a preferred option over version upgrade - I can try<br>
to bisect it further, just need more time to identify it.<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Tue, 26 Jan 2021 at 13:13, Andrey Zhizhikin &lt;<a href=3D"mailto:=
andrey.z@gmail.com" target=3D"_blank">andrey.z@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hello Steve,<br>
&gt;&gt;<br>
&gt;&gt; gpsd recipe build breaks on the dunfell branch with following err=
or messages:<br>
&gt;&gt;<br>
&gt;&gt; | /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3=
.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch6=
4-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:<br>
&gt;&gt; ./libgpsd.a(ppsthread.o): undefined reference to symbol<br>
&gt;&gt; &#39;pthread_create@@GLIBC_2.17&#39;<br>
&gt;&gt; | /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3=
.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch6=
4-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:<br>
&gt;&gt; /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.1=
9-r0/recipe-sysroot/lib/libpthread.so.0:<br>
&gt;&gt; error adding symbols: DSO missing from command line<br>
&gt;&gt;<br>
&gt;&gt; This cannot be reproduced on the current master branch, where the=
<br>
&gt;&gt; version of gpsd recipe has been bumped up from 3.19 to 3.20.<br>
&gt;&gt;<br>
&gt;&gt; Can you please consider to cherry-pick following commits from mas=
ter<br>
&gt;&gt; in order to upgrade the gspd version on dunfell branch:<br>
&gt;&gt;<br>
&gt;&gt; 98e61961c gpsd: add new init script<br>
&gt;&gt; 04afc692a gpsd: mark CLEANBROKEN<br>
&gt;&gt; 33a15c790 gpsd: fix build on aarch64<br>
&gt;&gt; cecab9c4c gpsd: Upgrade 3.19 -&gt; 3.20<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ve tried to cherry-pick them locally and they do apply clea=
n. Also<br>
&gt;&gt; the build of gpsd is successful after this upgrade.<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Regards,<br>
&gt;&gt; Andrey.<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
<br>
-- <br>
Regards,<br>
Andrey.<br>
</blockquote></div>

--000000000000e3cef505b9cdb779--
