Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q6vqI-0003ym-Ki
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 04:18:07 +0200
Received: by pwj9 with SMTP id 9so1719153pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2011 19:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=haqklhAV/NL2Otvdb+ixedjE1Hep4gsSJhTuVIfHB/Y=;
	b=Kp/nW18dH8bPoGJShxOJa+4BSwsbmwJiC4PUPWjp9EJ8RYRqbrqIwj8vUwZCnttZx+
	k1aBZHxg/QjiVlNEEl4txWK0RHC872zYe4NrYxkZQ+edlTl4+1Cp5jkn+EvgW00yuesi
	GooiV68+Os2wINhM9N23e0hHjhxsjYB5ezLOo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=Yo36eixEJJpDLZ9eBohDmwEUudwaWtHg6XcuEA3J8lFwIwwNFLC32Vaqaf4Rn0As2U
	PrCn+58w0j7OcrieYgJszajY4w48gXF497tzqssq20ZTw0ACgpKdechVDLDRowWEq0lj
	O1oGOYVko8SEkxXNocNW+HDrrw/k6k9rxp2I4=
Received: by 10.143.133.7 with SMTP id k7mr7044782wfn.9.1301969760665;
	Mon, 04 Apr 2011 19:16:00 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w11sm8333105wfh.18.2011.04.04.19.15.58
	(version=SSLv3 cipher=OTHER); Mon, 04 Apr 2011 19:15:59 -0700 (PDT)
Message-ID: <4D9A7B5C.8080705@gmail.com>
Date: Mon, 04 Apr 2011 19:15:56 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1301496447.24596.100.camel@rex>
	<4D934FBC.40802@windriver.com>	<9DA5872FEF993D41B7173F58FCF6BE94510B849E@orsmsx504.amr.corp.intel.com>	<9DA5872FEF993D41B7173F58FCF6BE94510B84A7@orsmsx504.amr.corp.intel.com>
	<9DA5872FEF993D41B7173F58FCF6BE94510B84B1@orsmsx504.amr.corp.intel.com>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94510B84B1@orsmsx504.amr.corp.intel.com>
Subject: Re: lconfig-native is not endian safe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Apr 2011 02:18:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/30/2011 7:09 PM, Kamble, Nitin A wrote:
>
>
>>> I have updated the ldconfig-native to match the version of eglibc
>>> 2.12.1, but that still does not solve the endienness problem of cross
>>> ppc.
>>
>> BTW ldconfig's endienness issue is also for mips&  armeb.
>
> Another solution I was thinking of was:
>    Use the target ldconfig in qemu shell. (like the glibc locales were generated earlier).
> Does it make sense to do it that way, or is it better to just not generate the ld.so.cache?
>

hmm we got rid of qemu for locales for a reason :). Think of people who 
do not build for qemu machines but real hardware now they have to build
qemu just for this.
>
>>
>>>
>>> Thanks,
>>> Nitin
>>>
>>>
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>>> Of
>>>> Mark Hatle
>>>> Sent: Wednesday, March 30, 2011 8:44 AM
>>>> To: openembedded-core@lists.openembedded.org
>>>> Subject: Re: [OE-core] lconfig-native is not endian safe
>>>>
>>>> On 3/30/11 9:47 AM, Richard Purdie wrote:
>>>>> Hi,
>>>>>
>>>>> Poky has had a ldconfig-native recipe in for a while. Back in the
>>>> times
>>>>> our RPATHS were totally broken adding in an ld.so.cache was
>> useful.
>>>> In
>>>>> modern times I'm having trouble working out when this would be
>>> useful
>>>> on
>>>>> a standard system as libraries are pretty much always in one of
>> the
>>>> two
>>>>> default search locations.
>>>>>
>>>>> ldconfig-native is 32/64 bit safe. I've just been looking at PPC
>>> and
>>>> it
>>>>> is certainly not endian safe though. The endianess of the target
>>>> system
>>>>> need to match that of the build system for it to work. It
>> wouldn't
>>> be
>>>>> much work to make it endian safe though although the codebase
>> will
>>>>> diverge further from that in (e)glibc though.
>>>>>
>>>>> Short term we need to disable it at least for ppc, longer term
>> what
>>>>> should we do?
>>>>
>>>> On ARM, are the structures packed in the same way as the target
>>> system?
>>>>
>>>> I know I prefer to NOT use ldconfig in the systems I design, but I
>>>> understand
>>>> why people want it.
>>>>
>>>> I suggest we disable it on PPC for now, and work on updating endian
>>>> support,
>>>> (packing if necessary) and make sure that it supports the latest
>>>> ldconfig
>>>> features of being able to use referenced directories and such.
>>>>
>>>> --Mark
>>>>
>>>>> Cheers,
>>>>>
>>>>> Richard
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
>>> core
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
>> core
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



