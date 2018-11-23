Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id ECD306C835
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 11:13:23 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id c206so9699329oib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 03:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UPRVNHR/snwLOVchIs151eiDRyU9REUM0mRJjkOTNco=;
	b=oM/FT9ud9x6XDm8QZ49g2+9imbqtSpSuJI3EAAx8V2cK3nhhUpfE/Fv14KmivCeLif
	5qqCVJK1jQON5/Ioz5jNudbXVUSJRoqkuW13/L9oNVpbVcfdhKtmoI/5NkI2POIt/6lo
	loxxFlL4kwXGyzauz73Sy9RZuO5zTK7cGd31+CeACmqkZaO2xjY1tMseQfGOy/1dbzCe
	C5Cqm0C0Tl6QNTrSp+t5r92zL/Q+hx7G8kh1+R3dMGr8gAIoeuW3VOIhBlDB7oDyWmXx
	52qZDZw8CUmPuRReNssYdYB7jEB38OQmkPqkFcgTeRB0HHccpP/XrOllvSIw1Vd3I9dx
	0G6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UPRVNHR/snwLOVchIs151eiDRyU9REUM0mRJjkOTNco=;
	b=GSZhzFY9OaDuimqdSG+HkC/LUYPrvrqZUA5El6B0Pmy3OyKnqyLcCxqIIa/7tGs5qB
	xLMz5EIQxrFcPCNaVcoC0mk5I9E671N7efkOhrUAwd9GGi+Lqv2HblJeizuJTAMb2m5v
	O6p/Go8HRvCXckekRFPK4QenuoDUNKqTOyElW1HvuF54yJ7Qp1HXslJSeqgPbIM+iGV8
	RyDwnvxtGrxF9vCmYgsJ6r/n4L59hlzbPgZmOdaj9Pd5viaPSm0DX/PBKzeXgQcVN9Jj
	Ax+WyPk6RBY6f5Zkori/6RudsKYB3jQLm0i/f3ESoohgsAcpr2TckMDQODy4okbc212c
	J8RA==
X-Gm-Message-State: AGRZ1gKZNDloPBq+hpvFKWQXB+SN27pfFecRCvdp+taV+9wGdX4GPv71
	p/Hr2cO5EWJDOdHhT6Eq6nL9IAqfyfJG7QGuo1OKzQ==
X-Google-Smtp-Source: AJdET5fImISKHek9FyQ+BLF8D5bOuHTcrg3lr3EigQ0GB5r+ybWOxa6nUX4pM7wxSsjx895fWPbZReGm1sIkhiN0n10=
X-Received: by 2002:aca:e691:: with SMTP id
	d139-v6mr7761112oih.232.1542971604982; 
	Fri, 23 Nov 2018 03:13:24 -0800 (PST)
MIME-Version: 1.0
References: <33D4DBCAC5F2D74E96B07F6E7632BF73B1B9F4B3@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B1B9F4B3@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Nov 2018 12:13:12 +0100
Message-ID: <CANNYZj9o9QvEBwg8sthFmNLFhpUzht8k2Hx-N4juM6LJFyYjLQ@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [question] rpm: nss problem on arm32be
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
X-List-Received-Date: Fri, 23 Nov 2018 11:13:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Nov 2018 at 08:55, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
> When I use rpm on arm32be, I found a Header SHA1 digest problem as follows:
>
> # rpm  -qpi test-manual-1.2.3-20181012.noarch.rpm
> error: test-manual-1.2.3-20181012.noarch.rpm: Header SHA1 digest: BAD (Expected
> f1deb7dc4a10742d88ccd1e967dbc62ae45095a5 !=4ad9d7dad6d70d6086eefec62612ad5d77f2fe81)  => this value is wrong
> error: test-manual-1.2.3-20181012.noarch.rpm: not an rpm package (or package manifest)
>
> I found it is caused by the hash of nss, if I rebuild rpm with beecropt, this problem will be fix.
> diff --git a/meta-ubinux/recipes-contrib/rpm/rpm_4.14.1.bb b/meta-ubinux/recipes-contrib/rpm/rpm_4.14.1.bb
>
>  EXTRA_OECONF_append = " --without-lua --enable-python"
> +EXTRA_OECONF_append_armeb = " --with-crypto=beecrypt"
>  EXTRA_OECONF_append_libc-musl = " --disable-nls"
>
> but I don't know why rpm with nss can't work well on arm32be, does anyone know the reason about it?

Most likely because nss upstream doesn't test that configuration? You
should probably report it there.

Alex

