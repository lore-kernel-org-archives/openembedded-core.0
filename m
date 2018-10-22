Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E72447503E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 21:38:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9MLcGKt012435
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Oct 2018 14:38:32 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 22 Oct 2018 14:38:18 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20181020054026.9619-1-Randy.MacLeod@windriver.com>
	<20181020054026.9619-2-Randy.MacLeod@windriver.com>
	<CAMKF1sp3xrV_1zG0UhknY26csC1TMbBjd+dMixrCbUXBwzQ2Uw@mail.gmail.com>
	<625e1152-8cfe-f9dc-c80f-e93a7fb74b26@windriver.com>
	<CAMKF1srghdS66FHbZv_ikGHLDUqGDK1oxZOC40UnSied=Y2EGw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <95316079-8f79-ea9a-161d-aeefe45a97f1@windriver.com>
Date: Mon, 22 Oct 2018 17:38:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srghdS66FHbZv_ikGHLDUqGDK1oxZOC40UnSied=Y2EGw@mail.gmail.com>
X-Originating-IP: [172.25.44.4]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] valgrind: update from 3.13.0 to 3.14.0
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
X-List-Received-Date: Mon, 22 Oct 2018 21:38:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/21/18 6:24 PM, Khem Raj wrote:
> On Sun, Oct 21, 2018 at 9:48 PM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>>
>> On 10/21/18 5:47 AM, Khem Raj wrote:
>>> fails ptest compile on musl/mips
>>> http://errors.yoctoproject.org/Errors/Details/197122/
>>
>> I have a fix that I'll send later tonight or tomorrow morning
>> once I've tested it a bit more. I'll paste it inline below in
>> case anyone wants it now.
>>
>> I did notice that the ptest build of valgrind takes a more than
>> 30 minutes!:
>>
>> 0: valgrind-3.14.0-r0 do_compile_ptest_base - 2306s (pid 21911)
>>
>> It's building:
>>     none/tests/mips32/msa_fpu.c
>> which is from a commit [1] that tries to cover
>> all MIPS SIMD architecture instructions. I'll
>> drop that test unless someone objects since it's overkill
>> for a ptest IMO.
> 
> I do not use MSA here so it might be ok to to save some time. but I am
> curious how it looks on real h/w
> 

I don't have a mips target at hand but I may decide
to dig one up and see if there's any value in the MSA test
at some point. Until then I'll leave the test as is.


Here are the valgrind bugs that I reported :

musl bug:
https://bugs.kde.org/show_bug.cgi?id=400162

assembler bug:
https://bugs.kde.org/show_bug.cgi?id=400164

I have update the oe-core patch status locally
with a link to these bugs IDs and I'll send that
once the:
   valgrind: Make local functions static to avoid assembler error
patch is merged.

-- 
# Randy MacLeod
# Wind River Linux

