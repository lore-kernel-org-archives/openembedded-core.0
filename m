Return-Path: <sbabic@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1572CC7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 12:20:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.11110.1685708441661340097
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 05:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=KwkLNx1U;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: sbabic@denx.de)
Received: from [IPV6:2001:a61:6143:6401:59fc:84b2:b547:73c3] (unknown [IPv6:2001:a61:6143:6401:59fc:84b2:b547:73c3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbabic@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 823CC847A2;
	Fri,  2 Jun 2023 14:20:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1685708438;
	bh=4QLnjSFqJBuNS/tPrWtseY1zUZ9hO9uJU6PTDGowGmQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=KwkLNx1UmicuFsPEb2KFXXvdO2SptvumaStHez2BSapAEIgbZVHaFQRBeec+GCsFe
	 QBuUjizHAN4d+NscDoaOKTruabf5hn6gCdaNd+YSv1m0d3fNe0GIS8730qJZ9s3OWn
	 3LZLiE0/CRbjtReLkx5re0ueayGQwQeY+Voj0jlnxEuc/s4O6IRzhC/Fei1hmTyJ9R
	 EGQwk62zSeQJleg873xT+6PWMWqXmtrfeFoMIHe586EJehzceGU716SD551V9hzrsg
	 Sc0L1QljeNBQm4R3K83pwXKOkvd39xszMjVRBCBu3WPKVDzYnKgFjW7jPbzoLuyh0j
	 SOGpxFG9qo9xg==
Message-ID: <c97eecc4-4b2e-76ac-5002-594bc6943d07@denx.de>
Date: Fri, 2 Jun 2023 14:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH] mtd-utils: export headers and libraries for MTD
 and UBI
Content-Language: de-DE
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Stefano Babic <sbabic@denx.de>, openembedded-core@lists.openembedded.org
References: <20230602112426.28353-1-sbabic@denx.de>
 <1c1b9977e8ef107c5469ba8a3a63b21fdb3a1729.camel@linuxfoundation.org>
From: Stefano Babic <sbabic@denx.de>
In-Reply-To: <1c1b9977e8ef107c5469ba8a3a63b21fdb3a1729.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 12:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182312

Hi Richard,

On 02.06.23 14:02, Richard Purdie wrote:
> On Fri, 2023-06-02 at 13:24 +0200, Stefano Babic wrote:
>> Mtd-utils has internal libraries (libmtd and libubi) that simplify the
>> usage and access, and they can be used by applications to access MTD
>> devices without reinventing the code.
> 
> Does upstream plan to turn these into a shared library if people are
> using them like this?

Not yet, I will push changes if this happen. I am not sure if tthis can 
be done soon: mtd-utils and these libraries are GPL-2 and not LGPL, and 
they can be used just by GPL2 compliant projects.

Best regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich,   Office: Kirchenstr.5, 82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================


