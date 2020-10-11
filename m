Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web11.26345.1602450256465695105
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2020 14:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id A16CA220232;
	Mon, 12 Oct 2020 10:04:10 +1300 (NZDT)
Subject: Re: [OE-core] [PATCH] allarch: Remove MACHINEOVERRIDES
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20201009043246.20465-1-douglas.royds@taitradio.com>
 <9e26168866709695b827450ba2e933efdb3077cd.camel@linuxfoundation.org>
From: "Douglas" <douglas.royds@taitradio.com>
Message-ID: <5978e05f-1289-33aa-ff75-c6dc9a353262@taitradio.com>
Date: Mon, 12 Oct 2020 10:04:10 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9e26168866709695b827450ba2e933efdb3077cd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

On 10/10/20 4:23 am, Richard Purdie wrote:

> On Fri, 2020-10-09 at 17:32 +1300, Douglas via lists.openembedded.org
> wrote:
>> Avoid machine-specific settings sneaking into allarch tasks.
>>
>> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
>> ---
>>   meta/classes/allarch.bbclass | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/allarch.bbclass
>> b/meta/classes/allarch.bbclass
>> index 5bd5c44a27..2365691fae 100644
>> --- a/meta/classes/allarch.bbclass
>> +++ b/meta/classes/allarch.bbclass
>> @@ -42,6 +42,7 @@ python () {
>>           d.setVar("TARGET_CXXFLAGS", "none")
>>           d.setVar("TARGET_LDFLAGS", "none")
>>           d.setVar("POPULATESYSROOTDEPS", "")
>> +        d.setVar("MACHINEOVERRIDES", "allarch")
> Why would a recipe which is using allarch be using machine specific
> overrides?


Um, yes, I have to admit that we had an in-house defect over this one, 
now separately fixed.

It seems wrong to have machine-specific overrides in the list at all for 
allarch recipes, so this is just a suggested tidy-up.

