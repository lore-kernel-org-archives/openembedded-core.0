Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id DA9C27851F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:26:41 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id n79so1388563ion.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 04:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gUS7ELIwRbWKsCCJtZ0EfVywMggZHiX5kzutN4l0wbI=;
	b=FqIsEslzUCpZ3NKtuSxG6kf2DDERWnWlKqfgwQ2wGGKMqcprQPsVYdEbnc0EWImYvj
	AE2+eluYI0q6eebO64Ny6luWIi+m/tZuCusjoQWW9fSLI1jo1GS9DJQD8cyKRjFXXJbh
	+nLqudZibpCHlNofw2okD8ug05jfrqjb43JoWUWL+ZdjH97pqguzzFcm5oDdXBxCPlx4
	q0z2H4s8YVJfVyW27Pfoqy2v4TK/aWJQNhF8zXpBB8q1zRXkWuiFct+mFFEUkWot2IKK
	I0TXe8pRDSV9VFe/ExYV+3SMzE1VZzPv7wuP/TUxZcOwbe58WNG5kqJ85Ay1TdPv0J/V
	6tjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gUS7ELIwRbWKsCCJtZ0EfVywMggZHiX5kzutN4l0wbI=;
	b=RShm51VhWP6z4dzsZl4eGmAblYfEUKpU7GjC2pGke9gZHWtt1atNscodY95pFswX5I
	lE4Yjra8NQp+9vfbe2UDSRImOQOCzOGywRZMULFxZa7UjRrBOOBTrODi7BWXwTxjnOh3
	5BgtnSsj7WJNCm0ebwyZaMIqQXDBLsbcmnbl7U19vD7Li+RQ/5l9Sb8OQ/mIc054Aefy
	fiV+mZRBqxZRNQRiaUSQkYUDaKaCWFm1kt3iOkWzEmuwInrTigWtVkmT5uZO7FUfZdkM
	L3GkwMX5bczhaown0jyz1XYfLCnDMiCQ5hUY2qLCaWgsalmeOqSpdhXqvpjA2y1bAdkp
	bcEQ==
X-Gm-Message-State: AJaThX4bjvtkmR2If8SlsV6omuHjrPIz90KObzH1bI5IDe2eFYoyBlIB
	oHdZUOOIO/Yj5SPCplXmsbSCHOhzhtFMiVUytCxx9A==
X-Google-Smtp-Source: AGs4zMZX6GC4BPpX8npBiAbZTL25sRr1RYdT1kjeR8bPhUmBlKg63W5Dhd0D0MBeSTTGM4Z4z+vMQCcLM7mXZ0JD96k=
X-Received: by 10.107.146.86 with SMTP id u83mr18525377iod.37.1510748802539;
	Wed, 15 Nov 2017 04:26:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Wed, 15 Nov 2017 04:26:22 -0800 (PST)
In-Reply-To: <CAP9ODKow3s0rXMmkVYM5b5jsgG-70GnXZkHMK1WxaFSUTA-c2A@mail.gmail.com>
References: <1510594546-27018-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAP9ODKquk8Cf-chkGCRTpPurE+ABQZgzgAs=3M4hp0qV5NMWug@mail.gmail.com>
	<CAJTo0LaNR-YLyCX=wHTS42XimeJrfhCWwCmm-hKCwNRkJ1KFmQ@mail.gmail.com>
	<CAP9ODKow3s0rXMmkVYM5b5jsgG-70GnXZkHMK1WxaFSUTA-c2A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Nov 2017 12:26:22 +0000
Message-ID: <CAJTo0LYfAYZruf=9WYFqD2ae2==LdTGwayFeXPxtQ7ROPm-T2w@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Nov 2017 12:26:42 -0000
Content-Type: multipart/alternative; boundary="94eb2c054fa6b87a1c055e049d3b"

--94eb2c054fa6b87a1c055e049d3b
Content-Type: text/plain; charset="UTF-8"

On 14 November 2017 at 17:16, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Hello Ross,
>
> On Mon, Nov 13, 2017 at 5:55 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > Can you explain why?
>
> We are using QEMU ARM for runtime tests on CI for updatehub, on this,
> when we run something that required entropy just after boot and
> especially if running inside of a Docker, it fails badly for 140s.
> Adding rng-tools solves it :-)


Are you enabling the virtio-rng driver so qemu can bridge the host entropy
into the guest?

Ross

--94eb2c054fa6b87a1c055e049d3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 14 November 2017 at 17:16, Otavio Salvador <span dir=3D=
"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_bl=
ank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Hello Ross,<br>
<br>
On Mon, Nov 13, 2017 at 5:55 PM, Burton, Ross &lt;<a href=3D"mailto:ross.bu=
rton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; Can you explain why?<br>
<br>
We are using QEMU ARM for runtime tests on CI for updatehub, on this,<br>
when we run something that required entropy just after boot and<br>
especially if running inside of a Docker, it fails badly for 140s.<br>
Adding rng-tools solves it :-)</blockquote><div><br></div><div>Are you enab=
ling the virtio-rng driver so qemu can bridge the host entropy into the gue=
st?</div><div><br></div><div>Ross</div></div></div></div>

--94eb2c054fa6b87a1c055e049d3b--
