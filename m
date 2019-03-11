Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 56E8E6C45B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 15:19:09 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id e4so4369554edi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 08:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZtJshe98wTXNIZEEfPkJTqtVbkv4vCUAhLyh0e32YDc=;
	b=QyVUf1Mre9PTP8tVfZrX+GmDgk+GPvDcrlQqSlgEus17ZHfROegnkL09lvnJqkIXUH
	ZNDCXhYHLcRQ9XlmOArBGs5wGj/+M52wKQuduFZa++EmitlteeXDFASB09+NOCwJC68q
	ytpBNe0xsjNv3MohQANwybIFGyB0UWGKIDakw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZtJshe98wTXNIZEEfPkJTqtVbkv4vCUAhLyh0e32YDc=;
	b=mb0vYhgf/F1tOHvAk2QB7zSFk+/M31ULW/eAUuZrQhXCWGnBmcNmgey2FWTMY1pBmc
	r6H0xWWrpxKu+tXFhsOnoe9lVAlijY7u030I1ur89iJnJPXcrZNL2Sm/2oryivFU+3Vi
	49O5yuvVnq4IXMGyRQsLj450azq7BWdtX6jPMaNhAXCqm3MbCGlhnGnJVz+DumkGrrHJ
	YLIDD68Sl9iWh5K2x/XOGWEHgo8kepo33jeT21/zHumDcw0TKxyesE5nHVP5P/QyXK0E
	8EdOs+58IhOzQ/qnVPeDrmYTQW6Ek3IgphiKIneV7xz8T/0MmLOCLJbN8/RqEht2BPUM
	08ng==
X-Gm-Message-State: APjAAAUn0DTJzUgDTQwMwEdzSMd56GK/IzoJVSmQy9CMSHgVP16Mvz3G
	KVbb6zmXzDztOgg1u977JArMTxm+A2Y=
X-Google-Smtp-Source: APXvYqygmb+e+1gmy+BQQiIIKiOdOA6opCuZGPeuW7LWN4uPOTCyRgRulk6BqD/Xt2bt5tplcemYQg==
X-Received: by 2002:a17:906:3c3:: with SMTP id
	c3mr21601812eja.181.1552317549881; 
	Mon, 11 Mar 2019 08:19:09 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1401-8115-A47B-CFB7-48B5-2047.dyn6.twc.com.
	[2606:a000:1401:8115:a47b:cfb7:48b5:2047])
	by smtp.gmail.com with ESMTPSA id
	p12sm1535337ejr.58.2019.03.11.08.19.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Mar 2019 08:19:08 -0700 (PDT)
Date: Mon, 11 Mar 2019 11:19:05 -0400
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190311151905.GZ5026@bill-the-cat>
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
	<20190311150926.GY5026@bill-the-cat>
	<3303e413e766655231584cffd06b018f63bf4e93.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <3303e413e766655231584cffd06b018f63bf4e93.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] qemuarm: Swap for an arm7ve (A15) configuration
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
X-List-Received-Date: Mon, 11 Mar 2019 15:19:09 -0000
X-Groupsio-MsgNum: 122192
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rg893I9M3tK9A1lH"
Content-Disposition: inline

--Rg893I9M3tK9A1lH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 08:13:21AM -0700, Richard Purdie wrote:
> On Mon, 2019-03-11 at 11:09 -0400, Tom Rini wrote:
> > On Mon, Mar 11, 2019 at 03:12:26AM +0000, Richard Purdie wrote:
> >=20
> > > From: Jon Mason <jdmason@kudzu.us>
> > >=20
> > > Add new QEMU BSP for a Arm Cortex-A15 system and use this as
> > > qemuarm,
> > > moving the old armv5te Versatile PB based machine to qemuarmv5.
> > >=20
> > > The new machine uses the QEMU virt machine type, which should be
> > > faster to emulate and updates the qemuarm support to a modern
> > > architecture.
> > >=20
> > > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
> > Should we also not set UBOOT_MACHINE here to qemu_arm_defconfig for
> > the new machine?  We dropped versatilepb support back in 2015
> > however.
> > Thanks!
>=20
> For which machine, the new qemuarm or the qemuarmv5? I'm guessing you
> mean the latter?

For the new v7 machine that uses the virt machine upstream.

> We perhaps could/should but it isn't set now so I'd suggest it be done
> in a separate patch.

I see we aren't doing it for qemuarm64 either which is also supported in
U-Boot under qemu_arm64_defconfig, so yes, I'll do a follow-up to enable
in both of these.  And to qemumips* too.

> I would like to see u-boot being used in more builds but if we don't
> actually test/use the binary, its not so useful and that would mean
> further changes?

So, humm.  As a serious question, how do we test wic images / ovmf
today?  On the U-Boot side of things, we test all of our qemu images
frequently with our functional tests.  What we don't have atm is "boot
linux to login prompt" or similar.

--=20
Tom

--Rg893I9M3tK9A1lH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJchnxoAAoJEIf59jXTHXZSveEP/0l9CuyuWOfbOS9SlwBnXGhB
Vf1bnhaGoGlZKmzTZwuLjUDCpq8yIekzZ+vRXyh4PQjIG8YuPVW9zBoBDEh7vBnj
KFar+KuDs/ENiPC43KwDYJUE8UeRkpvlcDQmHdBDHi7zy5M+Yei9uLBpuNCNFDjP
6pcWHWaFUB5wrTwbYAQjidlMPsAHRzKSb2fQFubtuWXsbe0y2h2yrUBxEV9TeJUV
DnV4WF8Le7AYKrAw8zQGISjJO1JcibX7Dx6R78wcSdmWZX31TKykdIUZnYsOwEbd
EPwYZZNAN2Haln49LgbU1Ado2dq1oe5U3TEDDZ3p7RLfrf24b7qUGHLPH22M+Dvp
t17h2PzTf/xUa4i3rtfbW0ZA/hLYcP4Hp9iwP4FfJmxDZ8J01jYZB0lEZe+3bAvE
OZxuAXG7n/N/nJ6BI1uWJZqfJdjg1lROBiSfr2XjPvQbo6RQLiOGDnQWRGlt+iDC
VD+vpQAT7R0kKSL7ma3nY5Wg4Xvg9Cxv1CQUtqk3Og0tp5iRo/Lp0f3dmSw4QtG7
8E93DgdNh7GClcEN6gDS2rDYvseSbq9hYDO+BB/WR1eR6tdSryC7jMOqHHdd5Ge9
GGXTATd01VJTT0SkQVD4811Y6gBJxElfNLHfoLLIPfKUMD52r8EVxbhvLjDMnWpx
rzcG0wus7LvDugbhR8GA
=7dtu
-----END PGP SIGNATURE-----

--Rg893I9M3tK9A1lH--
