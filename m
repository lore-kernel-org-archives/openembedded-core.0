Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QsyRL-0002Ja-7B
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 16:46:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 07:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,374,1309762800"; d="scan'208";a="41594551"
Received: from unknown (HELO helios.localnet) ([10.255.18.70])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2011 07:42:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2011 15:42:16 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <201108142050.37352.paul.eggleton@linux.intel.com>
	<201108151523.09022.paul.eggleton@linux.intel.com>
	<B0416E2E-1F00-40F5-83F3-230D341239F5@dominion.thruhere.net>
In-Reply-To: <B0416E2E-1F00-40F5-83F3-230D341239F5@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201108151542.16948.paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Machine specific sysroot issue
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
X-List-Received-Date: Mon, 15 Aug 2011 14:46:55 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 15 August 2011 15:30:53 Koen Kooi wrote:
> > Same way it gets installed, it looks for it in ${OPIEDIR}. It's just that
> > the second time around if the machine is not the same, ${OPIEDIR} is not
> > the same either.
> 
> That sounds like an expanded version is getting stored somewhere where it
> shouldn't

How could that be the case? If it stayed the same I could understand it...

It's pretty straightforward; OPIEDIR is set to STAGING_DIR_HOST, but 
STAGING_DIR_HOST is now ${STAGING_DIR}/${MACHINE},  thus if you change the 
machine, STAGING_DIR_HOST also changes. In OE-dev (and Poky prior to machine-
specific sysroots) STAGING_DIR_HOST was ${STAGING_DIR}/${BASEPKG_HOST_SYS}, 
thus there was no problem.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


