Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD5377058
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 16:07:58 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id v123so467499qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pn2IWYyTZ6IIw89Spud6fOvp/f1wpOOOsBElSCDXp6o=;
	b=g1PWWLT4HCJYK8yNpBscAfwcHI9WlxaLI24Y81iTJ0lHxJKDSu8losjGbDGvzmPCpg
	Dn2UPItGE9b0I2Axomm8L6CV3XSGZNBSbAuCPuEE5U+WKgDXlOTWdStu2CEJ3dMPyL1y
	drXPJ7mYjGDL2ibP43QoLep7Pra95Uxb6wgjnaMoDug6P59pQj/FaXdkr9Gxp8dTm120
	+QD34BOSnBqZ2aDw1qJIEepr1zwqlzO0RakMQqXyqleU846iwYsQqMgdyW2t7ZLBUv23
	oLr3Tqy6wWeoliqrpZkEdHYHvDDYk9b19nxpwaGhs2oQ/BbgCzF15vHHwCemYpfUJ5R0
	4ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pn2IWYyTZ6IIw89Spud6fOvp/f1wpOOOsBElSCDXp6o=;
	b=WsisDCqHrQEx/glG1Oxp+qj3TSdkkQBqs6D0zplQZUj9t6HED9ZM1mMEaF8A2zM+zF
	qX5bfzRTXB5y3VmaaHQ/ZnpXyKqLN1nYYkX5KdT9TLKN2dXrWSinKi9h0RyDm2mfOIJl
	G8WQMy3sgiGoyS9OUs4+yUnx5jF7WiIInQh+QzAERWuLYwsdwKnmo5EUAHOWZwf1Q1E3
	75yxT8tcWfVzGaK/KdLd2caBn0U+Shn8sWVGpo991QF9jWNUsPFQjErN8p47ThIk9juq
	cVweBk3wDOSnIItXzeFmczgjMG31DDtLYam5HmyzPV2CsPtOiHTUHtsVaIB7JS9dLXlq
	0hVw==
X-Gm-Message-State: AEkoouvXuY7R8U1Fm+BgnMDjHSZrykpUImel3iz4HklNT5dd3NAjy4+8SzjUV63S+7wJwgDzKka6W7Vtgtfj7g==
X-Received: by 10.55.47.199 with SMTP id v190mr5467990qkh.45.1470845278715;
	Wed, 10 Aug 2016 09:07:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.215.13 with HTTP; Wed, 10 Aug 2016 09:07:58 -0700 (PDT)
Received: by 10.55.215.13 with HTTP; Wed, 10 Aug 2016 09:07:58 -0700 (PDT)
In-Reply-To: <1470819593.8166.68.camel@linuxfoundation.org>
References: <20160801123253.9292-1-twoerner@gmail.com>
	<57A9C7AD.9090901@topic.nl>
	<BA7DFF44-541C-4FEE-B5B2-586FD82ABC60@gmail.com>
	<1470819593.8166.68.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Aug 2016 09:07:58 -0700
Message-ID: <CAMKF1soe+Z1PqbuzB-7FW=r5pWpzs08-8N10W5=xnpC+z1npHg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: add lzop dependency
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
X-List-Received-Date: Wed, 10 Aug 2016 16:08:00 -0000
Content-Type: multipart/alternative; boundary=001a114f42e65b850e0539b9da91

--001a114f42e65b850e0539b9da91
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Aug 10, 2016 1:59 AM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2016-08-09 at 12:27 -0700, Khem Raj wrote:
> > > On Aug 9, 2016, at 5:08 AM, Mike Looijmans <mike.looijmans@topic.nl
> > > > wrote:
> > >
> > > I've been adding "lzop-native" to a lot of kernel recipes because
> > > you also need it when generating an LZO compressed kernel (I like
> > > my boot time to be under 1 second).
> > >
> > > It's a small dependency which is hard to automatically figure out,
> > > since there are a number of ways to trigger it (we just found two).
> > > I would welcome this patch very much, and I don't think many will
> > > suffer=E2=80=A6
> >
> > From linux.inc days there is a python snippet which can do this
> > conditionally e.g. see
> >
> > https://github.com/kraj/meta-raspberrypi/blob/master/recipes-kernel/l
> > inux/linux-rpi.inc#L121
>
> Which is fine if you have a prebuild defconfig file however in many
> cases we don't have that :(
>

Thats right perhaps dependency could be conputed after configure task and
added to say compile task

> Cheers,
>
> Richard

--001a114f42e65b850e0539b9da91
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">On Aug 10, 2016 1:59 AM, &quot;Richard Purdie&quot; &lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfound=
ation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 2016-08-09 at 12:27 -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; On Aug 9, 2016, at 5:08 AM, Mike Looijmans &lt;<a href=3D"ma=
ilto:mike.looijmans@topic.nl">mike.looijmans@topic.nl</a><br>
&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;ve been adding &quot;lzop-native&quot; to a lot of ker=
nel recipes because<br>
&gt; &gt; &gt; you also need it when generating an LZO compressed kernel (I=
 like<br>
&gt; &gt; &gt; my boot time to be under 1 second).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; It&#39;s a small dependency which is hard to automatically f=
igure out,<br>
&gt; &gt; &gt; since there are a number of ways to trigger it (we just foun=
d two).<br>
&gt; &gt; &gt; I would welcome this patch very much, and I don&#39;t think =
many will<br>
&gt; &gt; &gt; suffer=E2=80=A6<br>
&gt; &gt;<br>
&gt; &gt; From linux.inc days there is a python snippet which can do this<b=
r>
&gt; &gt; conditionally e.g. see<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://github.com/kraj/meta-raspberrypi/blob/master/r=
ecipes-kernel/l">https://github.com/kraj/meta-raspberrypi/blob/master/recip=
es-kernel/l</a><br>
&gt; &gt; inux/linux-rpi.inc#L121<br>
&gt;<br>
&gt; Which is fine if you have a prebuild defconfig file however in many<br=
>
&gt; cases we don&#39;t have that :(<br>
&gt;</p>
<p dir=3D"ltr">Thats right perhaps dependency could be conputed after confi=
gure task and added to say compile task</p>
<p dir=3D"ltr">&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br></p>

--001a114f42e65b850e0539b9da91--
