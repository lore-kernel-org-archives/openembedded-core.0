Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S7q8M-0006jJ-Lr
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:29:02 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 08:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128925557"
Received: from unknown (HELO envy.home) ([10.255.15.199])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2012 08:20:16 -0700
Message-ID: <4F60B703.6020404@linux.intel.com>
Date: Wed, 14 Mar 2012 08:19:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<e4d001f8c6f8945c8c70c2558ad5f9e1fd85dfad.1331685330.git.paul.eggleton@linux.intel.com>
	<4F60B091.9010005@linux.intel.com> <2443372.s5EABu74ja@helios>
In-Reply-To: <2443372.s5EABu74ja@helios>
X-Enigmail-Version: 1.3.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] scripts/bitbake: ensure user is in build directory
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
X-List-Received-Date: Wed, 14 Mar 2012 15:29:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/14/2012 08:09 AM, Paul Eggleton wrote:
> On Wednesday 14 March 2012 07:52:01 Darren Hart wrote:
>> Should this have some kind of prefix? "ERROR: " or something along those
>> lines for consistency with other output?
> 
> I did wonder about that; in the end I elected to be consistent with the python 
> version errors in the same script (although I was the one who added those 
> IIRC... heh). Perhaps we ought to add the "ERROR: " prefix to all of the errors 
> in the wrapper script.
> 

Consistency is king here IMO. I don't care much one way or the other, so
long as it's consistent.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


