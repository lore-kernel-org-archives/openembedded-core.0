Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E0B2875794
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:14:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7LADomh027084
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Aug 2015 03:13:50 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Fri, 21 Aug 2015 03:13:50 -0700
Message-ID: <55D6F9FC.9020807@windriver.com>
Date: Fri, 21 Aug 2015 18:14:20 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Randy MacLeod <randy.macleod@windriver.com>, Khem Raj
	<raj.khem@gmail.com>, Philip Balister <philip@balister.org>
References: <1439787800-21088-1-git-send-email-raj.khem@gmail.com>	<CAJTo0LZRWXQOc+SCbL1PeJ9QXn_9WHKDC3y6t+QpJ8-_689Y6w@mail.gmail.com>	<5402FBA9-07E4-47CF-983E-E8778B5AE2F6@gmail.com>	<CAJTo0La4nHiHRLzraJdmO1AMSZ9RJGi=WSZAemrcGPFZTsoXrg@mail.gmail.com>	<CAMKF1soxndfF7OLyAx-c49WBDdLhbbecQhxSj7ixeo2hFsRcTA@mail.gmail.com>	<55D5D076.5000106@balister.org>
	<CAMKF1sqfGP1VGefHU_HRBSZnF=UikHZcs=b9sO92PO5v5TBaBQ@mail.gmail.com>
	<55D682D9.4050902@windriver.com>
In-Reply-To: <55D682D9.4050902@windriver.com>
X-Originating-IP: [128.224.162.211]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4 V2] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Fri, 21 Aug 2015 10:14:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Khem,

I built core-image-minimal for qemuarm64.
There's a lot of failures and warnings at boot time and the system boots 
into rescue mode.
And I also verified 199 has no such problem.

Best Regards,
Chen Qi

On 08/21/2015 09:46 AM, Randy MacLeod wrote:
> On 2015-08-20 09:17 PM, Khem Raj wrote:
>> On Thu, Aug 20, 2015 at 6:04 AM, Philip Balister 
>> <philip@balister.org> wrote:
>>> On 08/19/2015 10:21 PM, Khem Raj wrote:
>>>> On Wed, Aug 19, 2015 at 12:55 PM, Burton, Ross 
>>>> <ross.burton@intel.com> wrote:
>>>>>
>>>>> On 17 August 2015 at 16:41, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>
>>>>>> There are many reasons, for me its overlay support for 
>>>>>> systemd-nspawn,
>>>>>> networkd has got many new features that is now usable w.r.t. IP 
>>>>>> forwarding,
>>>>>> vxlan etc.
>>>>>> and it has many bug fixed in those 2000 odd commits since 219, no
>>>>>> different then any other package upgrades we do in general it 
>>>>>> keep the
>>>>>> upgrade workload lower as we roll the releases.
>>>>>> Any specific concerns ?
>>>>>
>>>>>
>>>>> Can we get an updated patch with a clearer commit log?
>>>
>>> I've also heard that as systemd evolves, more binaries are getting 
>>> added
>>> to the base package that should be packaged separately for people
>>> interested in small images. I do not have personal experience here, but
>>> wanted to pass along the feedback.
>>>
>>> We should look at buildhistory packaging differences when we do 
>>> upgrades.
>>
>> Here is the diff between files in 219 and 224, if you want to know
>> more I can paste more info just let me know.
>>
>> https://gist.github.com/kraj/2a066973a5e5cf83ed24
>>
>> sizes have gone up on daemons, no new daemons besides some new 
>> service files
>> and scripts are added
>>
>
> ubu-15.10 will use v224 as well:
> http://cdimage.ubuntu.com/daily-live/current/wily-desktop-amd64.manifest
> and Arch and a couple other distro are using this version already:
>    http://pkgs.org/download/systemd
>
> v224 was released 3 weeks ago:
> ---
> $ git log -1 v224
> commit b2a0ac5e5b29c73ca7c0da23369a4769d5a91ddd
> ...
> Date:   Fri Jul 31 18:56:38 2015 +0200
> ---
>
> Khem's summary of the binaries is reassuring given that there
> has been lots of churn:
>
> $ git log --oneline v219..v224 |  wc -l
> 2167
> $ git diff v219..v224 | diffstat | tail -1
>  1367 files changed, 109907 insertions(+), 166577 deletions(-)
>
> I'm skimming the NEWS file from 219->224 and I haven't seen
> anything that concerns me yet:
>    https://github.com/systemd/systemd/blob/master/NEWS
> Qi,
> Please take a closer look at the NEWS file,
> review Khem's uprev and build and boot qemuarm64, qemuppc
> when you have time. Send partial feedback today even if you
> just review the commit and NEWS file.
>
> Qi may not be able to do that in the next couple of day
> due to SDK work.
>
> Khem,
> What testing have you done so far?
> Any ptest?
> What toolchain version are you building with, btw?
>
>
> It's late in M3 and we still have the kernel and toolchain coming in
> but unless we hear of known problems with v224, let's go for it
> once the new toolchain and kernel have settled.
>


