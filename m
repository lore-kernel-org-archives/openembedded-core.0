Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id AAAF77FDED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 12:29:28 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w15so5816168wru.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 04:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=xNZYu4Z9bpIYudPO7G/IumvHwK72bSSePGXnsiV1XJw=;
	b=j9ByZmOLzGKIlZpaoBHF1bhZRSVxvyhI9dQ+OzAnboxbojFuW52TyVzwLIedrextev
	M6jg2xWx8bEVZFWEw1CIV3GEWDyy7Fb3nlPST2s9VVuaPuMv+e2E153zhpFGowMIic5H
	N/lnfVEP464efBORXUTALUt5lI16A5PooGvdrXjeLvCLN3S+v0NDXf5nI4GIw5ioVpnQ
	8uQzDjgoZf0y8V/YsAqafExvccOHC3DVPpNWyL1w8Rd67QPqeakTjv/fXb9sHl4KZwrv
	GZurXUebmo8RzgngA4q+RT1rkM+En32dChOIueT5mue+Q7IHYfoBD1GLuIfQARUjn7lS
	duxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=xNZYu4Z9bpIYudPO7G/IumvHwK72bSSePGXnsiV1XJw=;
	b=G2fqhldlCDmODT1U2xb+r5oYAZ9X5CDANqAxaX2lkdXLonb8YI4FNVJZgRkDuamJFj
	CN/ybpS5VnQ7fMvjUntuqPEDrwNC+T0zZKEh52+jsWaOGKaK04YFdaEcYh1fmpzkKXau
	9oTerp0Agnl14WJYbaz0paK1de55hkVL3L7DQ2VBAOcVWFImj02MqG8Vnt11yq1S+9Yu
	hUDEUWKA6xCM6GLuNaHDoYcRXRQ0nHXCJx9tY1hyjbY8CrdZ27OAi6UB7sgHQGtl7csf
	PXBOhXldfDb8SRmWwerNfNCl8UnofaHhBglWsoFnxHngBAkLVrw2bTkVcvbzgU+bADbD
	wFjQ==
X-Gm-Message-State: APjAAAWDvpIzeM5rRLfnyqCqBruBhr+Agu9+OG4LQgBjkcDqsPLqk/yl
	UhfE3vC8wzhI2hxfl8MsEYRbsUHZ
X-Google-Smtp-Source: APXvYqzn54/E0zqwwrx+7jT4Scv2Qn24GFduD3MUX/w0WLQzTnBtmhwHr4a/lUCLS7roVxEx7K+zyw==
X-Received: by 2002:a5d:68c5:: with SMTP id p5mr9396741wrw.193.1576758568862; 
	Thu, 19 Dec 2019 04:29:28 -0800 (PST)
Received: from ?IPv6:2a01:598:b106:ffe1:8c7d:fd13:cdde:58e4?
	([2a01:598:b106:ffe1:8c7d:fd13:cdde:58e4])
	by smtp.gmail.com with ESMTPSA id
	c195sm6541578wmd.45.2019.12.19.04.29.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Dec 2019 04:29:28 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <20191219122722.85234-1-shohei.maruyama@cybertrust.co.jp>
Date: Thu, 19 Dec 2019 13:29:27 +0100
Message-Id: <46F6C987-BA29-466C-8435-654A8ED4E2F7@gmail.com>
References: <20191219122722.85234-1-shohei.maruyama@cybertrust.co.jp>
To: shohei.maruyama@cybertrust.co.jp
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2][warrior] qemu: Add PACKAGECONFIG for glusterfs
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
X-List-Received-Date: Thu, 19 Dec 2019 12:29:28 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Please send a patch for the master branch first.=20

Alex

> On 19 Dec 2019, at 13.27, <shohei.maruyama@cybertrust.co.jp> <shohei.maruy=
ama@cybertrust.co.jp> wrote:
>=20
> This commit adds PACKAGECONFIG for glusterfs. glusterfs is not required f-=

> or runqemu, so it should be optional to reduce build time.
>=20
> Signed-off-by: Shohei Maruyama <shohei.maruyama@cybertrust.co.jp>
> ---
> meta/recipes-devtools/qemu/qemu.inc | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/q=
emu/qemu.inc
> index 202134b3d8..e917a96241 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -160,5 +160,6 @@ PACKAGECONFIG[virglrenderer] =3D "--enable-virglrender=
er,--disable-virglrenderer,v
> PACKAGECONFIG[spice] =3D "--enable-spice,--disable-spice,spice"
> # usbredir will be in meta-networking layer
> PACKAGECONFIG[usb-redir] =3D "--enable-usb-redir,--disable-usb-redir,usbre=
dir"
> +PACKAGECONFIG[glusterfs] =3D "--enable-glusterfs,--disable-glusterfs"
>=20
> INSANE_SKIP_${PN} =3D "arch"
> --=20
> 2.24.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

