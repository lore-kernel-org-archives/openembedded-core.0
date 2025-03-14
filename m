Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75072C35FF1
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 18:32:23 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.1435.1741977141467417549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 11:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=K/WaeUKd;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52EIWIGS1719684
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 14 Mar 2025 13:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741977138;
	bh=1jCJVpOTRuo1e7AeCBFiyhKhfIV+uvIEzuXBiv56b1g=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=K/WaeUKdQkZVexYUpvv+lku75i1JyjzCYPRJrOb+HLo+U8z9GohnTMyBNzmKEnrLZ
	 RmE+QsRVMJngtSTEVVd2Atmwkp/MA01vjybgM/qJLcyff+sjIWuyQiwgtqkCrgWqb+
	 Ffhy3s/COKPFojtFU4EFAYIZqFRJAD9A+08Ma/XA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52EIWI6C017469;
	Fri, 14 Mar 2025 13:32:18 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Mar 2025 13:32:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Mar 2025 13:32:17 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52EIWHOc100369;
	Fri, 14 Mar 2025 13:32:17 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 14 Mar 2025 13:32:17 -0500
Message-ID: <D8G7CXG09QRC.WGDHGSSIY06R@ti.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "gettext: fix a parallel build issue"
From: Randolph Sapp <rs@ti.com>
To: Ross Burton <Ross.Burton@arm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250314002937.672768-1-rs@ti.com>
 <20250314002937.672768-2-rs@ti.com>
 <4AC93975-A859-47DE-844D-C4AD653BAA5D@arm.com>
In-Reply-To: <4AC93975-A859-47DE-844D-C4AD653BAA5D@arm.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 18:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212857

On Fri Mar 14, 2025 at 1:13 PM CDT, Ross Burton wrote:
> On 14 Mar 2025, at 00:29, rs@ti.com wrote:
>>=20
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> This reverts commit e18fc96f9d4c0a0525c21371d3f36e8dfe008b35.
>
> Can you explain why you=E2=80=99re reverting a fix for a build issue?
>
> Ross

Sorry about that. Please disregard this patch and "[OE-core] [PATCH] bzip2:=
 add
libbz2.so.1.0 link for compat". I didn't notice my glob picked up some old
patches I was playing around with months ago. My bad.

- Randolph

