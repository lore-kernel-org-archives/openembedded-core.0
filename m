Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0Fl9-0000Ac-O5
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 18:13:43 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Feb 2012 09:05:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120148629"
Received: from unknown (HELO helios.localnet) ([10.252.123.31])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2012 09:05:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 17:05:06 +0000
Message-ID: <2346347.g99Y6mRhMf@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <11CBD2DA-EE9C-4062-AA95-7B1FAE68E82D@dominion.thruhere.net>
References: <11CBD2DA-EE9C-4062-AA95-7B1FAE68E82D@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Wed, 22 Feb 2012 17:13:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 22 February 2012 17:40:03 Koen Kooi wrote:
> Is anyone else seeing this:
> 
> OTE: package libsdl-1.2.14-r5: task do_unpack: Started
> NOTE: package libsdl-1.2.14-r5: task do_unpack: Succeeded
> NOTE: Running task 1611 of 1622 (ID: 1,
> /OE/tentacle/sources/openembedded-core/meta/recipes-graphics/libsdl/libsdl_
> 1.2.14.bb, do_patch) NOTE: package libsdl-1.2.14-r5: task do_patch: Started
> ERROR: Command Error: exit status: 1  Output:
> Applying patch add.XGetRequest.symbol.patch
> missing header for unified diff at line 11 of patch
> can't find file to patch at input line 11

FWIW I did just build libsdl-nativesdk and did not have this problem...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


