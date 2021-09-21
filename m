Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.7381.1632230414011057133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 06:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0E5A520002;
	Tue, 21 Sep 2021 13:20:10 +0000 (UTC)
Subject: Re: [OE-core] [PATCH V2] archiver: Configurable tarball compression
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ian Ray <ian.ray@ge.com>, openembedded-core@lists.openembedded.org
References: <20210921061517.8235-1-ian.ray@ge.com>
 <6c5ca68319e216177b75f0e3cb6ad8da0bcf8c25.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <0a03a86b-b4ec-a3e5-54a9-9007db9d2d3d@bootlin.com>
Date: Tue, 21 Sep 2021 15:20:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6c5ca68319e216177b75f0e3cb6ad8da0bcf8c25.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/21/21 2:18 PM, Richard Purdie wrote:
> On Tue, 2021-09-21 at 09:15 +0300, Ian Ray wrote:
>> In order to be more efficient, we use xz as compression method
>> to create GPL sources archives.
>>
>> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
>> [V1 was https://patchwork.openembedded.org/patch/155985/]
>> [Rebased]
>> Signed-off-by: Ian Ray <ian.ray@ge.com>
>> ---
>>  meta/classes/archiver.bbclass | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
> Would it be better just to move to zstd and rather than making it configurable,
> just switch to the better compression format?
>
> Configurability is good but where there is a clear good choice, it may be better
> just to do that rather than giving too many options if they aren't really
> needed?


I agree. We shouldn't add unnecessary complexity to the manuals ;-)

By the way, zstd seems to be marginally worse (+1%) than xz in terms of
compressed size, but is orders of magnitude faster (see
https://archlinux.org/news/now-using-zstandard-instead-of-xz-for-package-compression/).

I vote for zstd.

Thanks for starting the discussion.

Cheers,
Michael.

>
> Cheers,
>
> Richard
>
>
> 
>
-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

