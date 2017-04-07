Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0726877CFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 09:31:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v379VVV9012030
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 7 Apr 2017 02:31:32 -0700
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Apr 2017 02:31:30 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1491460816.git.liezhi.yang@windriver.com>
	<1491522840.17200.74.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <29b46115-c4ad-3a31-5686-c36b4275323e@windriver.com>
Date: Fri, 7 Apr 2017 17:31:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1491522840.17200.74.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/6] fixes for runqemu
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
X-List-Received-Date: Fri, 07 Apr 2017 09:31:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/07/2017 07:54 AM, Richard Purdie wrote:
> On Wed, 2017-04-05 at 23:41 -0700, Robert Yang wrote:
>> The following changes since commit
>> 3a1cce659156ef2654a55a6e3c6922fa2dc780e4:
>>
>>   glibc: fix nativesdk ldd RTLDLIST (2017-04-05 23:22:06 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib rbt/qemu
>>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/q
>> emu
>>
>> Robert Yang (6):
>>   runqemu: fix 2 typos
>>   runqemu: support env vars explicitly
>>   runqemu: use self.rootfs to replace self.nfs_dir
>>   runqemu: run without arguments
>>   runqemu: use realpath for imgdir
>>   runqemu: do not rely on grepping images
>
> Something in here breaks the use of "bitbake xxx-image -c testimage":
>
> https://autobuilder.yocto.io/builders/nightly-arm/builds/280
>
> [basically all sanity tests failed in that build]

I'm really very sorry for the stupid errors, I had seen it, and I thought
that I had fixed it, but didn't. I will send a V2 and include Qi's
patch since there are conflicts, I will resolve the conflicts.

// Robert

>
> Cheers,
>
> Richard
>

