Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 4527A617B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 10:44:21 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id E245CF811F1; Thu, 14 Aug 2014 04:44:22 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id BBB6DF811D8;
	Thu, 14 Aug 2014 04:44:19 -0600 (MDT)
Message-ID: <53EC932B.2000506@mlbassoc.com>
Date: Thu, 14 Aug 2014 04:44:59 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <53EBD780.9060005@mlbassoc.com>	<CAP9ODKpND6P-x7ZKE9SuZ6vbfFF8RxoVSL3X9UDzj-WhV9yTpw@mail.gmail.com>	<CAMKF1soYYaAQ9tY7462=zEgo9urFaaAV-qDk6qhO=8_n0xdDyA@mail.gmail.com>	<53EC6F53.4070908@pseudoterminal.org>	<53EC71B1.3000200@pabigot.com>	<53EC723D.5000807@pseudoterminal.org>
	<53EC8951.5070700@pabigot.com>
In-Reply-To: <53EC8951.5070700@pabigot.com>
Subject: Re: GCC 4.9 considered evil
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
X-List-Received-Date: Thu, 14 Aug 2014 10:44:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-08-14 04:02, Peter A. Bigot wrote:
> On 08/14/2014 03:24 AM, Carlos Rafael Giani wrote:
>> On 08/14/2014 10:22 AM, Peter A. Bigot wrote:
>>> On 08/14/2014 03:12 AM, Carlos Rafael Giani wrote:
>>>> On 08/14/2014 02:46 AM, Khem Raj wrote:
>>>>>
>>>>>
>>>>> On Wednesday, August 13, 2014, Otavio Salvador <otavio@ossystems.com.br <mailto:otavio@ossystems.com.br>> wrote:
>>>>>
>>>>>     On Wed, Aug 13, 2014 at 6:24 PM, Gary Thomas <gary@mlbassoc.com <javascript:;>> wrote:
>>>>>     > I've found that the latest GCC doesn't work very well, at
>>>>>     > least not on ARM (and obviously other architectures as well [1])
>>>>>     > When I build Google Chromium browser for my i.MX boards using
>>>>>     > GCC-4.9.x, no pages can be rendered - massive bloodshed and
>>>>>     > failures are shown on the console.  If I use the older GCC 4.8.2,
>>>>>     > everything else the same, all is well.
>>>>>     >
>>>>>     > Here's my configuration:
>>>>>     > BB_VERSION        = "1.23.1"
>>>>>     > BUILD_SYS         = "x86_64-linux"
>>>>>     > NATIVELSBSTRING   = "Ubuntu-13.10"
>>>>>     > TARGET_SYS        = "arm-amltd-linux-gnueabi"
>>>>>     > MACHINE           = "teton-p0382"
>>>>>     > DISTRO            = "amltd"
>>>>>     > DISTRO_VERSION    = "1.6+snapshot-20140812"
>>>>>     > TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa9"
>>>>>     > TARGET_FPU        = "vfp-neon"
>>>>>     > meta              = "master:86afd7eb7c679eb065706137f28f44248f3fbc5a"
>>>>>     > meta-amltd        = "master:899529b4184dc9e3e291e7fcdbbf157233db056d"
>>>>>     > meta-teton-imx6-p0382 = "master:9188e2f8fafd203c95dcd7a3c79cb38a1568e9b5"
>>>>>     > meta-fsl-arm      = "master:b0cf5c78c5f98c5977ae556d331e7495648f154c"
>>>>>     > meta-fsl-arm-extra = "master:12e560967b7136222c325d11633295fe3a0c701c"
>>>>>     > meta-browser      = "master:da93c8e386133a15eff1414d9307c8f2c7a44787"
>>>>>     >
>>>>>     > Should this be filed as a bug?  I don't have much data other than it
>>>>>     > simply breaks (and chrome is not the easiest thing to debug!).  Other
>>>>>     > applications seem OK, but I am loathe to trust it...
>>>>>     >
>>>>>     > I'm going to hold onto GCC-4.8.x for my $DISTRO at least (and I hope
>>>>>     > it doesn't vanish like 4.7.x did too quickly).
>>>>>     >
>>>>>     > [1]
>>>>>     > http://slashdot.org/story/14/07/27/1838219/linus-torvalds-gcc-490-seems-to-be-terminally-broken
>>>>>     >
>>>>>     > Note: I've also tried this on qemux86 (a totally different
>>>>>     > architecture) and chrome bombs just as badly!
>>>>>
>>>>>     I confirm that GCC 4.9 does NOT work for Chromium 35. At this moment I
>>>>>     am not aware of any fix for it.
>>>>>
>>>>>
>>>>> Again Its a broad brush statement. Something concrete is needed if some.action is to taken
>>>>>
>>>>>
>>>>>     IIRC the Chromium 37 works though.
>>>>>
>>>>>
>>>>> Well then its less chance.that someone will fix 35
>>>>>
>>>>>     --
>>>>>     Otavio Salvador                             O.S. Systems
>>>>>     http://www.ossystems.com.br http://code.ossystems.com.br
>>>>>     Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>>>>>     --
>>>>>     _______________________________________________
>>>>>     Openembedded-core mailing list
>>>>>     Openembedded-core@lists.openembedded.org <javascript:;>
>>>>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>
>>>>>
>>>>>
>>>>
>>>>
>>>> The problem is that narrowing down is very difficult, since the problems manifest themselves as seemingly random stack corruptions. I have tried to dig into it, but got
>>>> nowhere. Pointers suddenly became null for no apparent reason, or were corrupted, free() calls failed, values on the stack suddenly changed without being modified by the code etc.
>>>>
>>>> I wouldn't rule out that Linus Torvald's find isn't the cause here. Look at this part of his message:
>>>>
>>>> "The x86-64 ABI specifies a 128-byte red-zone under the stack pointer, and this is ok by that limit. It looks like it's illegal (136 > 128), but the fact is, we've had four
>>>> "pushq"s to update %rsp since loading the frame pointer, so it's just *barely* legal with the red-zoning."
>>>>
>>>> Perhaps gcc is pushing further outside of the red zone bounds, thus causing the problems. No idea how to check for that at the moment though.
>>>
>>> Simplest would be to apply the upstream fix to Yocto's gcc and see if that helps.  You'd want commit 556537c4ad0df4cbebb74197bb2bdea75cf5dd35 from
>>> git://gcc.gnu.org/git/gcc.git.  (The patch went into gcc-4_9-branch one day after 4.9.1 was released.)
>>>
>>> I'd add it to the current set but ATT Khem and I both have pending patches that touch the same gcc files, so it'd just increase the conflicts.
>>>
>>> Peter
>>>
>>>>
>>>>
>>>
>>>
>>>
>>
>>
>>
>> To further elaborate, the Chromium developers know about problems with GCC 4.9. Here is an example: https://code.google.com/p/chromium/issues/detail?id=385729
>
> For what little comfort it might give, that one turns out to be a bug in Chromium that was exposed by GCC 4.9, not a GCC 4.9 bug. "Still, the root issue exists on every branch and
> it's sheer chance that most builds don't appear to be affected."
>
>> Note that while a build of Chromium 37 works, I've had internal compiler errors happen. I actually had to re-run the run.do_compile script about 30 times until the build finished
>> (the ICE's happen only sometimes, so repeated attempts at compiling eventually yields a result.)
>>
>> Thanks for the link. I'll try it out when I have the time. Aside from that, I recommend to keep the GCC 4.8 recipes for the time being. At least they should not be removed as
>> quickly as the 4.7 ones.
>
> I'm adding the twisted-Torvalds'-knickers patch to both gcc 4.8 and 4.9 in my gcc series.
>
> Peter
>

Fair enough.  I'm glad that I'm not the only one seeing such
issues (although I seem to have been the first to kick the hornet's
nest!).  My comments were not so much for "please fix this" as
they were "buyer beware".  I've seen problems with other tools
when built with GCC 4.9, e.g. midori also fails pretty badly on
at least one target but seems OK when built with 4.8, so for now
I'm sticking with the older compiler.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

