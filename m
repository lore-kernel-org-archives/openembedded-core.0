Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2E97B77D11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 19:50:09 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id a12so40296423ywh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ylmC100y5ieO0DzybwFrHA9L0clOJtjWalckefkCwVw=;
	b=rT/RomXuys2cNGAaSuZl4aRVttcTnsgzaYtGZeb70biA3wYZM7xbJOyhCyIydEXeBW
	AVDBNIz8IyaFssx1zQiVVXDpdA8KYFDNjzIcuZCn+8URJ8GVIJxTuxmK5OfBdnY/NNyb
	wuynscj+lrDDXFSFugzRSS4JbcgbqL/Wl+5/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ylmC100y5ieO0DzybwFrHA9L0clOJtjWalckefkCwVw=;
	b=hCCnrNlhrHwmRHKW00mSztigSQzD9CaA6r9IDkIM/D6zcsl1CEPaipnxZ0dHaiU7Gg
	gnS1Q5Or0eMVCw/JAmE7jbkCH5qbDNqGG37iaFReaTWIJwG32sh44mwAuYeD+c4ox7xa
	2//OEhHg5MBzO//+C8CX4IYZoC9GwU/BiAMja2s40wVIWvlqPC2UXa7aGkssylvypbah
	3yW16G/7AWs5UC6zBVfsvdW9TsIndq+XVV6W948qapKQq3rSVBiHIJV89+/X2ZaTrS/c
	uhimsXfxLDdaKQfFpDRlVz5ceJrRk5zSBWmTyygK1Htdm9UuLGPY6JLr/pczlwhZ9AVp
	3Zbw==
X-Gm-Message-State: AIVw110b+5Zzh+oAohMv1Yakf/JqY+YX3PIPJSSPtZcbMwGTOoGOGB9Y
	nr/44/vORabNYJN0
X-Received: by 10.129.141.74 with SMTP id w10mr2223638ywj.155.1499716211073;
	Mon, 10 Jul 2017 12:50:11 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133])
	by smtp.gmail.com with ESMTPSA id v3sm5310688ywg.37.2017.07.10.12.50.10
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Mon, 10 Jul 2017 12:50:10 -0700 (PDT)
Date: Mon, 10 Jul 2017 15:51:08 -0400
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20170710195108.GI22707@bill-the-cat>
References: <20170710183657.12885-1-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20170710183657.12885-1-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: marex@denx.de,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.07 release (WIP)
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
X-List-Received-Date: Mon, 10 Jul 2017 19:50:10 -0000
X-Groupsio-MsgNum: 99929
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vG+3nK3IAL7cgJXH"
Content-Disposition: inline

--vG+3nK3IAL7cgJXH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2017 at 03:36:57PM -0300, Otavio Salvador wrote:


> This patch upgrades the U-Boot to the 2017.07 release.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

FWIW, git.denx.de is now up to date and has the githash in question.

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--vG+3nK3IAL7cgJXH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZY9qrAAoJEIf59jXTHXZSDw4P/1ZekK/EqN6pbkb4RHmpDcAa
H/nc7wX8PNlhG0X0Wqir2qeHhgB8lc+NMkH6z47Eg27YM9v2FnBcgtKyLeraGEe+
tqZXFwqlFUdB2echSdrH+8yvp2GWu3t9R1EzKggDePcDaCT4ZnQO/gpbkTv+hPow
4Q8lH88cM4KFxfdlFFi5lkxa522NvCVDnObTuuhDPCODhJAnRn7mkX2zGnuq7QVh
pbL0Xnpmv+7e1ZkFPgukd07wveLCDQHG8N96ypANk4WpHE72CT+K0Jpzfhwv1jcI
BF/9zM8Ipy+i4sYe0DhPjOfNft8GvOsuBAEQEVOjrs19ut8xXh4S9i2VsAlYQA8V
+sZ0HIhFR++F7frbey9comURT1nXIpy6zHbXWUgKxr+nQVtMB1j7xful3YT2yJ7b
JMz42DQL7CgexhmCU7ZZBaE2UyoPwA07qHOJICJwe6qQa+Jdkh2+eJ9NCXqwzfQ4
9tGdhP3mXWNSBOXMnL3/n99oN+V8wfYup9dhL6VdIrxSv6j991Z88MDNCF0+uaIH
+kLQCzCZMlBIGc0HaMlCMXLIOGRV9gP/Fnm8wrMy7b/8VDUvM2qvQNo8zhicjfOc
UcxDXr4qe7HFjXvk200oC2x1y44LRkW8hnnVKlhKIa9GIE8SsTSVwS8nKd496O5N
V9VKyOlYDIKU38GaJeSd
=zMTS
-----END PGP SIGNATURE-----

--vG+3nK3IAL7cgJXH--
