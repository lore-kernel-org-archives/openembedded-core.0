Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QToLE-0001eP-OZ
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 06:56:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Jun 2011 21:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,330,1304319600"; 
   d="scan'208";a="9997320"
Received: from unknown (HELO [10.255.12.161]) ([10.255.12.161])
	by orsmga002.jf.intel.com with ESMTP; 06 Jun 2011 21:53:18 -0700
Message-ID: <4DEDAEBE.8080404@linux.intel.com>
Date: Mon, 06 Jun 2011 21:53:18 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4DE56B0D.4020209@intel.com>
	<4DE87AD1.1050004@linux.intel.com>	<4DE8EE32.9060905@windriver.com>	<1307115801.2529.350.camel@phil-desktop>
	<BANLkTi=n+MNMu+EY0F5Hh3OqVe7Ex7CCQg@mail.gmail.com>
In-Reply-To: <BANLkTi=n+MNMu+EY0F5Hh3OqVe7Ex7CCQg@mail.gmail.com>
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: Tell me your build error message annoyances!
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
X-List-Received-Date: Tue, 07 Jun 2011 04:56:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/03/2011 08:47 AM, Chris Larson wrote:
> On Fri, Jun 3, 2011 at 8:43 AM, Phil Blundell <pb@pbcl.net> wrote:
>> On Fri, 2011-06-03 at 09:22 -0500, Mark Hatle wrote:
>>> I believe currently we have around 3-5 messages per step, and it's still too
>>> noisy -- unless you need to debug something.
>>
>> Correct.  Right now, the output looks like:
>>
>> NOTE: Running task 613 of 728 (ID: 190, virtual:native:/home/pb/oe/oe-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_install)
>> NOTE: package util-linux-native-2.19.1-r0: task do_install: Started
>> NOTE: package util-linux-native-2.19.1-r0: task do_install: Succeeded
>> NOTE: Running task 614 of 728 (ID: 191, virtual:native:/home/pb/oe/oe-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_populate_sysroot)
>> NOTE: package util-linux-native-2.19.1-r0: task do_populate_sysroot: Started
>> NOTE: package util-linux-native-2.19.1-r0: task do_populate_sysroot: Succeeded
>>
>> It looks as though the "Started" and "Succeeded" lines could just be
>> deleted without losing any real information.
> 
> Heh, I used to have a personal branch where I dropped those, and also
> removed the unnecessary NOTE: prefix. I think its a given that
> something that doesn't indicate a warning or an error is simply
> informative :) The problem with dropping those messages is for
> postprocessing scripts, which may well want/need to know when a task
> completes, not just when it starts. Still, yet another case of
> something we could drop as long as we log it. We need to add a main
> bitbake execution log that captures everything, including debug
> messages, whether the user specifies -D or not.

In most systems, running with -D implies not only greater verbosity, but
also reduced performance. I haven't checked, but I expect that is the
case with bitbake as well. I don't think we want to enable all of -D and
log it by default.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


