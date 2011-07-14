Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhIMl-0006uc-Qa
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 11:37:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Jul 2011 02:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,528,1304319600"; d="scan'208";a="27125242"
Received: from unknown (HELO helios.localnet) ([10.255.17.207])
	by azsmga001.ch.intel.com with ESMTP; 14 Jul 2011 02:33:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jul 2011 10:33:52 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <CAGiJk9epBnpXunG0nJGyJUvBfcm6w3XK2RxCEU-CkACwdnAqag@mail.gmail.com>
	<19B4D9B5-F086-47C4-8817-94DC7D6A6CB6@dominion.thruhere.net>
In-Reply-To: <19B4D9B5-F086-47C4-8817-94DC7D6A6CB6@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201107141033.53014.paul.eggleton@linux.intel.com>
Subject: Re: Error running bitbake with a fresh copy of OE-Core
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
X-List-Received-Date: Thu, 14 Jul 2011 09:37:57 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 14 July 2011 10:25:28 Koen Kooi wrote:
> Op 14 jul 2011, om 10:52 heeft Samuel Stirtzel het volgende geschreven:
> > File name too long:
> > '/home/*user*/oe-core/setup-scripts/build/sstate-cache/sstate-gcc-cross-
> > initial-armv5te-angstrom-linux-gnueabi-4.5-r39.0+svnr175127-x86_64_armv5t
> > e-2-1ce8da5cb101acb651e00e9a2c94ecde_populate-lic.tgz.siginfo'
> 
> That seems to be filesystem related, I know ext3, ext4 and xfs work fine,
> which one are you using?

ecryptfs (encrypted home directory) perhaps? I thought we had a check for long 
filename creation in sanity.bbclass, maybe it isn't being tripped here for some 
reason...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


