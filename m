Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QlOVe-0001by-VP
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 19:00:03 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QlORc-0004Tf-8k from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 09:55:52 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 25 Jul 2011 09:53:13 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 25 Jul 2011 09:55:51 -0700
Message-ID: <4E2DA015.2050105@mentor.com>
Date: Mon, 25 Jul 2011 09:55:49 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311354521.git.tom_rini@mentor.com>	<c0c3e475a5fe98d61d0b92dca026486b955c2812.1311354521.git.tom_rini@mentor.com>	<1311609451.30326.244.camel@phil-desktop>
	<4E2D9304.6090502@mentor.com>
	<1311612043.30326.254.camel@phil-desktop>
In-Reply-To: <1311612043.30326.254.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 25 Jul 2011 16:53:13.0421 (UTC)
	FILETIME=[57975FD0:01CC4AEB]
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
X-List-Received-Date: Mon, 25 Jul 2011 17:00:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/25/2011 09:40 AM, Phil Blundell wrote:
> On Mon, 2011-07-25 at 09:00 -0700, Tom Rini wrote:
>> On 07/25/2011 08:57 AM, Phil Blundell wrote:
>>> On Fri, 2011-07-22 at 10:10 -0700, Tom Rini wrote:
>>>> --- a/meta/site/common-linux
>>>> +++ b/meta/site/common-linux
>>>> @@ -23,3 +23,6 @@ bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
>>>>  # mysql
>>>>  ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
>>>>  ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
>>>> +
>>>> +# rp-pppoe
>>>> +rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
>>>
>>> Is that really correct?  Bitfield packing isn't an OS issue, it's
>>> primarily a question of compiler choice.  For GCC I think it correlates
>>> with endianness; looking at what that test is doing, I'd expect you to
>>> get "reversed" on little-endian and "normal" on big-endian.
>>
>> It's possible we're getting this, and have been getting this wrong on
>> big-endian targets but I haven't heard from Freescale this is failing
>> for them.  I'm OK with dropping this bit out for now until we can
>> confirm this test on a BE machine.
> 
> That's probably best.  In any case, as far as I can tell rp-pppoe is
> (despite what you might expect from the name) not actually in oe-core
> itself, so perhaps its definitions don't belong in oe-core's site files
> either.

Yeah.  At one point I was going to try and move the bits that oe-core
doesn't use to meta-oe where they are or likely will be, but possibly
after consolidation (and then just not adding in brand new ones, eg
postgresql).

-- 
Tom Rini
Mentor Graphics Corporation


