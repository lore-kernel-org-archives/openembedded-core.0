Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id C5A197F32C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 10:34:30 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id c7so5897777vse.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 03:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EGDXTroHyH7icswH8HWHmO4OA4cr2lXYF/yqFzVyZdE=;
	b=mCPsvBnXRUWcjc1sM6bZbM6X2LOjV/kz2mcLm/wsYjkDPDZ3/+u5BfCjOHCFfUes/T
	1OQ/PW0zgxuMUca4ohgdzjJqkfd6pStX8bD/fvHHGiXn9vSqeP4qpJ66i947Gw3TzRf8
	MvsDRSdxVQSn5wmfJA+/oESeEdz4TUFiKpl2ncQjz5GWOKevKR7ikT5m4WxDpR0vn89J
	muir50pP/X42u5jKmaDClNYRm3nwMZpqknuKITJG/zbVnnyJpIRHiQdK/mXv30AyeIAz
	t3OAEYRK81rI6pOSUKh8+NgX9VEeM6DXUg38HOITjzmRsaSApCsBkv76GiPhXl80k97U
	B8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EGDXTroHyH7icswH8HWHmO4OA4cr2lXYF/yqFzVyZdE=;
	b=CBM7vfJNGlXJN9n9p3V/rnb17joMopqBqrTuhkMJIUf+4GTJ8rM4diXCbacXkLO46R
	A9cS0QbePDN1dLTcFSrOqkkd9crxVMibyRTljBoVG5GAZa6rI+H3ycqX9PZvsnr777N7
	Izx4ugfyNmfJLlG4OfmQ9+P/285oKPlUxlYWM7Z1k8sGV1g+nK4qgKzi3F5eQ3MoCXlZ
	/nE7/FACLR2jscMilTQIGt6CKP/L1VoReo5F9qKzafhmmJUBl9KB+vWlOhqHCfuXgPA2
	m/F15IabRkTN0kIb/freKirJTLGhF8XEruBUkCn6OwwvQR5JlzYWM+A2NQSLq+hnnYBX
	aMcg==
X-Gm-Message-State: APjAAAXpp2ZtpJjnZMR2jhwcUI6vcd579L/BHFMfby2HghP7M2FLw5LR
	8ec8e9hcdkN0giWuGUjFuJ7AyW4Fioi21SnIDmQ=
X-Google-Smtp-Source: APXvYqzmT2AFuI5oNGc5WSicwF6o0vd0lBI9e4t4Bs/z7BjAC+zUuCUSatckkvVLOX1C/pVQi7oSWsmRjg36jfIiT2U=
X-Received: by 2002:a67:1c87:: with SMTP id c129mr2264172vsc.23.1566556471542; 
	Fri, 23 Aug 2019 03:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
	<20190820153219.62435-2-alex.kanavin@gmail.com>
	<a1afd589e5a20fa0fa780b2290e75caedbbf17d8.camel@linuxfoundation.org>
In-Reply-To: <a1afd589e5a20fa0fa780b2290e75caedbbf17d8.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Aug 2019 12:34:20 +0200
Message-ID: <CANNYZj8nUsruTu4W5O4ACr-QAr26mAbhRb=Ta5PBbJqGJRyo4Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/12] qemu: switch to '-vga std' emulated hardware from vmware/cirrus for x86/mips
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
X-List-Received-Date: Fri, 23 Aug 2019 10:34:31 -0000
Content-Type: multipart/alternative; boundary="00000000000001cb3e0590c65a8a"

--00000000000001cb3e0590c65a8a
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Aug 2019 at 11:13, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The patches in master-next had some failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/636
>
> I think but am not 100% sure it could from this patch?
>

Yes, at least two of those are direct X11 failures (X server crash on x32;
X refusing to start if mesa is built with llvmpipe in step8 of qa-extras2).
I'll try to look into them.

Alex

--00000000000001cb3e0590c65a8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 23 Aug 2019 at 11:13, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">The patches in master-next =
had some failures:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/85/build=
s/636" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/85/builds/636</a><br>
<br>
I think but am not 100% sure it could from this patch?<br></blockquote><div=
><br></div><div>Yes, at least two of those are direct X11 failures (X serve=
r crash on x32; X refusing to start if mesa is built with llvmpipe in step8=
 of qa-extras2). I&#39;ll try to look into them.</div><div><br></div><div>A=
lex<br></div></div></div>

--00000000000001cb3e0590c65a8a--
