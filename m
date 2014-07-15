Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 698CB70623
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:19:37 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kx10so6065864pab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=PBrvtciJd2aPuXU2QQa6rgKw0HrlXeegOQYs+z9/DVI=;
	b=C+ytbE2GfU9VxzAgziIgr3wndztsGeLm9WKfcbIhpjQiCP9u8FxPXTaCWEajbpZYGx
	5Iz5hwavkupAsXnjn+m20NOLJ2c0eB0DaqhcleJv+h/LQiiBQYjEQDqw156w15Awi9Zs
	W9Tfz1fM/4mjimLOHvata7L4VHFRyqthonfF6b7yJbI/8P4SISp0/7EhArFMXn1oRrVn
	v7+KSp5JfEUsXl2SjoR3tdiql31Ey1u7Av1cthRbldIeOocHo4GCs4xg6wtH7gj+2HC8
	rFBeFZRGqS0BlJoWeWyKE4+xt01A/B+qAz2D8/3TarAnIlOUneRG8ZxAORkDA5TYKoER
	BHfA==
X-Gm-Message-State: ALoCoQkPnR8pD/Nw6YBTDPgZCYiAd7eIbuxl708Fa12m6wZRebnSWapGCI9mzeYTt7wKyL3T9f9k
X-Received: by 10.70.61.103 with SMTP id o7mr4373375pdr.134.1405437578442;
	Tue, 15 Jul 2014 08:19:38 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	kn1sm14280793pbd.13.2014.07.15.08.19.37 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jul 2014 08:19:37 -0700 (PDT)
Message-ID: <53C54687.6090501@mvista.com>
Date: Tue, 15 Jul 2014 08:19:35 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	akuster <akuster@mvista.com>
References: <1405430855-12398-1-git-send-email-akuster@mvista.com>	<CAJTo0LYfG4kCxWHbKK9rM7YScB2NAqVqmTVmMKpGb7UD7WE0Bg@mail.gmail.com>	<53C53683.7050107@mvista.com>
	<1405436945.20402.9.camel@ted>
In-Reply-To: <1405436945.20402.9.camel@ted>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nettle: update to version 3.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jul 2014 15:19:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard,

On 07/15/2014 08:09 AM, Richard Purdie wrote:
> On Tue, 2014-07-15 at 07:11 -0700, akuster wrote:
>> On 07/15/2014 06:49 AM, Burton, Ross wrote:
>>> On 15 July 2014 14:27, Armin Kuster <akuster@mvista.com> wrote:
>>>> Add GNUv3 license
>>> If nettle 3 contains GPLv3 code then we probably don't want to remove
>>> nettle 2.1, for people building without any v3 code in the images.
>>
>> They have what they call dual license in 3.x ( GPLv2 or GPLv3). We
>> certainly can keep 2.7.1
>
> Is it "GPLv2 or GPLv3" or "GPLv2 and GPLv3". There is a big difference
> and the LICENSE field needs to be set correctly (&& or || in the license
> field).



Looks like 'or':
<snippet>
    GNU Nettle is free software: you can redistribute it and/or
    modify it under the terms of either:

      * the GNU Lesser General Public License as published by the Free
        Software Foundation; either version 3 of the License, or (at your
        option) any later version.

    or

      * the GNU General Public License as published by the Free
        Software Foundation; either version 2 of the License, or (at your
        option) any later version.

    or both in parallel, as here.

- Armin

>
> Cheers,
>
> Richard
>

