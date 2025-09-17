Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F56CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 18:25:14 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.31257.1758133506100398284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 11:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=upqAJIZU;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HIP1hi1673085;
	Wed, 17 Sep 2025 13:25:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758133501;
	bh=A3EOap4oOsXbUCMdgXS0CHDUXxJPbNg5mf1vltLJ710=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=upqAJIZUA2l+n7mHRrz82oIJdDhByh7XXSw6K2igHw2yTVUYFvbUrd4fbRRPUcdkL
	 VKuY5uNMftvLwbyrgTfjmRfzleX/9R7vK5yr5A3u/xtkRV8M8WQO7VynIEKrQSdnAg
	 FbO2SoZ78Mm7+lEwUmzVlJE0NrB6cdPR/0Hp+9FQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HIP1Pr2545982
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 17 Sep 2025 13:25:01 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 13:25:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 13:25:00 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HIP0dm3495103;
	Wed, 17 Sep 2025 13:25:00 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 17 Sep 2025 13:25:00 -0500
Message-ID: <DCVAB83KANXB.3DT780UK0CKPK@ti.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: Patchtest results for [oe-core][PATCHv7 2/6] go: fix sigaction
 usage on i386 platforms
From: Randolph Sapp <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <patchtest@automation.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250910212855.2480561-3-rs@ti.com>
 <010101993599e96f-c5965afc-45bb-4c4c-b4d5-a9072245169d-000000@us-west-2.amazonses.com> <DCQLKFDJKMYF.1R7OO62UHIKFX@bootlin.com>
In-Reply-To: <DCQLKFDJKMYF.1R7OO62UHIKFX@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 18:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223614

On Fri Sep 12, 2025 at 1:10 AM CDT, Mathieu Dubois-Briand wrote:
> On Wed Sep 10, 2025 at 11:48 PM CEST, Patchtest via lists.openembedded.or=
g wrote:
>> Thank you for your submission. Patchtest identified one
>> or more issues with the patch. Please see the log below for
>> more information:
>>
>> ---
>> Testing patch /home/patchtest/share/mboxes/PATCHv7-2-6-go-fix-sigaction-=
usage-on-i386-platforms.patch
>>
>> FAIL: test Signed-off-by presence: A patch file has been added without a=
 Signed-off-by tag: '0001-runtime-when-using-cgo-on-386-call-C-sigaction-fu=
nct.patch' (test_patch.TestPatch.test_signed_off_by_presence)
>>
>
> Hi Randolph,
>
> Have you seen the above message? I believe this is indeed an issue with
> this patch, so I haven't took your series so far. Any thought?
>
> Thanks,
> Mathieu

Yeah, I saw it and addressed it. Figured I would give it a bit of time befo=
re
sending an update. Didn't want to spam the list. If nobody reviewed it then=
 I
guess I'll go ahead with the update.

