Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF647E97C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 13:31:37 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id z23so2583888ote.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 06:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p5izoL3oPnDWweSQVVhrQCOjQCMZ047Paa77FV8LOxI=;
	b=qQI17f9DJGgTMkyRZx+xgTD6IqEufFutTULyNzsAvCbMiY1vyzARgsrv5JRboeD28f
	9xbwaMLShZdZcjG7nbjnfB9wadF4T/WBNqTKirH4NzF4Zm8OKHaUzBBSM+VKdcl76rm+
	EryUNfiDgeUKGOXZv3v9osOJohVut3geMor7NBq5nZz4yrM8s+dr5c7BL0oe6spCZC+B
	14PIIK7vv7666Wx2+Ymm4u0rWCmUMZlb6P7GPtQ39Mv2dDqVp9M9TmPyKgYWw5jtuJgq
	6AgmoaYc0WX4zp08WSJTUzo2BPHXnhER5KtsIQq5XB6FJ15j+YsQzr8LOAH6DZiuVmT1
	HCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p5izoL3oPnDWweSQVVhrQCOjQCMZ047Paa77FV8LOxI=;
	b=AbZ7xmIYEPvP1SqMp/rbvg1tWxjqr9B4VHGhHcOnExuBFnN14UPx7TXaJqTp49/KLV
	yDXjVGQ67bFrxSUXJxtKb367AaSpiPHZB/TAnH+YhSEhWh8EZpgjSTv5oOGEKE/XPjIO
	X/F5yDR3S9YHumZBToflOrhZNlI37RScH5VkuXO36tURrMw3rHX7RXedLXK0fe4YmwlU
	tRYhUNWY+oGH0DvGK2HA4xqZRcT0Ltne09opTa7qVuxyhpNfIkJAYBlVaC6O2wWx68bS
	+D4fMoMCrWi/50Xd66khof5KfehRvZR6fOvdQGO9cugtA4UKYHhOFNHJhtNpQQ2tAelO
	7o4w==
X-Gm-Message-State: APjAAAWyE0WjsaIW/cwmvuAlAgOPYtmF7TWjnBj7X+oZWUHj23x72hja
	GfR17B/ZpoW/G46m5T3MPNCyPhlPq+g5Mh199kY=
X-Google-Smtp-Source: APXvYqxDhunbphGCMFRKRGx1Xr2lcpErkXqvnViNBI5/dUYzoPSpwG1BC2dvcRinn/FHH9SLgGn8zArT0ddAAsFxZjc=
X-Received: by 2002:a9d:5f05:: with SMTP id f5mr3113597oti.167.1560519098450; 
	Fri, 14 Jun 2019 06:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
	<20190614120448.2wg2523qu67la7mh@pengutronix.de>
	<ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
	<20190614123451.c5idgiizmqnlhob4@pengutronix.de>
	<CANNYZj-7=AVo51+aRpCL7k14VFiDhCtXozsSzZTbPWZO0=Ud1A@mail.gmail.com>
	<CAJTo0LYA8yC8T10rj0ga0gsGT8z1J_oboW_xr_5s-V63oZsmpA@mail.gmail.com>
In-Reply-To: <CAJTo0LYA8yC8T10rj0ga0gsGT8z1J_oboW_xr_5s-V63oZsmpA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Jun 2019 15:31:26 +0200
Message-ID: <CANNYZj92g1KJFTB993F0y=9fUmjUQRfo7Tkzk+WGhS7Xrd0k-Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: kernel@pengutronix.de, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Fri, 14 Jun 2019 13:31:37 -0000
Content-Type: multipart/alternative; boundary="000000000000874832058b48aaed"

--000000000000874832058b48aaed
Content-Type: text/plain; charset="UTF-8"

I think the only qemus where we do anything mesa-related are kvm-enabled
x86 ones. So in that sense it doesn't matter which drivers are shipped for
other qemu targets.

Alex

On Fri, 14 Jun 2019 at 15:16, Burton, Ross <ross.burton@intel.com> wrote:

> On Fri, 14 Jun 2019 at 13:46, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> > I would rather replace swrast with virgl in the qemu machine configs.
> Currently it's pulled in implicitly via the megadriver package which has
> virgl included because it is enabled by default in the mesa recipe. From
> what I can see beaglebone etc. are not affected by this.
>
> So the failure is that swrast is no longer shipped by mesa but the
> qemu BSP does this:
>
> XSERVER ?= "xserver-xorg \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
>             xf86-video-fbdev \
>             "
>
> However as Alex says, we have virgl now.  Does this work on all qemus?
>  Should we just change the XSERVER assignment to explicitly pull in
> the megadriver instead?
>
> The 'proper' swrast driver *is* terrible, lets not enabe it by default
> now we have virgl for qemu.  If a BSP wants to use it then they can,
> but it's not something we should enable out of the box.
>
> Ross
>

--000000000000874832058b48aaed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think the only qemus where we do anything mesa-rela=
ted are kvm-enabled x86 ones. So in that sense it doesn&#39;t matter which =
drivers are shipped for other qemu targets.</div><div><br></div><div>Alex<b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri, 14 Jun 2019 at 15:16, Burton, Ross &lt;<a href=3D"mailto:ro=
ss.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Fri, 14 Jun 2019 at 13:46, Ale=
xander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_bla=
nk">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; I would rather replace swrast with virgl in the qemu machine configs. =
Currently it&#39;s pulled in implicitly via the megadriver package which ha=
s virgl included because it is enabled by default in the mesa recipe. From =
what I can see beaglebone etc. are not affected by this.<br>
<br>
So the failure is that swrast is no longer shipped by mesa but the<br>
qemu BSP does this:<br>
<br>
XSERVER ?=3D &quot;xserver-xorg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;opengl&#39;,<br>
&#39;mesa-driver-swrast xserver-xorg-extension-glx&#39;, &#39;&#39;, d)} \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-video-fbdev \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
However as Alex says, we have virgl now.=C2=A0 Does this work on all qemus?=
<br>
=C2=A0Should we just change the XSERVER assignment to explicitly pull in<br=
>
the megadriver instead?<br>
<br>
The &#39;proper&#39; swrast driver *is* terrible, lets not enabe it by defa=
ult<br>
now we have virgl for qemu.=C2=A0 If a BSP wants to use it then they can,<b=
r>
but it&#39;s not something we should enable out of the box.<br>
<br>
Ross<br>
</blockquote></div>

--000000000000874832058b48aaed--
