Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 86657713AB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 12:08:58 +0000 (UTC)
Received: from [192.168.178.100] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 408DA284FC;
	Mon,  8 Sep 2014 14:08:59 +0200 (CEST)
Message-ID: <540D9C5A.2020204@pseudoterminal.org>
Date: Mon, 08 Sep 2014 14:08:58 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1410174256-3263-1-git-send-email-dv@pseudoterminal.org>
	<1410175101.19272.1.camel@ted>
In-Reply-To: <1410175101.19272.1.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: handle .dsp firmware
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
X-List-Received-Date: Mon, 08 Sep 2014 12:09:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/14 13:18, Richard Purdie wrote:
> On Mon, 2014-09-08 at 13:04 +0200, Carlos Rafael Giani wrote:
>> A few firmware files use this filename extension, like korg/k1212.dsp .
>> Create respective packages.
>>
>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>> ---
>>   meta/classes/kernel.bbclass | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index b02036f..4710719 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -387,6 +387,7 @@ python split_kernel_packages () {
>>       do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>>       do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>>       do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>> +    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.dsp$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>>   }
> Perhaps its time to improve the regex slightly here and use something
> like file_regex='^(.*)\.(bin|fw|cis|dsp)$ rather than multiple calls to
> do_split_packages?
>
> Cheers,
>
> Richard
>
>
>

I had the same thought. However, I figured that perhaps it would be 
better to do this in a followup patch, to keep the two distinct changes 
separate (add .dsp support + modify regex to the new and improved version).

