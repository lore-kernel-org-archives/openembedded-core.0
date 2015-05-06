Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A58273D98
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 17:46:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t46HkLZr009490
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 May 2015 10:46:21 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 6 May 2015 10:46:21 -0700
Message-ID: <554A536C.5060608@windriver.com>
Date: Wed, 6 May 2015 13:46:20 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
	<1430521154.18360.28.camel@linuxfoundation.org>
	<55440C90.5060605@windriver.com> <20150502081346.GD2366@jama>
	<55458D0D.6070904@windriver.com> <20150506144241.GA2067@jama>
	<554A2C1C.5040304@windriver.com> <20150506153325.GB2067@jama>
	<1430927086.8074.65.camel@linuxfoundation.org>
	<20150506160708.GD2067@jama>
In-Reply-To: <20150506160708.GD2067@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 06 May 2015 17:46:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-06 12:07 PM, Martin Jansa wrote:
> On Wed, May 06, 2015 at 04:44:46PM +0100, Richard Purdie wrote:
>> On Wed, 2015-05-06 at 17:33 +0200, Martin Jansa wrote:
>>> On Wed, May 06, 2015 at 10:58:36AM -0400, Bruce Ashfield wrote:
>>>> On 2015-05-06 10:42 AM, Martin Jansa wrote:
>>>> At this point, all I can say is file a bug. My builds of the same
>>>> board work, and the autobuilder show up green.
>>>>
>>>> That screams race condition, so I'll look into it from that angle.
>>>
>>> I'm considering providing simple old-style recipes for vanilla kernels
>>> and using them in my jenkins builds instead linux-yocto, because kernel
>>> shouldn't block testing other recipes from meta-oe and other layers as
>>> often as linux-yocto does.
>>
>> I wasn't aware of linux-yocto breaking that often?
>
> Someone can query http://errors.yoctoproject.org/ database to see how
> often (or if it's just me and my builds), unfortunately the full-text
> search for "linux-yocto" doesn't provide good overview of issues,
> because it shows 350 errors and not all are from linux-yocto recipe.
>
> http://www.openembedded.org/wiki/Bitbake_World_Status* pages and status
> on e-mail also aren't very accurate because I submit only reports from
> relatively success full builds (so I usually skip the builds with failed
> kernel, unless it's failing like that for long time).
>
>> I am aware that:
>>
>> * we have a race issue with shared_work which we're trying to resolve
>>    and its proving tricky to find a patch which doesn't break builds
>>
>> * we have the newly reported issue in this thread. FWIW the builders
>>    I've seen are all green
>>
>> * there are some warnings in the build which need addressing
>>
>> but on the most part I thought we'd caught the serious kernel failures
>> in advance of changes hitting master. Are you using master-next or
>> master?
>
> I've used master-next week or two ago (mostly to test bluez4 and python3
> changes) and soon after that dropped all linux-yocto related changes
> from it assuming that it's indeed cause for the issues I'm seeing, but
> it's not and it's still failing with master as well (and my
> jenkins/world builds are just small portion of my builds executed
> elsewhere where I see similar issues).

Richard: How can we sort out the differences between the build
environment that Martin uses versus what the autobuilder is showing?

There's nothing particularly complex happening during that build,
it's a checkout and generation of a config.

I'm unable to reproduce any of the failures, and neither is the
autobuilder.

I've stared at the code and can't see what could cause any of this.

That being said, I think I have a solution to what Martin is reporting
here, where I've changed the way the meta data is maintained and
build.

It will be ready in a week or so, so I'd be interested in us holding
on anything drastic until we can try that out.

Bruce

>
>> Its its -next, I can understand the problems more as that has been
>> unstable recently but then by its nature, it can be. We are rooting out
>> problems before master afaict though?
>>
>> Cheers,
>>
>> Richard
>


