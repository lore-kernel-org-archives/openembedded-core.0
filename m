Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0i3H-0006eS-L6
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 00:26:19 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Feb 2012 15:17:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110131835"
Received: from unknown (HELO helios.localnet) ([10.252.123.18])
	by azsmga001.ch.intel.com with ESMTP; 23 Feb 2012 15:17:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 Feb 2012 23:17:53 +0000
Message-ID: <2566428.9SdMv8sSb9@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <20120223210431.GC3769@jama.jama.net>
References: <11CBD2DA-EE9C-4062-AA95-7B1FAE68E82D@dominion.thruhere.net>
	<6C81C8C1-7D50-4B8E-9E72-68E5982D3709@dominion.thruhere.net>
	<20120223210431.GC3769@jama.jama.net>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: libsdl patch failure
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
X-List-Received-Date: Thu, 23 Feb 2012 23:26:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 23 February 2012 22:04:32 Martin Jansa wrote:
> > Are you using 'git' as PATCHTOOL or plain patch? 'patch' on my debian
> > system chokes, while 'git apply' works fine. I've sent a patch to make it
> > work with either.
> I also haven't seen patch failing.
> 
> I'm not setting PATCHTOOL, but I have PATCHRESOLVE = "noop" if that
> implies some other tool.

I'm not setting it either, which means it will be using the default (which is 
quilt according to a git grep). I have to admit I was not even aware of this 
option until now.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


