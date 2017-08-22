Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 776357825A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 15:35:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7MFYx38020361
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 22 Aug 2017 08:35:00 -0700
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 08:34:59 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<1503330934.32591.64.camel@linuxfoundation.org>
	<74bfd0a2-59a7-c98b-690d-8749ca7a989a@windriver.com>
	<1503411893.32591.108.camel@linuxfoundation.org>
	<7f1c93bd-0d0d-b4c4-d084-2a75d7362481@windriver.com>
	<1503415737.32591.112.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <7462b13d-0fa2-7a9f-c6d9-49c5a3f6abb0@windriver.com>
Date: Tue, 22 Aug 2017 11:34:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503415737.32591.112.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 22 Aug 2017 15:35:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/22/2017 11:28 AM, Richard Purdie wrote:
> On Tue, 2017-08-22 at 10:54 -0400, Bruce Ashfield wrote:
>> On 08/22/2017 10:24 AM, Richard Purdie wrote:
>>>   
>>> Thanks, I think you got that one but the /bin/awk issue remained
>>> after
>>> your changes. Its easy to reproduce with "bitbake core-image-sato-
>>> sdk",
>>> or IMAGE_INSTALL_append = " kernel-devsrc". I ended up with this
>>> change
>>> to fix it:
>> Yah, I noticed all of those references as well. Saul had dealt with
>> the one that hit us before, but I wasn't able to trigger any installs
>> of the other parts in the images I built .. so they were being left
>> be for now, just to keep our footprint low.
>>
>>>
>>>
>>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=
>>> a28acfa6c5890df4f5cb09962ef0c53837ac3b37
>>>
>>> which I appreciate you won't like but it illustrates the problem.
>>> Any
>>> preference on what to do with that patch?
>> I can merge it directly into linux-yocto, since that is what we did
>> with Saul's change before, and at the same time, we can submit it
>> upstream and drop it next release.
> 
> Ok, Should I merge my patch for now and you and then deal with it in
> due course or do you want to do that directly?

I can send you a v4 of the 4.12 patch in the next half an hour,
that's easiest for me to do.

.. but if it isn't for you, go ahead and do the merge and I'll
sort it out in a follow up.

> 
> I can take care of the mips issue but we have one final problem:
> 
> "oe-selftest -r runqemu.RunqemuTests.test_boot_machine_iso"
> 
> is failing, it works with 4.10, fails with 4.12. Did some key config
> option for booting isos go missing?

Not that I'm aware of, but I admit that I've never done any ISO
booting of the images so wouldn't see it.

I'll diff the configs here and see if anything jumps out. Otherwise,
I'll do a boot test myself and debug from there.

Bruce

> 
> Cheers,
> 
> Richard
> 


