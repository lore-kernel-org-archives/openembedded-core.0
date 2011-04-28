Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QFOGh-0000BT-Js
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 12:16:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2011 03:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,279,1301900400"; d="scan'208";a="739605410"
Received: from unknown (HELO helios.localnet) ([10.255.13.71])
	by orsmga001.jf.intel.com with ESMTP; 28 Apr 2011 03:13:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Organization: Intel Corporation (UK)
To: Darren Hart <dvhart@linux.intel.com>
Date: Thu, 28 Apr 2011 11:13:45 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.35-28-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1303922644.git.paul.eggleton@linux.intel.com>
	<318c3139745e74177a23f323881dbd76ddc42006.1303922644.git.paul.eggleton@linux.intel.com>
	<4DB858B9.3030901@linux.intel.com>
In-Reply-To: <4DB858B9.3030901@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201104281113.45335.paul.eggleton@linux.intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 1/1] initscripts: remove -i from halt/reboot arguments and allow override
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
X-List-Received-Date: Thu, 28 Apr 2011 10:16:19 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 27 April 2011 18:56:09 Darren Hart wrote:
> Is the SED_* tag a common search/replace mechanism in OE recipes? It's
> fine, I'm just wondering if there is an accepted best practice for this
> sort of thing. I know we do some sed replacements of /usr/bin and /etc.

Is there a more appropriate mechanism for substituting values of variables 
into files (genuinely asking)? If this is the best mechanism it's possible we 
might want to have a standard naming scheme though, I just made this one up on 
the spot - I see in some other places we've used FIXMExxxx, so at least it's 
not the worst :)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


