Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8WGE-0003QF-Gb
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 13:27:59 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2012 05:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121633942"
Received: from unknown (HELO helios.localnet) ([10.252.123.171])
	by orsmga002.jf.intel.com with ESMTP; 16 Mar 2012 05:19:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: VIJAY KUMAR <vijaykumar.pulluri@gmail.com>
Date: Fri, 16 Mar 2012 12:19:08 +0000
Message-ID: <1448333.L62IlB2ypX@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <CAD=xvPuzd-S-kf-5Ns_95J8Sjpo=S0ygY7VnZtvMx3ppfP8UVg@mail.gmail.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<1481997.vT15FBqihJ@helios>
	<CAD=xvPuzd-S-kf-5Ns_95J8Sjpo=S0ygY7VnZtvMx3ppfP8UVg@mail.gmail.com>
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 16 Mar 2012 12:27:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Vijay,

On Friday 16 March 2012 17:25:33 VIJAY KUMAR wrote:
>    Iam not specialist in this. I am just following the steps mentioned here
> 
>      http://icedtea.classpath.org/wiki/CrossCompileOECoreTutorial
> 
> I am building from this path  vj@ubuntu:/host/coreembedded/oe-core/build$
> and it contains pseudodone file.
> 
> and in vj@ubuntu:/host/coreembedded/oe-core/build/conf local.conf exits..
> 
> and the same is calling bitbake which is present in scripts..

FYI when you run bitbake after using . ./oe-init-build-env it sets up PATH so 
that "bitbake" runs the bitbake wrapper script in scripts/, that is intended.

Are you experiencing a problem relating to this?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


