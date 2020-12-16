Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.10651.1608135915213207873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 08:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Aq3GN8gY;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [meta-oe][PATCH v2] iproute2: split ip to individual package
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608135914;
	bh=OhKQBZW4SiP/WhgPTZ8M5RqRhJjx6O0Mb7HDSI6OMj4=;
	h=From:To:References:Date:In-Reply-To:From;
	b=Aq3GN8gY7bZ3t3GpLeXswbmuLlnlKetnZBFaIi8KfbBbBX62bC1NsqsCPdFlkIxEO
	 IBTIFF8W6x25u37I25KMrihK02Ny+DAntqf7dOtvMhLZtR3BRFG8hxnI+vqLcMC5m/
	 RXXo8tgKnrj6FTOFGO0zhHPngFjgE2veAfcBNHtULGXjmc+0elz3+eRRWd9jYX/WLG
	 gyNPZHGU3UK2zB59XfLA8a34F4ibtgyngSDfdH3NXUheEdCDTKl5rkmbJq2pbjl4zK
	 sMyiiggdhurB0l5yjmhJtz31YMkbMr1kCaFNEY1yA0Ft0A99Yq3Cwqq9HYC7D2UndH
	 JW05Gn0hQpVFQ==
From: "Sinan Kaya" <okaya@kernel.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20201216024141.22439-1-okaya@kernel.org>
 <fdfd532cceb2c81874e4a0ac6a9a27014a14808a.camel@linuxfoundation.org>
 <16513E431D142AE6.31352@lists.openembedded.org>
Message-ID: <df8eef45-e48a-5fc1-8b54-40c31baf6a37@kernel.org>
Date: Wed, 16 Dec 2020 11:25:12 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <16513E431D142AE6.31352@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/16/2020 11:09 AM, Sinan Kaya wrote:
>>> +PACKAGES += "${IPROUTE2_PACKAGES}"
>>> +PROVIDES += "${IPROUTE2_PACKAGES}"
>> This doesn't look correct. Why do we need to add all the individual
>> package splits to PROVIDES?
>>
> I want to add iproute2-ip into my IMAGE_INSTALL and not take the rest
> of the iproute2-$foo packages. If I don't add PROVIDES, build stage
> fails saying nobody provides iproute2-ip.
> 

Interesting, it worked now. I queued some builds on my side. I will
post a new REV.
