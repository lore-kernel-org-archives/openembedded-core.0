Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F774C00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 19:20:45 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.11046.1658863241676581670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 12:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BrzKc0+c;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3EFA7240003;
	Tue, 26 Jul 2022 19:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658863239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ToTWMOfUa4DExfOVthMT+iF/af6mSoG2+2wKs6Quecw=;
	b=BrzKc0+c4OEP/Gv+4Hnz6+cRp8CD+Oo/BjqNfXtBdrq7AvQAKYZohcPGbF8HPu/CAofdJs
	6rLB+TeYCCq23J21r0h9SWqqrCTa4MjrTKk26qa9ZN2KU06TsW/6V3EBWR116tXNYEunyC
	PGv5KmXNPX32RkgX0Y7cJOD7cCxHDwLQghaY0HA7lgSH0Bmmgn857rTNiKxTo7zU0WU6sO
	5zal+7bA06IuvntSsP7IR0lR9SNXy1DPX19Qnnyu+M5dlRNPpPM6UVLYSJqQ0vGLPonBHj
	I07EhcxraSEOFLd1OwTCkw1AR3ZARVvV7fJCl8mZSwGPbvUSTsgoI2ZAr7Rz8A==
Message-ID: <1c2f9104-e6e3-bb4c-1b68-8c7fdc68d62c@bootlin.com>
Date: Tue, 26 Jul 2022 21:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [yocto-security] OE-core CVE metrics for kirkstone on Sun 24 Jul
 2022 03:00:01 AM HST
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org,
 yocto-security@lists.yoctoproject.org
References: <20220724130244.94AB0962535@nuc.router0800d9.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220724130244.94AB0962535@nuc.router0800d9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 19:20:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168512

Hi Steve,

On 7/24/22 15:02, Steve Sakoman wrote:
> Branch: kirkstone
>
> New this week: 4 CVEs
> CVE-2022-2343 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2343 *
> CVE-2022-29187 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29187 *
> CVE-2022-30634 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30634 *
> CVE-2022-35414 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35414 *
>
> Removed this week: 0 CVEs
>
> Full list:  Found 19 unpatched CVEs
> CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
> CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
> CVE-2022-1183 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1183 *
> CVE-2022-1664 (CVSS3: 9.8 CRITICAL): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1664 *
> CVE-2022-2288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2288 *
> CVE-2022-2289 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2289 *
> CVE-2022-2304 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2304 *
> CVE-2022-2343 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2343 *
> CVE-2022-2344 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2344 *
> CVE-2022-2345 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2345 *
> CVE-2022-29187 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29187 *
> CVE-2022-30634 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30634 *
> CVE-2022-32205 (CVSS3: 4.3 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32205 *
> CVE-2022-32206 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32206 *
> CVE-2022-32207 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32207 *
> CVE-2022-32208 (CVSS3: 5.9 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32208 *
> CVE-2022-33099 (CVSS3: 7.5 HIGH): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33099 *
> CVE-2022-34903 (CVSS3: 6.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34903 *
> CVE-2022-35414 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35414 *


Hey, what about adding the link to status page generated by the 
autobuilder to these generated e-mails?
https://autobuilder.yocto.io/pub/non-release/patchmetrics/

This would help people to get an up to date status any time they want.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


