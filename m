Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QtFVp-0002Su-4H
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 11:00:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Aug 2011 01:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,379,1309762800"; d="scan'208";a="41863319"
Received: from unknown (HELO helios.localnet) ([10.255.18.69])
	by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2011 01:56:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 16 Aug 2011 09:56:02 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <4E450925.7060101@windriver.com> <1313418691.14274.591.camel@rex>
	<4E4A2CEE.9050401@windriver.com>
In-Reply-To: <4E4A2CEE.9050401@windriver.com>
MIME-Version: 1.0
Message-Id: <201108160956.02075.paul.eggleton@linux.intel.com>
Subject: Re: [RFC] Performance Issue: Build time increases
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
X-List-Received-Date: Tue, 16 Aug 2011 09:00:41 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 16 August 2011 09:40:14 Robert Yang wrote:
> Thanks for you reply, yes, one build one restart(bitbake core-image-sato,
> then restart the computer, and bitbake again) makes the build time stable.
> I'm doing this now.

Are you using my scripts (scripts/contrib/test_build_time.sh) ? Much of the 
initial part of the script is ensuring that caches get cleared out; thus 
rebooting should not be necessary in order to get stable results.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


