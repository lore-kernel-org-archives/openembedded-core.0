Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qf7y8-0008CP-Pd
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 12:07:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jul 2011 03:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,498,1304319600"; d="scan'208";a="24344610"
Received: from unknown (HELO helios.localnet) ([10.255.17.130])
	by azsmga001.ch.intel.com with ESMTP; 08 Jul 2011 03:03:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jul 2011 11:03:37 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
	<201107080938.37370.paul.eggleton@linux.intel.com>
	<1310118829.18564.13.camel@lenovo.internal.reciva.com>
In-Reply-To: <1310118829.18564.13.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <201107081103.37637.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
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
X-List-Received-Date: Fri, 08 Jul 2011 10:07:34 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 08 July 2011 10:53:49 Phil Blundell wrote:
> They can always provide their own OLDEST_KERNEL setting, though.  To
> some extent I think it's a bit academic what the default in oe-core is.

Yes, but let's have a sensible default value, in particular that will allow 
the majority not to experience subtle problems that they will have to spend 
time tracking down. Many people coming to OE fresh will not know this setting 
even exists - I only discovered it the other day by accident.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


