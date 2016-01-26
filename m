Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0056FF7B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 16:28:39 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id s68so64743414qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=AuLO+kqnzwLCDpq46+ZkxIt4wsHiHe3imluEhs6ixwM=;
	b=0AK9djpcZnodPGmxOaiC3VpmZ7uqIqfbXD1eXBaWsaQUX/HWEKKy8Y49R8z0M3qOmD
	hcc8/FGqcxWK60uz+7QT2I7IpcTUbsvxFHe9qrHQtmYnr8NPw5EMFOxTtWYdZlBVeDVC
	GvpWB+/EWoASiOuNEx88/tT+aOT8FaTAnCmy9fSetGN+5Ip9F3qmgflz9gJDN1fok34s
	8KP+kGObdZ1a6z+O3Q2eoQDktfTUzJS6+oPKPs08dSBplVKzYIqCBNz8nYUNrtUyRBjq
	cAVxpd2jdpA91UAtc6mn/6MJhGRzh1MrRcHVw68tGhFcCBjVwlve2pNgm1wAIvpI0A4q
	fhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=AuLO+kqnzwLCDpq46+ZkxIt4wsHiHe3imluEhs6ixwM=;
	b=BniPYVgHeAuGw9hABdzhg83Mok4QEcmd/fzkI1XO6wOwaHACKZIYCgwC/zzGePDcG0
	Sr+PJ0VsSF6OPqsa+e6d52zRxowAeyCOXlzuI5cE1MuMKjdli052A61tbqxySzKe08Ks
	OJf5Nj+ldZq0um85G9c1+ekM1ghcQloaFXZR9hZyXxl+QLCj3XIS+Jw9jbexKS6L0Sgv
	G/7GeadPJWE1L+Rm5y4wKhXk7YvwSN9FiKD3qzxLrdAwBo3bnotllde89FysnnmbnPfu
	fyQC2seWbOwB2Hdku8v35pMlk7GSaYt71Z+wHxiRCuwa3/8Wn7UfbW1352cVrOyqTt48
	chHw==
X-Gm-Message-State: AG10YORKIFXvXnfyccX+xTTUb6Fm0KUfmQxMMveFgYNb9OTwLpOuC9W0bbvyj33w/nLhdw==
X-Received: by 10.55.33.229 with SMTP id f98mr5131702qki.18.1453825720204;
	Tue, 26 Jan 2016 08:28:40 -0800 (PST)
Received: from [172.20.20.20] ([50.153.94.17])
	by smtp.gmail.com with ESMTPSA id
	n27sm7282615qki.18.2016.01.26.08.28.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jan 2016 08:28:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1037243108.4336.1453770172960.JavaMail.zimbra@efficios.com>
Date: Tue, 26 Jan 2016 11:28:34 -0500
Message-Id: <51287CFC-6F3C-43B1-9190-84F3B20C192E@gmail.com>
References: <1037243108.4336.1453770172960.JavaMail.zimbra@efficios.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
X-Mailer: Apple Mail (2.3112)
Cc: lttng-dev <lttng-dev@lists.lttng.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Bogus openembedded gcc patch
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
X-List-Received-Date: Tue, 26 Jan 2016 16:28:40 -0000
X-Groupsio-MsgNum: 76923
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2677B631-FCB6-4CAB-8353-1DA5EABE02F1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2677B631-FCB6-4CAB-8353-1DA5EABE02F1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 25, 2016, at 8:02 PM, Mathieu Desnoyers =
<mathieu.desnoyers@efficios.com> wrote:
>=20
> Hi,
>=20
> We are noticing the presence of the following patch in various
> openembedded gcc versions:
>=20
> 0024-PR-target-32219.patch
>=20
> "=46rom e0d15f4f8bf28c351b9215ca37f1caa24df0e1fd Mon Sep 17 00:00:00 =
2001
> From: Khem Raj <raj.khem@gmail.com>
> Date: Fri, 29 Mar 2013 09:18:54 +0400
> Subject: [PATCH 24/35] PR target/32219
>=20
> * varasm.c (default_binds_local_p_1): Weak data is not local.
>=20
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> Upstream-Status: Backport"
>=20
> However, contrarily to its "Backport" status, that patch is
> not upstream in gcc, and we're starting to wonder if this
> would be the patch that breaks handling of start/stop automatic
> hidden symbols we use in lttng-ust.
>=20
> We are only experiencing problems on the various openembedded
> compilers, but on no other distro (with same compiler versions),
> which leads us to suspect a buggy distro-specific gcc patch.
>=20
> We've been testing with openembedded gcc-4.9.2-r0.
>=20
> The original gold linker issue that this patch was trying to
> address seems to have been fixed in the gold linke since
> then.
>=20
> Refs:
> http://lists.lttng.org/pipermail/lttng-dev/2014-May/023112.html
> https://gcc.gnu.org/ml/gcc-help/2014-05/msg00042.html
> =
http://cgit.openembedded.org/openembedded-core/commit/?id=3D3cb2b003db7371=
b3a47d02c08352a262e1e419b4
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D15435
>=20
> Thoughts ?

OE has defaulted to gcc5 since last release, and gold issue is fixed in =
binutils 2.25
which is what we use in 2.0 as well so it might be OK to unbolt this =
fix. Although I am not sure
about the original problem reported in PR32219 is fixed for gcc 4.9 if =
we remove this fix.
Have you narrowed down your issue to this patch ? if not, then it would =
be good to do so

>=20
> Thanks,
>=20
> Mathieu
>=20
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com


--Apple-Mail=_2677B631-FCB6-4CAB-8353-1DA5EABE02F1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlannrYACgkQuwUzVZGdMxRNbwCeNGhVKoTwhyOySRAGpPID+xLQ
HusAoIgKdi9T/+D4SusXmbR/ALHB9t9R
=/Ibh
-----END PGP SIGNATURE-----

--Apple-Mail=_2677B631-FCB6-4CAB-8353-1DA5EABE02F1--
