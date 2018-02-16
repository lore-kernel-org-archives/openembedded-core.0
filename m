Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 966D171B50
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 19:11:48 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id h74so4948921wme.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 11:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZjNPA0CkpTV4UR9RzzRpo3Hm+Itys0BIk5hteXSXuI4=;
	b=eJT6nY6OqVDn4uEVZ1gKC5Cpvgku38msSU2rrqMbRiHGsi166exNkCUPAWPHxiV1D2
	00pDm/KEIo8WMdeYdKyyl8TIawgFIzauqRND0bUaGiy9YF76QR6rtKz2bJ+Sw1nGrNfb
	Ra1HWcz+4kgUdQWbrM29thNto7VLpV5zIbtRySQ2Zg7Jc0psq1UJ585t7iWJLRXvOmvg
	Lqbqqyi7kTsFyEiTCb+3xpmtomzc7x6MQ4DLXyIaqUEu9aaAGzlicZNGle+lB7Ia83KR
	5yByl93HQcUeEDfFtFV+n2BorY2x1BuAdPsCwJdvnS945yBTHD7f6YdfvMsgBSgoIz3E
	/G/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZjNPA0CkpTV4UR9RzzRpo3Hm+Itys0BIk5hteXSXuI4=;
	b=uBSKBRg2rve+AwaRwJqI+2ZEjLfL7fP06IEJbazvi5n0MD28aQ4Oz8iuzLA5r37q51
	Tn9wTgZTl5Y5PhUHCllIN3nZGJUlEyYVgTg5mQQ4UilHJtu/J2lr8WYyRxpS2PxZSQWZ
	6HkDR1JTb9rHdPRAaK8cYZe0SJ57QqEOoXuN02adYjZKx+NSNnpSCktIkX3GxHgrp0jF
	lux6uyFDGIkxA3N4NL6+La3MiOScvOuh7nKkH8vLYZ+0CI38yTHssBMtzYE3D+3e5MpW
	N3ur2ChUoCYDmAdAhVip6Kwu8e4rHfAv1Q9zadNU95K5FF7gTSo6c1NmuGtDb/TMxpR9
	8aWA==
X-Gm-Message-State: APf1xPDT3uSM0FC4EzERr1Ixq4l6Z1FEyJF5I8jzsIwX61t7YXgU3mc7
	7PYFPhxdq9Xk5rT6bdds4UHLuufVEx8DBrTSH0A=
X-Google-Smtp-Source: AH8x226zaW/CMY9gGy9qlI369mosPyN4LvTmkINDk9ZjHB5a9LwnERvFkjYe1U7Nt2y7hKLZDToclXOTOWUX1jkQbuE=
X-Received: by 10.28.207.201 with SMTP id f192mr4390380wmg.81.1518808309285;
	Fri, 16 Feb 2018 11:11:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Fri, 16 Feb 2018 11:11:48 -0800 (PST)
In-Reply-To: <20180216115147.2869fdf2@seebsdell>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
	<20180216115147.2869fdf2@seebsdell>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Feb 2018 20:11:48 +0100
Message-ID: <CA+chaQf=OMV60V7S=C6zaJ3sd_FwQkiojKY5EqAb6gTxXAQmXw@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: update to latest master
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2018 19:11:49 -0000
Content-Type: multipart/alternative; boundary="94eb2c0d6dd6c1ca840565591d75"

--94eb2c0d6dd6c1ca840565591d75
Content-Type: text/plain; charset="UTF-8"

I didn't get to the logs yet, but with this change added I see many
do_install tasks failing with exit code '134'.

It might have different cause, but I wasn't seeing this after last oe-core
upgrade before this last pseudo SRCREV bump.


There isn't temp/log.do_install* (for whatever reason) and in pseudo.log I
see following 3 lines being repeated couple times:

debug_logfile: fd 2
pid 47520 [parent 47518], doing new pid setup and server start
Setup complete, sending SIGUSR1 to pid 47518.

250 times even for very simple recipe:
sysvinit-inittab/2.88dsf-r10$ grep -c "Setup complete, sending SIGUSR1"
pseudo/pseudo.log
250


On Fri, Feb 16, 2018 at 6:51 PM, Seebs <seebs@seebs.net> wrote:

> On Fri, 16 Feb 2018 17:55:54 +0100
> Martin Jansa <martin.jansa@gmail.com> wrote:
>
> > $ grep -c "tried to close client 0 (highest is 1)"
> > update-rc.d/0.7-r5/pseudo/pseudo.log
> > 579655922
> >
> > All pseudo processes I've seen on various servers which were building
> > with this change included got stuck until disk space run out..
>
> Oh-hoh! That could be the epoll thing that I wasn't able to reproduce.
>
> > commit 26e30fa2e1a0fe4e885d7eea3f55d23cd2c3158f
> > Author: Seebs <seebs@seebs.net>
> > Date:   Fri Feb 16 11:49:49 2018 -0600
> >
> >     Allow closing client 0
>
> Added a thing to master. It looks like the failure mode is that a
> client ended up on fd 0, and for some reason, back in 2010, I thought
> that would be invalid and did not allow it. So change is to replace "<=
> 0" with "< 0".
>
> -s
>

--94eb2c0d6dd6c1ca840565591d75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I didn&#39;t get to the logs yet, but with this change add=
ed I see many do_install tasks failing=C2=A0with exit code &#39;134&#39;.<d=
iv><br></div><div>It might have different cause, but I wasn&#39;t seeing th=
is after last oe-core upgrade before this last pseudo SRCREV bump.</div><di=
v><br></div><div><br></div><div>There isn&#39;t temp/log.do_install* (for w=
hatever reason) and in pseudo.log I see following 3 lines being repeated co=
uple times:</div><div><br></div><div><div>debug_logfile: fd 2</div><div>pid=
 47520 [parent 47518], doing new pid setup and server start</div><div>Setup=
 complete, sending SIGUSR1 to pid 47518.</div></div><div><br></div><div>250=
 times even for very simple recipe:</div><div>sysvinit-inittab/2.88dsf-r10$=
 grep -c &quot;Setup complete, sending SIGUSR1&quot; pseudo/pseudo.log<br><=
/div><div><div>250</div></div><div><br></div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Fri, Feb 16, 2018 at 6:51 PM, Seebs <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:seebs@seebs.net" target=3D"_blank">se=
ebs@seebs.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span=
 class=3D"">On Fri, 16 Feb 2018 17:55:54 +0100<br>
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gma=
il.com</a>&gt; wrote:<br>
<br>
&gt; $ grep -c &quot;tried to close client 0 (highest is 1)&quot;<br>
&gt; update-rc.d/0.7-r5/pseudo/<wbr>pseudo.log<br>
&gt; 579655922<br>
&gt;<br>
&gt; All pseudo processes I&#39;ve seen on various servers which were build=
ing<br>
&gt; with this change included got stuck until disk space run out..<br>
<br>
</span>Oh-hoh! That could be the epoll thing that I wasn&#39;t able to repr=
oduce.<br>
<br>
&gt; commit 26e30fa2e1a0fe4e885d7eea3f55d2<wbr>3cd2c3158f<br>
&gt; Author: Seebs &lt;<a href=3D"mailto:seebs@seebs.net">seebs@seebs.net</=
a>&gt;<br>
&gt; Date:=C2=A0 =C2=A0Fri Feb 16 11:49:49 2018 -0600<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Allow closing client 0<br>
<br>
Added a thing to master. It looks like the failure mode is that a<br>
client ended up on fd 0, and for some reason, back in 2010, I thought<br>
that would be invalid and did not allow it. So change is to replace &quot;&=
lt;=3D<br>
0&quot; with &quot;&lt; 0&quot;.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-s<br>
</font></span></blockquote></div><br></div>

--94eb2c0d6dd6c1ca840565591d75--
