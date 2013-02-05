Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U2moP-0007Fm-Nx
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 19:00:10 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2013 09:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,609,1355126400"; d="scan'208";a="258087707"
Received: from unknown (HELO envy.home) ([10.255.12.135])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2013 09:44:14 -0800
Message-ID: <511144EC.1030704@linux.intel.com>
Date: Tue, 05 Feb 2013 09:44:12 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
References: <cover.1360059615.git.dvhart@linux.intel.com>
	<41381da878685b601c62d446795c38119f08941b.1360059615.git.dvhart@linux.intel.com>
	<ly7gmn57tl.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51113140.5050600@linux.intel.com>
	<lytxpq4t0n.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lytxpq4t0n.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Enigmail-Version: 1.5
Cc: Darren Hart <public-dvhart-VuQAYsv1563Yd54FQh9/CA@plane.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/8] oe-git-proxy.sh: Add a new comprehensive git proxy script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 18:00:13 -0000
X-List-Received-Date: Tue, 05 Feb 2013 18:00:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/05/2013 08:36 AM, Enrico Scholz wrote:
> Darren Hart <dvhart@linux.intel.com> writes:
> 
>>>> +	$NC -X connect $*
>>>
>>> why '$*' but not '"$@*"'?
>>>
>> I'm not familiar with $@*
> 
> sorry... I meant "$@"
> 
> 
>> As for $* versus $@, the issue is how the arguments are presented. $*
>> as a single word, $@ each argument is quoted separately. I believe I
>> ran into issues with $@. I haven't had any trouble with $*.
> 
> $* is causing trouble all the time because it does not retain whitespaces
> or empty parameters.  There are only very few cases, where $* makes sense.
> 
> 
>> Is there a particular use case where you can see this failing as is?
> 
> "$@" is just the right thing to do in this situation.  E.g. when your
> script is called as
> 
> | oe-git-proxy.sh "${HOST}" "${PORT}"
> 
> and HOST is undefined due to some reason, you will try to connect to
> "${PORT}" with $*.  The "$@" will cause nc to complain about the broken
> HOST parameter.
> 
> 
> Btw...
> 
> | exec $NC $METHOD "$@"
> 
> would be the school book implementation for the thing you want to do...
> 
> 
> 
> Enrico

That all makes sense. When I read up the difference again in the bash
documentation I was surprised I had used $*, but thought I had done that
dance already. I'll update with "$@" and do some tests.

Thank you for the review and catching that.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


