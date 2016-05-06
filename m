Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6B84071951
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 11:24:13 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id bi2so42544627igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 04:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VvTBgGuKfHRsZpuTjX7Q5QW4UgI1evuPtjuBUDStSoI=;
	b=xLlPoNLn6krThl4CkFv555PfvS+dNP920abG5y/KJjhNPdUwHBHrF39b9w+NsnP1ZA
	MBs30xiJZpouWjXY5iEXZtH2ZfC49oxWvAhule4ALuXqs7vM1fMKwq9yKmAaVGeFxdrI
	vydRtl8+WBNDiPkj7LRxw9KR0Q4mVpKJbiQ+BPOXPotEoQEo8AGcVGvJVil6FYVV/pvZ
	FNX12rrmSw+9/K/ZiqPOU/MyezzDOZv7OMxTbnYhDhBCM1woP/wFK2JBOZlWlchc6wEV
	+M33aoI7jH4gbXuvLpgBjo4Kp0geNMs8ADXLkb5trpbYRNN9aC9GrUcAJjU9UXVcRryF
	3G1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VvTBgGuKfHRsZpuTjX7Q5QW4UgI1evuPtjuBUDStSoI=;
	b=Im1pXdP70bkBIRcniUNhg+BjfGphYXSnNr+/Wt0l0LlD8xXmcTSNnZ4Na70YprD/s9
	GpFJ6Z7KmE4HoAf0BVOPLBKr3Q5lntu94m5ntE/90+dyZTcJMpE7f4l3zkHFae+WDKsX
	++zk59bCWHB+CP7Iv4pJ/SUapp4yJHTBSNxGGMiNVXtyWQpJSvX3Co104CmW8zlylw/E
	wn+wf3dA+le3AoKTWGnLZbZvEkEQiANfnGDx2E32A6Fxfkwipq6fKsMk0MubUatKYq86
	Nv4qnQnH/LvAcDI/yul+vZV7Yxp2rDz2wDZDeKtgULa4KBOqtXtk8BzFKre8l97vjdvh
	NZ8A==
X-Gm-Message-State: AOPr4FWXg4nV6OUZ9PeqMVerMvLoep9X6uyCuxlBlwipua3K/xo/WFkWn+PZXLKqSlloG+epNj3eS8tKUn2qgMzS
X-Received: by 10.50.62.20 with SMTP id u20mr9592906igr.52.1462533854552; Fri,
	06 May 2016 04:24:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.142 with HTTP; Fri, 6 May 2016 04:23:55 -0700 (PDT)
In-Reply-To: <9ac61a33-ea21-17d4-a7d5-c5c2e94fad86@windriver.com>
References: <1461084427.31320.25.camel@linuxfoundation.org>
	<20160505154748.GA23370@jama>
	<9ac61a33-ea21-17d4-a7d5-c5c2e94fad86@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 May 2016 12:23:55 +0100
Message-ID: <CAJTo0LZ5KNk2eLC=fD7+PxzrcRrq_-UVG3etOeHOx3vL616RPg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Ensure rootfs dependencies cover DEBUGFS
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
X-List-Received-Date: Fri, 06 May 2016 11:24:15 -0000
Content-Type: multipart/alternative; boundary=047d7bdca606df7fad05322ab224

--047d7bdca606df7fad05322ab224
Content-Type: text/plain; charset=UTF-8

On 5 May 2016 at 16:55, Mark Hatle <mark.hatle@windriver.com> wrote:

> I thought this had been fixed.
>
> IMAGE_FSTYPES_DEBUGFS -should- be set to default to:
>
> IMAGE_FSTYPES_DEBUGFS ?= "${IMAGE_FSTYPES}"
>
> I usually set it to "tar.gz" myself.
>
> So this is a bug, and we definitely need to fix it.  :P
>

Nope, nothing in oe-core sets that.  Can some at WR send a patch?

Ross

--047d7bdca606df7fad05322ab224
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 May 2016 at 16:55, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto:=
mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1j6" class=3D=
"a3s aXjCH">I thought this had been fixed.<br>
<br>
IMAGE_FSTYPES_DEBUGFS -should- be set to default to:<br>
<br>
IMAGE_FSTYPES_DEBUGFS ?=3D &quot;${IMAGE_FSTYPES}&quot;<br>
<br>
I usually set it to &quot;tar.gz&quot; myself.<br>
<br>
So this is a bug, and we definitely need to fix it.=C2=A0 :P</div></blockqu=
ote></div><br>Nope, nothing in oe-core sets that.=C2=A0 Can some at WR send=
 a patch?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--047d7bdca606df7fad05322ab224--
