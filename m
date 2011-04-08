Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1Q8GJP-0003T3-1q
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 20:21:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Apr 2011 11:18:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,325,1299484800"; d="scan'208";a="416176586"
Received: from unknown (HELO [10.255.13.36]) ([10.255.13.36])
	by azsmga001.ch.intel.com with ESMTP; 08 Apr 2011 11:18:14 -0700
Message-ID: <4D9F5166.1020500@intel.com>
Date: Fri, 08 Apr 2011 11:18:14 -0700
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: "Cui, Dexuan" <dexuan.cui@intel.com>
References: <cover.1301388474.git.dexuan.cui@intel.com>	<c9789f2d0873c6b8ff2ae3a7b338b72527cfbf02.1301388474.git.dexuan.cui@intel.com>	<1301395410.24596.22.camel@rex>
	<1865303E0DED764181A9D882DEF65FB68A3F6A15D4@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB68A3F6A15D4@shsmsx502.ccr.corp.intel.com>
X-Mailman-Approved-At: Fri, 08 Apr 2011 22:05:31 +0200
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 1/1] qt4: remove the option -feliminate-dwarf2-dups to fix the build
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
X-List-Received-Date: Fri, 08 Apr 2011 18:21:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2011 04:43 AM, Cui, Dexuan wrote:
> Richard Purdie wrote:
>> On Tue, 2011-03-29 at 16:52 +0800, Dexuan Cui wrote:
>>> From: Dexuan Cui<dexuan.cui@intel.com>
>>>
>>> [YOCTO #932]
>>>
>>> After commit 5ea06dc295b657383fd97545c15255b294cf1a79(bitbake.conf:
>>> Prune global OPTIMIZATION flags) that adds an option
>>> -feliminate-dwarf2-dups, gcc 4.5 reports such an internal compiler
>>> error when building Qt4 if the option is used:
>>>
>>>> graphicsview/qgridlayoutengine.cpp:1553:1: internal compiler error:
>>>> in build_abbrev_table, at dwarf2out.c:9806 Please submit a full bug
>>>> report,
>>>> with preprocessed source if appropriate.
>>>> See<http://gcc.gnu.org/bugs.html>  for instructions.
>>>
>>> This is a gcc bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47361
>>>
>>> At present we can remove the option as a workaround.
>>>
>>> Thanks Robert Berger for reporting the bug and his investigation in
>>> gcc bugzilla and thanks Khem Raj for the quick suggestion about
>>> removing
>>> the option.
>>
>> How about we add the patch for this issue:
>>
>> http://gcc.gnu.org/ml/gcc-patches/2011-01/msg01647.html
> Ok,  I'll apply the patch to g++ and test building qt4.
>
Any update on this patch?

Sau!

> Thanks,
> -- Dexuan
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>



