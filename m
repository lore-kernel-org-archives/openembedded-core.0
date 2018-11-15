Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C74006C1C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 09:27:52 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id e3-v6so20396008wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 01:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gveP8J/FZU4y3tzEGn86lhTS4ZF05S8uS5XKNa+ELEg=;
	b=o3wQIRtI/RUFmaCm2EJaktLTVmAPVWcd3kC2liSAE8guYJrxKmAMFSPVcbPmHrCffX
	/9SwbEZcBcnhFNlcrD6BO3XKJJwnamsJlh8LXSP9JSxtwD+1nHfP69A5+CRx0Vvm7fp0
	iop/eyOMWsCDqR8NxBfBcQbS8F+JE6dcm+64lAmXzANND8gAd0ESeSCGvhCN5/VVmf3s
	bsgqQENFyjX6kGlSbUWZbmYSy8f6pT4iVOxbtmB0Psfhl1rf2NOh2+gMJp4nwjBI08aK
	yRw1a1/7K5JfvbCZsWla3l81i9vsrJp7YZgWNMEex63C56r3LDZB7L2qX6tBPFgtectX
	oUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gveP8J/FZU4y3tzEGn86lhTS4ZF05S8uS5XKNa+ELEg=;
	b=KeJIPp0Wf/jRuttmbZ8UC2duoRyWPiHrNSN3Xvnw8uSbdUUUk30KTAL1UvfFoYfOhm
	ZPhnOHFg3RjYKXEwWGjX7N/lIzZ1+2hxuH6e2SuihlTPvoM6oniOjTF85zechNfw7Oro
	8DhE9xSqfpr+5xSr1TqeYlqsyONJ2Yl+XVr5wOGmcW2TZcQJXUd2qBgmQDFpsUHvMHcp
	/N/Ai6tQp8C0yIeH8w+PwKNxI1VZwNhchqsvAOQ1r2UNqxF/D5GXnmaFyft2wR+QWX82
	JEM0Ft61ywRpLN4o41Q3RSLydsh+534ZZhyB7EfGE9+lkW2KwA8PbysyLJUDID5iw3ea
	3Xjg==
X-Gm-Message-State: AA+aEWbh0CX5frArkWj22BVSg2xy1vZYvAmDZUAvlv3eKVOm5SNvW4jX
	Y7JAqzar8Nt60326OlTgAdg=
X-Google-Smtp-Source: AFSGD/WUtH0jL2KgSr8u5iLL0XK7lN5c3qG3DVwu3w9uE8BynAYQIMdyjTANdpvjKaOfM44piOtj4g==
X-Received: by 2002:adf:f101:: with SMTP id r1mr1687622wro.32.1542274073358;
	Thu, 15 Nov 2018 01:27:53 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y7-v6sm18763180wmy.27.2018.11.15.01.27.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Nov 2018 01:27:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Nov 2018 10:27:58 +0100
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Message-ID: <20181115092758.GA1430@jama>
References: <20181115040043.9326-1-abrodkin@synopsys.com>
	<CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
	<2c011907-e4f6-2b16-e0b8-714db476130e@denx.de>
	<804b3db998a4d9efa0e9f8f649ea9741274be094.camel@synopsys.com>
MIME-Version: 1.0
In-Reply-To: <804b3db998a4d9efa0e9f8f649ea9741274be094.camel@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "marex@denx.de" <marex@denx.de>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 15 Nov 2018 09:27:53 -0000
X-Groupsio-MsgNum: 118247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 15, 2018 at 05:15:03AM +0000, Alexey Brodkin wrote:
> Hi Marek,
>=20
> On Thu, 2018-11-15 at 06:03 +0100, Marek Vasut wrote:
> > On 11/15/2018 05:57 AM, Khem Raj wrote:
> > > On Wed, Nov 14, 2018 at 8:00 PM Alexey Brodkin
> > > <alexey.brodkin@synopsys.com> wrote:
> > > > This utility is used for creation of images containing
> > > > usable in run-time U-Boot environment.
> > > >=20
> > > > As of today this utility is added per-board like here [1]
> > > > for Intel Edison board, here [2] for Altera's SoCFPGA and
> > > > I may guess there're others so instead of adding another one for
> > > > ARC why don't we package it for each and everyone.
> > > >=20
> > > > [1]=20
> > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__git.yoctoproj=
ect.org_cgit_cgit.cgi_meta-2Dintel-2Dedison_tree_meta-2Dintel-2Dedison-2Dbs=
p_recipes-2Dbsp_u-2Dboot_u-2Dboot-2Dtools-5F2014.04.bb&d=3DDwICaQ&c=3DDPL6_=
X_6JkXFx7AXWqB0tg&r=3DlqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=3DcK5ur=
AA7P2ER1AvKZdD3CEL5r23DwdtJ4Iohy_QCUSQ&s=3DVyVOHq5I3FsOXvOf7SQgVlwtTfKX0bN5=
ZmPPehjD-zw&e=3D
> > > > [2]=20
> > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_k=
raj_meta-2Daltera_blob_master_recipes-2Dbsp_u-2Dboot_u-2Dboot-2Dmkenvimage-=
5Fv2016.11.bb&d=3DDwICaQ&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3DlqdeeSSEes0GFDDl656=
eViXO7breS55ytWkhpk5R81I&m=3DcK5urAA7P2ER1AvKZdD3CEL5r23DwdtJ4Iohy_QCUSQ&s=
=3DTDPtpmofctGuP4dejRGli0SBUReQQPoiFQsWPHs4vV8&e=3D
> > >=20
> > > If this is applicable/works for all u-boot based machines then I thin=
k it makes
> > > sense to have it on OE-core.
> >=20
> > It is.
> >=20
> > > > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > > > Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> > > > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > Cc: Otavio Salvador <otavio@ossystems.com.br>
> > > > Cc: Ross Burton <ross.burton@intel.com>
> > > > Cc: Marek Vasut <marex@denx.de>
> >=20
> > Reviewed-by: Marek Vasut <marex@denx.de>
> >=20
> > That said, could the recipe for mkimage and mkenvimage be somehow
> > deduplicated ? There seems to be a lot of common stuff.
>=20
> I'd say why don't we just have one recipe for all U-Boot tools
> instead of adding tools one-by-one?

Or add:
    install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
    ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage

to existing u-boot-mkimage recipe, that's what I'm doing in
u-boot-mkimage bbappend.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW+08HQAKCRA3VSO3ZXaA
HCjCAKCV00NQWjUUeHveogNIwZtSv65LYgCbBt220U53BzuY/TigSgXwqf5OXWg=
=wlAm
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
