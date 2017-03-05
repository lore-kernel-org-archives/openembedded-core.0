Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id A0B6871DB8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Mar 2017 16:58:44 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id 1so122306619qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Mar 2017 08:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gMHbcV7zdxqB91Z+/IX7xnAwI64X4qb87labxJgaJ/M=;
	b=XeDXIYVlNUWThfz8PXxzpVdJkIfGUHSrmx5dfolu3btLFYh0HAZ12fdSTjENnaJh5d
	aWnvzBD62oPAMorayiwmIQKbeneInzXN88ygAbWI2hwXHc7aLjTkz980s2IRhu4yZVgD
	MK7Upk+DJzWMhi+BDRZIYS1HJ8bsud8Qa8h6Liq6/lsIZRmOmzqyh2r8aOxPXdmcjWql
	trZQ/W+Ej7lzZ7+JobKGpu+qmBPT9RGnV/rayADtbw0VeVynU4Ms9uaOrmkvzsppNUKb
	2Jewb4z7rWfNPhuM3wTPsUjwDUtKT8JRHqsl52nekALlW/xAvVzwDEIYZnBNcOkXSWYh
	5yDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gMHbcV7zdxqB91Z+/IX7xnAwI64X4qb87labxJgaJ/M=;
	b=L9zoymEomV+BeVNx+MEx0Nk1W6NCWsB8EGOkJag57aAK3i4jiWUoqSOiqcFguT1ksO
	bpuWqjOvAKpqdHASH3aLgNWIGORqP004d0XcjKj6oXqmqtzUDewPTkjZ0KxUTMbxSP93
	r1NWIArZ2lyqXhBc+DDVa0013YOtgddXvVhB6KrEGLgm+l78PNOdxlIfQFIgB63l7407
	HKBX4Yevk1jVRfpIbx9ngmctsHw0c41jqc6JC1Awr6hTu4mFWbANcal6tVMoNE9MktKm
	HusHfG1MA7xON5Hth+NxBq5KYYhHb56vHrPKD5FjS775uZ8lZcUXvykNnk4MC9w1nR0U
	PxUA==
X-Gm-Message-State: AMke39lHXvLcJy+tNquz5Fvo6mCzf32POXICc8FRQ2KKt1MC53lVuLRPJMFPUqHh/AkDXBAaMVhjgCgobTgn4+LN
X-Received: by 10.55.221.1 with SMTP id n1mr11196041qki.221.1488733125225;
	Sun, 05 Mar 2017 08:58:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Sun, 5 Mar 2017 08:58:24 -0800 (PST)
In-Reply-To: <a94ef9bf-da82-b236-6911-7bfb595797d5@huau-gabriel.fr>
References: <a94ef9bf-da82-b236-6911-7bfb595797d5@huau-gabriel.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 5 Mar 2017 16:58:24 +0000
Message-ID: <CAJTo0LZs7MyM0jRwcnkxjOM7Lbg8zXgOKinrpYcVapEb4RURgg@mail.gmail.com>
To: Gabriel Huau <contact@huau-gabriel.fr>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libglu: dependency on x11
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
X-List-Received-Date: Sun, 05 Mar 2017 16:58:45 -0000
Content-Type: multipart/alternative; boundary=001a1149d7dc18500c0549feb115

--001a1149d7dc18500c0549feb115
Content-Type: text/plain; charset=UTF-8

On 4 March 2017 at 22:52, Gabriel Huau <contact@huau-gabriel.fr> wrote:

> I'm not sure to understand why do we have a dependency on X11 in the
> libGLU package? I might miss some pieces of information here, but IMO, it
> should only depends on opengl as the libGL.so could be generated without
> X11 or any Window system.
>

How does one build libGL.so without X11, considering libGL is explicitly
GLX, and the X in GLX stands for X Window System?

Ross

--001a1149d7dc18500c0549feb115
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 March 2017 at 22:52, Gabriel Huau <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:contact@huau-gabriel.fr" target=3D"_blank">contact@huau-gabriel.fr</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1t8" class=
=3D"a3s aXjCH m15a9b8c775f12cf7">I&#39;m not sure to understand why do we h=
ave a dependency on X11 in the libGLU package? I might miss some pieces of =
information here, but IMO, it should only depends on opengl as the libGL.so=
 could be generated without X11 or any Window system.<br></div></blockquote=
></div><br>How does one build libGL.so without X11, considering libGL is ex=
plicitly GLX, and the X in GLX stands for X Window System?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1149d7dc18500c0549feb115--
