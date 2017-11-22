Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ED2E27872A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 06:10:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAM6Abkf026953
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Nov 2017 22:10:37 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 21 Nov 2017 22:10:37 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Randy MacLeod
	<randy.macleod@windriver.com>, <openembedded-core@lists.openembedded.org>,
	Armin Kuster <akuster808@gmail.com>, "Huang, Jie (Jackie)"
	<Jackie.Huang@windriver.com>,
	"Xu, Chi" <Chi.Xu@windriver.com>, "WOLD, SAUL" <saul.wold@intel.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com>
	<45922039-30bd-7fbc-89be-c037c068a0db@windriver.com>
	<1511262584.862.32.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <1864d74a-6b63-1e5e-b0b4-ec703ad260b9@windriver.com>
Date: Wed, 22 Nov 2017 14:09:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1511262584.862.32.camel@linuxfoundation.org>
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXNDfigJkxNw==?=
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
X-List-Received-Date: Wed, 22 Nov 2017 06:10:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/21/2017 07:09 PM, Richard Purdie wrote:
> On Mon, 2017-11-20 at 20:22 -0500, Randy MacLeod wrote:
>> On 2017-11-20 10:36 AM, Jolley, Stephen K wrote:
>>> Current Dev Position: YP 2.5 Planning and M1 development
>>> Next Deadline: YP 2.5 M1 cut off of 12/4/17
>>>   
>>> SWAT team rotation: Juro -> Paul on Nov.17, 2017.
>>> SWAT team rotation: Paul -> Todor on Nov. 24, 2017.
>>> https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>>>   
>>> Key Status/Updates:
>>> ·        There is no real change to the status from last week. We
>>> continue to suffer intermittent build failures and are continuing
>>> to attempt to debug these.
>>> ·        Currently open issues are:
>>   
>> Some US-based people may be on holiday later this week so I'm
>> offering
>> help from the frozen Northland and more importantly from the team in
>> Beijing. ;-)
>>
>>> o   qemuppc continues to demonstrate random hangs in boot  in
>>> userspace
>>   
>> Is we can create a defect for this and point / copy the wiki notes
>> into it, that
>> would help.
>>     https://wiki.yoctoproject.org/wiki/Qemuppc_Boot_Hangs
>>
>> I think I had asked Chi to see if he could reproduce this a week or
>> two ago.
>> When the lack of entropy problem was identified and fix, many people
>> thought
>> this hang went away as well. Chi can you read the wiki report and see
>> if you
>> can add anything to them?
> 
> Good news is that the qemuppc issue has been identified as a bug in
> qemu ppc locking which breaks timer interrupt handling. I've posted on
> the qemu mailing list asking for help in verifying what I think is
> happening.
> 
> I have a patch ready to merge which should address this one, just
> cleaning up my environment and doing some further stress testing.
> 
> [There is a defect somewhere for this btw, I created the wiki as it was
> a better place to dump and update information as we learnt what it
> is/is not without having to follow a train of thought updating in the
> bugzilla].
> 
>>> o   Issues with 4.13.10 host kernels booting kvm x86 guests on
>>> Tumbleweed (Suse) and Fedora 26 (attempting to see if 4.13.12
>>> helps)
>>   
>> Robert, can you test Fedora 26. It would help to have a defect open
>> with steps to reproduce or
>> something about the typical workflow/ build time/ day of the week/
>> phase of the moon.
> 
> FWIW we have noticed that the choice of kernel timers seems to vary in
> the x86_64 boots but not with a pattern that matches the hangs.
> 
>>> o   nfs inode count for the sstate/dldir share appears to break
>>> periodically causing the disk monitor to halt the builds (bug
>>> 12267)
>>   
>> Likely specific to the AB server so no plans to do anything for this
>> bug.
> 
> Agreed, this one is our infrastructure somehow :(. We have a workaround
> in -next for this at least.
> 
>>> o   a perf build race (bug 12302)
>>    I'll take a look to:
>>   - see if I can duplicate the bug on a fast build host
>>   - check upstream to see if the bug is known/fixed
>>   - see if I can spot a race in the build rules.
> 
> Sounds good, thanks!
> 
>>> o   An ext filesystem creation/sizing issue (bug 12304)
>>   
>> Saul, Are you around this week? Do you have any additional
>> information before
>> leaving for Thanksgiving?
>>
>> Jackie,
>> Can you look at the code around the image creation and try to
>> reproduce this one?
> 
> Saul hasn't been able to reproduce. I've asked at the minimum we add
> better logging so if/when this happens again, we can debug it properly
> next time. I did also wonder about fuzzing the image size code, writing
> some code which puts in all possible input values and checks the sanity
> of the resulting image size. Its the kind of problem a computer can
> probably brute force. Anyone interested in trying that?

I have interests on it, but I don't quite understand what did you mean.
Currently, the image size is from "du -sh <image_rootfs>" * factor, about
the bug 12304, it got 8192 which is the default value of core-image-minimal,
so maybe something is wrong with "du -sh", the normal value is larger than 8192.

// Robert

> 
> Cheers,
> 
> Richard
> 
> 
> 

