Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Ty2nH-0005KZ-SJ
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 17:03:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0NFlRP3016474
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Jan 2013 07:47:27 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 23 Jan 2013 07:47:26 -0800
Message-ID: <5100060C.70501@windriver.com>
Date: Wed, 23 Jan 2013 09:47:24 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>
References: <50FFE5D6.8020207@balister.org> <50FFF12B.7010709@windriver.com>
	<50FFF460.5050108@balister.org>
In-Reply-To: <50FFF460.5050108@balister.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: UHD (from meta-oe) failure when rpm packaging selected
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 16:03:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/13 8:32 AM, Philip Balister wrote:
> On 01/23/2013 09:18 AM, Mark Hatle wrote:
>> On 1/23/13 7:29 AM, Philip Balister wrote:
>>> The recipe builds fine with ipk only, but when you add rpm packaging the
>>> recipe fails to build with:
>>>
>>> so.5 libncurses.so.5
>>> Processing files: uhd-dbg-3.5.0-r3.0.armv7a_vfp_neon
>>> Finding  Provides:
>>> /home/balister/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.provides
>>>
>>> Finding  Requires:
>>> /home/balister/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.requires
>>>
>>> Processing files: uhd-dev-3.5.0-r3.0.armv7a_vfp_neon
>>> Finding  Provides:
>>> /home/balister/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.provides
>>>
>>> error: line 719: Illegal char '-' in EVR:
>
> [balister@mini ~]$ wc -l
> thuvia/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.spec
>
> 719
> thuvia/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.spec
>
> The last line is blank.

The only other thing I can think of is that the uhd.provides or uhd.requires 
file are returning a line with an invalid character.. but it's rare that they 
return values with full version information.

Can you put the uhd.spec, uhd.provides and uhd.requires files somewhere I can 
look at them, I can probably spot the problem fairly quickly.

--Mark

> Philip
>
>>>
>>> error: Failed to find Provides:
>>>
>>>
>>> RPM build errors:
>>>       line 719: Illegal char '-' in EVR:
>>
>> The line above is from the generated spec file.  Look at
>> /home/balister/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.spec
>> -- line 719 and see what it contains.
>>
>> In RPM there is a rule that the Epoch, Version and Release may not
>> contain a "-".  So a translation should have occurred to change it to
>> either a + or a _..  (I don't remember which at the moment.)
>>
>>>       Failed to find Provides:
>>> DEBUG: Python function do_package_rpm finished
>>>
>>> Any suggestions?
>>>
>>> Philip
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>



