Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QKE7h-0000qC-Ms
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 20:27:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 May 2011 11:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,354,1301900400"; d="scan'208";a="641358080"
Received: from unknown (HELO [10.255.12.71]) ([10.255.12.71])
	by orsmga002.jf.intel.com with ESMTP; 11 May 2011 11:24:13 -0700
Message-ID: <4DCAD458.60202@linux.intel.com>
Date: Wed, 11 May 2011 11:24:24 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <4DCAB609.8030601@linux.intel.com>	
	<BANLkTintvgFGKUUUdvq2M7Q=m+gYuzs2-A@mail.gmail.com>
	<1305135637.30391.455.camel@rex>
In-Reply-To: <1305135637.30391.455.camel@rex>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>
Subject: Re: RFC: create-pull-request / send-pull-request updates
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
X-List-Received-Date: Wed, 11 May 2011 18:27:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/11/2011 10:40 AM, Richard Purdie wrote:
> On Wed, 2011-05-11 at 10:01 -0700, Khem Raj wrote:
>> On Wed, May 11, 2011 at 9:15 AM, Darren Hart <dvhart@linux.intel.com> wrote:
>>>
>>> Thoughts/Comments?
>>>
>>
>> I would suggest to alter the process a bit and get rid of the scripts
>> completely. Patches are sent to mailing list for review once reviewed
>> the final patches are
>> sent as git pull-request. It would simplify things.

I think I know where you're coming from Khem, and I don't disagree that
it would simplify things for some people. However, we have a wide range
of people working on the various portions of the project. The scripts
offer a means of standardizing how patches are reviewed and pulled, and
I think that has improved things significantly over how things were a
year ago.

With the Linux kernel, the vast majority of patches are just sent to the
list as email. Pull requests are typically sent from sub-maintainers.
However, the poky developers have long been using a pull model for many
contributors. The problem was the patches weren't ever hitting the list.
This led me to write the scripts in the first place. They attempted to
maintain the pull model which worked well for the maintainers while
still ensuring there was easy access to the patches for review.

> 
> I'd argue that it doesn't. It just means the requests come in different
> formats, sometimes with key pieces of information missing which means
> the people trying to handle the requests (like me) get frustrated.
> 
> I find it easiest to deal with requests that have come through those
> scripts.


Obviously we need to try and make things as easy as possible for the
maintainers to merge in changes. One thing I think would be painful for
maintainer with the current model, is that a pull request appears (at
least to me) to be the final version of a patch series, when in fact
they can be the very first iteration and still require review. The pull
does make it easy to do some testing of patches in addition of review
though.

I can certainly see both sides to this.


> 
> Cheers,
> 
> Richard
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


