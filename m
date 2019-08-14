Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8DA037E436
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 12:08:11 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id 62so11513354vsl.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 05:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6yZE1m9C9hhbh7Oaz4G6vEiISUPm6KUp83Y1JDUtvfE=;
	b=e0WbDXxeF1FXgTOsW9/1uJolqevAE6f6TP6qG+7Ll2jPIEgTgJuxWHp5o1CXgxPgWB
	y5oaDWRbMd6OIYTWSKaCS3XfWsn1KOy7/5iVm4bp+Edg5Mb6gIJGVJkKImrTMpiUm824
	LO4hP9PE/1KTyT/nkE3QVJnRejt+Uh4gCZZmqwdUx5Gp+JfaWtz/HI5Xtkh3vdHd+stR
	dNMw+PacX+6NkQSHA49ywPctuBEx5qfeLCpgJVEaMMkkomjkGoyeW3AWaoCFvIfRn4yJ
	yqaIs3MUPeQAgZ5q7GBnow8kKFPdAWO3JXSUPdcXrYw4mPSNEbWXwONHt4T5n7pp7CHe
	3jpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6yZE1m9C9hhbh7Oaz4G6vEiISUPm6KUp83Y1JDUtvfE=;
	b=s+Zh03pyGTrDVVz4vUxF9nVVWHlvuKUhaw5y4WvaJjdFKo70ehoGyOWnj7tdl4t5cB
	5F4Dxuah+KWqktJKMR4dfP10yN7XBSKjE35LS1OQKvIJjDZmL/scUwex8xH3uxgTwLPo
	Ok/plk2iO2VZX/jnUvtaBXTwu1EcNVFF/o4YMzcXZDNp55EUmGJVatOxPZj3YZ+wFxT5
	rNeKwMPlVF51U42ZqAB+rHGwgZlTgGeBYkQUalsDLmZ9rOv3DklbhAec1TT4SgCanwIL
	LNetnQAtBQYKKgLRtWZY0H2+rkb9QHQoup+N7RAh+RTcgDjxzXNRHaKXLmb0KY5DdPZ0
	U2rg==
X-Gm-Message-State: APjAAAUoK5K7JlFxzN9yOBd/tqQjkjqPHq1Ujif7MFU14oNf8pQ0xaiZ
	Ko7ySrn2tTxg4w7rGma7smmKKkg2TcLQOLwmaSs=
X-Google-Smtp-Source: APXvYqxEiWfVKIGfPM/6WXparzOQWaDnUnf0I71k6rFvpAbpR3djANsfvv3Aeetlgwf8KWEUa5jB4TRQsvFdA4h5jyU=
X-Received: by 2002:a67:fd66:: with SMTP id h6mr19382548vsa.83.1565784492412; 
	Wed, 14 Aug 2019 05:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
	<CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
	<6551fb5303bcc8dbf3a9d55a1aa6a9ecd2baeb13.camel@linuxfoundation.org>
In-Reply-To: <6551fb5303bcc8dbf3a9d55a1aa6a9ecd2baeb13.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Aug 2019 14:08:01 +0200
Message-ID: <CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Wed, 14 Aug 2019 12:08:11 -0000
Content-Type: multipart/alternative; boundary="00000000000077158d0590129cf2"

--00000000000077158d0590129cf2
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Aug 2019 at 13:36, <richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2019-08-14 at 13:25 +0200, Alexander Kanavin wrote:
> > On Tue, 13 Aug 2019 at 21:18, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > I had a glance at the profile output from master-next and the
> > > problem
> > > wasn't where I thought it would be, it was in the scheduler code.
> > > That
> > > is good as those classes are effectively independent of the other
> > > changes and hence are a separate fix.
> > >
> > > I've put a patch in -next which takes the above test to 36s which
> > > is
> > > close to the older bitbake.
> > >
> > > Could be interesting to see how it looks for others and different
> > > workloads.
> >
> > I just tried the same test I did yesterday with
> > ab56d466452148e5fce330d279d13e2495eceb1f. Unfortunately it doesn't
> > seem to improve things much: bitbake is stuck at "NOTE: Executing
> > Tasks" for 15 minutes now.
>
> This might sound slightly crazy but can you try commenting out this
> line in runqueue.py:
>
> logger.debug(2, "Holding off tasks %s" %
> pprint.pformat(self.holdoff_tasks))
>
> ?
>

Even crazier is the outcome: it helped! The whole thing completed after
15m49secons (with much of the time going to the empty task spin), that's
some 3 minutes slower, but certainly it's usable again.

I have not enabled the hash server at any point.

Alex

--00000000000077158d0590129cf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 14 Aug 2019 at 13:36, &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, 2019-08-14 at 13:25 +0200, Alexand=
er Kanavin wrote:<br>
&gt; On Tue, 13 Aug 2019 at 21:18, Richard Purdie &lt;<br>
&gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; I had a glance at the profile output from master-next and the<br>
&gt; &gt; problem<br>
&gt; &gt; wasn&#39;t where I thought it would be, it was in the scheduler c=
ode.<br>
&gt; &gt; That<br>
&gt; &gt; is good as those classes are effectively independent of the other=
<br>
&gt; &gt; changes and hence are a separate fix.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ve put a patch in -next which takes the above test to 36s w=
hich<br>
&gt; &gt; is<br>
&gt; &gt; close to the older bitbake.<br>
&gt; &gt; <br>
&gt; &gt; Could be interesting to see how it looks for others and different=
<br>
&gt; &gt; workloads.<br>
&gt; <br>
&gt; I just tried the same test I did yesterday with<br>
&gt; ab56d466452148e5fce330d279d13e2495eceb1f. Unfortunately it doesn&#39;t=
<br>
&gt; seem to improve things much: bitbake is stuck at &quot;NOTE: Executing=
<br>
&gt; Tasks&quot; for 15 minutes now.<br>
<br>
This might sound slightly crazy but can you try commenting out this<br>
line in runqueue.py:<br>
<br>
logger.debug(2, &quot;Holding off tasks %s&quot; % pprint.pformat(self.hold=
off_tasks))<br>
<br>
?<br></blockquote><div><br></div><div>Even crazier is the outcome: it helpe=
d! The whole thing completed after 15m49secons (with much of the time going=
 to the empty task spin), that&#39;s some 3 minutes slower, but certainly i=
t&#39;s usable again.</div><div><br></div><div>I have not enabled the hash =
server at any point.</div><div><br></div><div>Alex<br></div></div></div>

--00000000000077158d0590129cf2--
