Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.8482.1620303289633033381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 05:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from [10.0.0.10] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C3DBC1C000B;
	Thu,  6 May 2021 12:14:47 +0000 (UTC)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] sanity.bbclass: mention CONNECTIVITY_CHECK_URIS in network failure message
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20210505175614.66322-1-michael.opdenacker@bootlin.com>
 <20210506092523.puuhdp77ho3egljd@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <2c3fd721-3822-8620-13a5-54efde3efe01@bootlin.com>
Date: Thu, 6 May 2021 14:14:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210506092523.puuhdp77ho3egljd@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Thanks for the review!

On 5/6/21 11:25 AM, Quentin Schulz wrote:
> Hi Michael,
>
> On Wed, May 05, 2021 at 07:56:15PM +0200, Michael Opdenacker wrote:
>> This expands the error message when a network failure is detected.
>> It happens that some ISPs or networks block the default example.com
>> domain. Therefore, instead of disabling network access, it
>> lets the user know how to modify the test URL.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  meta/classes/sanity.bbclass | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index a377917f2a..e907a3566f 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -392,9 +392,12 @@ def check_connectivity(d):
>>              msg = data.getVar('CONNECTIVITY_CHECK_MSG') or ""
>>              if len(msg) == 0:
>>                  msg = "%s.\n" % err
>> -                msg += "    Please ensure your host's network is configured correctly,\n"
>> -                msg += "    or set BB_NO_NETWORK = \"1\" to disable network access if\n"
>> -                msg += "    all required sources are on local disk.\n"
>> +                msg += "    Please ensure your host's network is configured correctly.\n"
>> +                msg += "    If your ISP or network is blocking the above URL,\n"
>> +                msg += "    try with another domain name, for example by setting:\n"
>> +                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.yoctoproject.org/\""
>> +                msg += "    You could also set BB_NO_NETWORK = \"1\" to disable network\n"
>> +                msg += "    access if all required sources are on local disk.\n"
> I have my doubts that we want to explicit all ways to get rid of the
> message. I'd see more an indication to look at the documentation for
> this.... and since I wanted to check what we had in the docs for
> CONNECTIVITY_CHECK_URIS I discovered we don't have anything for
> that variable in YP documentation!
>
> That would be a nice addition even if you keep the message as is!

Sure, I was definitely planning to add such documentation.

Any other thoughts about making this error message more helpful?

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

