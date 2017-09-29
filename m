Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5391477B27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 10:16:24 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id 85so1645821ith.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 03:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T8G8yVwVRtf6tJ4CSOSXkGAlJfgMRmyXruh2KimAfpI=;
	b=F8kM2/pxsWEkefUh9rTAQBBMlFGcs9OkGE1RSu9Kog2VI3+0lo3ei7P5EKfYqJvyH6
	oXyq9X8fGGzPU7a9SVupmibvlp4nFpOUxtzJJU9IqxFHTtoPui1nkpmBCl4piAYf30nB
	HWDSTwze+sG1EP/R8tylDvyOQvOrJjAPbAFGlT+D/1g1oWNocbehiBJ1uYFmGlQq6VCZ
	8h6gTWgF1CEaOdwoe9vlo4DYHEFEGQsOeK55wp+ZbL8zvjs8ACIteTE6YHJOqrYj97t/
	j+SXkc6DeAoh5vIvBJ6/3engeD0Y5ivx0O5ty0lMwO/t7GYhtUfRo+TUDzJngYQ4IhK6
	4FVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T8G8yVwVRtf6tJ4CSOSXkGAlJfgMRmyXruh2KimAfpI=;
	b=py4t+CZmtVYAHoi9xeC9HHOkGqptanwMymFc6lECRNSpjESdPZoXnA5vRig/XMVw6w
	V2bhzDq29aU4p4gQKwYoCRZkXviw6LplN+WSI9xHCKCxVyM1d7JFiiEgqEPxTdH5PXPF
	pXeS8L6sz0XUKxtiSz7QQboAHUWeZXb0JL6uphRzNgKBiMBMXM1pI+gVVWrE66EmuBLs
	8UQNjxP2wy02rNIAfSU/YEXLQNSOaJdNeU27S2w2GDzHGB0qw9M3aTclmvRrrfB/PO6+
	lcO+0Y1AoB9OvT5j3ROIY0rKYqak9Pg+SsE75KpuwraBYC6YsQFlzA8OUS2OBFxWz515
	r3yw==
X-Gm-Message-State: AHPjjUhu3B0v/8KHmVzZmk4K+XbuLvzmJlwNu5039hZjYqevUogNcBtt
	tzocFfa1w1SVcpf1gIXpnPFoH0QOqD6+KHkEi/zO+w==
X-Google-Smtp-Source: AOwi7QCI3RurZpnnkr4Fknta51DBeTJK1h9VOXRQNKySu8eYhlBthw+HwfWl4s/akCcXtN3Hy30RYR5HMw72rnlOmGE=
X-Received: by 10.36.178.1 with SMTP id u1mr6602746ite.120.1506680186359; Fri,
	29 Sep 2017 03:16:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Fri, 29 Sep 2017 03:16:05 -0700 (PDT)
In-Reply-To: <CAEQ58siT6Lw_W9Oe60v125ZZak2UXQ0L-R4PvaHAz6NKRi_-vA@mail.gmail.com>
References: <20170929094702.5334-1-francescogiancane8@gmail.com>
	<CAJTo0LZTrRnhgFRhK3=GxVfzrT5H7p-k=Untwq9T+KWTrpyMQA@mail.gmail.com>
	<CAEQ58siT6Lw_W9Oe60v125ZZak2UXQ0L-R4PvaHAz6NKRi_-vA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Sep 2017 11:16:05 +0100
Message-ID: <CAJTo0LYaN8SapMtgpQhNkPz7TKR9JgOMhroxWp4Q1+BDkcucMQ@mail.gmail.com>
To: Francesco Giancane <francescogiancane8@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [openembedded-core][PATCH] xorg-xserver: fix building of the package when different virtual/egl provider are selected
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
X-List-Received-Date: Fri, 29 Sep 2017 10:16:25 -0000
Content-Type: multipart/alternative; boundary="f403045d9c0e4c6902055a515170"

--f403045d9c0e4c6902055a515170
Content-Type: text/plain; charset="UTF-8"

On 29 September 2017 at 11:14, Francesco Giancane <
francescogiancane8@gmail.com> wrote:

> Hi Ross,
> Thank you for your clarification. I double checked the recipes before
> asking for the patch,  and I found out that Mesa provides both virtual/egl
> and virtual/libegl; searching through the layers I did not find any recipe
> depending on libegl but only on egl. Incidentally, userland from
> meta-raspberrypi provided only egl, and that was the final confirmation.
>

Note that virtual/* are build-time dependencies, this dependency is a
runtime dependency.

Ross

--f403045d9c0e4c6902055a515170
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 29 September 2017 at 11:14, Francesco Giancane <span di=
r=3D"ltr">&lt;<a href=3D"mailto:francescogiancane8@gmail.com" target=3D"_bl=
ank">francescogiancane8@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gm=
ail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div d=
ir=3D"auto">Hi Ross,=C2=A0<div dir=3D"auto">Thank you for your clarificatio=
n. I double checked the recipes before asking for the patch,=C2=A0 and I fo=
und out that Mesa provides both virtual/egl and virtual/libegl; searching t=
hrough the layers I did not find any recipe depending on libegl but only on=
 egl. Incidentally, userland from meta-raspberrypi provided only egl, and t=
hat was the final confirmation.=C2=A0</div></div></blockquote><div><br></di=
v><div>Note that virtual/* are build-time dependencies, this dependency is =
a runtime dependency.=C2=A0</div><div><br></div><div>Ross</div></div></div>=
</div>

--f403045d9c0e4c6902055a515170--
