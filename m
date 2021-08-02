Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.336.1627923343289060474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 09:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D1D071C0004;
	Mon,  2 Aug 2021 16:55:40 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] [PATCH] sstate: Fix rebuilds when changing layer config
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210801124856.3413781-1-richard.purdie@linuxfoundation.org>
 <62a315a0-5015-bd1f-3133-560ceaf051ce@bootlin.com>
 <c98abd643937b04a47744a4bdd0270f89eb098b9.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <60be955b-493a-25d4-c259-9f50cc64101f@bootlin.com>
Date: Mon, 2 Aug 2021 18:55:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c98abd643937b04a47744a4bdd0270f89eb098b9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/2/21 4:36 PM, Richard Purdie wrote:
> On Mon, 2021-08-02 at 15:30 +0200, Michael Opdenacker wrote:
>> Hi Richard,
>>
>> On 8/1/21 2:48 PM, Richard Purdie wrote:
>>> When adding a layer which changed SSTATE_EXCLUDEDEPS_SYSROOT, the state
>>> hashes were changing when they should not. This was caused by wider use
>>> of setscene_depvalid which means the dependency on the variable was seen
>>> when it was previously not.
>>>
>>> Exclude the variable since this should be be included in the hashes.
>> I realize that this variable isn't documented in any of the manuals.
>> Should be document it?
>> Thank you in advance for your advice.
> Yes, this should be on the list of things to document.


Thanks for confirming. I opened a new bug for this, now that we have a
special category for undocumented variables:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14496

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

