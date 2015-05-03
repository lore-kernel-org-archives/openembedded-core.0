Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40B2172120
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 May 2015 02:50:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t432os7o014635
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 2 May 2015 19:50:55 -0700 (PDT)
Received: from server.local (128.224.23.1) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 2 May 2015 19:50:54 -0700
Message-ID: <55458D0D.6070904@windriver.com>
Date: Sat, 2 May 2015 22:50:53 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
	<1430521154.18360.28.camel@linuxfoundation.org>
	<55440C90.5060605@windriver.com> <20150502081346.GD2366@jama>
In-Reply-To: <20150502081346.GD2366@jama>
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
X-List-Received-Date: Sun, 03 May 2015 02:51:04 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-02 4:13 AM, Martin Jansa wrote:
> On Fri, May 01, 2015 at 07:30:24PM -0400, Bruce Ashfield wrote:
>> On 2015-05-01 6:59 PM, Richard Purdie wrote:
>>> On Thu, 2015-04-30 at 21:34 -0400, Bruce Ashfield wrote:
>>>> Here is the latest consolidated pull request for the supported linux-yocto
>>>> kernels.
>>>>
>>>>    - We have a refresh of the 3.14-rt support
>>>>    - bluetooh configuration changes for common-pc/qemux86
>>>>    - braswell BSP features and fixes
>>>>    - Introduction of the 4.1-rc1 -dev kernel (and associated perf fix).
>>>> I've built and booted these on my local machines and qemu, and
>>>> everything was sane.
>
> Does it fix the issue I've reported few days ago?
> http://lists.openembedded.org/pipermail/openembedded-core/2015-April/104344.html

Nope. But one config warning is far down on the list when I'm
trying to introduce new -stable's and an entire -dev kernel.

I didn't forget about it, it'll just get done in priority order.

Bruce

>
>>>> The -dev kernel obviously isn't something for deployment yet, but
>>>> it builds, and forms the base for follow up config changes, features
>>>> and development work. I built and booted core-image-kernel dev with
>>>> the 4.1 changes in place.
>>>
>>> The autobuilder showed up this for an x32 build :/.
>>
>> Can one of the intel folks have a look at this ? I won't be able to get
>> to it until Tuesday at the earliest.
>>
>> Bruce
>>
>>>
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/282/steps/BuildImages/logs/stdio
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


