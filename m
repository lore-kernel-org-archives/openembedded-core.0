Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFD56C341
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 19:08:37 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id z2-v6so13017739ybj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 11:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3qLVj1jpsZGkWFF1ZdbqxkwT+RXRrfD4TdG0+q7ZzNU=;
	b=O6MELkxra+YSpzkXIzrdcjeVucHFCXK5ysRnSogVl6LR+ChvXopdUQ/cujLB0K3MnT
	gB/RaT1wUUH50tbDWHPZaQsjpATV4SiUVMnlGR97sw758uvZEpCjNZBV4/7z9vkiGOZQ
	JQr4vER0SR9rMBH6Ec6Sp7JR0cevpdNpe8kFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3qLVj1jpsZGkWFF1ZdbqxkwT+RXRrfD4TdG0+q7ZzNU=;
	b=JsODFMKvOZ6233SRUPe9m/Mvfsrf8ayFxscmXMf6x0gV5DVGIUOkUDcTTP25+IdTF7
	z1ytQ6zk6KoJttGtlavn6A2V6NvJdRKOztKzdtEzokOUZkzOyF/ldBFRmJxy8ErN1o7T
	QOsXxDHM1cLy4Xt1XONyeZtj792ueJdO03zG288R5E6jcmfwAHALLD6T3TWROvYExmZs
	jmiuqbWtnTwq7xCuRlLzayO+2GpCcpYSV5CIj3zrQhZyHFuY50kvys1XbegGWQ7GZX9N
	/4k0Jr4+dWT4h8HlIz/TblUYCog5G2xJIlSh5I0K5l0SBR814H8Q8Vr08ZytVb/NZYzb
	b2LA==
X-Gm-Message-State: AGRZ1gLVy0LHUSX4yDV4hM8QH/LxDMfkIgvHEMQu64mX2p8xBUtvxsPl
	obGoZ9GKCfzIXCXk5tBR3ztPSw==
X-Google-Smtp-Source: AJdET5eHxHYlq384z6linzLT5qVafgcKCIYhbRSEFZkb+5BB3+MVcUEKhUHWcIWMYBJylB3WjeRkpQ==
X-Received: by 2002:a25:b944:: with SMTP id
	s4-v6mr21782504ybm.130.1542654518220; 
	Mon, 19 Nov 2018 11:08:38 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
	by smtp.gmail.com with ESMTPSA id
	x127-v6sm10041071ywf.28.2018.11.19.11.08.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 11:08:37 -0800 (PST)
Date: Mon, 19 Nov 2018 14:08:35 -0500
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20181119190835.GO11247@bill-the-cat>
References: <20181119100443.2882-1-abrodkin@synopsys.com>
	<1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
MIME-Version: 1.0
In-Reply-To: <1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Mon, 19 Nov 2018 19:08:37 -0000
X-Groupsio-MsgNum: 118360
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kWzmbpYiBEY/UHFh"
Content-Disposition: inline

--kWzmbpYiBEY/UHFh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 19, 2018 at 01:51:41PM +0100, Marek Vasut wrote:
> On 11/19/2018 11:04 AM, Alexey Brodkin wrote:
> > This utility is used for creation of images containing
> > usable in run-time U-Boot environment.
> >=20
> > As of today this utility is added per-board like here [1]
> > for Intel Edison board.
> >=20
> > [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/me=
ta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> >=20
> > Given there're quite some U-Boot tools that we may want to add later
> > this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
> > still for compatibility we provide "u-boot-mkimage" with help
> > of PROVIDES as well as proposed "u-boot-mkenvimage".
> >=20
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: Otavio Salvador <otavio@ossystems.com.br>
> > Cc: Martin Jansa <martin.jansa@gmail.com>
> > Cc: Ross Burton <ross.burton@intel.com>
> > Cc: Marek Vasut <marex@denx.de>
>=20
> Do we want to generate one package per tool or not ?

I think so, yes.  Not all places will want all tools.

--=20
Tom

--kWzmbpYiBEY/UHFh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJb8woyAAoJEIf59jXTHXZSQkEP/jecr3R7rD/Dl/r42z8XbPIp
CLVO/eTMTSPWvF+HY5cgvAPVywNvS+GdGPqxHsorvy3sAV3HZ/e/6ROFYvEQENfg
fr3HHpGDEQh/t8HEqHW7HcPc0HzzhH+ZjA9EhD5hFrcSBvEz/GbQXJeVf9XA7sPz
GAHwLcqUB1H5KGyQQLJ5NdcNgdRKgayNYlrHQhplu2EXAcxMnf0qnCOodtXiAlwP
bpY0cyGBN6bw1RJG/ROjjunYzV36Nlao1XnTDeDL4ZkDSfWLwW/p9kFkA3NEBa1z
bSGzuJLxVsozzwZvmeidz239lgnM+AP43xmaZxfvyM7ASPjBZxVur8r9EFBf3Up9
PyY7X8S9Q6nZ+f79av3hFmKCznTx2hin0q7+T/+N6Xlh2R2EeAkQQuJWJ5jCrjU4
OCVbCeKehKIk0rYBokwUN7yfPlxypXcZxtUT1JxV1IF7tTzS1TppnFz8U/k8cZtk
yNBIhhiRqh+WXjIALDEq1+6PKkfUo1jQWsv4tXUX2nIQbsmG7z0KC5ZNOYSb4Abu
os+EE6a6Q1Ba1g+e06zIniJceKP0gM7AiPTtAXY7aAYJ4BYuOj3cutJt1kA4AZPn
O0OvQ1Ok9gU7qK6SEZpySNFj6TVzOvvrtdIy8Z6KkZvSlmYg+uMSQEBSqrdlo4Hx
sYs3Jy39ogolB8ZkIB0J
=LMu3
-----END PGP SIGNATURE-----

--kWzmbpYiBEY/UHFh--
