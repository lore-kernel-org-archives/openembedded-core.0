Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S7q7R-0006gn-70
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:28:05 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 08:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128925172"
Received: from unknown (HELO envy.home) ([10.255.15.199])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2012 08:19:18 -0700
Message-ID: <4F60B6CA.3040401@linux.intel.com>
Date: Wed, 14 Mar 2012 08:18:34 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331684953.git.scott.a.garman@intel.com>
	<4F60B1F4.4040705@linux.intel.com>
	<20120314150033.GJ3919@jama.jama.net> <1531514.2kqRaLqA4b@helios>
In-Reply-To: <1531514.2kqRaLqA4b@helios>
X-Enigmail-Version: 1.3.5
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 1/1] ncurses: fix packaging of moved libraries
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
X-List-Received-Date: Wed, 14 Mar 2012 15:28:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/14/2012 08:07 AM, Paul Eggleton wrote:
> On Wednesday 14 March 2012 16:00:33 Martin Jansa wrote:
>> isn't just
>> ALLOW_EMPTY_${PN}-libncursesw = "1"
>> enough?
> 
> I suspect we don't care if the libncursesw package isn't created when wide 
> character support is disabled, if so, we don't even need that.

OK, so if a package is defined and none of the files exist, bitbake will
simply not create the package - and no errors or warnings will be raised?

If so, then kindly disregard my comments.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


