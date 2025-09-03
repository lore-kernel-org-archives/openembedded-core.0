Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EB4CA1012
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 23:57:36 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.27698.1756943854537403411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 16:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ngQYKVTR;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583NvFZm3377706;
	Wed, 3 Sep 2025 18:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756943835;
	bh=kW+9U3IZubgfwlx1SFA2+AuvK9s30fcvsSErJpO+fWE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ngQYKVTRGaBI/VILQJTk2tRdXda8WCSvtb4elbq+UcrVewk0tiaTuVkl4J50avqj0
	 psnWPtKzckLSB+41UBYvPITX+ZdXh6gJ6RB3X/tzXLkDBOJ5MzBniBStHsdwt4erRn
	 g937dMZTbafPN7W7/gl1fzMFLy43eHhgshThCALg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583NvFOW3888915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 18:57:15 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 18:57:15 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Wed, 3 Sep
 2025 18:57:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 18:57:15 -0500
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583NvFYe2365567;
	Wed, 3 Sep 2025 18:57:15 -0500
Message-ID: <a6c34937-dc30-449b-b4d5-75c505500b97@ti.com>
Date: Wed, 3 Sep 2025 18:57:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [OE-core] [master][PATCH] libsdl2: Add tests
 package and ptest support
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: <openembedded-core@lists.openembedded.org>,
        <mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>
References: <20250827222051.367093-1-a-christidis@ti.com>
 <CANNYZj9E1JB2tdWMUL_fz_rjyACSyw9pDAsJDQH4eJtEUC3c5Q@mail.gmail.com>
 <9316e8d2-0ee9-49b6-b645-1c7db8a21df9@ti.com>
 <CANNYZj9-kQEjc_3BiZK2PaFkimKNVmw4Nijdt9oeV7szE-iQcg@mail.gmail.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <CANNYZj9-kQEjc_3BiZK2PaFkimKNVmw4Nijdt9oeV7szE-iQcg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 583NvFZm3377706
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 23:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222887

I'm about to send a v2 of the patch, I'm going to put my thoughts here:

On 9/3/25 7:46 AM, Alexander Kanavin wrote:
> On Tue, 2 Sept 2025 at 17:=E2=80=8A20, Antonios Christidis=20
> <a-christidis@=E2=80=8Ati.=E2=80=8Acom> wrote: > Moreover, having the t=
ests in a=20
> separate package allows users to easily > include them in their=20
> filesystem without having to rebuild the entire >
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczhAu0BQayXPU=
P0olvN75LhXkzNe47Xria24XTS9579FCRTzKSpEtnSjV_XpryRBCT0_RcgdO14WAihF0O6xEm=
DhbBFOuEfufIFcK3tHa1IKqjAO6Iius84$>=20
>
> ZjQcmQRYFpfptBannerEnd
> On Tue, 2 Sept 2025 at 17:20, Antonios Christidis <a-christidis@ti.com>=
 wrote:
>
> > Moreover, having the tests in a separate package allows users to easi=
ly
> > include them in their filesystem without having to rebuild the entire
> > package with |DISTRO_FEATURES| including |ptest|. This is particularl=
y
> > important since rebuilding with |ptest| enabled in my experience can
> > cause a significant increase in build time, as it often triggers the
> > rebuild of basic package dependencies.
>
> You can enable ptests per-recipe by setting PTEST_ENABLED =3D "1" for
> that particular recipe only (via bbappend or distro config).
>
> > I do agree with the placement of tests being non-standard, do you hav=
e
> > any suggestions on elsewhere to place them ? Aside from
> > |/usr/lib/libsdl2/ptest/tests| .
>
> Once again, if you want to install the tests, and upstream does not
> currently install them, then you need to write a patch for sdl
> upstream that does it and get it accepted. Otherwise, what this change

Missed a cmake configuration parameter that does the above, so now tests=20
are installed under |usr/libexec| and |usr/share|.

> is doing (installing the tests ad hoc) is entirely non-standard and
> deviates from what upstream expects, and as such the tests would
> belong only in ptest package, but not in the test package.
> Openembedded, as a rule, does not cherry-pick items from the build
> tree in do_install because they might be useful to someone, with ptest
> the only exception.
>
> > > This should stay as PACKAGECONFIG, and be enabled subject to ptest =
in
> > > DISTRO_FEATURES.
> >
> > Looking over other packages that have ptest support, they often
> > automatically build tests without the need for setting PACKAGECONFIGS.
>
> This lengthens the build times and increases disk usage, and is
> wasteful if the tests aren't actually installed and packaged. Other
> recipes aren't always perfect, or they build components that do not
> have a way to disable tests.

I would like for the tests to be built automatically, without the need=20
for a |PACKAKECONFIG|. I don't think it is a good idea for a ptest=20
package to depend on another package that conditionally exists=20
(PN-tests). What I mean, there's a dependency on the PN-ptest (enabled=20
via DISTRO_FEATURES or PTEST_ENABLE) and PN-tests (if using=20
PACKAGECONFIG). The recipe would be over complicated if I were to=20
introduce all the logic required to make sure the right packages exist=20
at the right time.

The build time increase is negligible. No comment on disk usage, as=20
yocto is not disk usage friendly to begin with. All recipes create=20
needless packages, the |PACKAGES| variable specifies packages like=C2=A0=20
PN-dbg=C2=A0 PN-doc. I would agree with you in not automatically building=
=20
packages if the tests took an insane amount of time to built, but that=20
is not the case, or if they required additional dependencies .... etc .


To anyone else reading this, what are your opinions on ptest dependency=20
chains like the above.

> Alex

Antonios


