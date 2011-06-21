Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QZ5IR-0001uc-9G
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 20:03:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Jun 2011 10:59:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,402,1304319600"; d="scan'208";a="17883854"
Received: from unknown (HELO helios.localnet) ([10.255.17.54])
	by orsmga001.jf.intel.com with ESMTP; 21 Jun 2011 10:59:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 21 Jun 2011 18:59:55 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1308677220.git.paul.eggleton@linux.intel.com>
	<201106211842.09743.paul.eggleton@linux.intel.com>
	<331DEFC1-20ED-45EE-B84F-429E55EB6C75@dominion.thruhere.net>
In-Reply-To: <331DEFC1-20ED-45EE-B84F-429E55EB6C75@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201106211859.55194.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] u-boot: set SRCREV to a git revision instead of a tag reference
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
X-List-Received-Date: Tue, 21 Jun 2011 18:03:31 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 21 June 2011 18:54:12 Koen Kooi wrote:
> Since we're using the 2011.03 tag, why is SRCPV in PV at all? It should be
> exactly the same as the tarball.

One might go one step further and ask why fetching from git is a good idea 
when the tarball would be much cleaner. Ultimately this is up to whoever 
maintains the u-boot recipe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


