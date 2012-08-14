Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1T1Iat-0006hU-VK
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 16:59:44 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 4664FF811E7; Tue, 14 Aug 2012 08:47:50 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 73490F811D7;
	Tue, 14 Aug 2012 08:47:49 -0600 (MDT)
Message-ID: <502A6515.2050007@mlbassoc.com>
Date: Tue, 14 Aug 2012 08:47:49 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <502A3A26.5090008@mlbassoc.com>
	<1344944787.23275.384.camel@phil-desktop>
	<502A3C00.6010609@mlbassoc.com>
	<20120814135946.GA5597@mi.fu-berlin.de>
	<3873D957-9816-4F94-B331-C3B7CB68FF37@dominion.thruhere.net>
In-Reply-To: <3873D957-9816-4F94-B331-C3B7CB68FF37@dominion.thruhere.net>
Subject: Re: wpa-supplicant & EAP-TLS
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
X-List-Received-Date: Tue, 14 Aug 2012 14:59:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-08-14 08:13, Koen Kooi wrote:
>
> Op 14 aug. 2012, om 15:59 heeft Henning Heinold <heinold@inf.fu-berlin.de> het volgende geschreven:
>
>> On Tue, Aug 14, 2012 at 05:52:32AM -0600, Gary Thomas wrote:
>>> On 2012-08-14 05:46, Phil Blundell wrote:
>>>> On Tue, 2012-08-14 at 05:44 -0600, Gary Thomas wrote:
>>>>> Does anyone know why the recipe for wpa_supplicant is using gnutls
>>>>> and not the default OpenSSH for TLS services?  It seems that gnutls
>>>>> is somehow broken and EAP-TLS does not work with this configuration.
>>>>> Changing wpa_supplicant to use the OpenSSH libraries makes EAP-TLS
>>>>> work fine.
>>>>>
>>>>> Would a patch to make this change be entertained?  or should I just
>>>>> keep it in my own layer?
>>>>
>>>> I don't think a patch to just flip the default would be a good idea.  A
>>>> patch to make it be a DISTRO_FEATURE, on the other hand, would be
>>>> excellent.
>>>
>>> Thanks, I'll see about working one up.
>>
>> Btw. You mean openssl not openssh, which uses openssl too.
>>
>> And a problem with using openssl for wpa_supplicant was license incompatibilities.
>
> I think wpa_supplicant has the openssl exception in its license nowadays, but it's best to double check

I don't see anything explicit on this topic.  That said, the latest version
(1.0) is dual licensed GPL and BSD and the OpenSSL license is BSD compatible
from what I can tell.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


