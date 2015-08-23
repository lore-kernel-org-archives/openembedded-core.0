Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD2A73E11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Aug 2015 02:26:31 +0000 (UTC)
Received: by igfj19 with SMTP id j19so36494502igf.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 19:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zmSWQg39IRl2lbAkdDAt4QWWHVSVvuvlRwKEJ1Xej6w=;
	b=TSd05oScweFTxuiWcKymg3VVHarv4mE8//aVew1i467RXktoASGZ3wfY0Bs/tcfKZl
	EMi5M9j6POhBv4uqu3CSAOTX3MbFUIzyVZpS7O3MZEzMmgNpVb68jZh4lnLuaBZQsuax
	WdFjjUsbRRi/O4XqQ2OB+snCTFc4akNHV5ijCEv8WPf+7I1cNqIaEp1NFJNphgHWEYaN
	dX5GKLaryOAnsUV8g12RZJori9PYWQiuGo7vD9CUkvHrpnQqGJkzPrInGyqYNAD35JQG
	y6k6LrHwV3cNsdMXE1LojZjEPF6/MI5L0msUbuHmRWDYM3DPmBMi4cEG9SkUf4aNfNxy
	vG8g==
X-Received: by 10.50.30.226 with SMTP id v2mr10397742igh.11.1440296791673;
	Sat, 22 Aug 2015 19:26:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Sat, 22 Aug 2015 19:26:01 -0700 (PDT)
In-Reply-To: <55D6F9FC.9020807@windriver.com>
References: <1439787800-21088-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LZRWXQOc+SCbL1PeJ9QXn_9WHKDC3y6t+QpJ8-_689Y6w@mail.gmail.com>
	<5402FBA9-07E4-47CF-983E-E8778B5AE2F6@gmail.com>
	<CAJTo0La4nHiHRLzraJdmO1AMSZ9RJGi=WSZAemrcGPFZTsoXrg@mail.gmail.com>
	<CAMKF1soxndfF7OLyAx-c49WBDdLhbbecQhxSj7ixeo2hFsRcTA@mail.gmail.com>
	<55D5D076.5000106@balister.org>
	<CAMKF1sqfGP1VGefHU_HRBSZnF=UikHZcs=b9sO92PO5v5TBaBQ@mail.gmail.com>
	<55D682D9.4050902@windriver.com> <55D6F9FC.9020807@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Aug 2015 19:26:01 -0700
Message-ID: <CAMKF1spQSibPq-Yn+Th8qUfYCj30ysB9viKerVEoM-s5xzCnXg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
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
X-List-Received-Date: Sun, 23 Aug 2015 02:26:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 21, 2015 at 3:14 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> Hi Khem,
>
> I built core-image-minimal for qemuarm64.
> There's a lot of failures and warnings at boot time and the system boots
> into rescue mode.
> And I also verified 199 has no such problem.

I verified once again specifically on qemuarm64, and all came up fine,
with no service failures, btw you need these three patches together

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=31772f3fc4745100bedf2e0d67b140a9b22d3f4b
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=fcba0329bc1a2b9d6d071247011cd43a9271d251
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=ddfe697d82e532e4c80e69f729170ca4571f7803

and I tried with gcc 4.9 this time.


>
> Best Regards,
> Chen Qi
>
>
> On 08/21/2015 09:46 AM, Randy MacLeod wrote:
>>
>> On 2015-08-20 09:17 PM, Khem Raj wrote:
>>>
>>> On Thu, Aug 20, 2015 at 6:04 AM, Philip Balister <philip@balister.org>
>>> wrote:
>>>>
>>>> On 08/19/2015 10:21 PM, Khem Raj wrote:
>>>>>
>>>>> On Wed, Aug 19, 2015 at 12:55 PM, Burton, Ross <ross.burton@intel.com>
>>>>> wrote:
>>>>>>
>>>>>>
>>>>>> On 17 August 2015 at 16:41, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>> There are many reasons, for me its overlay support for
>>>>>>> systemd-nspawn,
>>>>>>> networkd has got many new features that is now usable w.r.t. IP
>>>>>>> forwarding,
>>>>>>> vxlan etc.
>>>>>>> and it has many bug fixed in those 2000 odd commits since 219, no
>>>>>>> different then any other package upgrades we do in general it keep
>>>>>>> the
>>>>>>> upgrade workload lower as we roll the releases.
>>>>>>> Any specific concerns ?
>>>>>>
>>>>>>
>>>>>>
>>>>>> Can we get an updated patch with a clearer commit log?
>>>>
>>>>
>>>> I've also heard that as systemd evolves, more binaries are getting added
>>>> to the base package that should be packaged separately for people
>>>> interested in small images. I do not have personal experience here, but
>>>> wanted to pass along the feedback.
>>>>
>>>> We should look at buildhistory packaging differences when we do
>>>> upgrades.
>>>
>>>
>>> Here is the diff between files in 219 and 224, if you want to know
>>> more I can paste more info just let me know.
>>>
>>> https://gist.github.com/kraj/2a066973a5e5cf83ed24
>>>
>>> sizes have gone up on daemons, no new daemons besides some new service
>>> files
>>> and scripts are added
>>>
>>
>> ubu-15.10 will use v224 as well:
>> http://cdimage.ubuntu.com/daily-live/current/wily-desktop-amd64.manifest
>> and Arch and a couple other distro are using this version already:
>>    http://pkgs.org/download/systemd
>>
>> v224 was released 3 weeks ago:
>> ---
>> $ git log -1 v224
>> commit b2a0ac5e5b29c73ca7c0da23369a4769d5a91ddd
>> ...
>> Date:   Fri Jul 31 18:56:38 2015 +0200
>> ---
>>
>> Khem's summary of the binaries is reassuring given that there
>> has been lots of churn:
>>
>> $ git log --oneline v219..v224 |  wc -l
>> 2167
>> $ git diff v219..v224 | diffstat | tail -1
>>  1367 files changed, 109907 insertions(+), 166577 deletions(-)
>>
>> I'm skimming the NEWS file from 219->224 and I haven't seen
>> anything that concerns me yet:
>>    https://github.com/systemd/systemd/blob/master/NEWS
>> Qi,
>> Please take a closer look at the NEWS file,
>> review Khem's uprev and build and boot qemuarm64, qemuppc
>> when you have time. Send partial feedback today even if you
>> just review the commit and NEWS file.
>>
>> Qi may not be able to do that in the next couple of day
>> due to SDK work.
>>
>> Khem,
>> What testing have you done so far?
>> Any ptest?
>> What toolchain version are you building with, btw?
>>
>>
>> It's late in M3 and we still have the kernel and toolchain coming in
>> but unless we hear of known problems with v224, let's go for it
>> once the new toolchain and kernel have settled.
>>
>

