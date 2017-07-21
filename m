Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C90771B04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 06:32:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6L6Wt8G023848
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 20 Jul 2017 23:32:55 -0700
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Jul 2017 23:32:54 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Khem Raj
	<raj.khem@gmail.com>
References: <cover.1499822461.git.kai.kang@windriver.com>
	<10b67207-e767-0458-c642-20ee38621bd3@windriver.com>
	<e25b7dde-3a9f-5964-8d63-c3cd60785072@linux.intel.com>
	<f136d49e-6409-fb63-0c07-a371392761f2@windriver.com>
	<33942952-1dcf-d334-5953-63020d14ef83@linux.intel.com>
	<CAMKF1spKp6=VpO=mtGSLph2UF84mnQMra=Roup6cHwZxr+Ct8w@mail.gmail.com>
	<1fdc5857-8f62-7ae7-52c1-bce71a23d37a@linux.intel.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <b68e4ea9-6d93-f9c5-7e2a-ca0664894c6e@windriver.com>
Date: Fri, 21 Jul 2017 14:37:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1fdc5857-8f62-7ae7-52c1-bce71a23d37a@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] bind: 9.10..3-P3 -> 9.10.5-P3
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
X-List-Received-Date: Fri, 21 Jul 2017 06:32:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年07月19日 21:05, Alexander Kanavin wrote:
> On 07/19/2017 12:08 AM, Khem Raj wrote:
>>> The policy in oe-core master is to update to latest stable upstream
>>> releases, so please provide an update to 9.11.x. If you want to keep 
>>> 9.10.x,
>>> you can do that, but please provide a more specific reason.
>>
>> if there are ABI incompatible changes then we have to scope the impact
>> and plan the upgrade accordingly, if its backward compatible then yes 
>> its
>> the norm.

It doesn't  mention that api changes in 9.11 from release notes pages of 
9.11.0rc1 and 9.11.0.

https://kb.isc.org/article/AA-01409
https://kb.isc.org/article/AA-01432/81/BIND-9.11.0-Release-Notes.html


But it suggests not to use 9.11 until the second maintenance 
release(9.11.2 if I understand correctly) for production systems:

| We recommend that administrators run one of our older, stable 
branches, such as a 9.9 or 9.10-based release on larger-scale critical 
production systems, while testing the new 9.11 branch until the second 
maintenance release.

https://www.isc.org/downloads/bind/bind-9-11-new-features/


--Kai

>
> What I'm saying is that it should not be a "9.10 now, 9.11 maybe 
> later" when working with a master branch. The proper way is to 
> "investigate and plan the upgrade to 9.11, update to 9.10 only if 
> necessary, based on that investigation".
>
>
> Alex
>

-- 
Regards,
Neil | Kai Kang


