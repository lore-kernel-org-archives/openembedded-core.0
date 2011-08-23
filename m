Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QvwPA-00087u-61
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 21:12:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2011 12:08:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41441347"
Received: from unknown (HELO envy.home) ([10.7.199.154])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2011 12:08:09 -0700
Message-ID: <4E53FA98.1060909@linux.intel.com>
Date: Tue, 23 Aug 2011 12:08:08 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
	<8c4bf939c0906cd744debeb85d5d55de622c184e.1313606178.git.paul.eggleton@linux.intel.com>
	<1313606497.3630.16.camel@lenovo.internal.reciva.com>
	<201108191127.48228.paul.eggleton@linux.intel.com>
In-Reply-To: <201108191127.48228.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Phil Blundell <philb@gnu.org>
Subject: Re: [RFC PATCH 1/2] image.bbclass, kernel.bbclass: create warning file about deleting deploydir files
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
X-List-Received-Date: Tue, 23 Aug 2011 19:12:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/19/2011 03:27 AM, Paul Eggleton wrote:
> On Wednesday 17 August 2011 19:41:37 Phil Blundell wrote:
>> On Wed, 2011-08-17 at 19:37 +0100, Paul Eggleton wrote:
>>> +Files in the deploy directory will not be re-created automatically if
>>> you +delete them. If you do delete a file, you will need to run:
>>> +
>>> +  bitbake -c clean TARGET
>>> +  bitbake TARGET
>>> +
>>> +where TARGET is the name of the appropriate package or target e.g.
>>> +"virtual/kernel" for the kernel, an image, etc.
>>
>> Doesn't it suffice to run "bitbake -f -c deploy TARGET"?
> 
> I guess it would, but I'm not sure we really want to be encouraging users to 
> use -f.

I don't see it as having the same negative conotation as the force
options to things like rpm and dpkg. Here it just means "I really want
to run this specific task again, even if you already ran it, likely
because I know I did something to undo what you just did." :-)

> 
> Cheers,
> Paul
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


