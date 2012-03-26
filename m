Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SC6yS-00089x-7z
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 12:16:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Mar 2012 03:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="125128805"
Received: from unknown (HELO helios.localnet) ([10.252.123.238])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2012 03:07:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Mon, 26 Mar 2012 11:07:24 +0100
Message-ID: <1593126.6uP6AmPbWl@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F6CDB0C.6080809@opendreambox.org>
References: <1332250625-18091-1-git-send-email-obi@opendreambox.org>
	<4F6CDB0C.6080809@opendreambox.org>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/bitbake: Allow to override path to pseudodone, make BUILDDIR optional
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
X-List-Received-Date: Mon, 26 Mar 2012 10:16:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 23 March 2012 21:20:28 Andreas Oberritter wrote:
> how do you propose to go on solving this problem?

My original patch solved a problem for many newer users who forget to cd back 
to their build directories before running bitbake. At least now they get a 
reasonable error message they can understand. I'm not going to support 
reverting it unless we have a practical alternative and so far I don't see 
one.

Your original reason for using the configuration you use was that pseudo was 
being rebuilt for every new configuration. I have a fix here locally which will 
skip doing this - it just needs to call bitbake -e in order to find out 
STAGING_BINDIR_NATIVE if pseudodone hasn't been created.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


