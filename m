Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5EA6AE0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 17:42:35 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id lj1so13008519pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 10:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=pJ4saPBdGnYTBvtDjJrF/d5Nazqmme4ShTHkvV89xck=;
	b=oIGux5gwhYDsWQhQxkt/5NwqFgpC2xn0WQS+gFns9J2E1dQeBXF+91zXlQiz8u3syc
	UgrT6UQ2UJLUmwW5VRxP2ivVyo/7WizGA6Yzw7zmcAoTFzSUiDu1g3jfEDxt0EMkN6TJ
	XWK0ob9aaJy1o7AYufSQ+Vqd6LDpc/kMIhewhW3+ZVA1KlAUoJJVj0sLcNLfdDBuZWce
	lb7s+Rnz1MVzsbUHZVkEb4NUarkZzXqvLsXJsw+rlHI8jR7wW8JxisZe118aoqIeBtMC
	3gXw52qj67IYueKmLfaRlL/J2fF+rhABXC1at2/w+i0qAndc0Th5uPRCDqlEW63WLaq9
	Ja/g==
X-Received: by 10.66.21.37 with SMTP id s5mr884178pae.103.1372182156235;
	Tue, 25 Jun 2013 10:42:36 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	eq5sm24182241pbc.15.2013.06.25.10.42.33 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Jun 2013 10:42:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51C9CE42.8020207@linux.intel.com>
Date: Tue, 25 Jun 2013 10:42:32 -0700
Message-Id: <56275DFD-34FD-49BF-B17D-79DBB877418E@gmail.com>
References: <51C9CE42.8020207@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Zhenhua Luo <zhenhua.luo@freescale.com>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>,
	Schmitt Richard-B43082 <B43082@freescale.com>,
	richard.schmitt@freescale.com
Subject: Re: GCC 4.8 Issues with fsl-ppc and fsl-arm (e5000)
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
X-List-Received-Date: Tue, 25 Jun 2013 17:42:35 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jun 25, 2013, at 10:07 AM, Saul Wold <sgw@linux.intel.com> wrote:

>=20
> Guys,
>=20
> There is a continuing failure on the auto-builder with the 4.8 version =
of GCC for the fsl-ppc and fsl-arm BSPs.  This is currently holding =
oe-core back from updating GCC to 4.8, which we want to do soon so that =
we have get any other issues worked out that might come up.

First of all these are not reference BSPs for OE-Core so this should not =
be a hold off if its urgent and we still have 4.7 gcc in OE-Core But its =
nicer if they worked.

>=20
> These seem to be ICE issues can get bee seen in the following log =
files:
>=20
> =
http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-arm/builds/1=
48/steps/Building%20Images/logs/stdio
>=20

perf is tied to kernel, it works fine with linux-yocto, what kernel is =
used for imx53qsb ? a preprocessed callchain.c will be helpful.


> =
http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-ppc/builds/1=
49/steps/Building%20Images/logs/stdio
>=20

gcc crash in eglibc I will take a look at it probably 2.18 might fix it.

> Has anyone investigated these?
>=20
> One possibility discussed during the tech call was to set the tune for =
these BSPs to use GCC 4.7, but this is not preferred as it just defers =
and hides the issue.
>=20
> Thanks
>=20
> --=20
>    Sau!
>=20
> Saul Wold
> Yocto Component Wrangler @ Intel
> Yocto Project / Poky Build System
>=20


