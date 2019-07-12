Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D83A37F0BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 10:33:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6CAXnJs015862
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Jul 2019 03:33:49 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Fri, 12 Jul 2019 03:33:48 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1561724553.git.liezhi.yang@windriver.com>
	<37d251c3a3f0b81fa910df996f54bc0be22cf846.1561724553.git.liezhi.yang@windriver.com>
	<CAJTo0LYyTbnvKE2_YAK4_Xu1csQaqLcMg5fCKCMxJ49vk3SepA@mail.gmail.com>
	<add0a48c-e769-9b86-1de7-88a156b3a599@windriver.com>
	<CAJTo0LaNjqmPG0RnRmeNOOeVqnX=muVCeyWcjtFW+1gnidRQmw@mail.gmail.com>
	<CAJTo0LboCz4FYFU5Rmy7a8XQXqXJCY1DNbpqHA7p_Anz+rgGow@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <41f8454d-7632-eb44-6aee-942d192a5165@windriver.com>
Date: Fri, 12 Jul 2019 18:34:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAJTo0LboCz4FYFU5Rmy7a8XQXqXJCY1DNbpqHA7p_Anz+rgGow@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] waf: python2 -> python3
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
X-List-Received-Date: Fri, 12 Jul 2019 10:33:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/11/19 6:46 PM, Burton, Ross wrote:
> On Thu, 11 Jul 2019 at 11:26, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On Thu, 11 Jul 2019 at 03:59, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> On 6/28/19 8:15 PM, Burton, Ross wrote:
>>>> Did you just do the minimum required, or take a new copy of waf from upstream?
>>>>
>>>> (https://gitlab.com/ita1024/waf/)
>>>
>>> I checked the one from upstream, it is still python2. The waf is the only one
>>> which still requires python2 in oe-core. We can get rid of python2 after this
>>> patch, what's your opinion, please?
>>
>> If that's the case then YES YES YES.  :)
> 
> Follow-up: do you mean remove python2 from HOSTTOOLS, or the recipe
> from oe-core?
> 
> $ bitbake -g world
> $ grep -- '-> "python"' recipe-depends.dot
> "kernel-devsrc" -> "python"
> "ltp" -> "python"
> "meta-world-pkgdata" -> "python"
> "packagegroup-core-tools-profile" -> "python"
> "packagegroup-core-tools-testapps" -> "python"
> "packagegroup-self-hosted" -> "python"
> "perf" -> "python"
> "python-nose" -> "python"
> "python-numpy" -> "python"
> "python-scons" -> "python"
> "python-setuptools" -> "python"
> 
> Nothing depends on the python-* in core, we can ignore the
> packagegroups, so that leaves kernel-devsrc, ltp, and perf. Also
> u-boot uses nativepython.
> 
> HOSTTOOLS is more complicated and there's still plenty of pieces that
> use host python.  I've an old poky-contrib:ross/nopy2 branch that
> fixes a few more users of host python2 that needs rebasing and
> retesting.

I meant remove python2 from HOSTTOOLS, but it seems not easy to do atm, so maybe
we still need keep it for many years. I have this idea is because host such as
Redhat Linux 8 doesn't install python2 by default any more.

// Robert

> 
> Ross
> 
> Ross
> 

