Return-Path: <california.l.sullivan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C1C706AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 23:47:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Sep 2016 16:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,412,1470726000"; d="scan'208";a="1057995336"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga002.jf.intel.com with ESMTP; 28 Sep 2016 16:47:18 -0700
To: Saul Wold <saul.wold@intel.com>, openembedded-core@lists.openembedded.org
References: <1475105254-15660-1-git-send-email-california.l.sullivan@intel.com>
	<1475105965.18115.71.camel@intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <7e20461e-9147-93f0-9840-cf4c4c03a6d2@intel.com>
Date: Wed, 28 Sep 2016 16:47:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1475105965.18115.71.camel@intel.com>
Subject: Re: [PATCH 1/1] genericx86-64.conf: Add SERIAL_CONSOLES_CHECK = "ttyS0"
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
X-List-Received-Date: Wed, 28 Sep 2016 23:47:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Alrighty. I will resend there.

Thanks,
Cal

On 09/28/2016 04:39 PM, Saul Wold wrote:
> On Wed, 2016-09-28 at 16:27 -0700, California Sullivan wrote:
>> Trying to start getty on a non-existent console will spew I/O errors
>> into auth.log on some hardware. Avoid this behavior by checking that
>> ttyS0 is a console that exists.
>>
>> Fixes [YOCTO #10291].
>>
>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>> ---
>>   meta-yocto-bsp/conf/machine/genericx86-64.conf | 2 ++
> As this is meta-yocto-bps, this should really go to poky@yoctoproject.o
> rg, otherwise this looks good.
>
> <Reviewed-by: Saul Wold <sgw@linux.intel.com>
>
>
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-yocto-bsp/conf/machine/genericx86-64.conf b/meta-
>> yocto-bsp/conf/machine/genericx86-64.conf
>> index ceee247..d843fd2 100644
>> --- a/meta-yocto-bsp/conf/machine/genericx86-64.conf
>> +++ b/meta-yocto-bsp/conf/machine/genericx86-64.conf
>> @@ -8,3 +8,5 @@ require conf/machine/include/tune-core2.inc
>>   require conf/machine/include/genericx86-common.inc
>>   
>>   PREFERRED_VERSION_linux-yocto_genericx86-64 ?= "4.8%"
>> +
>> +SERIAL_CONSOLES_CHECK = "ttyS0"
>> -- 
>> 2.5.5
>>


