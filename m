Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QYvaN-0000Bu-5o
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 09:41:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Jun 2011 00:37:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,399,1304319600"; d="scan'208";a="16015743"
Received: from unknown (HELO helios.localnet) ([10.255.17.2])
	by azsmga001.ch.intel.com with ESMTP; 21 Jun 2011 00:37:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 08:37:47 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1308423290.git.paul.eggleton@linux.intel.com>
	<11485e23dab6a284009ac850616899faf1005f1a.1308423290.git.paul.eggleton@linux.intel.com>
	<4DFFDE40.2040306@gmail.com>
In-Reply-To: <4DFFDE40.2040306@gmail.com>
MIME-Version: 1.0
Message-Id: <201106210837.47377.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/3] qt4-tools-nativesdk: fix unpack failure due to missing g++.conf
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
X-List-Received-Date: Tue, 21 Jun 2011 07:41:23 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 21 June 2011 00:56:48 Khem Raj wrote:
> On 06/18/2011 11:56 AM, Paul Eggleton wrote:
> > FILESPATHPKG was being used to in order to bring in linux.conf and
> > g++.conf in this recipe, however this probably never worked since
> > FILESPATHPKG always has the MACHINE appended to it and these are not
> > machine-specific files.
> 
> FILESPATHPKG is not supported in oe-core. Its an oe.dev feature for now.

Right, but there's still a reference to it in utils.bbclass where it 
supposedly operates in the manner I described. This patch actually removes its 
usage in the qt4-tools-nativesdk recipe however.

Cheers,
Paull

-- 

Paul Eggleton
Intel Open Source Technology Centre


