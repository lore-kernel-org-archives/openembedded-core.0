Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB14E70016;
	Thu, 28 Apr 2016 15:19:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3SFJ50E023162
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 28 Apr 2016 08:19:06 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 28 Apr 2016 08:19:05 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
	<CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
	<CAJTo0LZZ3Hs_yrm5ceik4j8Orv-UQ9T72Wu=R_PCRKw4Y9-WCw@mail.gmail.com>
	<CAMKF1sozR3_Mhy5PKSaKCo7S2yHrtLzTNrUURFhN38gV0AbkYQ@mail.gmail.com>
	<246f9c39-736b-7ed6-b69a-69d8c4369236@windriver.com>
	<B59F2ADC-CB7F-44CF-9AD7-AD779FC2EEC9@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <748495f9-7383-ce65-a41b-7343aa1c6004@windriver.com>
Date: Thu, 28 Apr 2016 10:19:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <B59F2ADC-CB7F-44CF-9AD7-AD779FC2EEC9@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Thu, 28 Apr 2016 15:19:13 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 4/28/16 2:10 AM, Khem Raj wrote:
> 
>> On Apr 27, 2016, at 11:06 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>
>> On 4/27/16 12:53 PM, Khem Raj wrote:
>>> thanks I think most of them come to these categories. So any help in
>>> fixing them is welcome.
>>>
>>> 1. kernel older than 4.4, backport needed fixed into these branches or
>>> move to newer kernels.
>>> 2. uboot dont have gcc6 compiler header files, backport the needed fixes
>>> 2. meta-qt4 needs to use gnu++98
>>> 3. gcc6 providing its own stdlib.h in libstdc++
>>> 4. gcc6 swtiching to gnu++14 for C++ as default.
>>> 5. GPLv2-only versions of recipes are simply old will need fixing
>>
>> From a -very- brief look, I suspect each of these fixes will be fairly simple.
>> So as we move into the next oe-core phase, we should be able get through this
>> pretty quickly.
> 
> I think yes, they are trivial, except the GPL-2.0 packages which might need patching
> 

Ha, actually that was what I was referring to.  The couple I looked at seemed to
be trivial.. :)

If someone doesn't get to it first, I expect some of my guys will in about a month.

--Mark

