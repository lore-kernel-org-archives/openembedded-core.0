Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QlmrA-0003vd-RA
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 20:59:53 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Qlmn6-00065u-9z from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 11:55:40 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 26 Jul 2011 11:52:55 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 26 Jul 2011 11:55:39 -0700
Message-ID: <4E2F0DA7.4080507@mentor.com>
Date: Tue, 26 Jul 2011 11:55:35 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311354521.git.tom_rini@mentor.com>	<c0c3e475a5fe98d61d0b92dca026486b955c2812.1311354521.git.tom_rini@mentor.com>	<1311609451.30326.244.camel@phil-desktop>	<4E2D9304.6090502@mentor.com>	<1311612043.30326.254.camel@phil-desktop>
	<4E2DA015.2050105@mentor.com>
In-Reply-To: <4E2DA015.2050105@mentor.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 26 Jul 2011 18:52:55.0983 (UTC)
	FILETIME=[3B251BF0:01CC4BC5]
Subject: Re: [PATCH v2 5/8] siteinfo: Move the rp-pppoe entry to common-linux
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 18:59:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/25/2011 09:55 AM, Tom Rini wrote:
> On 07/25/2011 09:40 AM, Phil Blundell wrote:
>> On Mon, 2011-07-25 at 09:00 -0700, Tom Rini wrote:
>>> On 07/25/2011 08:57 AM, Phil Blundell wrote:
>>>> On Fri, 2011-07-22 at 10:10 -0700, Tom Rini wrote:
>>>>> --- a/meta/site/common-linux
>>>>> +++ b/meta/site/common-linux
>>>>> @@ -23,3 +23,6 @@ bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
>>>>>  # mysql
>>>>>  ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
>>>>>  ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
>>>>> +
>>>>> +# rp-pppoe
>>>>> +rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
>>>>
>>>> Is that really correct?  Bitfield packing isn't an OS issue, it's
>>>> primarily a question of compiler choice.  For GCC I think it correlates
>>>> with endianness; looking at what that test is doing, I'd expect you to
>>>> get "reversed" on little-endian and "normal" on big-endian.
>>>
>>> It's possible we're getting this, and have been getting this wrong on
>>> big-endian targets but I haven't heard from Freescale this is failing
>>> for them.  I'm OK with dropping this bit out for now until we can
>>> confirm this test on a BE machine.
>>
>> That's probably best.  In any case, as far as I can tell rp-pppoe is
>> (despite what you might expect from the name) not actually in oe-core
>> itself, so perhaps its definitions don't belong in oe-core's site files
>> either.
> 
> Yeah.  At one point I was going to try and move the bits that oe-core
> doesn't use to meta-oe where they are or likely will be, but possibly
> after consolidation (and then just not adding in brand new ones, eg
> postgresql).

As you suspected, this is normal on BE and rev on LE.  I'll fix this for
meta-oe.

-- 
Tom Rini
Mentor Graphics Corporation


