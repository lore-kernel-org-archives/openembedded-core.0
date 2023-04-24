Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793C7C7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 15:32:52 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.54912.1682350362801853465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 08:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=m32UII2W;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33OFWYwj008552;
	Mon, 24 Apr 2023 10:32:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682350354;
	bh=uhikrs+ZD2hp3Drx74+m6IBMl2TojV0VOXBU25TIl0Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=m32UII2WaKTcQXvq1TQ9J5Gdzbp0b3Avf7BW0LASD0/FXP3WqjwpDnGJtIfzt9w7o
	 gKD4o6OnXjm4gVSqCgl/pgSs5zancjSn/yYYPQjk4O5GdAIiYuA6lgXL0WQBldWO1z
	 iuNwRj/jdwCDTBuWZjN+vbuNwPPlg4YFGxszTrOU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33OFWYij117219
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Apr 2023 10:32:34 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 24
 Apr 2023 10:32:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 24 Apr 2023 10:32:33 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33OFWX2p021373;
	Mon, 24 Apr 2023 10:32:33 -0500
Message-ID: <51022390-b911-5b8c-36bf-3ddb13263826@ti.com>
Date: Mon, 24 Apr 2023 10:32:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [OE-core] [PATCH v2] wic/bootimg-efi: if
 fixed-size is set then use that for mkdosfs
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
        "Randolph Sapp via
 lists.openembedded.org" <rs=ti.com@lists.openembedded.org>
CC: <zarkakareem@gmail.com>, <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>,
        <openembedded-core@lists.openembedded.org>
References: <20230421212613.3660730-1-rs@ti.com>
 <20230424104813.79ddd2bc@booty>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230424104813.79ddd2bc@booty>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 15:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180358

On 4/24/23 03:48, Luca Ceresoli wrote:
> Hello Randolph,
> 
> On Fri, 21 Apr 2023 16:26:13 -0500
> "Randolph Sapp via lists.openembedded.org"
> <rs=ti.com@lists.openembedded.org> wrote:
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> As you can see your sender address has been mangled, and as a result
> the patch is rejected by the the openembedded git server. This is not
> your fault, but we need you to modify your git configuration to prevent
> this from happening in the future. Have a look at the wiki for more
> info and how to solve that:
> 
Ah! Thanks for the heads up. I've just adjust my configs.

> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity
> 
> I'm taking your patch for testing on the autobuilders, fixing it
> manually so you don't need to resend your patch this time.
> 
> Best regards,
> Luca
> 
Cool, thanks!

