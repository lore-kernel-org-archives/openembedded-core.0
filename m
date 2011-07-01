Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QcdlW-0005XS-Vt
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 15:28:15 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Jul 2011 06:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,458,1304319600"; d="scan'208";a="20554927"
Received: from unknown (HELO helios.localnet) ([10.255.17.121])
	by orsmga002.jf.intel.com with ESMTP; 01 Jul 2011 06:24:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Date: Fri, 1 Jul 2011 14:24:27 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <RFC: Layer tooling brainstorming>
	<201105201745.29497.paul.eggleton@linux.intel.com>
	<4DD6A817.6050701@mvista.com>
In-Reply-To: <4DD6A817.6050701@mvista.com>
MIME-Version: 1.0
Message-Id: <201107011424.27821.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add support for remote layering.
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
X-List-Received-Date: Fri, 01 Jul 2011 13:28:15 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Jeremy

Have looked at this further and I really think this needs to be a separate 
utility, but one still written in python using bitbake's infrastructure (like 
bitbake-layers). The advantages of this approach:

1) Avoids reworking bitbake's initialisation and avoids possible re-execution. 
A separate utility can take advantage of a full parse and utilise all of the 
user's configuration.

2) Fetching/updating layers should be (able to be) a conscious action rather 
than something that happens implicitly as part of the build process

I'm trying to put something together that does this at the moment, with a view 
to there being components that allow integration with the content tools you 
posted earlier. Will keep you posted.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


