Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C48CD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 14:59:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.13563.1712156379945460687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 07:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R3ogFWmM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FB0C240003;
	Wed,  3 Apr 2024 14:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712156378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IrtwQ0WOmM4kDriA875+DT74RuhDaIv62pLPUy6uIdQ=;
	b=R3ogFWmM5TZGdlFw0hgt5U9JDoT6GmGiyjapfafnK8UJTjgOiAzdRF7/sBQmp8N3C1zfRz
	NxZQ+ySkaXxFSuqrTWmpIR50KfNwCE2eCqjPkbP/QM4HFNHxjA6QjEGB8XpJTTQIU2926a
	lG0p6UA4/nuPphXCOJxSyJvfgP+NK9lWxp8VgOBgtLHOEkweCPoPqVAT/dQC7+Ibqm+j7X
	8JIK5WGa4CEyq+BgNPbmIXt6AhFDCl7v0mg1pmrLTr7ARhtP3IxM9sIgIQ7ef8+uhUqg9F
	+f30ftMK+FU0oqG86Cg8BPLHFMZ4D9IIFkH97NeJuhPyaAWqIg7HoTOVX3rwJQ==
Message-ID: <997ee82c-be16-4562-b196-1aae40bb9284@bootlin.com>
Date: Wed, 3 Apr 2024 16:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>,
 OE-core <openembedded-core@lists.openembedded.org>,
 yocto@lists.yoctoproject.org, Ross Burton <ross.burton@arm.com>
Subject: Re: [yocto] [Openembedded-architecture] New mailing list for layer
 patches
To: pbarker.renesas@gmail.com
References: <8363E7C5-B3C0-4B3E-941E-762A400DF87B@arm.com>
 <1f92e19a-6e2e-43ed-b300-2d4f5cd4815b@bp.renesas.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1f92e19a-6e2e-43ed-b300-2d4f5cd4815b@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 14:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197921

Hi Paul,

On 4/2/24 at 10:38, Paul Barker wrote:
> On 28/03/2024 14:36, Ross Burton wrote:
>> Hi,
>>
>> At the moment if a layer doesn’t have enough volume to justify a dedicated mailing list for patches (see, for example, meta-arm@lists.yoctoproject.org <mailto:meta-arm@lists.yoctoproject.org>) then the convention is that the patches can be sent to yocto@lists.yoctoproject.org <mailto:yocto@lists.yoctoproject.org>.
>>
>> However, that’s also the list that we encourage users of Yocto to use for help, so the list has a mix of patches for various layers and people asking for help, which isn’t ideal: users who want help don’t want to be flooded with patches for layers they’re not using, layer maintainers may not want to see the requests for help, and people who want the status reports have to receive patches and support.
>>
>> The Yocto TSC has been discussing this, and as a solution to this we’ve just created a new mailing list: yocto-patches@lists.yoctoproject.org <mailto:yocto-patches@lists.yoctoproject.org>.  This list is specifically for Yocto-related projects which don’t have their own mailing list or other patch submission process.   We ask that all layers currently using yocto@ for patches move to yocto-patches@, so that yocto@ can be used purely for discussion and other non-patch related subjects.
> I think this is a great change, along with the new yocto-status@ list it will make things easier to follow :)
>
> Do you know if yocto-patches@ will be available via lore.kernel.org?

I've just asked them to index the new lists as well as these important 
ones which are missing too:
https://lists.yoctoproject.org/g/yocto-announce
http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
https://lists.yoctoproject.org/g/automated-testing
https://lists.yoctoproject.org/g/yocto-security

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


