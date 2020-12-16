Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.116.1608139524119821848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 09:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=VIKytJ2v;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [meta-oe][PATCH v3] iproute2: split ip to individual package
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608139523;
	bh=CGBWg7dQS9b74RuTqFAksdXy+uHssYHovL6eTRzbYYU=;
	h=To:References:From:Date:In-Reply-To:From;
	b=VIKytJ2vgHhZnGbYSucAyF3Fe6tO44KJh0RQERPLQrOyMO2P75GSKAKHMEJuccmcu
	 Otq+J7OrsrVE+8voXjSds9TuczgelQBpoqyGP+pcGttjbS5KhUa9in/tXgm8q8W1dK
	 2Lz3/N3HHlePpbzWm/jrRNKVQHfw6nQKY3GTcBTBAD9BtJe51KnQTvlVS/D18GdHXz
	 nWI7oFPI1x8b8FEQmXiX6BR0rdo/fpMIt/ycXEZSNHpmh2kqGSxM3e86K5yVskRibz
	 xf2fTbn9WuH4Sca6GVdhbhtTRO3b33KzPirbVOdsMZLn3/aqfA432j5dBGEQDxpUvz
	 mbz5n8Sl7VXlA==
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20201216164510.9823-1-okaya@kernel.org>
 <497c9433b74b13fc96510739deb4b41d2ea2fd5e.camel@linuxfoundation.org>
 <284464d4-6bc6-f70a-4c5e-630cc9fc13b0@kernel.org>
 <2857cf4f91605b6862b75096610e1f77779695e6.camel@linuxfoundation.org>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <e751ce84-b089-71cb-5bbd-38a94c11219c@kernel.org>
Date: Wed, 16 Dec 2020 12:25:21 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <2857cf4f91605b6862b75096610e1f77779695e6.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/16/2020 12:24 PM, Richard Purdie wrote:
>> Is your preference to keep ip or have individual packages for the
>> remaining ?
> I have a very strong preference for only splitting the things we need
> to split.

Sounds good, I'll rework.
