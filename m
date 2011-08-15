Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QsxWE-0000EC-Fi
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 15:47:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Aug 2011 06:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,374,1309762800"; d="scan'208";a="38566238"
Received: from unknown (HELO helios.localnet) ([10.255.18.70])
	by azsmga001.ch.intel.com with ESMTP; 15 Aug 2011 06:43:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Anders Darander <anders@chargestorm.se>
Date: Mon, 15 Aug 2011 14:43:15 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1313164659.6733.163.camel@phil-desktop>
	<201108151424.01537.paul.eggleton@linux.intel.com>
	<20110815133258.GB22184@chargestorm.se>
In-Reply-To: <20110815133258.GB22184@chargestorm.se>
MIME-Version: 1.0
Message-Id: <201108151443.15654.paul.eggleton@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libx11: skip self if x11 not in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 15 Aug 2011 13:47:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 15 August 2011 14:32:59 Anders Darander wrote:
> I've been struggling with a few other qt4-related issues (one or two
> RFC-patches will be submitted shortly), that's why I mistakenly wrote
> qt4.
> 
> I meant libx11 (in xorg-lib) in my last e-mail.

Ah yes, I realised this after sending, no worries :)

I definitely agree, anything that's a duplicated recipe in meta-oe ought to be 
turned into a bbappend. In addition, any newer version in meta-oe of recipes 
in oe-core ought to just be pushed up to oe-core unless there is a really good 
reason to do otherwise.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


