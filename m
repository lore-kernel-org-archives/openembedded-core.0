Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 304756C3B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 16:20:45 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id v18so990955uad.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 09:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o9x0OLL+kOJVmDCgD8wOKV/008u6Eb66clFYh3lnTnA=;
	b=XD4yGlgAhcpwyYP1vQGbB7V8448XEpmI1rvBjYJo+ECHtwMPZ4dKpkm/whMPLRXvQp
	M9kBhMsAay6N99NSU2IXv3y6dzBqa+0/56uQIzLqcWcCTOFX/40jHykzpWktmlaDANi/
	My8RjqmDdS5M4AkPr4sN5ZzoS8qGJcRHbwYRC4ekskG9WION/oS0RLbZDAICwohkD6ql
	rDQzG1ClXSJkt/On1FcsrpnjW7AZQQPFZXGnNEUPTzsZmgytZpQTXgRZRQKV0k1UwTFT
	s31zW+eXheu7E1yevFdzOlTdg6h4FeMKDIBIHT+xCVxsZHW/EodRBh2wQVMU5+vonXgw
	XeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o9x0OLL+kOJVmDCgD8wOKV/008u6Eb66clFYh3lnTnA=;
	b=Kp+r5achz6Gv9rN15LNhVOQ1fa3LXahN1uwYs6BIfoAl0KYNWm36DgldlCJq3oO+3e
	7Uooxm1idNolk0ys4eI+huoRRb5g49DO2DVfx2DUqwNCFi8ekuI9FmcD24OTmGbT4rJV
	q32wZd4YJ1Wwq+Xudaao81qde3RVaCyib57JSj1Ch//UNgEgcDR+uDfEM90UuU4V6Zpb
	Q0i1gw9UHlhBqP0n5hAvqIoMQYOwghvIcecFGyQTwPN4pvEe+50+Hyvg1qYcjqSMG06p
	Lw6bZenjviXwIpGjuLoJDSF15T5W7sapM3i+AVB0e21ydiAnRVduQTkVbZ09b0mBMb7d
	WAKg==
X-Gm-Message-State: APjAAAXrjPxSoBwXME6SWjzhyCAHIfxpJKa40acKZMK+n8qXs2yqWiKO
	K9ZA6N/XLaHDQ7qkctcpFQyHDPMH3pxC/Hpeu5g=
X-Google-Smtp-Source: APXvYqwlOlAGgjm+TNOU8Ni+ehvl++JtDisLNWmQ1xPPwxxJwF8TQlKDw2YBbO0HvTm+imKp9xF6P2tzZJ/tA2LPCpg=
X-Received: by 2002:ab0:70c8:: with SMTP id r8mr3604740ual.89.1565886046129;
	Thu, 15 Aug 2019 09:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190814152613.46996-1-alex.kanavin@gmail.com>
	<20190814152613.46996-2-alex.kanavin@gmail.com>
	<23fcfd39e3626c222c41bda1e40099820d82da92.camel@linuxfoundation.org>
In-Reply-To: <23fcfd39e3626c222c41bda1e40099820d82da92.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Aug 2019 18:20:34 +0200
Message-ID: <CANNYZj8mODa0BZCFasxTgqu-CZmGYQYh8Kw-8tp8M86dwehs7Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] qemuboot.bbclass: increase the default RAM to 512M
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
X-List-Received-Date: Thu, 15 Aug 2019 16:20:45 -0000
Content-Type: multipart/alternative; boundary="00000000000089d55c05902a4183"

--00000000000089d55c05902a4183
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Aug 2019 at 18:42, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I'm not sure I agree with this.
>
> We are meant to work on embedded systems and 256MB should be enough to
> let us bring up X under qemu.
>
> I'm fine with some sdk/ptest images having more memory, that makes
> sense but 256MB not allowing X under qemu seems rather poor.
>

I poked a bit more at this. The main difference between vmware emulated
hardware and std emulated hardware is that X uses the standard 2D
framebuffer interface for the former, and the full 3D stack for the latter
(via use of glamor: https://www.freedesktop.org/wiki/Software/Glamor/). The
3D stack (mesa and friends) is what causes the memory usage to swell.

It is possible to disable this behaviour and enforce framebuffer usage (see
'man modesetting'), and I have verified that the RAM usage drops to similar
levels as vmware, but that is not the upstream default; they have more or
less obsoleted 2D drivers and are defaulting to 3D rendering nowadays. I'd
rather follow that.

Alex

--00000000000089d55c05902a4183
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 14 Aug 2019 at 18:42, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">I&#39;m not sure I agree wi=
th this.<br>
<br>
We are meant to work on embedded systems and 256MB should be enough to<br>
let us bring up X under qemu.<br>
<br>
I&#39;m fine with some sdk/ptest images having more memory, that makes<br>
sense but 256MB not allowing X under qemu seems rather poor.<br></blockquot=
e><div><br></div><div>I poked a bit more at this. The main difference betwe=
en vmware emulated hardware and std emulated hardware is that X uses the st=
andard 2D framebuffer interface for the former, and the full 3D stack for t=
he latter (via use of glamor: <a href=3D"https://www.freedesktop.org/wiki/S=
oftware/Glamor/">https://www.freedesktop.org/wiki/Software/Glamor/</a>). Th=
e 3D stack (mesa and friends) is what causes the memory usage to swell.<br>=
</div><div><br></div><div>It is possible to disable this behaviour and enfo=
rce framebuffer usage (see &#39;man modesetting&#39;), and I have verified =
that the RAM usage drops to similar levels as vmware, but that is not the u=
pstream default; they have more or less obsoleted 2D drivers and are defaul=
ting to 3D rendering nowadays. I&#39;d rather follow that.<br></div><div><b=
r></div><div>Alex<br></div><div><br></div><div><br></div></div></div>

--00000000000089d55c05902a4183--
