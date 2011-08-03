Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QocO9-0003gF-HD
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 16:25:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2011 07:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,310,1309762800"; d="scan'208";a="33871492"
Received: from unknown (HELO helios.localnet) ([10.255.18.43])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 07:21:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 3 Aug 2011 15:21:07 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<201108031501.58796.paul.eggleton@linux.intel.com>
	<1312380668.4325.79.camel@phil-desktop>
In-Reply-To: <1312380668.4325.79.camel@phil-desktop>
MIME-Version: 1.0
Message-Id: <201108031521.07596.paul.eggleton@linux.intel.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Wed, 03 Aug 2011 14:25:37 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 03 August 2011 15:11:07 Phil Blundell wrote:
> Has anybody ever tried to quantify how much work would be involved in
> making OE work within the constraints of POSIX sh (i.e. work with dash)?
> It does seem fairly obnoxious/embarrassing that you're obliged to
> make /bin/sh be bash on a systemwide basis; I can't think offhand of any
> other piece of software I use that has this kind of requirement.

Would that not entail fixing everything we build that contains shell scripts 
with bashisms that claim "#!/bin/sh"?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


