Return-Path: <ajlennon@dynamicdevices.co.uk>
Received: from www.dynamicdevices.co.uk (www.dynamicdevices.co.uk
	[89.200.136.37])
	by mail.openembedded.org (Postfix) with ESMTP id 123D260DD7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 19:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by www.dynamicdevices.co.uk (Postfix) with ESMTP id 34AFE27E060;
	Sun,  3 Aug 2014 19:23:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at lennoab2.miniserver.com
Received: from www.dynamicdevices.co.uk ([127.0.0.1])
	by localhost (www.dynamicdevices.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vp-vnim5dIWj; Sun,  3 Aug 2014 19:23:02 +0000 (UTC)
Received: from [127.0.0.1] (cpc32-live22-2-0-cust59.17-2.cable.virginm.net
	[82.36.253.60])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by www.dynamicdevices.co.uk (Postfix) with ESMTPSA id 4F00027E04C;
	Sun,  3 Aug 2014 19:23:02 +0000 (UTC)
Message-ID: <53DE8C14.1030602@dynamicdevices.co.uk>
Date: Sun, 03 Aug 2014 20:23:00 +0100
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <53DE3841.2000305@topic.nl>	
	<53DE3E5C.5020303@dynamicdevices.co.uk>
	<1407082617.6981.44.camel@ted>
In-Reply-To: <1407082617.6981.44.camel@ted>
X-Enigmail-Version: 1.6
Cc: mike.looijmans@topic.nl, OE <openembedded-core@lists.openembedded.org>
Subject: Re: What does "QA Issue: ... rdepends on .. but its not a build dependency?" mean
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
X-List-Received-Date: Sun, 03 Aug 2014 19:23:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 03/08/2014 17:16, Richard Purdie wrote:
> On Sun, 2014-08-03 at 14:51 +0100, Alex J Lennon wrote:
>> On 03/08/2014 14:25, Mike Looijmans wrote:
>>> I'm getting lots of warnings like this:
>>>
>>> """
>>> WARNING: QA Issue: enigma2-plugin-systemplugins-wirelesslan rdepends
>>> on wireless-tools but its not a build dependency? [build-deps]
>>> """
>>>
>>> What does it actually mean? What does it want me to provide here?
>>>
>>> The message in itself is correct. The package only has a runtime
>>> dependency. It does not require the wireless-tools package to be built
>>> or otherwise present on the build system. But what is the QA issue
>>> here and how do I get rid of the message?
>>>
>> Surely if package B has a non-optional runtime dependency on package A
>> then package A must be built and present on the target ?
> Its the "built" part that is the issue, bitbake can't see the
> dependency, hence the warning.
>
>>> Apart from that, there's a spelling error in there (its -> it's)
>>> because it's "it's" when it's "it is" and it's "its" when it's its
>>> property.
>>>
>> It is a spelling error in a superficial sense perhaps, but at a deeper
>> level I suspect it is more accurately characterised as a grammatical error.
>>
>> Perhaps somebody was having trouble with string terminations and decided
>> to avoid trouble?
> Somebody was concentrating on the correctness of the code generating the
> warning rather than the grammar. The latter is easily fixed, patches
> welcome.
>

I stand corrected :)

Cheers, Alex


