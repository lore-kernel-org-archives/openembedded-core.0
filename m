Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.121.1630516218744465085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 10:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 01D9240009;
	Wed,  1 Sep 2021 17:10:16 +0000 (UTC)
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meta: stop using "virtual/" in RPROVIDES and RDEPENDS
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20210901092020.116142-1-michael.opdenacker@bootlin.com>
 <CADkTA4NCnTW5Zx=UJ9Lk0szNdJqENZyZL=pNJVmMXanBHEYr6A@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <a6875557-07cc-bda2-9742-026bd07c2084@bootlin.com>
Date: Wed, 1 Sep 2021 19:10:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NCnTW5Zx=UJ9Lk0szNdJqENZyZL=pNJVmMXanBHEYr6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Bruce

On 9/1/21 3:23 PM, Bruce Ashfield wrote:
> On Wed, Sep 1, 2021 at 5:20 AM Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
>> Fixes [YOCTO #14538]
>>
>> Recipes shouldn't use the "virtual/" string in RPROVIDES and RDEPENDS.
>>
>> That's confusing because "virtual/" has no special meaning in
>> RPROVIDES and RDEPENDS (unlike in PROVIDES and DEPENDS).
>>
>> Instead, using "virtual-" instead of "virtual/"
>> as already done in the glibc recipe.
> We have quite a few cases in meta-virtualization, where the same
> unclear syntax is used.
>
> I can take care of updating it, if you aren't looking at it already.


That would be great if you take care of it. I just covered oe-core and
meta-oe so far.

Thanks!
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

