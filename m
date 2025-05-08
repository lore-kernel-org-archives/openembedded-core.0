Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72444C3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 20:39:57 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.6401.1746736793993267003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 13:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PkNbsRjn;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548KdUAE1970972
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 15:39:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746736771;
	bh=RZ8TFumDph+nkv/M7W6MltmUi+2H2JbmfFRPPEiAtzU=;
	h=Date:To:CC:Subject:From:References:In-Reply-To;
	b=PkNbsRjnbWm5pPf4SLZS3aqedC+nD35vc6sXE82ynIP1r27xiY5ZR9V3gbnodWOEy
	 eF9XQe0JTyw7Wqt21Bb1399fZyta8WrV/3Kwa1HApYKVgCY7mGY0S5ZhI6dDsW4Xfs
	 OE2Nxn4376r2/ts8l3nwqjSWD0w2M/7cTqCdbAG8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548KdUwv081396
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 15:39:30 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 15:39:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 15:39:30 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548KdUjc075490;
	Thu, 8 May 2025 15:39:30 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 8 May 2025 15:39:30 -0500
Message-ID: <D9R2IAEKL6IZ.37PWD38041XCA@ti.com>
To: <rs@ti.com>, Alexander Kanavin <alex.kanavin@gmail.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv2 0/3] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250505224801.3181046-1-rs@ti.com>
 <D9OWUBHID8JT.3FJEJAXYPMT2W@bootlin.com>
 <D9PGBHDAZ7RF.16SWU58NCK9NV@ti.com>
 <CANNYZj8xD66nTL7=oJr8fqknYyDjU+kjkY8i8Kok7xVH6tciTw@mail.gmail.com>
 <183D59758C0F13FA.9842@lists.openembedded.org>
In-Reply-To: <183D59758C0F13FA.9842@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 20:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216163

On Wed May 7, 2025 at 3:42 PM CDT, Randolph Sapp via lists.openembedded.org=
 wrote:
> On Wed May 7, 2025 at 8:37 AM CDT, Alexander Kanavin wrote:
>> On Wed, 7 May 2025 at 01:03, Randolph Sapp via lists.openembedded.org
>> <rs=3Dti.com@lists.openembedded.org> wrote:
>>
>>> Ah, this is the first I hearing about the gnux32 triplet. Well, that is=
 being
>>> filtered out by COMPATIBLE_HOST in the goarch bbclass. Some of those va=
lues seem
>>> to be invalid now (powerpc64 is supported upstream). That being said, I=
 don't
>>> see any mention of the new x32 ABI upstream. Not entirely sure how to a=
ddress
>>> that at the moment.
>>
>> There are two options:
>>
>> - set up the x32 build as specified in [1], replicate the fail, tweak
>> COMPATIBLE_HOST as needed (in a separate commit) and see if any
>> further issues come up.
>>
>> - correct [1] to no longer build core-image-sato for x32, and replace
>> it with core-image-full-cmdline, reducing x32 to non-graphical
>> targets. It's been a controversial target for a long time, as no one
>> has ever seen actual usage of it, and there's been a stream of
>> graphical related crashes and build failures. We keep it around for
>> now, but I'd fully support dropping the graphics and leaving only the
>> console images.
>>
>> [1] https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.js=
on#n867
>>
>> Alex
>
> Alright, well I did a little work poking around go. It has no understandi=
ng of
> the x32 ABI currently. Dropping the x32 tests from core-image-sato to
> core-image-full-cmdline can work, but that does mask a bit of a regressio=
n.
>
> As useful as a display manager will be, I'm not sure I can justify that m=
uch of
> a regression for an entire ABI. I know the linux kernel has debated about
> dropping x32 support a number of times, GCC seems to be the only compiler=
 that
> has fully implemented it, and Yocto is one of 3 listed distro solutions t=
hat
> currently support it. Still feels a little rough. I don't know.
>
> Anyone got any strong opinions here?

Well, I guess we'll go with a old fashioned scream test. Let me know if the=
re
are any other issues that need to be addressed or if I need to resubmit thi=
s
series if the following is accepted.

https://lists.yoctoproject.org/g/yocto-patches/message/1539

