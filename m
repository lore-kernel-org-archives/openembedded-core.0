Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 60D036059F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 18:32:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8KIWCYA006689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Sep 2017 11:32:12 -0700 (PDT)
Received: from [128.224.56.221] (128.224.56.221) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 20 Sep 2017 11:32:11 -0700
To: Matt Madison <matt@madison.systems>, Khem Raj <raj.khem@gmail.com>
References: <007BD92917A2324FA403BCF9A464CF84CF41E3E8@ALA-MBC.corp.ad.wrs.com>
	<20878500-1BB2-43F0-A6A5-087775FC0FAB@madison.systems>
	<b8a7eae3-2b65-e17d-efe0-f7efb113fd38@windriver.com>
	<CAMKF1spd-DuNQLT+iGCTVWDXcWzpsXyEGtUCeHFz953jF5e2Sg@mail.gmail.com>
	<CAGgRHJp27mt4P2pPRkJEQgoUnmD4VAbj83=dCSrZT=X=53NFEQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <2eedee2e-f768-8470-1647-ea0c98c4e55c@windriver.com>
Date: Wed, 20 Sep 2017 14:32:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAGgRHJp27mt4P2pPRkJEQgoUnmD4VAbj83=dCSrZT=X=53NFEQ@mail.gmail.com>
X-Originating-IP: [128.224.56.221]
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: go-runtime does not build for mips32r2 tune
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
X-List-Received-Date: Wed, 20 Sep 2017 18:32:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2017-09-19 07:47 AM, Matt Madison wrote:
> On Mon, Sep 18, 2017 at 4:26 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Sep 18, 2017 at 3:52 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> On 9/18/17 5:50 PM, Matt Madison wrote:
>>>>
>>>>> On 18 Sep 2017, at 2:11 PM, Slater, Joseph <joe.slater@windriver.com
>>>>> <mailto:joe.slater@windriver.com>> wrote:
>>>>>
>>>>> This is the default tune for qemumips.  It appears that the problem does not
>>>>> occur for an oe-core checkout just before the split creating go-runtime.
>>>>>
>>>>> Before the split, go-helloworld will build, but after the split it will not
>>>>> because it needs go-runtime.
>>>>
>>>> There’s a TUNE_CCARGS_remove in go_1.9.bb to remove the ‘-march=mips32r2’ flag
>>>> that probably either needs to be moved to a .inc file or copied to
>>>> go-runtime_1.9.bb.  Missed that when splitting out the runtime recipe.
>>>
>>> That seems wrong.  We should be using the TUNE_CCARGS, and -not- using the
>>> arguments that 'go' has decided must be right.
>>>
>>> Otherwise the optimizations may or may not be compatible... and if someone
>>> selects different arguments, they won't get filtered.
>>
>> go supports mips32r1, and needs fpu or kernel FPU emulation enabled
>> so using mips32r2 might be fine back when I was adding it to oe-core it
>> did not work, things might be different with 1.9 release where mips
>> support is complete in golang.
> 
> It's still mips32r1, though, and the go build tool explicitly adds
> '-march=mips32 -mabi=32' when invoking the C compiler for cgo.
> 
> -Matt
> 

Is someone working on a fix or should I open a YP defect?

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

