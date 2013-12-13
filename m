Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E84EF6E307
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 02:00:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBD20lHH027770
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Dec 2013 18:00:47 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 12 Dec 2013 18:00:46 -0800
Message-ID: <52AA6A4D.7070805@windriver.com>
Date: Fri, 13 Dec 2013 10:00:45 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1386752561.git.liezhi.yang@windriver.com>		
	<1386771992.4332.76.camel@ted> <1386772701.4332.80.camel@ted>	
	<52A95C72.3030605@windriver.com> <1386891243.504.47.camel@ted>
In-Reply-To: <1386891243.504.47.camel@ted>
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 000/122 V2] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Fri, 13 Dec 2013 02:00:51 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/13/2013 07:34 AM, Richard Purdie wrote:
> On Thu, 2013-12-12 at 14:49 +0800, Robert Yang wrote:
>>> That leaves the following we need to investigate:
>>>
>>> + 20c0a87c19cf51bcd849fb4de91421cae0f97ae4 mdadm: Disable the RUN_DIR check
>>
>>   From OE-Core master rev: d62882794890eeee8e8d5c9ba4837ec77a58d787
>>
>>> + cc225f0e74865623714461cd38bec3b6557c6df7 mdadm: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for powerpc64
>>
>>   From OE-Core master rev: d3caab6eb03264b4f4d744f914598022299011ba
>>
>>> + d912ce035beb0da28d83719920a2cebfda8b3073 ethtool: Fix ptest compile
>>
>>   From OE-Core master rev: 5dd8653fdcda5e0e8b4f3c37a46f357bc97ec66c
>
> Thanks, these are all fine.
>
>>> + 1cff575511f32935a69ec1c9ef966311ad409e2f gdb-7.6: fix cygwin check in configure script
>>
>> This one is sent by Steffen, for dora only.
>
> I took a closer look at this. Whilst the version of gdb in master is
> different, the issue still exists. I've ported the patch to master and
> merged it there. We can now backport it.
>
> Please don't take anything into dora until we have something equivalent
> in master.
>

OK, thank you very much.

// Robert

>>> + 5a13d607954fb2099a82c5f1f4135be6cb6ca4d3 dpkg: Fix a build error for dpkg-native on CentOS 5.8.
>>> + c37ab9c220b8f1d2045b1aaf9cd03c1f9a899390 dpkg: Fix a link problem for dpkg-native on CentOS 5.8.
>>
>> They are sent by Mark for dora only.
>
> These were sent as an RFC for compliance purposes. They're not in
> master, they can't go into dora. I've dropped these.
>
> Other than the patches I've mentioned, things should be merged in the
> dora branch. We've found some build issues. I've pushed a fix for the
> qt3 one, we also have one with lttng-modules which we don't have a fix
> for yet.
>
> Cheers,
>
> Richard
>
>
>

