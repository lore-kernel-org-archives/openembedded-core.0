Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PuZcp-0004M3-9S
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 01:09:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p21KQR4n002544
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Mar 2011 12:26:27 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 1 Mar 2011 12:26:26 -0800
Message-ID: <4D6D5671.6050903@windriver.com>
Date: Tue, 1 Mar 2011 14:26:25 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1298920867-4961-1-git-send-email-koen@dominion.thruhere.net>
	<A632FFDE-18DE-439E-B247-80DE29746320@dominion.thruhere.net>
In-Reply-To: <A632FFDE-18DE-439E-B247-80DE29746320@dominion.thruhere.net>
X-Originating-IP: [172.25.36.227]
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 02 Mar 2011 00:09:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 3/1/11 1:55 PM, Koen Kooi wrote:
> ping

Do you have an example showing how this is to be used?

--Mark

> Op 28 feb 2011, om 20:21 heeft Koen Kooi het volgende geschreven:
> 
>> * Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
>>  setting for a recipe.
>> * This will allow recipes to work for entire families of
>>  devices without having to maintain/update the compatible
>>  devices as new devices are added into a family
>>
>> Based on 07076390358f211bd96779bec2d6eb5eaa0ad699 by Chase Maupin <chase.maupin@ti.com>
>>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/classes/base.bbclass |    4 +++-
>> 1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index a674f52..aaf99da 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -342,7 +342,9 @@ python () {
>>             import re
>>             this_machine = bb.data.getVar('MACHINE', d, 1)
>>             if this_machine and not re.match(need_machine, this_machine):
>> -                raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
>> +                this_soc_family = bb.data.getVar('SOC_FAMILY', d, 1)
>> +                if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
>> +                    raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
>>
>>
>>         dont_want_license = bb.data.getVar('INCOMPATIBLE_LICENSE', d, 1)
>> -- 
>> 1.6.6.1
>>
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



