Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QKpTp-00005f-7x
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 12:20:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 May 2011 03:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,363,1301900400"; d="scan'208";a="746720456"
Received: from unknown (HELO helios.localnet) ([10.255.16.107])
	by orsmga001.jf.intel.com with ESMTP; 13 May 2011 03:17:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Organization: Intel Corporation (UK)
To: poky@yoctoproject.org
Date: Fri, 13 May 2011 11:17:29 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <1305157370-3264-1-git-send-email-yanok@emcraft.com>
In-Reply-To: <1305157370-3264-1-git-send-email-yanok@emcraft.com>
MIME-Version: 1.0
Message-Id: <201105131117.29367.paul.eggleton@linux.intel.com>
Cc: Ilya Yanok <yanok@emcraft.com>, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [RFC][PATCH] qt4: add target qmake to qt4-tools package
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
X-List-Received-Date: Fri, 13 May 2011 10:20:21 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

This exclusion of qmake of course comes from OE, and I'm not sure but I'm 
guessing the reason this was not installed is because qmake is already 
provided by the qmake2 package in OE. We don't have that currently in oe-core 
and the question is do we want to bring that over rather than simply 
installing it as part of qt4*tools?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


