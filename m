Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWs4l-0006sG-Rv
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 17:32:16 +0200
Received: by iye7 with SMTP id 7so398902iye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=+PRuSwxpcfFXauqGWMiUYXNte93gho4rOfMsWyqD+h4=;
	b=iJrVZoEFI5lNVXAQLPyMlaXft86zT9Yi9VURVpWeGRQBvqQ5lTRyEv7bvUkqNREvCd
	Jo53MqL7zShhxla5j0+sYcJlGZ0HA8bAddlJTxb8ec6ALUb1UgOeIgesLKbo7ydIS59H
	/r3Rad9vrvotWhYTjMLsDW0q0JlN8YWpviwyc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=pLYWuefNXzgvdqKdtxowZjYqF3ld+r6l4jBGdvQ4kpzDvbry0HIDJtDSheq5SonVOr
	/3fplvSPzpiHCa0BJVpocr9bmAYhZMOCj5+CSBzuw2E6s8Ugn7FOkDqxzHrVIRg4fHYf
	5BKYohtFrPvCKb9RmnIhf9cSnJb0hXXKIo5ZY=
Received: by 10.231.6.23 with SMTP id 23mr487944ibx.187.1308151728309;
	Wed, 15 Jun 2011 08:28:48 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id s9sm276947ibe.61.2011.06.15.08.28.46
	(version=SSLv3 cipher=OTHER); Wed, 15 Jun 2011 08:28:47 -0700 (PDT)
Message-ID: <4DF8CFAC.4020108@gmail.com>
Date: Wed, 15 Jun 2011 08:28:44 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>	<1308086688.15712.362.camel@rex>	<CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>	<BANLkTi=Kk7J-ZAQuPkC5LNAnxZSAzwtvOg@mail.gmail.com>	<8C2617DC-2693-42A3-810B-C3A516DB7360@dominion.thruhere.net>	<BANLkTimY-6iNGoKeeZ7Xs0rswKSZUi3xSQ@mail.gmail.com>	<3E89612B-A102-423A-8499-55E5AC1CDF07@dominion.thruhere.net>	<1308132960.15712.390.camel@rex>	<E322171D-B7A5-4F4B-974D-8CFDCC9C8DB5@dominion.thruhere.net>
	<1308133418.15712.396.camel@rex>
In-Reply-To: <1308133418.15712.396.camel@rex>
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Wed, 15 Jun 2011 15:32:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2011 03:23 AM, Richard Purdie wrote:
> On Wed, 2011-06-15 at 12:18 +0200, Koen Kooi wrote:
>> Op 15 jun 2011, om 12:16 heeft Richard Purdie het volgende geschreven:
>>
>>> On Wed, 2011-06-15 at 09:00 +0200, Koen Kooi wrote:
>>>> Op 15 jun 2011, om 01:12 heeft Khem Raj het volgende geschreven:
>>>>
>>>>> On Tue, Jun 14, 2011 at 2:44 PM, Koen Kooi<koen@dominion.thruhere.net>  wrote:
>>>>>>
>>>>>> Op 14 jun 2011, om 23:40 heeft Khem Raj het volgende geschreven:
>>>>>>
>>>>>>> On Tue, Jun 14, 2011 at 2:32 PM, Koen Kooi<koen@dominion.thruhere.net>  wrote:
>>>>>>>>
>>>>>>> BASE_PACKAGE_ARCH = "${@['armv5teb',
>>>>>>> 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
>>>>>>>
>>>>>>> PACKAGE_EXTRA_ARCHS = "${@['armeb armv4b armv4tb armv5teb', 'arm armv4
>>>>>>> armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
>>>>>>>
>>>>>>> and this does not get evaluated properly then
>>>>>>
>>>>>> But that wouldn't matter in the scope of allarch, though?
>>>>>
>>>>> SITEINFO_ENDIANESS  = "${@siteinfo_get_endianess(d)}"
>>>>>
>>>>> def siteinfo_get_endianess(d):
>>>>>       info = get_siteinfo_list(d)
>>>>>       if 'endian-little' in info:
>>>>>              return "le"
>>>>>       elif 'endian-big' in info:
>>>>>              return "be"
>>>>>       bb.error("Site info could not determine endianess for target")
>>>>>
>>>>>
>>>>> and
>>>>> get_siteinfo_list has this
>>>>>
>>>>>       targetinfo = {\
>>>>>               "allarch-linux":           "",\
>>>>>
>>>>> hence siteinfo_get_endianess ends up with
>>>>>
>>>>> bb.error("Site info could not determine endianess for target")
>>>>>
>>>>> may be we need to differentiate with None return and empty string
>>>>> return along with 'endian-little' and 'endian-big'
>>>>> or may be add another option called 'endian-neutral'
>>>>
>>>> Or just add a bogus endianness: http://cgit.openembedded.org/cgit.cgi/meta-openembedded/commit/?id=f95ffd6cedb2a0fcad9db1b2d612663a327be87b
>>>
>>> This is just papering over cracks. "allarch" packages shouldn't be
>>> querying endianness, it really is that simple.
>>
>> This isn't the recipes querying the endianness, but the class itself.
>
> Er, if nothing references the appropriate variable, the query is never
> made...

certain variables which are common across all kind of recipes e.g. 
IMAGE_NAME could use endian information to have endian information in
image name but they get evaluated in all recipes. so there in lies the 
problem


>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



