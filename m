Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCeGI-0000Sb-Ov
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 23:49:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Mar 2012 14:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="124001184"
Received: from unknown (HELO helios.localnet) ([10.252.123.228])
	by azsmga001.ch.intel.com with ESMTP; 27 Mar 2012 14:40:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 27 Mar 2012 22:40:01 +0100
Message-ID: <1601708.ZBzUYWUMic@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1203271728430.7513@oneiric>
References: <alpine.DEB.2.02.1203271728430.7513@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: verifying all necessary OE-related software on your dev host
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
X-List-Received-Date: Tue, 27 Mar 2012 21:49:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 27 March 2012 17:33:18 Robert P. J. Day wrote:
> the only thing a beginner might want to do is check that the dev host
> has all essential S/W for OE work.  i know that's documented in the
> yocto QS guide here:
> 
> http://www.yoctoproject.org/docs/current/yocto-project-qs/yocto-project-qs.h
> tml
> 
> is there any automated way to check for this?  is there any OE/bitbake
> equivalent to "please check that all necessary commands are
> installed"?

There are checks performed within sanity.bbclass to ensure the availability of 
all of these commands, so this happens automatically the first time a build is 
run.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


