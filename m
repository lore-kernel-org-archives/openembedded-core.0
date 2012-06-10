Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SdqIa-0004py-7D
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 00:07:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Jun 2012 14:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110446946"
Received: from unknown (HELO helios.localnet) ([10.252.120.99])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jun 2012 14:57:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Jun 2012 22:57:16 +0100
Message-ID: <2259015.9Zf9erY4xL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-24-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1614F67B@IRSMSX102.ger.corp.intel.com>
References: <1338537158-19917-1-git-send-email-cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB1614F04C@IRSMSX102.ger.corp.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB1614F67B@IRSMSX102.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ltp: Add patch to correct failing build
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
X-List-Received-Date: Sun, 10 Jun 2012 22:07:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 05 June 2012 13:29:20 Iorga, Cristian wrote:
> &> does not work correctly in dash, working to correct the issue.
> I have tested it by making the target (bitbake ltp), but it is safe to
> assume that make Version is not issued during normal build. Will propose a
> new patch.

Indeed, > filename 2>&1 is the recommended alternative. Sadly a git grep '&>' 
shows that we are currently using this in a number of places, I guess we 
should fix those.

FYI for anyone who hasn't already seen this page, it's a good reference for 
this kind of thing:

http://mywiki.wooledge.org/Bashism

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


