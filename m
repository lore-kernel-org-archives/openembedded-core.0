Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U2oHh-0004tc-1T
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 20:34:25 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Feb 2013 11:18:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,609,1355126400"; d="scan'208";a="286967963"
Received: from unknown (HELO envy.home) ([10.255.12.108])
	by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2013 11:18:33 -0800
Message-ID: <51115B09.9090607@linux.intel.com>
Date: Tue, 05 Feb 2013 11:18:33 -0800
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
	<511144EC.1030704@linux.intel.com>
	<CAP9ODKr1qz6=k7xC84h0Try0HsydDhNyERPzuW-FhuaLRbYajQ@mail.gmail.com>
	<lyhalq4lz0.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyhalq4lz0.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Enigmail-Version: 1.5
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Darren Hart <public-dvhart-VuQAYsv1563Yd54FQh9/CA@plane.gmane.org>
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
X-List-Received-Date: Tue, 05 Feb 2013 19:34:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/05/2013 11:08 AM, Enrico Scholz wrote:
> Otavio Salvador <otavio@ossystems.com.br> writes:
> 
>> Please give it a try in dash as well.
> 
> fwiw, what's the point in writing such scripts plain sh?  I guess. every
> machine where this script is running has /bin/bash and performance is
> not critical for it. Using '#! /bin/bash' shebang fixes the problem
> where sh is non bash.
> 
> Some constructs in the scripts can be expressed mor efficiently in bash
> (e.g. the '... | sed' statements, or using arrays for the arguments).

Indeed, in fact I had to remove the bash parameter expansions
(substrings, etc) I had in my original script in order to make it
dash-able. I hate dash and personally find it to be completely
pointless, but for better or worse, people like it and there is an
expectation that scripts run in both dash and bash in OE-core.

If RP tells me a #!/bin/bash is acceptable, I'll restore the bashisms in
a heartbeat.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


