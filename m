Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QFWRT-0007YS-Mx
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 20:59:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Apr 2011 11:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,282,1301900400"; d="scan'208";a="635478645"
Received: from unknown (HELO [10.255.13.11]) ([10.255.13.11])
	by orsmga002.jf.intel.com with ESMTP; 28 Apr 2011 11:57:16 -0700
Message-ID: <4DB9B883.3050302@linux.intel.com>
Date: Thu, 28 Apr 2011 11:57:07 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1303922644.git.paul.eggleton@linux.intel.com>	<318c3139745e74177a23f323881dbd76ddc42006.1303922644.git.paul.eggleton@linux.intel.com>	<4DB858B9.3030901@linux.intel.com>
	<201104281113.45335.paul.eggleton@linux.intel.com>
In-Reply-To: <201104281113.45335.paul.eggleton@linux.intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 1/1] initscripts: remove -i from halt/reboot	arguments and allow override
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
X-List-Received-Date: Thu, 28 Apr 2011 19:00:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/28/2011 03:13 AM, Paul Eggleton wrote:
> On Wednesday 27 April 2011 18:56:09 Darren Hart wrote:
>> Is the SED_* tag a common search/replace mechanism in OE recipes? It's
>> fine, I'm just wondering if there is an accepted best practice for this
>> sort of thing. I know we do some sed replacements of /usr/bin and /etc.
> 
> Is there a more appropriate mechanism for substituting values of variables 
> into files (genuinely asking)? If this is the best mechanism it's possible we 
> might want to have a standard naming scheme though, I just made this one up on 
> the spot - I see in some other places we've used FIXMExxxx, so at least it's 
> not the worst :)

There is an effort to document how to do initscripts, so including
something along these lines would be appropriate there. I have no
objection to SED_.... FIXMExxx that's a different story ;-)

> 
> Cheers,
> Paul
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


