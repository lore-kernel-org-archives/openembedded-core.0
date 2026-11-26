Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15592.1795705271731491895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 07:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=U7KOWcB6;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=w9jr4Wrf;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id B91D4EC0ADE
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 10:01:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 26 Nov 2026 10:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795705270;
	 x=1795791670; bh=eUNhAoghAz0uwWhdBCNlnbP1EI0O5AJm85r80FrM1bY=; b=
	U7KOWcB6y85zyPM9Ok0cES6ECbs7t//hl+0GKzmcLROo7uQrSpNuuioWTpjOyX28
	GH5qaVJxu90FKE+XJxfgXtyegOa4yI2ZPxoCpQGActzOM7uSSwoPtC05QcOWOzkT
	CSIkuKQNsCfdqiduBdGzT4zatgzfBJI6C8AxTeQVH7pveOeZNlNvpwt6ZH+SYjVl
	YGaHkm6R+ztRSuk2UmYe40S2d18IMLv0/H4UxjqctvUFaKhyKjVjDpeH5092nLDV
	mNeQkNl145pDWBOxlfcL6IwZm1hSncF/h5HMCVWayH0dXF9LIKMprJU06rH/KV21
	7uAkQ7UaTWkJzEMvs3iVow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795705270; x=
	1795791670; bh=eUNhAoghAz0uwWhdBCNlnbP1EI0O5AJm85r80FrM1bY=; b=w
	9jr4WrfhGYWltGguj9M8ridzmXBVl7CQFuS/2dvdgo/4ZhBU2grvqNTeqFroQ3Ge
	v0wzuxu5T8h5u9r9Hhn/WGOsfoejdmkymHhutXCnqnhyYxf7jumsCvSG0dSMx3uY
	rJDs20rd2Uj68FaCb2W3TWAukeo4JApKoQDRZ/2ae1oqbhKDfn8uGvm8GvsD+83S
	ybdzZfGdp7VI0i6toH3el9wphtlbeqFD1/JSnU7sfdEECLb4aXayCW6UnRGcel99
	wWUYMN3aAY8z70Bpf4NJYmM+kkRvCIGvCvrfBWBT58mptEopOger3t14dKSAJ5Bq
	mpWol3SSDUS8MZAESekLw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795705270; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:EDJLsci/vpaOicRVjjROjSDv6QolhEWe2F7RMxCId+XsZz4
	P2hLFpOAZyhIrAFoGL9HiEY0kIlyWkQeiByi0J5BEqIn38niHDdqUZOKHIyaNw8F
	hcSsDsffex9oknO7LQ3XdW2bwfyr9FGb0XzsfdoV9EJNpm4qQt4QWVE4+jrBo2Fc
	pxQ+zkSYunKROrdNpIFlMRlI/485j1GrUSBzNCmZQGUgIvJY8NSUNOdMo7SVeENZ
	KCgpNYL49Zi7Kkf/3vzQI2Ye6Y8z6nl3RiPsolzyElZfEHCcLZmCJYmpB1L+7QXD
	FuRpxf7RXpWHZuJZWKoDdxw13GUQNT2N/3q+3Zg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:7mXIGkpZjcbEXoFDB+8P/3BzBW1eEKXdIt+OonN0ksc=:23hzBeMXzE73+1utpxrfdeHi0772eY1Bm7wEviO4+2s=;
X-ME-Sender: <xms:tkkIa9KCctglcppSYv5a058vGtPsH6w-Af2QtFj-iD9mQXDQjrGPQQ>
    <xme:tkkIawlXtHFEr3knjrSgkUWnkDYzu9yPe2NR8m5tAJULYQqEHOQikWLjAB96JwZfc
    6aDHwFMwc2W9BNQk80FEymm-ZPOWj4fCpIoqs-5Ech7hqp9Mkmn6n78>
X-ME-Received: <xmr:tkkIazEtxa5DfrF1ay4rxL6kbdV49T8Ba50tNvfUnRGXTXbYgY6NXtTISJwR6E_vOob3DXyB_9t1cgMnpLop8iLWJ_lD>
X-ME-Proxy-Cause: dmFkZTGQBTx6T4Pm4CsXGhF0iuzIBwk6Km1wL14YLC9mPSY7R3/UBdFDnkQm35IdzeMGQG
    gPDecR0jx+u9ECaTtaerPTiujLcc/ViWf7In/s+MC+4GiUipjSEV1FwPaiZXK9A8gpmNtR
    kTQ+Q9ATNhln0PsQFI+sr+LJqkPhUgVV2I964jIqhhyEsYGVjrJ9jMT7NXz4yJfY5DUOjB
    c6TDrGHOxe1SQAEger6550XhVMqC0FAPm8qVtb0ikyX2iY6YDk7zrQ7uxJb0AkxjvVOpNb
    KcBIFSfmyoolj8NX1ZcAbCkARJnXB4jA2LIHcFmAu+xuDOmSTr4Ggci0Xrfwo2BJTes8ip
    0Zhts0xwRGYgY25hvruIhFkG85EuvRrNsAASKv7JgFM8rBzAfs9s8KcwEvTQvd67QO2a5k
    4Xfy262QBQxteJ9I2XFcB8Hrum6b8Z4tYpTnStpIj+LFPYhptoglb7Idv3dV5yDEo8MYfX
    LT4gQjTh/u2XcxLRJ8hFzOks0DFILk8K8kxo9vzsKneRXKdafGmAfvAeC68dU5P1I6kZWR
    x6FF4GfHyzOAHCppJnPHmhWP8SIcZBp4ZnOpQrjR/g0sUA+hguwhyONkGGitWEz13mkSC8
    kW7TM0KE5k1vbkaAW0n3Ef15baLahCkroY7tebWUo09nUfK5ZTpufSX0roOg
X-ME-Proxy: <xmx:tkkIa4HHhKDRxpnc9fBEY2FhPHnjFlEaQ7kVanU6b93y7vQm3VRpeQ>
    <xmx:tkkIa4NTFNeSEsZW-c9-s2pgJGgfzdYQYNSKeMp0KA6xo6dZesdUwg>
    <xmx:tkkIa_HBBHiBhuxO_qXya_zLUB3LuwdZG-_MQQo7qXW7gQTLthOBxg>
    <xmx:tkkIa3MjRJaWDIuPMcgf4ZXan4uov5PN1tdkA4cDuUJGc8u2sSwX2A>
    <xmx:tkkIa6-vOjFKVEw-9qeHbfb7psnR7qT5820jC7IsFycwsAyehfVJEfOP>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 10:01:09 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 15:01:08 +0000
Message-Id: <DN58E43X0JY2.H11X8K5K2H4T@pbarker.dev>
Subject: Re: [PATCH 2/2] zstd: add nobench, nocompress, nodecompress, nodict
 to PACKAGECONFIG
From: "Paul Barker" <paul@pbarker.dev>
To: "Antonin Godard" <antonin.godard@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261125-zstd-1-6-0-v1-0-95f50c6b9de6@bootlin.com>
 <20261125-zstd-1-6-0-v1-2-95f50c6b9de6@bootlin.com>
In-Reply-To: <20261125-zstd-1-6-0-v1-2-95f50c6b9de6@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 15:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251312

On Wed Nov 25, 2026 at 10:03 AM GMT, Antonin Godard wrote:
> Add PACKAGECONFIG knobs matching zstd's configuration knobs:
>
> - nobench disables the integrated benchmark module, which produces a
>   smaller binary
> - nocompress makes zstd compiled without compress support
> - nodecompress makes zstd compiled without decompress support
> - nodict compiles zstd without support for the integrated dictionary
>   builder, which produces a smaller binary
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  meta/recipes-extended/zstd/zstd_1.6.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-extended/zstd/zstd_1.6.0.bb b/meta/recipes-exte=
nded/zstd/zstd_1.6.0.bb
> index 6e4e07050a..cba70007b8 100644
> --- a/meta/recipes-extended/zstd/zstd_1.6.0.bb
> +++ b/meta/recipes-extended/zstd/zstd_1.6.0.bb
> @@ -25,6 +25,10 @@ CVE_PRODUCT =3D "zstandard"
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[lz4] =3D "HAVE_LZ4=3D1,HAVE_LZ4=3D0,lz4"
>  PACKAGECONFIG[lzma] =3D "HAVE_LZMA=3D1,HAVE_LZMA=3D0,xz"
> +PACKAGECONFIG[nobench] =3D "ZSTD_NOBENCH=3D1,ZSTD_NOBENCH=3D0"
> +PACKAGECONFIG[nocompress] =3D "ZSTD_NOCOMPRESS=3D1,ZSTD_NOCOMPRESS=3D0,,=
,,nodecompress"
> +PACKAGECONFIG[nodecompress] =3D "ZSTD_NODECOMPRESS=3D1,ZSTD_NODECOMPRESS=
=3D0,,,,nocompress"
> +PACKAGECONFIG[nodict] =3D "ZSTD_NODICT=3D1,ZSTD_NODICT=3D0"
>  PACKAGECONFIG[zlib] =3D "HAVE_ZLIB=3D1,HAVE_ZLIB=3D0,zlib"
> =20
>  # See programs/README.md for how to use this

Hi Antonin,

I think we can clean up the options that upstream gives us a little.

We don't like PACKAGECONFIG values starting with 'no' as the logic is
inverted. We should also be able to disable benchmarking and dictionary
building by default as they are rarely going to be used. I don't see any
case where people would want zstd but wouldn't want decompression
support.

So perhaps we need the following PACKAGECONFIGs:
  - `benchmark`, disabled by default
  - `dict-builder`, disabled by default
  - `compress`, enabled by default

How does that sound?

Best regards,

--=20
Paul Barker

