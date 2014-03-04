Return-Path: <nitin.a.kamble@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B92B86E759
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 22:27:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Mar 2014 14:27:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,588,1389772800"; d="scan'208";a="494101166"
Received: from unknown (HELO [10.254.121.201]) ([10.254.121.201])
	by orsmga002.jf.intel.com with ESMTP; 04 Mar 2014 14:26:33 -0800
Message-ID: <53165319.7020506@intel.com>
Date: Tue, 04 Mar 2014 14:26:33 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1393957379.git.nitin.a.kamble@intel.com>	
	<a63693d8974ab55ba1031cf36302f28c4cc86c22.1393957379.git.nitin.a.kamble@intel.com>
	<1393969091.4151.3.camel@e130.pbcl.net>
In-Reply-To: <1393969091.4151.3.camel@e130.pbcl.net>
Cc: Openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] QA_check: special case kernel modules for x32 targets
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
X-List-Received-Date: Tue, 04 Mar 2014 22:27:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/4/2014 1:38 PM, Phil Blundell wrote:
> On Tue, 2014-03-04 at 10:28 -0800, nitin.a.kamble@intel.com wrote:
>> -        ("virtual/kernel" in provides) and (target_os == "linux-gnux32")):
>> +        (("virtual/kernel" in provides) or (KERNEL_MODULE_RECIPE == "1")) and (target_os == "linux-gnux32")):
> Can you not use bb.data.inherits_class("module") rather than adding this
> extra variable?
This would simplify the code.
> Also, out of curiosity, I don't entirely understand how the code above
> can possibly work.  KERNEL_MODULE_RECIPE is a bitbake variable that's
> either defined to 1 or not defined at all, right?  Is there some special
> magic nowadays that allows you to refer to it transparently from python
> code without using d.getVar()?
There is no such special magic. This fix need to be fixed.

Thanks,
Nitin

> p.
>
>


