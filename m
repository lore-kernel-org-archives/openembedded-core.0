Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 704786E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 13:11:45 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id z74so5172723iof.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 05:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c1yHbzN6dx+X5acKCy1JRrBNUvn4A95Eiha4NvyKD9A=;
	b=zX5cARNgD4ONg/EfQAneurvnBKsMRKuEo/WJ5CxhAyeEISBlauACfOp2+uT0buDxTj
	U9s09ru14lSHQfKuTlB27AlZSRXHVi/Qq5Wdn75Eemuoc/qDL6foe8K++m62e28H4+WQ
	qEs0vfsqFNLhuYnNpBJx00aZkPEzWLVMF8C8JxtaHrebX89UFp1ky90B4NBNqUIdb9he
	mlSgQWvfwinLhLeNhHPVlRI3N5fkcH4AbwFRndepvWLUiLERuNaMaC9tJwi7fRiATqoX
	o2SdGejueqDp1S3Cmvcn88/040D2KbedkJKdSDm4fgnN2VLQdtwNvNVuumMZQQr2Z9T0
	We9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c1yHbzN6dx+X5acKCy1JRrBNUvn4A95Eiha4NvyKD9A=;
	b=Y3WIy1nNRPZWWq0HOvQdm45kewEVF8m0JaYUOsoR6FIS/Y5IYhjH9ls/F7ppcTaLyM
	r3mB2o4lfHNQrkXtri4X4jSn6dj/r4utxxghRy8W7LH/sqAYC0oseh7BcOp+zgoMj+bg
	YCWJLi1fhSRRP6FCmcwW/hQ+w1laQZGRMp/DSAr7A4ObdnYNWUNQl1AAyryQ1M4apEho
	m0JEr7Rc33fl2UzqEjGAwoTp8rkh6+lAQWTmWOwhj7ttXO4NAjAiHiLqlpkIAAhBGNA6
	St0EVqJx4N/a/getLdLBRe45Iqh5lbnZZPZsWRtFonTLHAcL5Sx8pQomXqyBg+Fhdp+4
	5p8g==
X-Gm-Message-State: AJaThX5rJDN/96AmtTfyUpjUk3Ox+Dr640NK7Rg720zmn+SEcpAs9akP
	kP1BbTwvODJ9b2AJxFJwdEq0WKJpLWc6e4Y8EsivbcMM
X-Google-Smtp-Source: AGs4zMYkuJWwMaM2tmFCiuLzDIi67jHj6NXMWiSqRq2/XDD6m2KazvPsQvsQ5gJeqNqEVRTj+LFvIpopH9RaOhuuhOI=
X-Received: by 10.107.178.145 with SMTP id b139mr1568190iof.52.1510837905513; 
	Thu, 16 Nov 2017 05:11:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Thu, 16 Nov 2017 05:11:25 -0800 (PST)
In-Reply-To: <CAP9ODKqxjDsS34yZ1G0h1wRvZ2QGfOD2rr=+2DG1KGuwcePmTQ@mail.gmail.com>
References: <1510594546-27018-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAP9ODKquk8Cf-chkGCRTpPurE+ABQZgzgAs=3M4hp0qV5NMWug@mail.gmail.com>
	<CAJTo0LaNR-YLyCX=wHTS42XimeJrfhCWwCmm-hKCwNRkJ1KFmQ@mail.gmail.com>
	<CAP9ODKow3s0rXMmkVYM5b5jsgG-70GnXZkHMK1WxaFSUTA-c2A@mail.gmail.com>
	<CAJTo0LYfAYZruf=9WYFqD2ae2==LdTGwayFeXPxtQ7ROPm-T2w@mail.gmail.com>
	<CAP9ODKqxjDsS34yZ1G0h1wRvZ2QGfOD2rr=+2DG1KGuwcePmTQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Nov 2017 13:11:25 +0000
Message-ID: <CAJTo0LZX253PH2xBQOANZ5rJ35wvDGKO7We2s-XBJjZy594GPA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu.inc: Drop rng-tools
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
X-List-Received-Date: Thu, 16 Nov 2017 13:11:46 -0000
Content-Type: multipart/alternative; boundary="001a114ca162abf48a055e195cbe"

--001a114ca162abf48a055e195cbe
Content-Type: text/plain; charset="UTF-8"

On 15 November 2017 at 19:59, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> > Are you enabling the virtio-rng driver so qemu can bridge the host
> entropy
> > into the guest?
>
> I am not. Do you have an example of command line for it?


 https://wiki.qemu.org/Features/VirtIORNG talks about qemu's support and
what to turn on there (the default qemu machines enable that).

http://elixir.free-electrons.com/linux/latest/source/drivers/char/hw_random/Kconfig
documents HW_RANDOM_VIRTIO and says at the top that the devices feed into
the kernel pool.

Ross

--001a114ca162abf48a055e195cbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 15 November 2017 at 19:59, Otavio Salvador <span dir=3D=
"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_bl=
ank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><span class=3D=
"gmail-">&gt; Are you enabling the virtio-rng driver so qemu can bridge the=
 host entropy<br>
&gt; into the guest?<br>
<br>
</span>I am not. Do you have an example of command line for it?</blockquote=
><div><br></div><div>=C2=A0<a href=3D"https://wiki.qemu.org/Features/VirtIO=
RNG">https://wiki.qemu.org/Features/VirtIORNG</a> talks about qemu&#39;s su=
pport and what to turn on there (the default qemu machines enable that).</d=
iv><div><br></div><a href=3D"http://elixir.free-electrons.com/linux/latest/=
source/drivers/char/hw_random/Kconfig">http://elixir.free-electrons.com/lin=
ux/latest/source/drivers/char/hw_random/Kconfig</a> documents HW_RANDOM_VIR=
TIO and says at the top that the devices feed into the kernel pool.</div><d=
iv class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Ross</div></d=
iv></div>

--001a114ca162abf48a055e195cbe--
