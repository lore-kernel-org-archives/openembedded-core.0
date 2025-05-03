Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB80EC3ABAC
	for <webhook@archiver.kernel.org>; Sat,  3 May 2025 00:25:37 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.2692.1746231931698946136
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 17:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dDidG7oY;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5430PHSM3970731
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 19:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746231917;
	bh=Hs+UxwmCrgLY/mx3ivoFZMjz559tp896Lss2KES3BvY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dDidG7oYkS+/TYg/YLb38GJpVepFh70zeIztiDwu0Qm8F0YJHoKfmOkJ283gLm+yG
	 GsxQ/Fth/hTvoOlS/ehtNhICiufswHKu0psaiLUCcCs7LbHG5DZMvgCGYvqep++bLB
	 na9ZyubyJYPCl/0ZS3jt5ZVEfNwFfDxMDf47CT5k=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5430PHrX002253
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 19:25:17 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 19:25:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 19:25:17 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5430PHp1103310;
	Fri, 2 May 2025 19:25:17 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 2 May 2025 19:25:17 -0500
Message-ID: <D9M3JW9M65A5.AVEDF3HX1ANY@ti.com>
From: Randolph Sapp <rs@ti.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "ross.burton@arm.com" <ross.burton@arm.com>,
        "alex@linutronix.de"
	<alex@linutronix.de>,
        "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
        "kexin.hao@windriver.com" <kexin.hao@windriver.com>,
        "afd@ti.com"
	<afd@ti.com>, "detheridge@ti.com" <detheridge@ti.com>,
        "denis@denix.org"
	<denis@denix.org>,
        "reatmon@ti.com" <reatmon@ti.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "vijayp@ti.com" <vijayp@ti.com>
Subject: Re: [oe-core][PATCH 3/3] xserver-nodm-init: convert to
 virtual-emptty-conf
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250502202840.3148565-2-rs@ti.com>
 <20250502202840.3148565-5-rs@ti.com>
 <AS8PR02MB102011E1478A4001F07D73517EF8D2@AS8PR02MB10201.eurprd02.prod.outlook.com>
In-Reply-To: <AS8PR02MB102011E1478A4001F07D73517EF8D2@AS8PR02MB10201.eurprd02.prod.outlook.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 May 2025 00:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215930

On Fri May 2, 2025 at 5:10 PM CDT, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.=
openembedded.org> On Behalf Of Randolph Sapp via lists.openembedded.org
>> Sent: den 2 maj 2025 22:29
>> To: richard.purdie@linuxfoundation.org; ross.burton@arm.com; alex@linutr=
onix.de; otavio@ossystems.com.br; kexin.hao@windriver.com; afd@ti.com; deth=
eridge@ti.com; denis@denix.org; reatmon@ti.com
>> Cc: openembedded-core@lists.openembedded.org; vijayp@ti.com
>> Subject: [oe-core][PATCH 3/3] xserver-nodm-init: convert to virtual-empt=
ty-conf
>>=20
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> Convert this script package into a simple config for emptty. This is
>> capabile of using either the root user or the underprivileged xuser
>
> "capabile" -> "capable"
>
>> account based on the same ROOTLESS_X variable. The xuser will leverage
>> the nopasswdlogin session provided by emptty for automatic logins.
>> Runtime provide virtual-emptty-conf as we need to set parameters for the
>> default session.
>>=20
>> This also gets rid of the xuser security/capability override since
>> emptty sets up required components as root before decending into the
>> specified user. This does not currently handle loading of autostart
>> applications in "/etc/xdg/autostart".
>>=20
>> License-Update: GPLv2 scripts were replaced with MIT based config files
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>
> //Peter

Thanks Peter, apparently my spellchecker decided I was beyond saving this t=
ime.
Picked up these changes. Going to give it a few days before a v2 to see wha=
t
other feedback there is.

