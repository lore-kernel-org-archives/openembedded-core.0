Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5000D70588
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 17:13:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jul 2014 10:13:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,725,1400050800"; d="scan'208";a="574938727"
Received: from unknown (HELO [10.255.13.66]) ([10.255.13.66])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2014 10:13:06 -0700
Message-ID: <53D13EA1.4070707@linux.intel.com>
Date: Thu, 24 Jul 2014 10:13:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1406187862-2819-1-git-send-email-stefan@agner.ch>
	<53D11221.9070704@windriver.com>
In-Reply-To: <53D11221.9070704@windriver.com>
Subject: Re: [PATCH] shadow-securetty: add freescale lpuart
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
X-List-Received-Date: Thu, 24 Jul 2014 17:13:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/2014 07:03 AM, Mark Hatle wrote:
> We should probably be setting up the securetty file in a machine
> specific way.
>
> Doing it generically just pollutes the file with more stuff a specific
> user won't want.
>
> (Note, you aren't the first to do this.. so right now it's probably the
> best answer, but we should fix this in the future.)
>

Mark,

can you please file a bug to track this, I will mark it as an unassigned 
future / low for someone to pick up.

Sau!

> --Mark
>
> On 7/24/14, 2:44 AM, Stefan Agner wrote:
>> Add Freescale lpuart tty's (ttyLPx) to securetty. Freescale Vybrid
>> devices running upstream kernel use this driver.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>   meta/recipes-extended/shadow/files/securetty | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/meta/recipes-extended/shadow/files/securetty
>> b/meta/recipes-extended/shadow/files/securetty
>> index 0b1629f..d919993 100644
>> --- a/meta/recipes-extended/shadow/files/securetty
>> +++ b/meta/recipes-extended/shadow/files/securetty
>> @@ -137,6 +137,14 @@ ttymxc3
>>   ttymxc4
>>   ttymxc5
>>
>> +# Freescale lpuart ports
>> +ttyLP0
>> +ttyLP1
>> +ttyLP2
>> +ttyLP3
>> +ttyLP4
>> +ttyLP5
>> +
>>   # Standard serial ports, with devfs
>>   tts/0
>>   tts/1
>>
>

