Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 65B6561423
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 21:03:57 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id c15so1279284vko.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 13:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YInYK/WmYzbHt2Sm+LSmNvi5HiG12m+RJ5JFMuWHAYU=;
	b=XU7gI24nWW/666iLBPdBSDAAE+YHGeFJ4K9AXL9Ck5MGdptCJ7ZIE1ZCch/3p90nlq
	KpY2Hl4bp3NViUPXTfL5yBTVw36ELwY6cz+2GlzFAFc0oQWlMgdgf32Lf5842LF/PAtS
	c1KNQLssh4p4aI95AAXzVE/BuqpnVjje7xOAd9YybFKJ9hNY9wFqjSOihxFbWtFwDP+i
	rW8ixaRYBP1KPkH56q3N0gBJFOZbfOEFJVYtT4vX8SDOUFtrY6JU5CCadA/nr1J+rXqA
	Nr10q4DZhefRBEzBXTTXzoJSLyFgpoBWD3jtMQC6GD5tIkXtmBAPiYtQXOjjZ44GvBbT
	Vwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YInYK/WmYzbHt2Sm+LSmNvi5HiG12m+RJ5JFMuWHAYU=;
	b=AJ27hNZvtCsYOqrI2Pew6juB5RodEKvvkhGAm1JG31XBK80JF9LMUIzu4Fr6of/T2I
	v3iCP8HJqzwisnHmKFuBsntbySgQV3MV+iT9xWSsY3uGHfpc5tvcwU94ZgTpukrJXPBW
	K4fJGv1rVAjBrbFuJ4oyFm3w+C2YPWbVfoS2Ykcu9rN+9IQDEHJt/sFxED7456E5cYCP
	P9pvGHIl5FEpB1Mbw93CW7b2Aybtt6M9Yu7qei9Fvt2pXQsDrNHbZEvMazPNJUwOWqxD
	2LXKOcKRC/n12Lus2/VAbLgI9z9g9rpiVx/0dsMhEQ1wQd8nTCcAhXIhue4f5INVkexh
	0VhA==
X-Gm-Message-State: APjAAAUl+ChyhwiSGQJUdqvN1iLNY8/KL9XmPNf80rxta7imwNl2niUK
	/JpJeKyzqM4hfX6AuWLJOSXKXt22pQ8XiXhDm/E=
X-Google-Smtp-Source: APXvYqwbujOipYmcFM2se1o9VXtlXsLMIzEjCJfY1MfWrqnfrSZX6v/HtpEWpM5lSte382jRDjr6RPw4H7Fy1ss974g=
X-Received: by 2002:a1f:7dcd:: with SMTP id y196mr4227962vkc.29.1581887038378; 
	Sun, 16 Feb 2020 13:03:58 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-5-alex.kanavin@gmail.com>
	<CAMKF1sppws+PSjDojzi7+=p_UjEkEafGa1_WtRLCpqO_73nhGA@mail.gmail.com>
	<CANNYZj8W0A12inq_K3kiShN7dsU3tsTuOgh4LZAtP-QcUVDaXQ@mail.gmail.com>
	<CAMKF1so86RKsiAXC=vzpT0wu8E=jiFMzJsVBdGb7SQ2TKxBo6Q@mail.gmail.com>
In-Reply-To: <CAMKF1so86RKsiAXC=vzpT0wu8E=jiFMzJsVBdGb7SQ2TKxBo6Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 16 Feb 2020 22:03:47 +0100
Message-ID: <CANNYZj_k+iXWB_V3PQOv8eE8Pvwt8B-q4=x_F4e4hzisW-NXaA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] weston-init: use the drm backend rather than fbdev one
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
X-List-Received-Date: Sun, 16 Feb 2020 21:03:57 -0000
Content-Type: multipart/alternative; boundary="000000000000ff55d3059eb7c6d6"

--000000000000ff55d3059eb7c6d6
Content-Type: text/plain; charset="UTF-8"

On Sun, 16 Feb 2020 at 21:10, Khem Raj <raj.khem@gmail.com> wrote:

> qemuall, applies to other qemu machines for arm/aarch64/mips/ppc/riscv
> as well, in recent past I knew
> this change was needed for qemumips and qemuarm to boot
> core-image-weston, I am not sure if
> anything has changed since then. I think this change would need some
> more testing.
>

Sure, but the testing should be done by people who need those other
machines to be able to boot weston; I would want to draw the line at what
is currently covered by the autobuilder (which is just qemux86_64).

We can then use the fallback in a more targeted way, although the proper
fix would be to look into why the default backend isn't working.

Alex

--000000000000ff55d3059eb7c6d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 16 Feb 2020 at 21:10, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">qemuall, applies to other qemu machines for arm/aarch64/mips/ppc=
/riscv<br>
as well, in recent past I knew<br>
this change was needed for qemumips and qemuarm to boot<br>
core-image-weston, I am not sure if<br>
anything has changed since then. I think this change would need some<br>
more testing.<br></blockquote><div><br></div><div>Sure, but the testing sho=
uld be done by people who need those other machines to be able to boot west=
on; I would want to draw the line at what is currently covered by the autob=
uilder (which is just qemux86_64).</div></div><div class=3D"gmail_quote"><b=
r></div><div class=3D"gmail_quote">We can then use the fallback in a more t=
argeted way, although the proper fix would be to look into why the default =
backend isn&#39;t working.<br></div><div class=3D"gmail_quote"><br><div>Ale=
x<br></div></div></div>

--000000000000ff55d3059eb7c6d6--
