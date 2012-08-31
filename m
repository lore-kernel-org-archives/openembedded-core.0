Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T7V16-0005ya-S4
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 19:28:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Aug 2012 10:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,348,1344236400"; d="scan'208";a="187677200"
Received: from unknown (HELO [10.255.12.251]) ([10.255.12.251])
	by orsmga001.jf.intel.com with ESMTP; 31 Aug 2012 10:16:06 -0700
Message-ID: <5040F156.2030609@linux.intel.com>
Date: Fri, 31 Aug 2012 10:16:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Bj=F6rn_Stenberg?= <bjst@enea.com>
References: <1346422229-61628-1-git-send-email-bjst@enea.com>
	<1346422229-61628-3-git-send-email-bjst@enea.com>
	<5040D8FE.3050506@linux.intel.com> <20120831170105.GA25179@giant>
In-Reply-To: <20120831170105.GA25179@giant>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] Enable bash-ptest
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
X-List-Received-Date: Fri, 31 Aug 2012 17:28:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 08/31/2012 10:01 AM, Björn Stenberg wrote:
> Saul Wold wrote:
>> You new patches still need patch headers with Upstream-Status and
>> Signed-off-by tags.
>
> Ouch, sorry about that. I added Signed-off but forgot upstream. I'll be more careful next time.
>
Just to be clear these need to be in your busybox patches not the commit 
message for the overall patch to OE-Core, I hope that makes sense.

In these two files:
meta/recipes-extended/bash/bash-4.2/build-tests.patch
meta/recipes-extended/bash/bash-4.2/test-output.patch


>> Should this be a DISTRO or IMAGE FEATURE? I can see potential
>> arguments for both sides, what was your thinking on choosing IMAGE
>> over DISTRO?
>
> I chose IMAGE since that is how the -dbg and -dev package groups are enabled, and -ptest is modeled after them. Also we have the EXTRA_IMAGE_FEATURES setting that can be used to enable this temporarily while I don't know if we have anything similar for DISTRO_FEATURES?
>
That makes sense also, I was thinking along the same lines, just wanted 
to get your reasoning captured.

Thanks
	Sau!




