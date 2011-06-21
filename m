Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZ46W-0006lf-Jy
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 18:47:08 +0200
Received: by pvf24 with SMTP id 24so1926029pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ANJxAK6nAt5y5pHrL5e/7dI3iAHshosb+CPnao6rJ3s=;
	b=Mu7Y+QBEWhlsTAAIJ9gf23Y+Jr+iR1meVEY897U5RpiX+bVom8V/OvgeLqXwrqTkPG
	wSVy/rAxPdUcHHsd45OOtNo6lsmBe4UtyBfHR8RSf3jcarIKcnDHTsbVMdQijVErxwCa
	Og241wcZYt1QrBUau1DLPTuCT+zEkzn6fY184=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=ORqdIHm0XFvXy97E6r2BczB2fHCALTJ1Q3woajl8dFJ1dZBrbxEsD/lBDpmGkqExgl
	Z6cQHSXvJUnIAb4pvaAaGfvbFBlaNnNEidTkqWguAhfjxj/yWVcF6UbUsbcFU7bNXvz/
	0msYpVvYSpmZzm0PrktZM9EE31kEyf0bEVlm8=
Received: by 10.142.142.5 with SMTP id p5mr534221wfd.64.1308674612316;
	Tue, 21 Jun 2011 09:43:32 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n9sm7211915wfk.8.2011.06.21.09.43.30
	(version=SSLv3 cipher=OTHER); Tue, 21 Jun 2011 09:43:31 -0700 (PDT)
Message-ID: <4E00CA31.7080403@gmail.com>
Date: Tue, 21 Jun 2011 09:43:29 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1308658461.20015.24.camel@rex>	<BANLkTimMLo4g7uWsrhAr=hun4wZ6AaDjQg@mail.gmail.com>	<1308663032.20015.29.camel@rex>
	<4E009D8F.10301@eukrea.com>
In-Reply-To: <4E009D8F.10301@eukrea.com>
Subject: Re: Multilib Development Update
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
X-List-Received-Date: Tue, 21 Jun 2011 16:47:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 06/21/2011 06:33 AM, Eric Bénard wrote:
> Hi,
>
> On 21/06/2011 15:30, Richard Purdie wrote:
>> On Tue, 2011-06-21 at 15:02 +0200, Frans Meulenbroeks wrote:
>>> As I already asked before: what is the benefit having this in embedded
>>> systems?
>>>
>>> If I am doing an embedded system I know the target hardware, and there
>>> is no need to have e.g. both 32 and 64 bit libs.
>>
>> This has been mentioned before but there are embedded use cases where
>> the requirement is to have a low overhead OS using 32 bit libs and
>> binaries to save memory but the main application (like a database
>> server) runs in 64 bit mode with 64 bit libraries so it can take
>> advantage of system memory, extra instructions or so forth. This applies
>> to mips and powerpc as well as x86.
>>
>> The implementation is fairly self contained so if you don't want
>> multilib, you shouldn't even be aware its there...
>>
> will that feature allow to build a sdk running on both x86 and amd64
> hosts whatever is the build host ?
>

thats a different aspect.
Although we could make a SDK which could cook up packages which run
on multilibs


> Eric
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



