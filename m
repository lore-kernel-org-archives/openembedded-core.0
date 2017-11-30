Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C52DC7851A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 08:18:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAU8Ihgu008189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 30 Nov 2017 00:18:43 -0800
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 30 Nov 2017 00:18:37 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <7f75c29b-312b-2047-c002-a6c45b4b132b@windriver.com>
	<bc57b2ed-70d5-f285-9408-12276c113dc4@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5f54d36b-a2c2-e667-538b-786e440b48b0@windriver.com>
Date: Thu, 30 Nov 2017 16:18:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <bc57b2ed-70d5-f285-9408-12276c113dc4@linux.intel.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: About auto-upgrade-helper's enhancement
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
X-List-Received-Date: Thu, 30 Nov 2017 08:18:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Alexander,

On 11/30/2017 03:18 PM, Alexander Kanavin wrote:
> On 11/30/2017 04:23 AM, Robert Yang wrote:
>> I tried auto-upgrade-helper, it is very helpful when upgrade recipes.
>> I'd like to make some enhancements to make it can be easily used by the
>> maintainer (recipe upgrader) himself:
> 
> Great, let's make it awesome :)
> 
>> 1) Don't send email when maintainer uses it, for example, when I want to
>>     upgrade "strace", I don't need it send email to anyone.
> 
> I think email sending can be easily disabled in the configuration, no?

I'm not sure, this is the first time that I use AUH, but I really like it.

> 
>> 2) Use git's user.name and user.email in git commit when not send email,
>>     we need let the maintainer take responsible for it.
> 
> You can reset the commit authorship via 'git commit --amend --reset-author', but 
> I wouldn't want automatically created commits to have my name by default, 
> especially when mass-creating them.

Yes, maybe it can read author from conf file, use git's user and email when not 
fonud in conf file.

I will send draft patches later.

// Robert

> 
>> 3) Do the commit on the recipes when the upgrade is succeed, currently,
>>     it keeps the commit when failed, but removed it when succeed.
> 
> Yes. In fact I've deleted all code that does branch and commit manipulation, 
> except the part that creates commits. The tool shouldn't decide for the user how 
> to manage branches, and on which branch to base the work (currently hardcoded to 
> master) etc.
> 
>> 4) Make upgradehelper.py can accept multiple recipes as args.
> 
> Yep.
> 
>> 5) It's a small tool and helpful when upgrade recipes, can we move it into
>>     oe-core/scripts, please ?
> 
> I agree, after it's been ported to use devtool and I'm happy with how it works.
> 
> Alex
> 

