Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QfJ4x-0000oF-PY
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 23:59:24 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QfJ1B-0000UZ-FS from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 14:55:25 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 8 Jul 2011 14:55:25 -0700
Received: from [172.30.80.17] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 8 Jul 2011 14:55:24 -0700
Message-ID: <4E177CBD.5060003@mentor.com>
Date: Fri, 8 Jul 2011 14:55:09 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1310080780.git.jessica.zhang@intel.com>	<1310142693.20015.906.camel@rex>
	<4E174E52.2@mentor.com>	<C6510F6D410BB64A8C15398EDC6B847C02A284@ORSMSX101.amr.corp.intel.com>
	<7A271CF8-4DB2-43E9-9FC2-860A9ACD3649@dominion.thruhere.net>
In-Reply-To: <7A271CF8-4DB2-43E9-9FC2-860A9ACD3649@dominion.thruhere.net>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 08 Jul 2011 21:55:25.0307 (UTC)
	FILETIME=[BE03DCB0:01CC3DB9]
Subject: Re: [PATCH 0/1] [bug 1195] site/mips-common:	Cache	cvs_cv_func_printf_ptr
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
X-List-Received-Date: Fri, 08 Jul 2011 21:59:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On 07/08/2011 01:49 PM, Koen Kooi wrote:
> I have a crude merged version of siteinfo.bbclass in meta-oe, any volunteers to have à look at the differences?

Ug, I didn't know oe-core was missing all of that.  Shoot it over to me,
I'll take a look Monday.

> 
> Op 8 jul. 2011 om 21:07 heeft "Zhang, Jessica" <jessica.zhang@intel.com> het volgende geschreven:
> 
>> We only have arm-common, common, ix86-common, mips-common, powerpc-common, sh-common under site, no Linux-common or glibc-common, and it's defined in all the arches-common files except mips-common.
>>
>> Thanks,
>> Jessica
>>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Tom Rini
>> Sent: Friday, July 08, 2011 11:37 AM
>> To: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 0/1] [bug 1195] site/mips-common: Cache cvs_cv_func_printf_ptr
>>
>> On 07/08/2011 09:31 AM, Richard Purdie wrote:
>>> On Thu, 2011-07-07 at 16:23 -0700, Jessica Zhang wrote:
>>>> The following changes since commit c412674cf818e77e35857fb93353e392e7ac9e53:
>>>>  Khem Raj (1):
>>>>        package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"
>>>>
>>>> are available in the git repository at:
>>>>
>>>>  git://git.yoctoproject.org/poky-contrib jzhang/1195
>>>>  http://git.yoctoproject.org/cgit.cgi//log/?h=jzhang/1195
>>>>
>>>> Khem Raj (1):
>>>>  [bug 1195] site/mips-common: Cache cvs_cv_func_printf_ptr
>>>
>>> Merged to master, thanks.
>>
>> Late again and my fault this time but why is this in site/mips-common
>> and not site/linux-common or glibc-common?
>>
>> --
>> Tom Rini
>> Mentor Graphics Corporation
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
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


-- 
Tom Rini
Mentor Graphics Corporation


