Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B201E7737A
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 16:34:03 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.44215.1696091635770447723
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 09:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lM9Y1cTa;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7a25040faffso178349239f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 09:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696091635; x=1696696435; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=neMeJz70tNte6SIMkM/PMUvdj4UxpLM+enYtb9YDbzs=;
        b=lM9Y1cTav88rDfAwwUpq5dscCBodf60JkZf6fPo+Bqd81XyOElTFy0G+qCZPcZZZ4B
         buydSFs2IXiwKyG1xCzvWFa8CbRXq0hKScQrAU7rzMga8f7jtWW+4EKJoYyLY/kQGO5G
         EuFDrzcLA7l5mJ4JIk+F20n9/MaSbjWi0GN7sfJ9jSG2rpxFP0vDjZtWnokdzL2Fnjk1
         tzqKQKLU6mlG101SmgfH9bS7JwuKQ7DgodOUo6lktvGLcxeLGp+tttP4yZ5DhvNASNxe
         L9sfx8oW8ttmgGu71Xakb9qZJyt58JMx3S2Voi0YHLKJVDcfRrs7Zxdzk8lCEReUWuY2
         Udpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696091635; x=1696696435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neMeJz70tNte6SIMkM/PMUvdj4UxpLM+enYtb9YDbzs=;
        b=Sb53oLxDZW+b9UCBMFlCR1lUT9jMmPv9VAOXnzs+ac6fxERAxQnU6PzVAOkIhUV2JM
         C49eN74ZFgIo5FBaaW385olQU7GTLy4gQDQbqWzBNvCudj0Hywr1c9ycSMD5sM7ZZGfH
         lAeim98h9+eFiHrZNIOO45mSwrBIqtGCi8cSdwlFPuUU4tQrwUUbtkysv/BxmIuVScvR
         YEHoQ8N/a1KCmZGa6b6Vk760sbLvXOo6/8kKMID3/TralwW1kaeUSaw05qWDo4MYk0/H
         Vr/C+PYNYy9nHjEs5xen8bOBJdzTyhZxRi/pTKB+KtjT7Kc1DLPYpAKiyQqYYBHRjlux
         9JKQ==
X-Gm-Message-State: AOJu0Yz6OdNLHXM+q5H6tAfSbT9jnvoSbB0E69BfM8UWIQquhcdyZQb2
	pnKLm6xr5z9irCnKtI1F6t5jWpdo9K+dCx43XtA=
X-Google-Smtp-Source: AGHT+IEr+uuV9LaM5wAHshQ5FOtKto2Tczn6FnaLA+hFvEph2tO7g7Ph6l65b2SL5NvpORB+5la0ZKi392V2jCujSyI=
X-Received: by 2002:a5e:de46:0:b0:783:4e11:76d7 with SMTP id
 e6-20020a5ede46000000b007834e1176d7mr7105551ioq.21.1696091634789; Sat, 30 Sep
 2023 09:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696017123.git.bruce.ashfield@gmail.com> <fa84ffaabc1616f617555fbf7cc2d46fb2358e51.camel@linuxfoundation.org>
In-Reply-To: <fa84ffaabc1616f617555fbf7cc2d46fb2358e51.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 30 Sep 2023 12:33:44 -0400
Message-ID: <CADkTA4PiKOf4=y4buxMQmzZJ3BJHQtUhFSSh8VjuV2_-ETwDsQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] kernel: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000065f1780606961b12"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 16:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188461

--00000000000065f1780606961b12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 7:07=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Hi Bruce,
>
> On Fri, 2023-09-29 at 16:04 -0400, bruce.ashfield@gmail.com wrote:
> > Given where we are in the release cycle, this clearly is NOT a typical
> > consolidated pull request.
> >
> > I've done what normally takes about three weeks in about 4 days.
>
> Thanks, I know this isn't where any of us wanted to be.
>
> >
> > With 6.4 going EOL before expected upstream, it really isn't a suitable
> > reference kernel for the release.
> >
> > So we've decided to take on the task of getting 6.5 ready and available=
,
> > and at the same time moving the -dev kernel to v6.6. The -dev kernel
> > testing for 6.5 was critical for this, since I already knew the core
> > was sane.
> >
> > Also we've never shipped purposely mismatched libc-headers in the
> release,
> > so I also took the leap to update the libc-headers to match.
>
> Agreed on both counts, I think we need to make 6.5 work.
>
> > I've already sent fixes to meta-oe, and there's a btrfs update in this
> > series to fix breakage that I found in the tightly coupled packages.
>
> I think btrfs-tools was already upgraded in master?
>

Ah bugger. That would have saved me some time :)



>
> > I've built and booted core-image-kernel-dev, core-image-minimal,
> core-image-sato
> > for both glibc and musl for all the supported architectures.
> > There will be some things that break regardless, but this needs the
> > better coverage of the AB.
> >
> > If this causes too much problems, our choices are to ship 6.4 EOLd, or
> > fall all the way back to 6.1.
> >
> > I'll remove 6.4 from master once we've figured out the fallout from
> > this kernel, and which direction we are going.
>
> I had some difficulties with this series since it doesn't apply against
> master. The issue was that someone else had updated the kernel CVEs and
> those changes weren't in your tree (nor was the btrfs upgrade). This
> meant all the cve inc changes threw errors. We will likely need to
> assume someone will update the CVE includes semi regularly just so we
> can keep the noise on the CVE reports down.
>

That's odd. I always do a pull --rebase before sending my changes, but yet
none of them showed up  (on any of my builders, so I had 3x machines
running that queue of patches and none of them had the changes from
master).

For the kernel CVEs. They either need to be part of my kernel releases
or not. I've updated my scripts, and they'll always be updated as part
of the process. Having something / someone else update that file is
just a huge pain, and we shouldn't do that.

Bruce



> Since we're short on time, I regenerated the series re-running the CVE
> script and rebuilding that piece of each commit. I suspect now we
> understand what happened we'll be able to better handle it in future.
>
> The first autobuilder test run crashed and burned due to unrelated
> patches. I've a new build running:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5969
>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000065f1780606961b12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Sep 30, 2023 at 7:07=E2=80=AFAM Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi Bruce,<br>
<br>
On Fri, 2023-09-29 at 16:04 -0400, <a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a> wrote:<br>
&gt; Given where we are in the release cycle, this clearly is NOT a typical=
<br>
&gt; consolidated pull request.<br>
&gt; <br>
&gt; I&#39;ve done what normally takes about three weeks in about 4 days.<b=
r>
<br>
Thanks, I know this isn&#39;t where any of us wanted to be.<br>
<br>
&gt; <br>
&gt; With 6.4 going EOL before expected upstream, it really isn&#39;t a sui=
table<br>
&gt; reference kernel for the release.<br>
&gt; <br>
&gt; So we&#39;ve decided to take on the task of getting 6.5 ready and avai=
lable,<br>
&gt; and at the same time moving the -dev kernel to v6.6. The -dev kernel<b=
r>
&gt; testing for 6.5 was critical for this, since I already knew the core<b=
r>
&gt; was sane.<br>
&gt; <br>
&gt; Also we&#39;ve never shipped purposely mismatched libc-headers in the =
release,<br>
&gt; so I also took the leap to update the libc-headers to match.<br>
<br>
Agreed on both counts, I think we need to make 6.5 work.<br>
<br>
&gt; I&#39;ve already sent fixes to meta-oe, and there&#39;s a btrfs update=
 in this<br>
&gt; series to fix breakage that I found in the tightly coupled packages.<b=
r>
<br>
I think btrfs-tools was already upgraded in master?<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">Ah bugg=
er. That would have saved me some time :)</div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I&#39;ve built and booted core-image-kernel-dev, core-image-minimal, c=
ore-image-sato<br>
&gt; for both glibc and musl for all the supported architectures.<br>
&gt; There will be some things that break regardless, but this needs the<br=
>
&gt; better coverage of the AB.<br>
&gt; <br>
&gt; If this causes too much problems, our choices are to ship 6.4 EOLd, or=
<br>
&gt; fall all the way back to 6.1.<br>
&gt; <br>
&gt; I&#39;ll remove 6.4 from master once we&#39;ve figured out the fallout=
 from<br>
&gt; this kernel, and which direction we are going.<br>
<br>
I had some difficulties with this series since it doesn&#39;t apply against=
<br>
master. The issue was that someone else had updated the kernel CVEs and<br>
those changes weren&#39;t in your tree (nor was the btrfs upgrade). This<br=
>
meant all the cve inc changes threw errors. We will likely need to<br>
assume someone will update the CVE includes semi regularly just so we<br>
can keep the noise on the CVE reports down.<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">That&#39;s odd.=
 I always do a pull --rebase before sending my changes, but yet</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">none of them showed up=C2=
=A0 (on any of my builders, so I had 3x machines</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">running that queue of patches and none of=
 them had the changes from</div><div class=3D"gmail_default" style=3D"font-=
size:small">master).</div></div><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">For the kernel CVEs. They either need to be=
 part of my kernel releases</div><div class=3D"gmail_default" style=3D"font=
-size:small">or not. I&#39;ve updated my scripts, and they&#39;ll always be=
 updated as part</div><div class=3D"gmail_default" style=3D"font-size:small=
">of the process. Having something / someone else update that file is</div>=
<div class=3D"gmail_default" style=3D"font-size:small">just a huge pain, an=
d we shouldn&#39;t do that.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Since we&#39;re short on time, I regenerated the series re-running the CVE<=
br>
script and rebuilding that piece of each commit. I suspect now we<br>
understand what happened we&#39;ll be able to better handle it in future.<b=
r>
<br>
The first autobuilder test run crashed and burned due to unrelated<br>
patches. I&#39;ve a new build running:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/5969" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/5969</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--00000000000065f1780606961b12--

