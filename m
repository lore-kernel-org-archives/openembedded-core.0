Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.11571.1608138569169118649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 09:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=c0ICP/2E;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [meta-oe][PATCH v3] iproute2: split ip to individual package
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608138568;
	bh=FtjFphtuGW1fZnKmqY9uCyU/iPW7jjTFR0E6XoGb25c=;
	h=To:References:From:Date:In-Reply-To:From;
	b=c0ICP/2EdS1Pgvxb6Jj51Q+ZktGEv89x8W5IuC3KwO4KiNTZoLkF10mdn3sMMHuh/
	 LyFnpYe/Qfp+fQbgZpvAi/EaqJTbPrJBcohvdwl1als/0eR7qPDiKt4DEeEJFXu0xf
	 Yxt5oZxLdg8/3jUMqzqAvi9CjgzCqrDV1oiF0DuO2hyoTJTd13G+SP0w0bedFFIpPn
	 czUZEo6bskLRwI+4+t6HAWLbXYSaUe6/qJqYG43FipWBLP6+Ocr1palmVnj233y5xb
	 L2+RZ2kzf21Axw5/KcfdRZHlQjPoiquiAzYmBh+K1MNeoVm3zkZ5U4zDieXeKIbcwQ
	 HDl6SipgJM2FA==
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20201216164510.9823-1-okaya@kernel.org>
 <497c9433b74b13fc96510739deb4b41d2ea2fd5e.camel@linuxfoundation.org>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <284464d4-6bc6-f70a-4c5e-630cc9fc13b0@kernel.org>
Date: Wed, 16 Dec 2020 12:09:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <497c9433b74b13fc96510739deb4b41d2ea2fd5e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/16/2020 12:00 PM, Richard Purdie wrote:
> I accept there is a case for splitting out ip, the patch now splits out
> every binary though? That isn't what the commit message says...

I thought of going all the way to split everything since I'm here.

Is your preference to keep ip or have individual packages for the
remaining ?

I can adjust commit and name accordingly.
